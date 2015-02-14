class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references  :answer
      t.references  :record

      t.timestamps
    end
  end
end
