class Responses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references  :answer

      t.timestamps
    end
  end
end
