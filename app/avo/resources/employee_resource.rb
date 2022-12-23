class EmployeeResource < Avo::BaseResource
  self.title = :first_name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], fist_name_cont: params[:q], last_name_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :first_name, as: :text
  field :last_name, as: :text
  field :email, as: :text
  field :phone, as: :text
  # add fields here

  field :company, as: :belongs_to
end
