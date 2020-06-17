json.extract! current_status, :id, :user_id, :status_id, :created_at, :updated_at
json.url current_status_url(current_status, format: :json)
