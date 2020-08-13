# README

Statrus was built as an office display/dashboard site for office mates to easily be able to find out what your status is. Be it from their desk by visiting the dashboard of it they are popping by your office for a quick chat.

Things you may want to cover:

* Ruby version: 2.6.3

* Rails version: 5.2.3

* Database: Postgresql

* Deployment instructions
	* Update the seed file for an initial account
		* The user creation route is only available to logged in useres and only by URL

	* Seed the Database
	* Available status's and ID's
	
		|ID  |    Status          |
		|----|--------------------|
		|   1|   Available        |
		|   2|   Back Shortly     |
		|   3|   In A Meeting     |
		|   4|   Working Remotely |
		|   5|   On Lunch         |
		|   6|   Out of the Office|
	* Status updates can be done by web or by comaandline using curl
		* to use command line you firs need your auth token
			* `curl -H "Email: logineamil@example.com" -H "password: yourpassword" http://example.com/login`
			* This returns the login token
			* `curl -H "token: yourtokenhere" -H "status: (id of status)" http://example.com/update_status`
		* get current status via command line
			* `curl -H "token: yourtokenhere" http://example.com/current_status`
		* office display config
			* I use a Raspberry Pi with a 7" display
			* The token is used to authenticate for this
			* I open a chromium in kisok mode on boot of the PI using the command `chromium-browser --kiosk --app=http://example.com/office_display?toke=yourtokenhere`

