class HttpConfig < UFuzz::Config
  def options
    {
      platform:     'Http',
      use_ssl:      false,
      use_session:  false,
      encoders:     [ proc { |f| f.to_s } ],
      #skip_urls:   /firmwareupdate1|UpdateWeeklyCalendar|ChangeFriendlyName/,
      #delay:       1, 
    }
  end
end