# Overview
If you have an Android phone, Google is constantly tracking your location.
They literally store your exact coordinates every few milliseconds.
Creepy? Sure.
But Google allows you access to the raw data,
so you can do fun things with it.

(You are able to
[opt-out](https://support.google.com/accounts/answer/3118687?hl=en)
of location tracking.)

I spent a ~year traveling around the U.S.,
so I wanted a map showing where I'd been.
I couldn't find a good existing solution, so I built this.

The map looks kind of like of like this--
![map](http://i.imgur.com/VL3hM6g.gif "map")

The GIF doesn't do it justice.
For a proper demo,
[this example is hosted on the web](http://danielallendeutsch.com/projects/map.html).

This was built in a way that should work with anyone's data.
This tool returns three files:
one HTML, one CSS, and one JavaScript that make up your map.

# Getting It Working
### Prerequisites
There are two things you need before you can get going.
The first is your data.
The second is an API key.

You can check that your location data is being stored at
[Google Timeline](https://www.google.com/maps/timeline).
If your data is there, click the tiny wheel in the bottom right corner.
Select 'Download a copy of all your data'.
Make sure the Data Format is JSON,
and then complete your own preferences for File Type (examples assume .zip),
Archive Size, and Delivery Method.

To get an API Key, see the
[full instructions](https://developers.google.com/maps/documentation/javascript/get-api-key).
You should be able to manage everything from the
[API Console](https://console.developers.google.com/apis/credentials).

### Setup
Copy your location data to the top-level of this repository.
You'll see a LocationHistory.json file already there.
Replace your that location history with *your* location history.

To do that you'll need to
uncompress the file Google provided and move over your data.
That will look something like--
```
unzip ~/Downloads/takeout-20170101T000000Z.zip
cp ~/Downloads/Takeout/Location\ History/LocationHistory.json ~/where-are-you-going-where-have-you-been/
```
(This assume: the provided file is zipped,
that that file is stored in `Home/Downloads/`,
and that this repository is stored in `Home/`.
Update as necessary.)

### Create
From the top-level of this directory, run `./script.rb`.
The console will ask you some questions,
including 'What is your API key?'.
More detail is provided about each term below.

At the end, the map should automatically open in your preferred browser &#128516;

### Assets
The page that opens is made up of three files, which can be found in
`where-are-you-going-where-have-you-been/site/`.
If you want to host your map on the web, you'll just need those files.

# The Details
### API Key
The key allows 25,000 map loads per day for free.
If you exceed that quantity, you will not be charged unless you 'enable billing'.
Complete details are available on the
[usage page](https://developers.google.com/maps/documentation/javascript/usage).

### Interval
The interval is the amount of time, in hours, between data points.
For example, 24 will set one data point per day
and 1 will set a data point per hour.
Therefore, higher numbers will result in straighter lines and less points.
Lower numbers will be more curved with more points.

Really low intervals may throw an error--with too many data points
an `Errno::E2BIG` error is raised.
There is a TODO item to fix this.

### Speed
Speed is actually a misnomer.
A more accurate term would be 'time (in milliseconds) between jumps.'
Therefore, a value of 1 will move the icon really really fast.
That is, it will move ever 1 millisecond.
4000 will move slowly--the marker will only jump every 4 seconds.
Because it is time, all positive numbers are acceptable.
200 is a reasonable starting value.

### Colors
The icon and line accept any color values that are legal with CSS.
All the following are valid--
```
blue
#ff0000
rgb(0, 255, 0
rgba(255, 0, 0, 0.3)
hsl(120, 100%, 50%)
hsla(120, 100%, 25%, 0.3)
```

### Center
There are 4 options to set as the center of the map:
the U.S., Europe, the world, and 'where I've been'.

The center of the world is difficult to define,
but here the Royal Observatory in Greenwich, London is used.
The center of the places you've been is
the middle of your northern most point and your southern most point
at the intersection of
the middle of your eastern most point and your western most point.

To use another value, edit the `constants.yml` file.
More details in the 'Building The Map' section below.

### Zoom
For complete details, see the explanation in
[Google's Documentation](https://developers.google.com/maps/documentation/static-maps/intro#Zoomlevels).
In short, 1 is super zoomed-out and shows the world.
20 is super zoomed-in and is at the building level.

Rule of thumb--1: world, 5: continent, 10: city, 15: street, 20: building

### Map Type
It is possible to display the map in several formats:
roadmap, satellite, terrain, hybrid.
Details about each are available in
[Google's Documentation](https://developers.google.com/maps/documentation/static-maps/intro#MapTypes).

# Building The Map
When you run `./script` the console asks a series of questions.
The answers are populated in the `constants.yml` file.

If you prefer, you can directly edit the `constants.yml` file.
Additionally, this is necessary to set values outside of given options.
(E.g. to set the center of the map to the Lincoln Memorial,
you'll need to find it's longitude and latitude and set them here.)

To parse the data and build the map directly from `constants.yml`
just run `./script.rb --skip` to bypass the questions.

Lastly, the JavaScript file is built with some inelegant regex matching.
If the `js.js` is edited by hand,
it's possible the script will no longer create the file correctly.
To get a clean version of the JS file, copy over the template with
`cp ~/where-are-you-going-where-have-you-been/site/js.template ~/where-are-you-going-where-have-you-been/site/js.js`.

# A Note on Privacy
It is important to note that your map reveals your location history.
By zooming in on my map, it is possible to tell where I live,
determine companies I've interviewed with, and see where I've been on dates.

If you've been telling your friends you've been going to the Vim meetup
when you've really been going to Emacs meetup--you've been warned.

Setting a high interval will reduct the number of data points.
Additionally, there is a TODO item to control the precision of the location points.

# Examples
If you created and hosted a map, submit a pull request
(or open an issue with the link) to add it here!

* [common-nighthawk](http://danielallendeutsch.com/projects/map.html)

# Contributing
Because this project is small, we can dispense with formality.
Submit a pull request, open an issue, request a change.
All good!

# Wanna Say Thanks?
GitHub stars are helpful.
Most importantly, they help with discoverability.
Projects with more stars are displayed higher in search results.
Also--they make contributors feel good.

If you are feeling especially generous,
give a shout to [@cmmn_nighthawk](https://twitter.com/cmmn_nighthawk).

# TODO
* different color lines for different methods of transport
* add different levels of precision (e.g. details at only city-level)
* fix error with too many data points (Errno::E2BIG). do not add coordinates to js file with `echo >> site/js.js`
* add a command line option to not open the html file at the end of the script
