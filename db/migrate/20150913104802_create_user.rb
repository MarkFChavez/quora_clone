class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :image, :string
      t.column :provider, :string
      t.column :uid, :string

      t.timestamps
    end

    add_index :users, [:provider, :uid]
  end
end
