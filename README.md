# Loc Reminder

# Loc Reminder Help

## Headers

# Setup Process
You will only see the setup page on the first launch of this app. The setup page only asks for access to certain permissions:


| Permission | Use |
|:------------:|---------------|
|`Always Location Access`|Using geofencing, we add and monitor regions even when the app is completely terminated|
|`Notifications`|Necessary for delivering notifications about the location-based reminder.|




##
# FAQ
> How does Loc Reminder work?

The meat of the app's functionality is the ability to detect when a user has entered/left a location. We use geofencing to set up circular regions around your desired locations, and the app automatically becomes active in the background, and we deliver the notifications.

##
> How do you handle my personal information?

_TL;DR_ We don't store any information on servers or have access to your information at all.

The addresses that we ask for are converted to coordinates and saved to a CoreData model.
The `Always Location` is used for region monitoring, which is handled by Apple on the device. Loc Reminder does not access/monitor your live location.

##
> Why do I need this app?

Loc Reminder is a location-based reminder app that can be used to remind you to do something when you arrive at a specific location. It is a functional alternative to the Apple Reminders app, which has been known to have issues.

