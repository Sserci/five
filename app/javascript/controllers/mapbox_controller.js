// app/javascript/controllers/mapbox_controller.js
import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
    static values = {
        apiKey: String,
        markers: Array,
        marker: Object
    }

    connect() {
        mapboxgl.accessToken = this.apiKeyValue

        this.map = new mapboxgl.Map({
            container: this.element,
            style: "mapbox://styles/mapbox/streets-v10"
        })
        console.log(this.markersValue.length > 0)
        if (this.markersValue.length > 0) {
            this.#addMarkersToMap()
            this.#fitMapToMarkers()
        }
        if (this.markersValue) {
            this.#addMarkerToMap()
            this.#fitMapToMarker()
        }
    }

    #addMarkersToMap() {
        this.markersValue.forEach((marker) => {
            new mapboxgl.Marker()
                .setLngLat([ marker.lng, marker.lat ])
                .addTo(this.map)
        })
    }

    #fitMapToMarkers() {
        const bounds = new mapboxgl.LngLatBounds()
        this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
        this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }

    #addMarkerToMap() {
            new mapboxgl.Marker()
                .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
                .addTo(this.map)
    }

    #fitMapToMarker() {
        const bounds = new mapboxgl.LngLatBounds()
        bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
        this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
}