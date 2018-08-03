import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
Vue.use(Vuex);

import PostStore from './stores/post_store';
import UserStore from './stores/user_store';

const store = new Vuex.Store({
    modules: {
        UserStore,
        PostStore
    }
});

export default store;