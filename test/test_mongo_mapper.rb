require 'test_helper'

class MongoMapperTest < Test::Unit::TestCase  
  should "be able to write and read connection" do
    conn = XGen::Mongo::Driver::Mongo.new
    MongoMapper.connection = conn
    MongoMapper.connection.should == conn
  end
  
  should "default connection to new mongo ruby driver" do
    MongoMapper.connection = nil
    MongoMapper.connection.should be_instance_of(XGen::Mongo::Driver::Mongo)
  end
  
  should "be able to write and read default database" do
    MongoMapper.default_database = DefaultDatabase
    MongoMapper.default_database.should be_instance_of(XGen::Mongo::Driver::DB)
    MongoMapper.default_database.name.should == DefaultDatabase
  end
  
  should "have record not found error" do
    lambda {
      MongoMapper::DocumentNotFound
    }.should_not raise_error
  end
end
