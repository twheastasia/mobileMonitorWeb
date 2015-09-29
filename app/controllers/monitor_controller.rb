class MonitorController < ApplicationController
  require 'MonitorData'

  @@getdata_url = 'http://192.168.199.180:3001/processor/getdata'
  @@getdataByDeviceId_url = 'http://192.168.199.180:3001/processor/getdataByDeviceId'
  #@@getdata_url = 'http://10.10.10.77:3000/processor/getdata'
  #@@PORT = 3000
  #@@HOST_IP = 'http://10.10.10.77'
  #@@PATH = "/processor/getdata"

  def index
    #@url = @@getdata_url
    @url = @@getdataByDeviceId_url
  end
  

  

end
