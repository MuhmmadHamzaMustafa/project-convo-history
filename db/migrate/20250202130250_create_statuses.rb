class CreateStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :slug
      t.string :statusable_type

      t.timestamps
    end
  end
end
