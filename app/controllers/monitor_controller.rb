class MonitorController < ApplicationController
  require 'MonitorData'

  @@getdata_url = 'http://192.168.199.180:3001/processor/getdata'


  def index
    @url = @@getdata_url
    @cpu_history_data = refreshData
  end
  
  def refreshData
    return MonitorData::CPU_HISTORY_DATA
  end
  

end
