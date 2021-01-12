require 'parser/cnab'

class TransactionService
  def self.execute(file)
    cnab_parser = Cnab.new

    ActiveRecord::Base.transaction do
      imported_transactions = 0

      File.foreach(file) do |line|
        if (line = line.squish).present?
          cnab_data = cnab_parser.parse(line)
          store = Store.find_or_create_by!(name: cnab_data[:store_name],
                                          owner: cnab_data[:store_owner])

          store.transactions.create!(
            kind: cnab_data[:kind].to_i,
            transaction_date: cnab_data[:transaction_date],
            transaction_time: cnab_data[:transaction_time],
            social_number: cnab_data[:social_number],
            card_number: cnab_data[:card_number],
            amount: cnab_data[:amount]
          )

          imported_transactions += 1
        end
      end

      return imported_transactions
    rescue StandardError => e
      raise "Erro at line #{imported_transactions + 1}: #{e.message}"
    end
  end
end
