$(document).ready(function() {
    // Setup the datetime pickers 
    $('#start').datetimepicker();
    $('#end').datetimepicker();

    /*
    * createUserRow
    *
    * Create the html code need to insert a user row.
    * @return HTML div
    */
    function createUserRow(d){
        var result = $('<div>').addClass('resultRow');
        for (key in d.user){
            $('<span>')
                .html('<b>[ ' + key + " : </b>" + d.user[key] + ' ]')
                .addClass('resultField')
                .appendTo(result)
        }
        return result;
    }
    /*
    * createLogRow
    *
    * Create the html code need to insert a log row.
    * @return HTML div
    */
    function createLogRow(d){
        var result = $('<div>').addClass('resultRow');
        console.log(d)        
        for (key in d.battleLog){
            $('<span>')
                .html('<b>[ ' + key + " : </b>" + d.battleLog[key] + ' ]')
                .addClass('resultField')
                .appendTo(result)
        }
        return result;
    }
    /*
    * ajaxGet
    *
    * Helper method to reduce code duplication preforms an ajax get call with the 
    * provided url, success and error functions
    */
    function ajaxGet(url, success, error){
        $.ajax({
            url: url,
            accepts: 'application/json',
            datatype: 'json',
            type: 'GET',
            xhrFields: {
                    withCredentials: true
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Authorization", 'Basic '+ btoa('patrick:patrick'));
            },
            success: success,
            error: error
        });
    }

    /*
    * buildLogURL
    *
    * Create the url to fetch the log data based off form data
    */
    function buildLogURL(){
        var start = $('#start').val();
        var end = $('#end').val();
        start = start.replace(' ', 'T');
        start = start.replace(/\//g, '-');
        end = end.replace(' ', 'T');
        end = end.replace(/\//g, '-');
        url = '/v1/battles/?format=json';
        if(start){
            url += '&start__gt=' + start;    
        }

        if(end){
            url += '&end__lt=' + end;    
        }
        return url;
    }

    // Handle form submit
    $('#nickForm').submit(function(e){
        var nick = $('#nickSearch').val()
        $('#userResult').html('');
        ajaxGet(
            '/v1/battleUser/?format=json&nickName=' + nick,
            function(data, textStatus, jqXHR) {
                for(user in data.objects){
                    var row = createUserRow(data.objects[user]);
                    console.log(row)
                    row.appendTo($('#userResult')) 
                }
            },
            function(jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        );
  	    e.preventDefault();
  	    return false;
    });

    // Handle form submit
    $('#logForm').submit(function(e){
        $('#logResult').html('');
        ajaxGet(
            buildLogURL(),
            function(data, textStatus, jqXHR) {
                for(log in data.objects){
                    var row = createLogRow(data.objects[log]);
                    console.log(row);
                    row.appendTo($('#logResult')) 
                }
            },
            function(jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        );
        e.preventDefault();
        return false;
    });

});


