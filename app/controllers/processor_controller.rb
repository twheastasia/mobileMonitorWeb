class ProcessorController < ApplicationController
  require 'MonitorData'
  skip_before_filter :verify_authenticity_token, :only => [:collectdata]
  @@data = {"cpu"=>"0", "memory"=>"0", "flow"=>"0", "timestamp_local"=>"1441077235940", "device_info"=>{"device_name"=>"honor3c"}}

  def getdata
    puts "-------"
    #@@data
    render :json => @@data
  end
 
  def collectdata
    puts "=============="    
    @@data = params
    MonitorData::CPU_HISTORY_DATA.push(@@data)
    #puts MonitorData::CPU_HISTORY_DATA
  end


end
