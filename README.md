# DayTweeter

## Features

### Done

* user signs in with twitter account
* user can submit tweets
* tweets can be published manually
* user can set start and stop times
* user can set a daily limit
* user can pause entire system
* tweets can be disabled and reenabled
* user can edit tweets in place
* get resque scheduler working
* manually published tweets use resque schedule
* manually published tweets can be cancelled within 15s
* cancel link in flash includes countdown timer
* add pending to tweet model
* pending tweet does not display publish button
* make the Home link in the nav point to the account page
* rename /my/account to /home
* rename /my/account/edit to /my/account

### First Iteration

* make clear published button work

#### Complex worker stuff

* add scheduled time to tweet model
* reschedule tweets when a tweet is created or deleted
* system will submit tweets to twitter
  * tweets will be spread out between start and stop times
  * disabled tweets are skipped when publishing
  * tweets exceeding daily limit will carry over to next day

### Second Iteration

* drag to reorder
* user can opt to receive an email summary at the end of the day
  * which tweets were sent when
  * which tweets were carried over
  * stats over total usage

### Third Iteration

* support multiple twitter accounts
