Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  # Note: access_type can be 'online' (for just authenticating) or 'offline' (for using services)
  # approval_prompt should be a blank string or else it defaults to 'force', which requires re-authenticating on each login/usage
  provider :google_oauth2, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'], {:access_type => 'online', :approval_prompt => ''}
end
