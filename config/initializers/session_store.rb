# Configure the TorqueBox Servlet-based session store.
# Provides for server-based, in-memory, cluster-compatible sessions
FairworksCom::Application.config.session_store :torquebox_store
if ENV['TORQUEBOX_APP_NAME']
  FairworksCom::Application.config.session_store :torquebox_store
else
  FairworksCom::Application.config.session_store :cookie_store, :key => '_fairworks.net_session'
end  
