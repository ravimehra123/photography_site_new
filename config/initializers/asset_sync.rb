AssetSync.configure do |config|
config.fog_provider = 'AWS'
config.aws_access_key_id = ENV['1D8S6N5SRNV1J2S0M3R2']
config.aws_secret_access_key = ENV['VnEiLgWaeWdaq/2gkOwUScHMriBRR0DUYmg9ZPQa']
config.fog_directory = ENV['staticimages']
config.fog_region = 'eu-west-1'
# config.aws_access_key = ENV['AWS_ACCESS_KEY']
# config.aws_access_secret = ENV['AWS_ACCESS_SECRET']
# config.aws_bucket = ENV['AWS_BUCKET']
#config.aws_region = 'eu-west-1'
config.existing_remote_files = "keep"
config.gzip_compression = true
config.manifest = false
end