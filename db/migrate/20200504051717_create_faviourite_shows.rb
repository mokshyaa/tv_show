class CreateFaviouriteShows < ActiveRecord::Migration[5.2]
  def change
    create_table :faviourite_shows do |t|
      t.references :user, foreign_key: true
      t.references :show, foreign_key: true

      t.timestamps
    end
  end
end
