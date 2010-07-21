(function(){
  jQuery.fn.svgimg = function(options) {
    return $(this).each(function() {
      var _a, _b, _c, attribute, img, object;
      img = $(this);
      img.attr('style', 'display: inline-block');
      if (img.height() > 0) {
        if (img.width() > 0) {
          $('body').addClass('has_svg_images');
        }
      } else {
        if (img.height() > 0) {
          $('body').addClass('has_svg_images');
        }
      }
      if ($('body').hasClass('has_svg_images')) {
        return img.removeAttr('style');
      } else {
        object = $('<object>');
        _b = ['height', 'width', 'id', 'class'];
        for (_a = 0, _c = _b.length; _a < _c; _a++) {
          attribute = _b[_a];
          if (img.attr(attribute)) {
            object.attr(attribute, img.attr(attribute));
          }
        }
        object.attr('data', img.attr('src'));
        img.after(object);
        return img.remove();
      }
    });
  };
})();
