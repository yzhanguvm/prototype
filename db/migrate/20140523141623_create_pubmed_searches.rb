class CreatePubmedSearches < ActiveRecord::Migration
  def change
    create_table :pubmed_searches do |t|
      t.integer :user_id
      t.string :query
      t.string :pubmed_link

      t.timestamps
    end
    add_index :pubmed_searches, [:user_id, :created_at]
  end
end
