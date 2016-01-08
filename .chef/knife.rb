current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "mrobbins"
client_key               "~/Keys/mrobbins.pem"
validation_client_name   "mdrtest-validator"
validation_key           "~/Keys/mdrtest-validator.pem"
chef_server_url          "https://api.chef.io/organizations/mdrtest"
cookbook_path            ["#{current_dir}/../cookbooks"]
