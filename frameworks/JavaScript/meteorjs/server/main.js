import { Meteor } from 'meteor/meteor';
import { EJSON } from 'meteor/ejson'

Meteor.startup(() => {

  const getRoutes = Picker.filter((req, res) => {
    return req.method == "GET";
  });

  getRoutes.route('/plaintext', function(params, req, res) {
    // var post = Posts.findOne(params._id);
    res.end("Hello, World!");
  });

  getRoutes.route('/json', (params, req, res) => {
    res.end(EJSON.stringify({message: "Hello, World!"}));
  });
});
