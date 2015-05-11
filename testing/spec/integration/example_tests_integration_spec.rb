#coding: utf-8
require 'spec_helper'

#include RSpec::Expectations

describe "Integration Tests" do

  before(:each) do

  end
  
  after(:each) do
  end

  it "Simple GET", :integ => false do
    response = RestClient.get 'http://localhost:3000/users/1.json', {'Content-Type' => 'application/json'}
    puts response.code
    puts response.to_str
    resultado = JSON.parse(response)    

    expect(response.code).to eq(200)
    expect(resultado["login"]).to eq("robsonagapito")
  end

  it "Simple Post", :integ => false  do
    param = {:user => {:login => "stellaagapito", :full_name => "Stella da Silva Agapito Correa", :email => "stellasilvaagapito@gmail.com", :age => "3"}}

    resp = RestClient.post 'http://localhost:3000/users', param, :content_type => :json, :accept => :json
    expect(resp.code).to eq(201)    
    result = JSON.parse(resp)

    resp1 = RestClient.get "http://localhost:3000/users/#{result['id']}.json", {'Content-Type' => 'application/json'}
    result1 = JSON.parse(resp1) 
    expect(resp1.code).to eq(200)
    expect(result1["full_name"]).to eq("Stella da Silva Agapito Correa")
  end

  it "Simple Delete", :integ => false  do
    param = {:user => {:login => "stellaagapito", :full_name => "Stella da Silva Agapito Correa", :email => "stellasilvaagapito@gmail.com", :age => "3"}}

    resp = RestClient.post 'http://localhost:3000/users', param, :content_type => :json, :accept => :json
    result = JSON.parse(resp)

    resp1 = RestClient.get "http://localhost:3000/users/#{result['id']}.json", {'Content-Type' => 'application/json'}
    result1 = JSON.parse(resp1) 
    expect(result1["full_name"]).to eq("Stella da Silva Agapito Correa")

    resp2 = RestClient.delete "http://localhost:3000/users/#{result1['id']}.json"

    expect(resp2.code).to eq(204)

  end

end