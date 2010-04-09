# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quiz_session',
  :secret      => 'ae9adedd114079820d22b7d00e4b3e7791a0ede68ae459f98cbed93474c17e3073ec719daff09a20e31a588a7de6c05c8ed5c79af7a1737738982d3562fb06fa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
