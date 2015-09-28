class ProcessorController < ApplicationController
  
  require 'MonitorData'
  require 'Time'
  
  skip_before_filter :verify_authenticity_token, :only => [:collectdata]
  
  @@data = {"cpu"=>"0", "memory"=>"0", "flow"=>"0", "timestamp_local"=>"1441077235940", "device_name"=>"honor3c", "device_id"=>"1234567890"}


  # get\post routes
  def getdata
    puts "-------"
    render :json => @@data    
  end

  def getdataByDeviceId
    render :json => MonitorData::PHONE_DATA[params["device_id"]]
  end
 
  def collectdata
    puts "=============="    
    @@data = params
    @@data["timestamp_server"] = Time.new.to_s
    MonitorData::DATA.push(@@data)
    sortDataByDeviceID @@data
    #puts MonitorData::CPU_HISTORY_DATA
  end

  def refreshDevices
    devices = {}
    MonitorData::PHONE_DATA.each do |key, value|
      devices[key] = value[0]["device_model"]
    end
    render :json => devices
  end





  # method in class
  def getCpuHistoryData
    data = MonitorData::DATA
    params.each do |key, value| 
      data = selectDataByKeyValue data, key, value
    end
    return data
  end

  def selectDataByKeyValue array, key, value
    result = []
    if array && array.length > 0
      array.each{ |cell| result.push cell if cell[key] == value}
            
    end
    return result

  end

  def sortDataByDeviceID data
    if(MonitorData::PHONE_DATA[data["device_id"]] == nil )
      MonitorData::PHONE_DATA[data["device_id"]]= []
      #MonitorData::PHONE_DATA[params["device_id"]][data["device_id"]] = []
    end
    
    MonitorData::PHONE_DATA[data["device_id"]].push data
    #puts MonitorData::PHONE_DATA
  end

end
