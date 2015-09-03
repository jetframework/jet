require "./../../../spec_helper"

describe Jet::Model::MySQLAdapter do
  describe "#connect" do
    it "is an instance of MySQL::Connection" do
      ENV["JET_ENV"] = "mysql"

      yaml_file = File.read("config/database.yml")
      yaml = YAML.load(yaml_file) as Hash
      keys_for_environment = yaml[ENV["JET_ENV"]] as Hash

      host = keys_for_environment["host"] as String
      port = keys_for_environment["port"] as String
      username = keys_for_environment["username"] as String
      password = keys_for_environment["password"] as String
      database = keys_for_environment["database"] as String

      Jet::Model::MySQLAdapter.connect(
        username, password, host, port, database
      ).class.should eq(MySQL::Connection)
    end
  end
end
