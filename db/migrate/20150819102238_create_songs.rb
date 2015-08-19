class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.integer :year
  		t.integer :rank
  		t.string :artist
  		t.string :name

      t.timestamps null: false
    end
  end
end
