require 'Mechanize'

class Agent
    def initialize
      @agent = Mechanize.new()
      @params = { 'ICAJAX'=>'1',
                 "ICNAVTYPEDROPDOWN"=>"0",
                 "ICType"=>"Panel",
                 "ICElementNum"=>"0",
                 "ICStateNum"=>"1",
                 "ICAction"=>"CLASS_SRCH_WRK2_SSR_PB_CLASS_SRCH",
                 "ICXPos"=>"0",
                 "ICYPos"=>"0",
                 "ResponsetoDiffFrame"=>"-1",
                 "TargetFrameName"=>"None",
                 "FacetPath"=>"None",
                 "ICFocus"=>"",
                 "ICSaveWarningFilter"=>"0",
                 "ICChanged"=>"-1",
                 "ICResubmit"=>"0",
                 "ICSID"=>"ToRwhmX0x3dLzRwIEPSN9AK8JuZc22GUgbR1XLjt6gM=",
                 "ICActionPrompt"=>"false",
                 "ICFind"=>"",
                 "ICAddCount"=>"",
                 "ICAPPCLSDATA"=>"",
                 "CLASS_SRCH_WRK2_STRM$273$"=>"2158"}

      @url = 'https://sis-cs-prod.uta.edu/psc/ACSPRD/EMPLOYEE/PSFT_ACS/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL'
      @headers = {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'accept'=>'text/html' }

    end

    def add_param(key,value)
      @params[key] = value
      @params
    end
    def load
      @agent.get(@url)
      @page = @agent.post(@url,@params,@headers)
      @page
    end



end




