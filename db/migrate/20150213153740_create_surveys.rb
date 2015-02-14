class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :creator
      t.string     :title
      t.string     :description

      t.timestamps
    end
  end
end
