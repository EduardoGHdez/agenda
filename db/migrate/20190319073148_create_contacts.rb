class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.integer :phone_type
      t.string :email
      t.integer :email_type
      t.text :notes

      t.timestamps
    end
  end
end
