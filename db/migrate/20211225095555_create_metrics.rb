# frozen_string_literal: true

class CreateMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :metrics do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :value, null: false, default: 0

      t.timestamps
    end
  end
end
