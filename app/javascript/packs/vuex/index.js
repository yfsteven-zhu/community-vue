import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
Vue.use(Vuex);

import PostStore from './stores/post_store';

const store = new Vuex.Store({
    modules: {
        PostStore
    }
});

export default store;