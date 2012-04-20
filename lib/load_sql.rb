class LoadSql

  def self.load(filename, env=RAILS_ENV, path_to_file = nil)
    if path_to_file.nil?
       filepath = "#{Rails.root}/db/data/#{filename}"
    else
       filepath = "#{path_to_file}/#{filename}"
    end 
    raise "Filename #{filepath} does not exist" unless File.exists?(filepath)
    config = Rails::Configuration.new.database_configuration[env]

    case config['adapter']
    when 'mysql'
      database = config['database']
      username = config['username']
      password = config['password']
      command = `mysql #{database} -u#{username} -p#{password} < #{filepath}`
    when 'sqlite3'
      database = config['database']
      command = `sqlite3 #{database} < #{filepath}`
    when 'postgresql'
      database = config['database']
      username = config['username']
      password = config['password']
      host = config['host']
      port = config['port']
      #command = `psql -e -d #{database} -h #{host} -p #{port} -U #{username} -f #{filepath}` # -U #{username}
      command = `psql -e -d #{database} -U #{username} -f #{filepath}` # -U #{username}
      
    else
      raise "Wrong adapter. Only MySQL, PostgreSQL and Sqlite3 are supported."
    end
    return command
  end
end
