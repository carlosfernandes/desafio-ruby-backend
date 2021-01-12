class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :store, null: false, foreign_key: true
      t.integer :kind, null: false
      t.date :transaction_date, null: false
      t.time :transaction_time, null: false
      t.decimal :amount, null: false
      t.string :social_number, null: false
      t.string :card_number, null: false

      t.timestamps
    end
  end
end
