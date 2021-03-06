# ~~Flaker~~
![](.images/landing_page_accept.png)

Web app designed to increase user attendance by creating an event money pool formed from user's entry fee, which is split among users who successfully attends the event. [*~~Flaker~~ Frontend*](https://github.com/kangyongn/flaker_frontend)

## Project Aim
1. Create a web app designed to increase user attendance to events.
2. Implement Redux.
3. Incorporate a third party API to process charges and transfers.
4. Create a mathematical equation to calculate the transfer amount between attendees after subtracting API's transaction fees.

## ~~Flaker~~'s Design
1. Any registered user can create a event with a determined entry fee and invite other registered users.
![](.images/creator_page.png)

2. Registered users that have been invite to a given event can either accept or decline the invitation. *Users can be re-invited after declining a invitation*
3. Users must input a valid credit card payment to be charged in order to successfully accept an invitation.
![](.images/landing_page_invite.png)

4. After a event is finished, the event creator selects users that successfully attended the event.
5. Upon closing the event, the event money pool is calculated and split equally among users who successfully attended the event.
![](.images/end_page.png)

## Resources Used
* React
* Redux
* Stripe
* Semantic UI
