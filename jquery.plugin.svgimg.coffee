# This plugin expects you to supply an SVG or SVGZ file as the
# src of an image. The script will only work if you omit the height or 
# width from the image in order to detect whether or not it rendered
# properly. Usage is simple - for instance to run this method on
# any svg images embedded in the page you can use:
#
# $(window).load(function () {
#   $("img[src$='.svg'], img[src$='.svgz']").svgimg();
# });
#
# I recommend $(window).load() over $(document).ready()
# to ensure that supporting browsers were able to render the 
# graphic before attempting to replace it with an object.
# 
# For handling browsers that do not support SVG graphics
# in general - I recommend utilizing a tool such as
# Modernizr to detect and handle a lack of SVG support.
# See: http://www.modernizr.com/
jQuery.fn.svgimg: (options) ->
   
   # Add a load event to each item. Then we perform the basic 
   # check to ensure it's rendered properly. If not - we'll try
   # embedding as an object with an alternate image if necessary.
   $(this).each( ->
      img: $(this)
      
      # Add an inline style to prevent display block from breaking
      # our detection method.
      img.attr('style','display: inline-block')
      
      # We're going to return to terminate the handler if we detect both dimensions.
      if img.height() > 0
         $('body').addClass('has_svg_images') if img.width() > 0
      else
         $('body').addClass('has_svg_images') if img.height() > 0
      
      if $('body').hasClass('has_svg_images')
         # Remove the inline style.
         img.removeAttr('style')
      else
         object: $('<object>')

         # We'll copy over any important attributes from the img tag.
         for attribute in ['height','width','id','class']
            object.attr(attribute, img.attr(attribute)) if img.attr(attribute)

         # Set the object's data attribute to the image's source.
         object.attr('data', img.attr('src'))
         img.after(object)
         img.remove()
   )