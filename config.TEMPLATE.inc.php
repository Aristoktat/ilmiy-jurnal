[general]

; Set this to On once the system has been installed
; (This is generally done automatically by the installer)
installed = Off

; The canonical URL to the OJS installation (excluding the trailing slash)
base_url = "https://ilmiy-jurnal.onrender.com"

; Session cookie name
session_cookie_name = OJSSID

; Session cookie path; if not specified, defaults to the detected base path
session_cookie_path = /

; Number of days to save login cookie for if user selects to remember
; (set to 0 to force expiration at end of current session)
session_lifetime = 30

; Enable support for running behind a reverse proxy
; IMPORTANT: Only enable this if you are running OJS behind a reverse proxy
trust_x_forwarded_for = On

; Post-installation configuration
; Set the following to Off if you want to force HTTPS for all requests
force_ssl = On
force_login_ssl = On

[database]

driver = postgres
host = dpg-cuov9aogph6c73cl93og-a.oregon-postgres.render.com
username = ojs_user
password = ojs_password
name = ojs_db
; Set the non-standard port number if needed
; port = 5432

[cache]

; The type of cache to use
; memcache: Use the memcache PHP extension
; file: Use file-based caching
; none: No caching
cache = file

; The location of the cache directory
; (relative to the OJS base directory)
memcache_hostname = localhost
memcache_port = 11211

[debug]

; Display a stack trace when a fatal error occurs.
; Note that this may expose private information and should be disabled
; for production systems.
show_stacktrace = Off

; Display an error message when a non-fatal error occurs.
display_errors = Off

; Display deprecation warnings
deprecation_warnings = Off

; Log web service request information for debugging
log_web_service_info = Off
