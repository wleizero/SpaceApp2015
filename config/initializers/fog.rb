CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIQIPHR27IBWLN3FQ',                        # required
    :aws_secret_access_key  => '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',                     # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    # :host                   => 's3.collabotree.com',             # optional, defaults to nil
    # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'collabotree'                             # required
  # config.fog_public     = true                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
 
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  # config.storage = :s3
  # config.fog_host = 'http://collabotree.com'

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
  end
 
  
end