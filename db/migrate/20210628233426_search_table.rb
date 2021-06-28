class SearchTable < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.timestamps null: false
      t.text :url, null: false
      t.json :content
    end
  end
end
