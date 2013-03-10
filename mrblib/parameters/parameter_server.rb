module ROS
  # API Document: http://www.ros.org/wiki/ROS/Parameter%20Server%20API
  class ParameterServerAPI
    def initialize(master_uri, caller_id, port = 11311)
      @caller_id = caller_id
      @master_uri = master_uri
      @server = XMLRPC::Client.new(@master_uri,"",port)
    end

    def delete_param(key)
      code, message, value = @server.call("deleteParam", @caller_id, key)
      case code
      when 1
        return true
      else
        return false
      end
    end

    def set_param(key)
      code, message, value = @server.call("deleteParam", @caller_id, key)
      case code
      when 1
        return true
      when -1
        raise message
      else
        return false
      end
    end

    def get_param(key)
      code, message, value = @server.call("getParam", @caller_id, key)
      case code
      when 1
        return value
      else
        return nil
      end
    end

    def search_param(key)
      code, message, value = @server.call("searchParam", @caller_id, key)
      case code
      when 1
        return value
      when -1
        raise message
      else
        return false
      end
    end

    def has_param(key)
      code, message, value = @server.call("hasParam", @caller_id, key)
      case code
      when 1
        return value
      when -1
        raise message
      else
        return false
      end
    end

    def get_param_names
      code, message, value = @server.call("getParamNames", @caller_id)
      case code
      when 1
        return value
      when -1
        raise message
      else
        return false
      end
    end
    end
  end
end

# vim: set ft=ruby ts=2 sw=2:
