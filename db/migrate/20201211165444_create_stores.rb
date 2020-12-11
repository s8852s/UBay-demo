class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone
      t.string :address
      t.string :account
    

      t.timestamps
    end
  end
end
