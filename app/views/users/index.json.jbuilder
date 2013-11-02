json.array!(@users) do |user|
  json.extract! user, :uid, :provider, :email, :first_name, :last_name, :github_username, :ssh_username, :ssh_public_key, :linux_password_hash, :enabled
  json.url user_url(user, format: :json)
end
