class TakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.references  :respondent, class_name: "User"
      t.references  :survey

      t.timestamps
    end
  end
end
