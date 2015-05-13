require 'rubygems'
require 'serialport'

class SerialReader
  def initialize
    baud_rate = 9600

    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    port_file = '/dev/cu.uart' #check arduino usb port

    @port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)
  end

  def read
    loop do
      while (i = @port.gets.chomp) do
        puts i
      end

    end
  end
end