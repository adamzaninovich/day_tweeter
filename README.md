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
* user can edit tweets
* manually published tweets use resque
* get resque scheduler working

### First Iteration

* reschedule tweets when a tweet is created or deleted

* system will submit tweets to twitter
  * tweets will be spread out between start and stop times
  * disabled tweets are skipped when publishing

* tweets exceeding daily limit will carry over to next day

* make clear published button work

### Second Iteration

* drag to reorder
* user can opt to receive an email summary at the end of the day
  * which tweets were sent when
  * which tweets were carried over
  * stats over total usage

### Third Iteration

* support multiple accounts

