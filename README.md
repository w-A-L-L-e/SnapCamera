SnapCamera
==========

RoR live webcam snapshots and gallery example project. Rails version 3.2.3
This combines a flash application and some clever jQuery ajax to take live webcam snapshots on the fly and have them stored in a mysql database using
carrierwave for file and live snapshot uploading.

Tested to work in firefox, chrome and safari. Needs some extra work for IE browsers.
Posting it now because it is based on a great tutorial found on web here :
 http://www.xarg.org/project/jquery-webcam-plugin/

Just rubified/ror'ed it in few hours for my own needs. Code needs to be cleaned up (put css and javascript into the right files in assets dir). Now it's all contained in
app/views/webcam_pictures/index.html.erb and the webcam_pictures controller's create action just to see if I could get it to work inside a rails app quickly...

Need some work for browsers that don't have a canvas or getElementById (like IE).
Apart from that it's really fun and easy to use. Take an instant snapshot or one in 3 seconds delay live from your cam and have it uploaded in one go to your webserver ;).
Great start for profile pages (dating, social networks etc...)

Code needs to be cleaned up but just a git clone and then 'rails s' is enough to go to http://localhost:3000 and see your face on the webpage + allow uploading. I've
modified and cleaned up the code a bit more to do it in 2 steps (allowing to snap and upload when done which auto refreshes the page but this is already in a larger project not destined
for github)...
Basically you just add a button with jquery listener and window.location.reload(); that saves and refreshes the page...

