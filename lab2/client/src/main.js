import 'ol/ol.css';
import './style.css';
import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import ImageLayer from 'ol/layer/Image';
import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';
import { fromLonLat } from 'ol/proj';

function saveLayerState(id, visible) {
    localStorage.setItem(id, visible);
}

function loadLayerState(id, defaultValue = true) {
    const saved = localStorage.getItem(id);
    return saved !== null ? saved === 'true' : defaultValue;
}

const osm = new TileLayer({ source: new OSM() });
const buildings = new ImageLayer({
    source: new ImageWMS({
        url: 'http://localhost:8080/geoserver/gis/wms',
        params: { LAYERS: 'gis:buildings', TILED: true, FORMAT: 'image/png', TRANSPARENT: true },
        ratio: 1,
        serverType: 'geoserver'
    })
});
const roads = new ImageLayer({
    source: new ImageWMS({
        url: 'http://localhost:8080/geoserver/gis/wms',
        params: { LAYERS: 'gis:roads', TILED: true, FORMAT: 'image/png', TRANSPARENT: true },
        ratio: 1,
        serverType: 'geoserver'
    })
});
const poi = new ImageLayer({
    source: new ImageWMS({
        url: 'http://localhost:8080/geoserver/gis/wms',
        params: { LAYERS: 'gis:poi', TILED: true, FORMAT: 'image/png', TRANSPARENT: true },
        ratio: 1,
        serverType: 'geoserver'
    })
});

osm.setVisible(loadLayerState('toggle-osm', true));
buildings.setVisible(loadLayerState('toggle-buildings', true));
roads.setVisible(loadLayerState('toggle-roads', true));
poi.setVisible(loadLayerState('toggle-poi', true));

const map = new Map({
    target: 'map',
    layers: [osm, buildings, roads, poi],
    view: new View({
        center: fromLonLat([50.235, 53.302]),
        zoom: 16
    })
});

const toggleOsm = document.getElementById('toggle-osm');
const toggleBuildings = document.getElementById('toggle-buildings');
const toggleRoads = document.getElementById('toggle-roads');
const togglePoi = document.getElementById('toggle-poi');

if (toggleOsm) toggleOsm.checked = osm.getVisible();
if (toggleBuildings) toggleBuildings.checked = buildings.getVisible();
if (toggleRoads) toggleRoads.checked = roads.getVisible();
if (togglePoi) togglePoi.checked = poi.getVisible();

if (toggleOsm) {
    toggleOsm.addEventListener('change', (e) => {
        osm.setVisible(e.target.checked);
        saveLayerState('toggle-osm', e.target.checked);
    });
}
if (toggleBuildings) {
    toggleBuildings.addEventListener('change', (e) => {
        buildings.setVisible(e.target.checked);
        saveLayerState('toggle-buildings', e.target.checked);
    });
}
if (toggleRoads) {
    toggleRoads.addEventListener('change', (e) => {
        roads.setVisible(e.target.checked);
        saveLayerState('toggle-roads', e.target.checked);
    });
}
if (togglePoi) {
    togglePoi.addEventListener('change', (e) => {
        poi.setVisible(e.target.checked);
        saveLayerState('toggle-poi', e.target.checked);
    });
}