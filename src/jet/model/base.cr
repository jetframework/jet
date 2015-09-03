require "yaml"

module Jet::Model
  class Base
    def self.establish_connection
      connection = nil
      yaml_file = nil

      yaml_file = File.read("config/database.yml")
      yaml = YAML.load(yaml_file) as Hash
      keys_for_environment = yaml[ENV["JET_ENV"]] as Hash

      adapter = keys_for_environment["adapter"] as String
      host = keys_for_environment["host"] as String
      port = keys_for_environment["port"] as String
      username = keys_for_environment["username"] as String
      password = keys_for_environment["password"] as String
      database = keys_for_environment["database"] as String

      if PERMITTED_ADAPTERS.includes?(adapter)
        if adapter == "postgresql"
          connection = PostgreSQLAdapter.connect(username, password, host, port, database)
        elsif adapter == "mysql"
          connection = MySQLAdapter.connect(host, username, password, database, port.to_u16)
        end
        return connection
      else
        raise ArgumentError.new "Adapter `#{adapter}` is not supported at this time."
      end
    end
  end
end
