require 'Mechanize'
class Agent
    def initialize
      @agent = Mechanize.new()
      begin
        Timeout::timeout(10) do
          @agent = Mechanize.new()
        end
      rescue Timeout::Error
        puts "timeout the page doesnt exist"
      end
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
                 "ICActionPrompt"=>"true",
                  'ICSPROMPT'=>'1',
                 "ICFind"=>"",
                 "ICAddCount"=>"",
                 "ICAPPCLSDATA"=>"",
                 "CLASS_SRCH_WRK2_STRM$273$"=>"2158"}

      @url = 'https://sis-cs-prod.uta.edu/psc/ACSPRD/EMPLOYEE/PSFT_ACS/c/COMMUNITY_ACCESS.CLASS_SEARCH.GBL'
      @headers = {
        'Content-Type' => 'application/x-www-form-urlencoded' }
      @agent.get(@url)
    end

    def add_param(key,value)
      @params[key] = value
      @params
    end

    def set_url(url)
      @url = url
    end

    def get
      @page = @agent.get(@url)
      @agent = Mechanize.new()           
      @page
    end
    def load_class(dept)
      @params['SSR_CLSRCH_WRK_SUBJECT$0'] = dept
     
      @page = @agent.post(@url,@params,@headers)
     rescue Errno::ETIMEDOUT, Timeout::Error => exception
           
      @page
    end



end




