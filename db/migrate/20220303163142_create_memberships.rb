class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.integer :charge
      t.references :client
      t.references :gym

      t.timestamps
    end
  end
end
