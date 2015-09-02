module ApplicationHelper
	require 'MonitorData'


	def refreshData

      return MonitorData::CPU_HISTORY_DATA.to_json
    end

end
