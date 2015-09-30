class MonitorController < ApplicationController
  require 'MonitorData'
  
  @@base_url = "http://192.168.199.180:3001/"
  #@@getdata_url = @@base_url + "processor/getdata"
  #@@getdataByDeviceId_url = @@base_url + "processor/getdataByDeviceId"
  #@@getHistoryData_url = @@base_url + "processor/getHistoryData"
  #@@getdata_url = 'http://10.10.10.77:3000/processor/getdata'
  #@@PORT = 3000
  #@@HOST_IP = 'http://10.10.10.77'
  #@@PATH = "/processor/getdata"

  def index
    #@url = @@getdata_url
    @getdataByDeviceId_url = @@base_url + "processor/getdataByDeviceId"
    @getHistoryData_url = @@base_url + "processor/getHistoryData"
    @refreshDevices_url = @@base_url + "processor/refreshDevices"
  end
  

  

end
