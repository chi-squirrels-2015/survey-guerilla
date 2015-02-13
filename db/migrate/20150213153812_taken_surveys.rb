class Records < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references  :respondent, class_name: "User"
      t.references  :survey

      t.timestamps
    end
  end
end
