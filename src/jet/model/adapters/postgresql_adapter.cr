require "pg"

class Jet::Model::PostgreSQLAdapter
  def self.connect(username, password, host, port, database)
    PG.connect("postgres://#{username}:#{password}@#{host}:#{port}/#{database}")
  end
end
