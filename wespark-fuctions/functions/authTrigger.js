var admin = require("firebase-admin");
const functions = require('firebase-functions');
exports.createStudentDocument = functions.auth.user().onCreate(async (user) => {
  const email = user.email;
  const uid = user.uid;
  // await firestore.CollectionReference('students').doc("Students").set({
  //     "email": email,
  //     "name": null,
  //     "avatar":null,
  // });
  await admin.firestore().collection("Students").doc(uid).set({
    email: email,
    name: null,
    avatar: null,
  });
});
