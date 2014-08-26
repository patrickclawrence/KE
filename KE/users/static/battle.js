$(document).ready(function() {
  

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

    $('#nickForm').submit(function(e){
        var nick = $('#nickSearch').val()
        $('#userResult').html('');
        $.ajax({
            // Substitute in your API endpoint here.
            url: '/v1/battleUser/?format=json&nickName=' + nick,
            accepts: 'application/json',
            datatype: 'json',
            type: 'GET',
            xhrFields: {
                    withCredentials: true
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Authorization", 'Basic '+ btoa('patrick:pLaAtW12'));
            },
            // The ``X-CSRFToken`` evidently can't be set in the
            // ``headers`` option, so force it here.
            // This method requires jQuery 1.5+.

            success: function(data, textStatus, jqXHR) {
                // Your processing of the data here.
                for(user in data.objects){
                    var row = createUserRow(data.objects[user]);
                    console.log(row)
                    row.appendTo($('#userResult')) 
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
            	alert(errorThrown);
            }
        });

  	    e.preventDefault();
  	    return false;
    });

    $('#logForm').submit(function(e){
        var start = $('#start').val();
        var end = $('#end').val();
        $.ajax({
            // Substitute in your API endpoint here.
            url: '/v1/battleUser/?format=json&nickName=' + start,
            accepts: 'application/json',
            datatype: 'json',
            type: 'GET',
            xhrFields: {
                withCredentials: true
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Authorization", 'Basic '+ btoa('patrick:pLaAtW12'));
            },
            // The ``X-CSRFToken`` evidently can't be set in the
            // ``headers`` option, so force it here.
            // This method requires jQuery 1.5+.

            success: function(data, textStatus, jqXHR) {
                // Your processing of the data here.
                for(user in data.objects){
                    var row = createUserRow(data.objects[user]);
                    console.log(row)
                    row.appendTo($('#userResult')) 
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
        e.preventDefault();
        return false;
    });

});


