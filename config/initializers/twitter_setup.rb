Twitter.configure do |config| 
  config.consumer_key = 'eJav7Vn3lDxhrZEi1mMI6g' 
  config.consumer_secret = 'kfFZne7UkuyH59kQLQctYsh43i6GbdKCJ4koBbsI' 
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Twitter.consumer_key, Twitter.consumer_secret
end
