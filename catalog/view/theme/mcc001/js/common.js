

function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

$(document).ready(function() {
    // Highlight any found errors
    $('.text-danger').each(function() {
        var element = $(this).parent().parent();

        if (element.hasClass('form-group')) {
            element.addClass('has-error');
        }
    });


    /* Search */
    $(' #search input[name=\'search\']').parent().find('button').on('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var value = $('input[name=\'search\']').val();

        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }

        location = url;
    });

    $(' #search input[name=\'search\']').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('#header input[name=\'search\']').parent().find('button').trigger('click');
        }
    });



    // Product List
    $('#list-view').click(function() {
        $('#content .product-layout').addClass('row-list');

        $('#content .product-item').attr('class', 'product-item product-list col-xs-6 col-sm-12');

        localStorage.setItem('display', 'list');
    });

    // Product Grid
    $('#grid-view').click(function() {
        $('#content .product-layout').removeClass('row-list');

        // What a shame bootstrap does not take into account dynamically loaded columns
        cols = $('#column-right, #column-left').length;

        if (cols == 2) {
            $('#content .product-item').attr('class', 'product-item product-grid col-lg-6 col-md-6 col-sm-12 col-xs-6');

        } else if (cols == 1) {
            $('#content .product-item').attr('class', 'product-item product-grid col-lg-4 col-md-4 col-sm-6 col-xs-6');

        } else {
            $('#content .product-item').attr('class', 'product-item product-grid col-lg-3 col-md-3 col-sm-6 col-xs-6');

        }

        localStorage.setItem('display', 'grid');
    });

    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
    } else {
        $('#grid-view').trigger('click');
    }

    // Checkout
	  $(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			  $('#collapse-checkout-option #button-login').trigger('click');
		}
	  });


    // tooltips on hover
    $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

    // Makes tooltips work on ajax generated content
    $(document).ajaxStop(function() {
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
    });
	



});



// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('.container.columns').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total">' + json['total'] + '</span>');
					}, 100);

					$('.bt-cart-mobile').addClass('incart');

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
      },
  	    error: function(xhr, ajaxOptions, thrownError) {
  	      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
  	 }
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"> ' + json['total'] + '</span>');
				}, 100);

				$('.bt-cart-mobile').addClass('incart');

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
      },
    error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
      },
        error: function(xhr, ajaxOptions, thrownError) {
	      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	   }
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
      },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
		});
	}
}

var wishlist = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();
                if (json['redirect']) {
        					location = json['redirect'];
        				}

        				if (json['success']) {
        					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        				}

                $('#wishlist-total span').html(json['total']);
				        $('#wishlist-total').attr('title', json['total']);

                $('html, body').animate({ scrollTop: 0 }, 'slow');
    			      },
    	           error: function(xhr, ajaxOptions, thrownError) {
    	           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    	         }
        });
    },
    'remove': function() {

    }
}

var compare = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();

                if (json['success']) {
                    $('#content').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#compare-total').html(json['total']);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
              },
              error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function() {

    }
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
    e.preventDefault();

    $('#modal-agree').remove();

    var element = this;

    $.ajax({
        url: $(element).attr('href'),
        type: 'get',
        dataType: 'html',
        success: function(data) {
            html  = '<div id="modal-agree" class="modal">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div';
            html += '  </div>';
            html += '</div>';

            $('body').append(html);

            $('#modal-agree').modal('show');
        }
    });
});

/* Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);



$(function() {
    $(window).scroll(function() {
        if($(this).scrollTop() > 300) {
            $('.rapidtop').fadeIn();
        } else {
            $('.rapidtop').stop().fadeOut();
        }
    });
    $('.rapidtop button').click(function() {
        $('body,html').animate({scrollTop:0},800);
    });
});

function responsive_break(){
if($(window).width() > 991) {

        $('.flexnav .list-unstyled').each(function() {
            var menu = $('.flexnav').offset();
            var dropdown = $(this).parent().offset();

            var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('.flexnav').outerWidth());

            if (i > 0) {
                $(this).css('margin-left', '-' + (i + 30) + 'px');

            }
        });
        // affix product-page
        $('#price-block .affix-product').affix({
            offset: {
                top: (this.top = $('#header').outerHeight(true) + 45),
                bottom: function () {
                    return (this.bottom = $('#footer').outerHeight(true) + 45 )
                }
            }
        }).css('width',$('#price-block').width());
    }else {
     $('.flexnav .list-unstyled').css('margin-left', '0px');
    }
}


$(document).ready(function() {
    // Menu + affix
    responsive_break();


    // Nav mobile version

    var blocks = new Array();

    if($('#search-block').length){blocks.push('#search-block');}
    if($('#navigation').length){blocks.push('#navigation');}
    if($('.user_info').length){blocks.push('.user_info');}
    if($('.wishlist-link').length){blocks.push('.wishlist-link');}
    if($('#currency-block').length){blocks.push('#currency-block');}
    if($('#languages-block').length){blocks.push('#languages-block')}

    $('#responsive-menu-button').sidr({
        name: 'sidr-main',
        renaming: false,
        source: blocks.join()});
});


$(window).resize(function(){
    // Menu + affix
    responsive_break();
    if($(window).width() > 991) {
        $.sidr('close', 'sidr-main');
    }
});


+function ($) {
    'use strict';
    if ( !$.fn.carousel ) {
        throw new Error( "carousel-swipe required bootstrap carousel" )
    }
    // CAROUSEL CLASS DEFINITION
    // =========================
    var CarouselSwipe = function(element) {
        this.$element = $(element)
        this.carousel = this.$element.data('bs.carousel')
        this.options = $.extend({}, CarouselSwipe.DEFAULTS, this.carousel.options)
        this.startX =
            this.startY =
            this.startTime =
            this.cycling =
            this.$active =
            this.$items =
            this.$next =
            this.$prev =
            this.dx = null
        this.$element
        .on('touchstart', $.proxy(this.touchstart,this))
        .on('touchmove', $.proxy(this.touchmove,this))
        .on('touchend', $.proxy(this.touchend,this))
    }
    CarouselSwipe.DEFAULTS = {
        swipe: 50 // percent per second
    }
    CarouselSwipe.prototype.touchstart = function(e) {
        if (!this.options.swipe) return;
        var touch = e.originalEvent.touches ? e.originalEvent.touches[0] : e
        this.dx = 0
        this.startX = touch.pageX
        this.startY = touch.pageY
        this.cycling = null
        this.width = this.$element.width()
        this.startTime = e.timeStamp
    }
    CarouselSwipe.prototype.touchmove = function(e) {
        if (!this.options.swipe) return;
        var touch = e.originalEvent.touches ? e.originalEvent.touches[0] : e
        var dx = touch.pageX - this.startX
        var dy = touch.pageY - this.startY
        if (Math.abs(dx) < Math.abs(dy)) return; // vertical scroll
        if ( this.cycling === null ) {
            this.cycling = !!this.carousel.interval
            this.cycling && this.carousel.pause()
        }
        e.preventDefault()
        this.dx = dx / (this.width || 1) * 100
        this.swipe(this.dx)
    }
    CarouselSwipe.prototype.touchend = function(e) {
        if (!this.options.swipe) return;
        if (!this.$active) return; // nothing moved
        var all = $()
        .add(this.$active).add(this.$prev).add(this.$next)
        .carousel_transition(true)
        var dt = (e.timeStamp - this.startTime) / 1000
        var speed = Math.abs(this.dx / dt) // percent-per-second
        if (this.dx > 40 || (this.dx > 0 && speed > this.options.swipe)) {
            this.carousel.prev()
        } else if (this.dx < -40 || (this.dx < 0 && speed > this.options.swipe)) {
            this.carousel.next();
        } else {
            this.$active
            .one($.support.transition.end, function () {
                all.removeClass('prev next')
            })
            .emulateTransitionEnd(this.$active.css('transition-duration').slice(0, -1) * 1000)
        }
        all.css('left', '')
        this.cycling && this.carousel.cycle()
        this.$active = null // reset the active element
    }
    CarouselSwipe.prototype.swipe = function(percent) {
        var $active = this.$active || this.getActive()
        if (percent < 0) {
            this.$prev
            .css('left', '')
            .removeClass('prev')
            .carousel_transition(true)
            if (!this.$next.length || this.$next.hasClass('active')) return
            this.$next
            .carousel_transition(false)
            .addClass('next')
            .css('left', (percent + 100) + '%')
                } else {
                    this.$next
                    .css('left', '')
                    .removeClass('next')
                    .carousel_transition(true)
                    if (!this.$prev.length || this.$prev.hasClass('active')) return
                    this.$prev
                    .carousel_transition(false)
                    .addClass('prev')
                    .css('left', (percent - 100) + '%')
                        }
        $active
        .carousel_transition(false)
        .css('left', percent + '%')
    }
    CarouselSwipe.prototype.getActive = function() {
        this.$active = this.$element.find('.item.active')
        this.$items = this.$active.parent().children()
        this.$next = this.$active.next()
        if (!this.$next.length && this.options.wrap) {
            this.$next = this.$items.first();
        }
        this.$prev = this.$active.prev()
        if (!this.$prev.length && this.options.wrap) {
            this.$prev = this.$items.last();
        }
        return this.$active;
    }
    // CAROUSEL PLUGIN DEFINITION
    // ==========================
    var old = $.fn.carousel
    $.fn.carousel = function() {
        old.apply(this, arguments);
        return this.each(function () {
            var $this = $(this)
            var data = $this.data('bs.carousel.swipe')
            if (!data) $this.data('bs.carousel.swipe', new CarouselSwipe(this))
                })
    }
    $.extend($.fn.carousel,old);
    $.fn.carousel_transition = function(enable) {
        enable = enable ? '' : 'none';
        return this.each(function() {
            $(this)
            .css('-webkit-transition', enable)
            .css('transition', enable)
        })
    };
}(jQuery);
