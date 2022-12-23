class AddCompanyIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :company, index: false
  end
end
