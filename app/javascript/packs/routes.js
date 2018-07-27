import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import HomeIndex from './components/home/index.vue';
import CommunityIndex from './components/home/community.vue';
import PostShow from './components/posts/show.vue';


const router = new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: HomeIndex, name: 'root_path' },
        { path: '/community', component: CommunityIndex, name: 'community_path'},
        { path: '/posts/:id', component: PostShow, name:'post_path'}
    ]
});

export default router;