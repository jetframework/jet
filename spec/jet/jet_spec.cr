require "./../spec_helper"

describe Jet do
  it "has a valid version number" do
    Jet::VERSION.should_not eq(nil)
  end
end
