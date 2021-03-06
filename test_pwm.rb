require "pigpio"
include Pigpio::Constant
pi=Pigpio.new()
unless pi.connect
  exit -1
end

led=pi.gpio(4)
pin.mode=PI_OUTPUT
led.write 0
pwm=led.pwm

button=pi.gpio(22)
button.mode=PI_INPUT
button.pud=PI_PUD_UP
button.glitch_filter(5000)

i=128
while true do
  if button.read == 0 do
    i=(i+1)%256
  end
  pwm.dutycycle= i
  sleep 0.01
end
pi.stop
