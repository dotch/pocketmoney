
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:





Parse.Cloud.afterSave("Transaction", function(request) {
  // Our "Comment" class has a "text" key with the body of the comment itself
  var receiverId = request.object.get('receivingUserId');
  var senderId = request.object.get('sendingUserId');
  var amount = request.object.get('amount');
  var mode = request.object.get('mode');

  var user = Parse.Object.extend("_User");
  var q = new Parse.Query(user);
  //console.log("sender: " + senderId.id)
  q.equalTo("objectId", senderId.id);
  q.find({
    success: function(results) {

      var pushQuery = new Parse.Query(Parse.Installation);
      pushQuery.equalTo('deviceType', 'ios');
      var sendUser = results[0];
      var text = mode == "ask" ? sendUser.get("username") + " asked you for $" + amount + "!" :
        sendUser.get("username") + " sent you $" + amount + "!";

      Parse.Push.send({
        where: pushQuery, // Set our Installation query
        data: {
          alert: text
        }
      }, {
        success: function() {
          // Push was successful
        },
        error: function(error) {
          throw "Got an error " + error.code + " : " + error.message;
        }
      });

    }
  })

});
