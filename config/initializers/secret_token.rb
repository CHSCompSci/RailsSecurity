# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# SampleApp::Application.config.secret_token = '5665cae76a24c056bd9d06f3d57d6a0b645d2a7495b8dc9a3b0a658bcfffaab26eac9bdd173da2bc5659746fb6a111bdb9fa1b749bd628aabd868976d7807114'


require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist? (token_file)
    #using existing token
    File.read(token_file).chomp
  else
    #generates a new token and stores it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token