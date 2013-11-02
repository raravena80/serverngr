json.array!(@servers) do |server|
  json.extract! server, :customer_name, :customer_email, :server_name, :server_id, :server_type, :server_public_ipaddress, :server_private_ipaddress, :server_account, :server_password, :server_status
  json.url server_url(server, format: :json)
end
