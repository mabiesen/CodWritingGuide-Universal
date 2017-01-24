# Model View Controller(MVC) - A User Interface Paradigm

## MVC is an expression of how a user interface is rendered.
* The Model contains all data and logic related to manipulation of that data
* The View contains information on how data will be presented to the user.
* The Controller (the browser in web applications) combines Model and View information for presentation

## Simple Example of MVC - Webpage
* Model - HTML and Javascript 
* View - CSS
* Controller - the Browser

The model provides page structure and logic; this would comprise all databases, data, JS/PHP/etc. logic, and HTML structure.  By default, if no CSS is provided to the Browser, a default styling is used to render the view; else the CSS is used to render he view.  The Browser displays the view.  In the event of user interaction, the Browser communicates back to the model, which is formatted by the view, which is rendered in the browser and the cycle repeats.

### In Rails - Taking the Example further

The Browser interacts with the model through routes.  Routes point to a specified controller, which can then alter the model.  Once the model is altered, it is formatted by the view and sent back to the Browser.

In Rails, the model exists entirely on the server.  However, with the assistance of AngularJS, EmberJS, JavascriptMVC, Backbone or similar, the model can be made to exist on the client side.


## MVC is not the ony UI paradigm
* Online reading has suggested that Rails is often more akin to an MVVM paradigm, this does not make sense to me.
* It has been suggested that what some refer to as MVC is actually more representative of a Model View Presenter paradigm

## Good websites to reference

https://blog.codinghorror.com/understanding-model-view-controller/

https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
