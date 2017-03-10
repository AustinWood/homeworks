import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';


import giphySearch from './util/api_util.js';

document.addEventListener("DOMContentLoaded", () => {
  window.giphySearch = giphySearch;
});
