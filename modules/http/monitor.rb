class HttpMonitor < UFuzz::Monitor
  def start
    @req = ""
    @crash_dump = ""
  end
  
  def check(content = nil)
    # we assume the server's binary crashed if the connection was dropped
    (content.to_s.downcase.include? 'connection reset') or
        # or we have a 500 HTTP error message with no well-formatted response
        (defined? content.body and defined? content.status and content.status == 500 and not content.body) ? content : nil
  end
  
  def close
  end
end