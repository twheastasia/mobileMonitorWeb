module ApplicationHelper
	require 'MonitorData'


	def refreshData

      return MonitorData::DATA.to_json
    end

end
