var json;function loadUI(uri){$.ajaxSetup({url:uri,type:"GET"});$.ajax({success:function(data){json=jQuery.parseJSON(data);for(var key in json){$('#list_content').append('<li><a data-transition="slide" class="row" id="'+key+'">'+json[key].title+'</a></li>')}$('ul').listview('refresh');$('.row').live("click",function(){onClick($(this).attr("id"))})},error:function(object,error){alert("error loading data ---> "+error)}})}function onClick(key){window.location="#entry";$("#news").empty();$("#news").append("<p>"+json[key].title+"</p>");$("#news").append("<p>"+json[key].summary+"</p>");$("#news").append("<p>Publiserad: "+json[key].pubdate+"</p>");$("#news").append("<p>Författare: "+json[key].author+"</p>")}