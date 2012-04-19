set_default(:remote, 'origin')

namespace :check do
  desc "Make sure local git is in sync with remote."
  task :revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse #{remote}/#{branch}`
      puts "WARNING: HEAD is not the same as #{remote}/#{branch}"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "check:revision"
  before "deploy:migrations", "check:revision"
  before "deploy:cold", "check:revision"
end
