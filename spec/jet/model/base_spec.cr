require "./../../spec_helper"

describe Jet::Model::Base do
  describe "#connection" do
    context "MySQL" do
      it "is an instance of MySQL::Connection" do
        ENV["JET_ENV"] = "mysql"
        Jet::Model::Base.establish_connection.class.should eq(MySQL::Connection)
      end
    end

    context "PostgreSQL" do
      it "is an instance of PG::Connection" do
        ENV["JET_ENV"] = "postgresql"
        Jet::Model::Base.establish_connection.class.should eq(PG::Connection)
      end
    end

    context "unrecognized adapter" do
      it "returns an ArgumentError" do
        ENV["JET_ENV"] = "unrecognized_adapter"
        expect_raises ArgumentError, /Adapter `unrecognized_adapter` is not supported at this time./ do
          Jet::Model::Base.establish_connection
        end
      end
    end
  end
end
