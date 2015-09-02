class MonitorController < ApplicationController
  require 'MonitorData'

  @@getdata_url = 'http://192.168.199.180:3001/processor/getdata'


  def index
    @url = @@getdata_url
  end
  

  

end
