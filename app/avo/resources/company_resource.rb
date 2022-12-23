class CompanyResource < Avo::BaseResource
  self.title = :name
  self.includes = [:employees]
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :email, as: :text
  field :website, as: :text
  field :employees_count, as: :text do |model| 
    model.employees.count
  end
  # add fields here

  field :employees, as: :has_many, attach_scope: -> { query.where.not(company_id: 
  parent.id).or( query.where(company_id: nil))}
end
