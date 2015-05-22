// This is a factory for generating an AJAX conduit
function ajaxRequest() {
  var activexmodes=["Msxml2.XMLHTTP", "Microsoft.XMLHTTP"] //activeX versions to check for in IE
  if (window.ActiveXObject) { 
    //Test for support for ActiveXObject in IE first (as XMLHttpRequest in IE7 is broken)
    for (var i=0; i<activexmodes.length; i++){
      try{
        return new ActiveXObject(activexmodes[i])
      } catch(e) {
        //suppress error
      }
    }
  } else if (window.XMLHttpRequest) {
    // if Mozilla, Safari etc
    return new XMLHttpRequest()
  } else {
    return false
  }
}

// This is a function to handle the actual transmission and coding of the data
// Javascript object in and Javascript structure back out
// JSON back and forth to server
function ajaxXmit(data, myfun) {
  var ajax = new ajaxRequest()

  ajax.onreadystatechange = function() {
    if (ajax.readyState==4){
      if (ajax.status==200 || window.location.href.indexOf("http")==-1){
        var jsondata = eval("(" + ajax.responseText + ")")
        myfun(jsondata)
      } else {
        alert("An error has occured making the request") 
      }
    }      
  }

  var ret = JSON.stringify(data)

  ajax.open("POST", "processAJAX.php", true)
  ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  ajax.send("dataString=" + ret)  
}

function saveState() {
  // If the question state is dirty, then save the current state
  // Question dirtyness can be determined by 
}

function previous() {
  var cmd = {"command":"previous"}
  ajaxXmit(cmd, 
      function(data) {
        document.getElementById("main").innerHTML = data.text
      }
    )
}

function next() {
  var cmd = {"command":"next"}
  ajaxXmit(cmd, 
      function(data) {
        document.getElementById("main").innerHTML = data.text
      }
    )
}

function home() {
  var cmd = {"command":"home"}
  ajaxXmit(cmd, 
      function(data) {
        document.getElementById("main").innerHTML = data.text
      }
    )
}

function welcome() {
  var cmd = {"command":"welcome"}
  ajaxXmit(cmd, 
      function(data) {
        document.getElementById("main").innerHTML = data.text
      }
    )
}