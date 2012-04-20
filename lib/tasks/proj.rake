namespace :proj do
  desc "refresh specs on the gems"
  task :resetgems => ['gems:refresh_specs', 'gems']

  desc "clean up user data"
  #task :clean_user_data => [:clear_images]
  task :clean_user_data => []

  desc "reset db, apply migrations"
  #task :resetdb => ['db:drop', :clean_user_data, 'db:create', 'db:migrate', :modify_annotate, 'db:seed']
  task :resetdb => ['db:drop', 'db:create', 'db:migrate', :modify_annotate, 'db:seed']

  desc "add test data"
  task :add_test_data => ['db:addpeople']

  desc "reset gems, db, test data, cron and workling"
  #task :reset_all => [:resetdb, :add_test_data, :cron, :workling]
  task :reset_all => [:resetdb, :add_test_data]

  desc "modifying of annotating"
  task :modify_annotate do
    system("annotate --position after --exclude tests,fixtures")
    #system("run_annotate.rb")
    #system("run_whenever.rb")
  end
  
  

  
end
