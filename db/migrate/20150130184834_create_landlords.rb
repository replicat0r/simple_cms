class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :address
      t.string :property_type
      t.string :bedroom
      t.string :email
      t.string :phone
      t.integer :contacted_date
      t.string :email_used

      t.timestamps
    end
  end
end
