#coding: utf-8
require 'spec_helper'

#include RSpec::Expectations

describe "Integration Tests" do

  before(:each) do
  end
  
  after(:each) do
  end

  it "Simple GET", :integ => false do
    ###### EXECUTA O GET BUSCANDO O PRIMEIRO USUÁRIO ######
    response = RestClient.get 'http://localhost:3000/users/9', :content_type => :json, :accept => :json
    # puts response.code
    # puts response.to_str
    resultado = JSON.parse(response)    

    expect(response.code).to eq(200)
    expect(resultado["login"]).to eq("stellaagapito")
  end

  it "Simple Post", :integ => false  do
    param = {:user => 
              {:login => "stellaagapito", 
               :full_name => "Stella da Silva Agapito Correa", 
               :email => "stellasilvaagapito@gmail.com", 
               :age => "3"
              }
            }
    resp = RestClient.post 'http://localhost:3000/users', param.to_json, :content_type => :json, :accept => :json
    expect(resp.code).to eq(201)    
    result = JSON.parse(resp)

    resp1 = RestClient.get "http://localhost:3000/users/#{result['id']}", :content_type => :json, :accept => :json
    result1 = JSON.parse(resp1) 
    expect(resp1.code).to eq(200)
    expect(result1["full_name"]).to eq("Stella da Silva Agapito Correa")
  end

  it "Simple Delete", :integ => false  do
    param = {:user => 
              {:login => "stellaagapito", 
               :full_name => "Stella da Silva Agapito Correa", 
               :email => "stellasilvaagapito@gmail.com", 
               :age => "3"
              }
            }

    resp = RestClient.post 'http://localhost:3000/users', param.to_json, :content_type => :json, :accept => :json
    result = JSON.parse(resp)

    resp1 = RestClient.get "http://localhost:3000/users/#{result['id']}", :content_type => :json, :accept => :json
    result1 = JSON.parse(resp1) 
    expect(result1["full_name"]).to eq("Stella da Silva Agapito Correa")

    resp2 = RestClient.delete "http://localhost:3000/users/#{result1['id']}", :content_type => :json, :accept => :json
    expect(resp2.code).to eq(204)

  end

  it "Simple Put", :integ => false  do
    param = {:user => 
              {:login => "stellaagapito", 
               :full_name => "Stella da Silva Agapito Correa", 
               :email => "stellasilvaagapito@gmail.com", 
               :age => "3"
              }
            }

    resp = RestClient.post 'http://localhost:3000/users', param.to_json, :content_type => :json, :accept => :json
    result = JSON.parse(resp)

    resp1 = RestClient.get "http://localhost:3000/users/#{result['id']}", :content_type => :json, :accept => :json
    result1 = JSON.parse(resp1) 
    expect(result1["full_name"]).to eq("Stella da Silva Agapito Correa")

    param = {:user => 
              {:login => "stellaagapito", 
               :full_name => "Stella Minha Filha Linda", 
               :email => "stellasilvaagapito@gmail.com", 
               :age => "3"
              }
            }    
    resp2 = RestClient.put "http://localhost:3000/users/#{result1['id']}", param.to_json, :content_type => :json, :accept => :json
    result2 = JSON.parse(resp2) 
    expect(resp2.code).to eq(200)
    expect(result2["full_name"]).to eq("Stella Minha Filha Linda")    
  end

end

describe "Integration Tests" do

  before(:each) do
      @param = {:user => 
          {:login => "", 
           :full_name => "Stella da Silva Agapito Correa", 
           :email => "stellasilvaagapito@gmail.com", 
           :age => "3"
          }
        }
  end
  
  context "Simple Post" do
    let(:resultado) {RestClient.post 'http://localhost:3000/users', @param.to_json, :content_type => :json, :accept => :json}

    it "Empty Login ", :integ => true  do  
      expect{ resultado }.to raise_error.with_message(/422 Unprocessable Entity/)
    end
  end
end





