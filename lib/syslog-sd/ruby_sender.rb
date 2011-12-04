require 'thread'

module SyslogSD
  # Plain Ruby UDP sender.
  class RubyUdpSender
    def initialize(addrs)
      @mutex = ::Mutex.new
      @socket = UDPSocket.open
      self.addresses = addrs
    end

    def addresses
      @mutex.synchronize do
        @i = 0
        @addresses
      end
    end

    def addresses=(addrs)
      @mutex.synchronize do
        @i = 0
        @addresses = addrs
      end
    end

    def send_datagram(datagram)
      # not thread-safe, but we don't care if round-robin algo fails sometimes
      host, port = @addresses[@i]
      @i = (@i + 1) % @addresses.length
      @socket.send(datagram, 0, host, port)
    end
  end
end
