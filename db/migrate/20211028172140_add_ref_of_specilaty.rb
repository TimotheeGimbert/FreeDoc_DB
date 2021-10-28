class AddRefOfSpecilaty < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :specialty, foreign_key: true
  end
end
