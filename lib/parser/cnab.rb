module Parser
  class Cnab
    attr_accessor :cnab

    def self.parse(cnab)
      @cnab = cnab
      {}.tap do |cnab_formated|
        cnab_formated[:kind] = parsed_kind
        cnab_formated[:transaction_date] = Date.parse(parsed_transaction_date)
        cnab_formated[:transaction_time] = Time.zone.parse(parsed_transaction_time)
        cnab_formated[:amount] = parsed_amount
        cnab_formated[:social_number] = parsed_social_number
        cnab_formated[:card_number] = parsed_card_number
        cnab_formated[:store_owner] = parsed_store_owner.strip
        cnab_formated[:store_name] = parsed_store_name.strip
      end
    end

    private

    def parsed_kind
      @cnab[0]
    end

    def parsed_transaction_date
      "#{@cnab[1..4]}-#{@cnab[5..6]}-#{@cnab[7..8]}"
    end

    def parsed_amount
      @cnab[9..18].to_i / 100.00
    end

    def parsed_social_number
      @cnab[19..29]
    end

    def parsed_card_number
      @cnab[30..41]
    end

    def parsed_transaction_time
      "#{@cnab[42..43]}:#{@cnab[44..45]}:#{@cnab[46..47]}"
    end

    def parsed_store_owner
      @cnab[48..61]
    end

    def parsed_store_name
      @cnab[62..80]
    end
  end
end
