 //= require tinymce


document.addEventListener('turbolinks:load', function(){
  tinymce.init({
    selector: '.tinymce'
  });
});


document.addEventListener('turbolinks:before-cache', function(){
  $('#froala').remove();
})
