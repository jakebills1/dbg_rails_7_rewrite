To run on cloud 9:
- clone
- bundle (skip production if pg gem doesn't install)
- change port in Procfile.dev to 8080
- add cloud9 hostname to config.hosts in config/environments/development.rb
- add aws creds, ADMIN_NAME and ADMIN_PASSWORD to .env
