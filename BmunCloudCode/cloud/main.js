
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
// after saving code, go to BmunCloudCode directory, then do "parse deploy; parse log -f"


var Mailgun = require('mailgun');
Mailgun.initialize('sandbox6297be6340654dbda14fa069757f08bc.mailgun.org', 'key-4a3ec384195678b3b13a6a63ff7d7460');

Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("sendEmail", function(request, response) {
    var data = request.params;
    Mailgun.sendEmail({
        to: "tempbmunfeedback@gmail.com",
        from: data.email,
        subject: data.topic,
        text: data.body
    }, {
        success: function(httpResponse) {
        console.log(httpResponse);
        response.success("Email sent!");
    },
        error: function(httpResponse) {
        console.error(httpResponse);
        response.error("Uh oh, something went wrong");
    }
});
})
