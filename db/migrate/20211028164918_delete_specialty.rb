class DeleteSpecialty < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :specilaty
  end
end
