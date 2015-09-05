class ProcessorController < ApplicationController
  
  require 'MonitorData'
  require 'Time'
  
  skip_before_filter :verify_authenticity_token, :only => [:collectdata]
  
  @@data = {"cpu"=>"0", "memory"=>"0", "flow"=>"0", "timestamp_local"=>"1441077235940", "device_info"=>{"device_name"=>"honor3c"}}

  def getdata
    puts "-------"
    #@@data
    render :json => @@data
    
    #render :json => @@data["device_info"]["device_name"]
  end
 
  def collectdata
    puts "=============="    
    @@data = params
    @@data["timestamp_server"] = Time.new.to_s
    MonitorData::CPU_HISTORY_DATA.push(@@data)
    
    #puts MonitorData::CPU_HISTORY_DATA
  end


end
