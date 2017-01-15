# What This Is
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

But the gif doesn't do it justice.
For a proper demo,
[this examples is hosted on the web](http://danielallendeutsch.com/projects/map.html).

I was able to build this quickly so that it worked for my data.
But then I went back and extended it
so that it should be easy to build for anyone.
This tool will return three files:
one HTML, one CSS, and one JavaScript that make up the map with your data.

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
and then complete your own preferences for File Type (examples will assume .zip),
Archive Size, and Delivery Method.

To get an API Key, see the
[full instructions](https://developers.google.com/maps/documentation/javascript/get-api-key).
You should be able to manage everything from the
[API Console](https://console.developers.google.com/apis/credentials).

### Setup
Copy your location data in the top-level of this repository.
You'll see a LocationHistory.json file already exists.
Replace your that location history with *your* location history.

Uncompress the file Google provided and move over your data.
It will look something like this--
```
unzip ~/Downloads/takeout-20170101T000000Z.zip
cp ~/Downloads/Takeout/Location\ History/LocationHistory.json ~/where-are-you-going-where-have-you-been/
```
(This assume: the file Google provided is zipped,
that that file is stored in `Home/Downloads/`,
and that this repository is stored in `Home/`.
Update as necessary.)

### Create
From top-level of this directory, run `./script.rb`.
The console will ask you some questions,
including 'What is your API' key.
More detail is provided about each of the terms below.

At the end, the map should automatically open in your preferred browser &#128516;

### Assets
The page that opens is made up of three files, which can be found in
`where-are-you-going-where-have-you-been/site`.
If you want to host your map on the web, you'll just need those files.

# The Details
### API Key

### Interval

### Speed

### Center

# A Note on Privacy

# Examples
[common-nighthawk](http://danielallendeutsch.com/projects/map.html)

# Contributing
Because this project is small, we can dispense with formality.
Submit a pull request, open an issue, request a change.
All good!

# Wanna Say Thanks?
GitHub stars are helpful.
Most importantly, they help with discoverability.
Projects with more stars are displayed higher in search results.
Also--they make contributors feel good :)

If you are feeling especially generous,
give a shout to [@cmmn_nighthawk](https://twitter.com/cmmn_nighthawk).

# TODO
* exclude points with low confidence levels
* different color lines for different methods of transport

