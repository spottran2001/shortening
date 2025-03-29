class CreateUrlShortenings < ActiveRecord::Migration[7.0]
  def change
    create_table :url_shortenings do |t|
      t.text :original_url
      t.string :code

      t.timestamps
    end
  end
end
