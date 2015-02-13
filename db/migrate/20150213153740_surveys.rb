class Surveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :creator, class_name: "User"
      t.string     :title
      t.string     :description

      t.timestamps
    end
  end
end
