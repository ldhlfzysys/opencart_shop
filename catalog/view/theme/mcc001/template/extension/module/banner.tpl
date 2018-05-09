<div id="banner{{ module }}" class="oc-banner">
    <div class="row">
        {% for banner in banners %}
        {% if banner.link %}
        <div class="col-sm-4 ">
            <a href="{{ banner.link }}" class="img-banner"><img src="{{ banner.image }}" alt="{{ banner.title }}" class="img-responsive" />
            </a>
        </div>
        {% else %}
        <div class="col-sm-4 ">
            <img src="{{ banner.image }}" alt="{{ banner.title }}" class="img-banner img-responsive" />
        </div>
        {% endif %}
		{% endfor %}

    </div>
</div>

