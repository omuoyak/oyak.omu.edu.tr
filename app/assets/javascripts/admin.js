//= require froala_editor.min.js
//= require languages/tr.js
//= require plugins/align.min.js
//= require plugins/url.min.js
//= require plugins/emoticons.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js


document.addEventListener('turbolinks:load', function(){
  $('#post_body').froalaEditor({
    language: 'tr'
  })
});


document.addEventListener('turbolinks:before-cache', function(){
  $('#post_body').remove();
})
