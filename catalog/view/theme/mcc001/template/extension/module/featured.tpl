<div class="product-block featured">
    <h3>{{ heading_title }}</h3>
    <div class="row product-layout list-unstyled">
        {% for product in products %}
        <article class="product-item col-xs-6 col-sm-6 col-md-3 product-layout">
            <a href="{{ product.href }}" title="{{ product.name }}" class="product-thumb transition">
                <div class="image"><img src="{{ product.thumb }}" alt="{{ product.name }}" title="{{ product.name }}" class="img-responsive" /></div>
                <div class="caption">
                    <h4>{{ product.name }}</h4>
                    <p class="description">{{ product.description }}</p>

                    {% if product.price %}
                    <p class="price">
                        {% if not product.special %}
                        {{ product.price }}
                        {% else %}
                        <span class="price-new">{{ product.special }}</span> <span class="price-old">{{ product.price }}</span>
                        {% endif %}
                        {% if product.tax %}
                        <span class="price-tax">{{ text_tax }} {{ product.tax }}</span>
                        {% endif %}
                    </p>
					{% endif %}
                    {% if product.rating %}
                    <div class="rating">
                        {% for i in 5 %}
                        {% if product.rating < i %}
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        {% else %}
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        {% endif %}
                        {% endfor %}

                    </div>
                    {% endif %}


                </div>
            </a>
            <div class="button-group">
                <button class="btn btn-primary btn-custom" type="button" onclick="cart.add('{{ product.product_id }}');">{{ button_cart }}</button><br/>
                <div class="btn-group">
                    <button class="btn btn-default btn-wishlist" type="button" data-toggle="tooltip" title="{{ button_wishlist }}" onclick="wishlist.add('{{ product.product_id }}');"><i class="fa fa-heart"></i></button>
                    <button class="btn btn-default btn-compare" type="button" data-toggle="tooltip" title="{{ button_compare }}" onclick="compare.add('{{ product.product_id }}');"><i class="fa fa-exchange"></i></button>
                </div>
            </div>
        </article>
		{% endfor %}
    </div>
</div>
