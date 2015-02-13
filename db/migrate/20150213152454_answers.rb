class Answers < ActiveRecord::Migration
  def change
    create_table do |t|
      t.references  :question
      t.string      :content

      t.timstamps
  end
end
