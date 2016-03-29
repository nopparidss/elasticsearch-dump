'use strict';
const express = require('express');
const router = express.Router();


const _copyIndex = (indexName) => {
  return new Promise((resolve, reject) => {
    const exec = require('child_process').exec;
    let cmd = './esdump.sh "' + 'http://localhost:9200" "' + indexName +'"'
    exec(cmd, (error, stdout, stderr) => {
      console.log("error:", error)
      console.log("stdout:", stdout)
      console.log("stderr:", stderr)
      resolve(indexName);
    })
  });
}

/* GET users listing. */
router.get('/dump', function(req, res, next) {
  let indexName = req.query.indexName;
  _copyIndex(indexName)
  .then((data) => {
    res.send(indexName)
  })
});

module.exports = router;
