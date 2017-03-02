/* global google */

function show(s1, s2, s3) {
    document.getElementById("text_comm").style.display = s1;
    document.getElementById("text_detail").style.display = s2;
    document.getElementById("text_about").style.display = s3;
    document.getElementById("text_input").style.display = s1;
}

function itemsChanged() {
    var value = document.getElementsByTagName('select')[0].value;
    window.location = '/LabsWeb?type=' + value;
}

function servletNamePage(value1, value2, value3) {
    window.location = 'ServletName?type=' + value1 + '&id=' + value2 + '&lang=' + value3;
}

function mainPage(value) {
    window.location = 'http://localhost:8080/LabsWeb/?lang=' + value;
}


function baskMenuPage(value) {
    window.location = 'http://localhost:8080/LabsWeb/Cart.jsp?lang=' + value;
}

function enter(value1, value2, value3) {
    window.location = 'SeqServlet?page=' + value1 + '&lang=' + value2 + '&id=' + value3;
}

function exit(value1, value2, value3) {
    window.location = 'ExitServlet?page=' + value1 + '&lang=' + value2 + '&id=' + value3;
}


function account(value) {
    window.location = 'http://localhost:8080/LabsWeb/PrAccount.jsp?lang=' + value + '&history=none';
}

function langPage(value, value1) {
    var res = '';
    var d = location.href.split("#")[0].split("?");
    var base = d[0];
    var query = d[1];
    if (query) {
        var params = query.split("&");
        for (var i = 0; i < params.length; i++) {
            var keyval = params[i].split("=");
            if (keyval[0] != value1) {
                res += params[i];
                if (i < params.length - 1) {
                    res += '&';
                }
            } else {
                res += value1 + '=' + value + '&';
            }
        }
    }
    window.history.pushState(null, null, base + '?' + res);
    return false;
}

function orderPage(value) {
    window.location = 'http://localhost:8080/LabsWeb/Order.jsp?lang=' + value + '&choice=1';
    /*document.getElementById("maps").style.display = 'block';
     document.getElementById("adress").style.display = 'none';
     document.getElementById("b1").style.border = '2px solid #209DCA';
     document.getElementById("b2").style.border = 'none';*/
}

function choice(value, value1) {
    if (value == '1') {
        document.getElementById("b1").style.border = '2px solid #209DCA';
        document.getElementById("b2").style.border = 'none';
        document.getElementById("maps").style.display = 'block';
        document.getElementById("adress").style.display = 'none';

    } else {
        document.getElementById("b2").style.border = '2px solid #209DCA';
        document.getElementById("b1").style.border = 'none';
        document.getElementById("maps").style.display = 'none';
        document.getElementById("adress").style.display = 'block';
    }
    window.location = 'http://localhost:8080/LabsWeb/Order.jsp?lang=' + value1 + '&choice=' + value;
}

var map;

function initMap() {
    var myLatLng = {lat: 59.956080, lng: 30.308455};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 9,
        center: myLatLng
    });

    var marker1 = new google.maps.Marker({
        position: myLatLng,
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker1.getPosition());
            market_choise('m1');
        }
    });
    marker1.addListener('click', marker1.func);

    var marker2 = new google.maps.Marker({
        position: {lat: 59.990996, lng: 30.315149},
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker2.getPosition());
            market_choise('m2');
        }
    });
    marker2.addListener('click', marker2.func);

    var marker3 = new google.maps.Marker({
        position: {lat: 59.827976, lng: 30.378618},
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker3.getPosition());
            market_choise('m3');
        }
    });
    marker3.addListener('click', marker3.func);

    var marker4 = new google.maps.Marker({
        position: {lat: 59.895845, lng: 30.275176},
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker4.getPosition());
            market_choise('m4');
        }
    });
    marker4.addListener('click', marker4.func);

    var marker5 = new google.maps.Marker({
        position: {lat: 59.959703, lng: 30.439751},
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker5.getPosition());
            market_choise('m5');
        }
    });
    marker5.addListener('click', marker5.func);

    var marker6 = new google.maps.Marker({
        position: {lat: 59.901821, lng: 30.420935},
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker6.getPosition());
            market_choise('m6');
        }
    });
    marker6.addListener('click', marker6.func);


    var marker7 = new google.maps.Marker({
        position: {lat: 60.058848, lng: 30.335862},
        map: map,
        func: function () {
            map.setZoom(15);
            map.setCenter(marker7.getPosition());
            market_choise('m7');
        }
    });
    marker7.addListener('click', marker7.func);

    document.getElementById("m1").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker1.getPosition());
    };
    document.getElementById("m2").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker2.getPosition());
    };
    document.getElementById("m3").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker3.getPosition());
    };
    document.getElementById("m4").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker4.getPosition());
    };
    document.getElementById("m5").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker5.getPosition());
    };
    document.getElementById("m6").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker6.getPosition());
    };
    document.getElementById("m7").onchange = function () {
        map.setZoom(15);
        map.setCenter(marker7.getPosition());
    };
}

function market_choise(value) {
    document.getElementById(value).checked = 'checked';
}

function addHistory(value, value1) {
    if (value1 == '0') {
        window.location = 'SeqServlet?page=4&lang=' + value + '&id=null';
    } else {
        window.location = 'http://localhost:8080/LabsWeb/AddToBase?page=read&lang=' + value;
    }
}


function myTimer(value) {
    if (value == null)
        value = 'ru';
    var date = new Date();
    document.getElementById("TIME").textContent = date.toLocaleString(value);
}


function loadXMLDoc() {
    var comment = document.getElementById("comment").value;
    var xmlhttp;
    document.getElementById("comment").value = null;
    if (window.XMLHttpRequest)
        xmlhttp = new XMLHttpRequest();
    else
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            document.getElementById("RESULT").innerHTML = xmlhttp.responseText;
    };
    xmlhttp.open("GET", "/LabsWeb/AjaxServlet?comment=" + comment, true);
    xmlhttp.send();
}