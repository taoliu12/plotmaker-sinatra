class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.string :title
      t.string :setting
      t.string :hero
      t.string :enemy
      t.string :conflict
      t.string :climax
      t.string :resolution
    end
  end
end
