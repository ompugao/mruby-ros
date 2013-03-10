module ROS
  # API Document: http://www.ros.org/wiki/ROS/Parameter%20Server%20API
  class ParameterSubscriber
    def subscribe_param(key,procedure)
      raise NotImperementedError
    end

    def unsubscribe_param(key,procedure)
      raise NotImperementedError
    end
  end
end
# vim: set ft=ruby ts=2 sw=2:
