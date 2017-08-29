#coding: utf-8
require 'spec_helper'

class QAIntegrationTest
  attr_accessor :user, :pass, :serv, :base, :ret_code, :ret_body, :execute_type

=begin
  def initialize
    self.base = 'https://systems-login.systemintegration.locaweb.com.br'
    self.execute_type = "JSON"
  end
  
  def get_headers(pheaders)

    sys_client = LwAuthClient.new base_url: self.base
    st = sys_client.service_ticket(:username => user.to_s, :password => pass.to_s, :service_name => serv.to_s)
    if pheaders
      pheaders.merge("Service-ticket" => st)
    else 
      {"Service-ticket" => st}
    end
  end

  def create_result(pres)
    self.ret_code = pres.code
    self.ret_body = pres.body
    if self.execute_type == "JSON" && !pres.body.empty?
      JSON.parse(pres) rescue pres
    else
      pres
    end
  end

  def get(purl, pheaders)
    headers = get_headers(pheaders)
    res = RestClient.send('get', purl, headers)
    create_result(res)
  end

  def put(purl, pparams, pheaders)
    headers = get_headers(pheaders)
    res = RestClient.send('put', purl, pparams.to_json, headers)
    create_result(res)
  end

  def post(purl, pparams, pheaders)
    headers = get_headers(pheaders)
    res = RestClient.send('post', purl, pparams.to_json, headers)
    create_result(res)
  end
=end

  def initialize
    self.base = 'https://systems-login.systemintegration.locaweb.com.br'
    self.execute_type = "JSON"
  end
  
  def post(purl, pparams, pheaders)
    sys_client = LwAuthClient.new base_url: self.base
    res = sys_client.post(purl, {:username => user.to_s, :password => pass.to_s, :service_name => serv.to_s}, pparams, pheaders, :verify_ssl => false)
    self.ret_code = res.code
    self.ret_body = res.body
    if self.execute_type == "JSON"
      JSON.parse(res)
    else
      res
    end
  end

  def get(purl)
    sys_client = LwAuthClient.new base_url: self.base
    res = sys_client.get(purl, {:username => user.to_s, :password => pass.to_s, :service_name => serv.to_s}, nil, :verify_ssl => false)
    self.ret_code = res.code
    self.ret_body = res.body
    if self.execute_type == "JSON"
      JSON.parse(res)
    else
      res
    end
  end

end