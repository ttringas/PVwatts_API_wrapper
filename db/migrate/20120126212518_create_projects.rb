class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :address

      t.timestamps
    end
  end
end
