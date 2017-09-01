#coding: utf-8
require 'spec_helper'

#include RSpec::Expectations

describe "Integration Tests I" do

  before(:each) do
    @user = User.new
    @rest = RestSupport.new
  end
  
  after(:each) do
  end

  it "Simple GET", :integ => false do
    ###### EXECUTA O GET BUSCANDO O USUÁRIO COM ID 9 ######
    @rest.get(@user.base_url(9)) 

    expect(@rest.code_status).to eq(200)
    expect(@rest.json["login"]).to eq("stellaagapito")
  end

  it "Simple Post", :integ => false  do
    @user.login = "stellaagapito"
    @user.full_name = "Stella da Silva Agapito Correa"
    @user.email = "stellasilvaagapito@gmail.com"
    @user.age = 5

    @rest.post(@user.base_url(''), @user.json)
    expect(@rest.code_status).to eq(201)

    @rest.get(@user.base_url(@rest.json['id']))
    expect(@rest.code_status).to eq(200)
    expect(@rest.json["full_name"]).to eq("Stella da Silva Agapito Correa")
  end

  it "Simple Delete", :integ => true  do
    @user.login = "stellaagapito"
    @user.full_name = "Stella da Silva Agapito Correa"
    @user.email = "stellasilvaagapito@gmail.com"
    @user.age = 5
    
    @rest.post(@user.base_url(''), @user.json)
    @rest.get(@user.base_url(@rest.json['id']))
    expect(@rest.json["full_name"]).to eq("Stella da Silva Agapito Correa")

    @rest.delete(@user.base_url(@rest.json['id']))
    expect(@rest.code_status).to eq(204)
  end

  it "Simple Put", :integ => false  do
    @user.login = "stellaagapito"
    @user.full_name = "Stella da Silva Agapito Correa"
    @user.email = "stellasilvaagapito@gmail.com"
    @user.age = 5
    
    @rest.post(@user.base_url(''), @user.json)
    @rest.get(@user.base_url(@rest.json['id']))
    expect(@rest.json["full_name"]).to eq("Stella da Silva Agapito Correa")

    @user.login = "stellaagapito"
    @user.full_name = "Stella Minha Filha Linda"
    @user.email = "stellasilvaagapito@gmail.com"
    @user.age = 5

    @rest.put(@user.base_url(@rest.json['id']), @user.json)
    expect(@rest.code_status).to eq(200)
    expect(@rest.json["full_name"]).to eq("Stella Minha Filha Linda")    
  end

end

describe "Integration Tests II" do

  before(:each) do
      @param = {:user => 
          {:login => "", 
           :full_name => "Stella da Silva Agapito Correa", 
           :email => "stellasilvaagapito@gmail.com", 
           :age => "3"
          }
        }
  end
  
  context "Simple Post", :integ => false do
    let(:resultado) {RestClient.post 'http://localhost:3000/users', @param.to_json, :content_type => :json, :accept => :json}

    it "Empty Login ", :integ => true  do  
      expect{ resultado }.to raise_error.with_message(/422 Unprocessable Entity/)
    end
  end
end





