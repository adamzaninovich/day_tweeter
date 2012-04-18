Resque::Server.use(Rack::Auth::Basic) do |user, password|
  Digest::SHA512.hexdigest(password) == "8f2faafe080354612db1fab703b73b6c62eca1042aacf562d7c44c7e762e2d077f75ccd98cd78c7edc0de983031cabc2893974f3a8243a045cd22875086ab6ec"
end