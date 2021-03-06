require "pigpio"
include Pigpio::Constant
pi=Pigpio.new()
unless pi.connect
  exit -1
end

led=pi.gpio(4)
led.mode=PI_OUTPUT
led.write 0
pwm=led.pwm

button=pi.gpio(22)
button.mode=PI_INPUT
button.pud=PI_PUD_UP
button.glitch_filter(5000)

# puts (pwm.dutycycle & 0xFF)
# по умолчанию dutycycle = 164

i=128
pwm.dutycycle= i
while true do
  if button.read == 0
    i=(i+1)%256
    pwm.dutycycle= i
    print "/r"
    print (i & 0xFF)
  end
  sleep 0.01
end
pi.stop
