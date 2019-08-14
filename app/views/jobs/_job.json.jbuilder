json.extract! job, :id, :title, :description, :city, :work_type, :contract_type, :salary, :requirements, :slug, :created_at, :updated_at
json.url job_url(job, format: :json)
