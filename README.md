# Augment

Our inspiration was derived from dreams of physically accessing what has been stored within the virtual worlds. We wanted for the user to be able to "feel" the software as if it wasn't just some random code running inside but rather something more tangible. We also wanted for this "code" to be useful in daily life, such as analyzing daily life objects, especially food, and getting the nutritional facts from the food. This will help the users better understand what they are eating and make better choices and we made a companion web app to track the cumulative food eaten by that user.

It will be using a projector along with an intricate system involving the iPhone, which allows the projector to display the screen of the iPhone. This will be displaying all the information sensed and analyzed by the hack which is being viewed on the iPhone screen. We are also utilizing a Myo for the hand motions which will control the iPhone screen which is being displayed by the projector so we don't need to hands on use the iPhone. The Myo will detect hand motions which will control our main iOS app and one of the main components of this hack, Augment. This native iOS app allows for the recognition and details about everyday items, ranging from a table, to a man's hand or face, to a sprite can. For food, nutritional details will also be given which will help the user analyze his daily meals. This app will be placed inside our main hardware container which will allow for the iPhone to detect whatever food or object that the user is trying to find out more about. All of this data will be stored on our web app, which runs meteor, and can be accessed by the user with his/her respective account. Another feature of the Augment iOS app is the ability to simply motion a gesture and take a picture wherever you are looking at, without the need to actually take out your phone and swipe up and then take the picture.

To build the hardware component of our Augment hack, we used cardboard which helped support our system which helped reflect the iPhone screen through the projector out onto any surface. We were able to get our hands on a pico projector which helped us in accomplishing this task. Afterwards, we integrated the Myo within our hack which allowed us to control the hack without actually touching the iPhone. This included our gestures which can be used to access certain features of our hack, like the Fist is to use the camera while a spread out hand is to access the "recognize food/object and respective details". For the recognition, we were able to implement MongoDB for the collection of various foods, nutritional facts, and for the graphing of the data gathered (the nutritional facts of the foods eaten by the user) via Nutritionix API. The overall detection was done via CloudSight API with OpenCV and we utilized Firebase for storage of images.

We ran into numerous challenges but the biggest hurdle was the object detection. However, this issue grew bigger when we had to incorporate this with our hardware and gestures. We were able to get through these hurdles by reading numerous documentations and blogs about optimizing a object recognition API along with perfecting the OpenCV and motion gestures which were recognized by the Myo. For the





## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisities

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Stay what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* Dropwizard - Bla bla bla
* Maven - Maybe
* Atom - ergaerga

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

