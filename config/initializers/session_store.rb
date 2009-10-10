# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_romanski2_session',
  :secret      => '4a7fb5f12e56742efe0679baf2902e54a7647f7b0b055ff1a677b9256447eb87ae85f913767eaf78397dba25419dff56c64f3cf5d9e31bb67bcbbac5d14d68e9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
