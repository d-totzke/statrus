class CreateCurrentStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :current_statuses do |t|
      t.references :user, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
