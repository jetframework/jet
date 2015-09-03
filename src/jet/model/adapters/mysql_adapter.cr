require "mysql"

class Jet::Model::MySQLAdapter
  def self.connect(host, username, password, database, port)
    MySQL.connect(host, username, password, database, port.to_u16, nil)
  end
end

