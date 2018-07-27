<template>
    <layout>
    <div class="row"  style="width:82.15%;margin:auto;">
        <nav class="nav_bar">
            <ul>
                <li>
                    <router-link :to="{name: 'root_path'}">
                        Home
                    </router-link>
                        \&nbsp;
                </li>
                <li>
                    Community
                </li>
            </ul>
        </nav>
        <header class="community_header">
            <h1>Community</h1>

            <div v-if="isEmpty" class="dropdown" id="sort_dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: #f2f2f2;
              color: black;
              border-color: #f2f2f2;">
                    Sort by: Posts - Newest
                    <span class="caret"></span></button>
                <ul class="dropdown-menu" id="sort-menu">
                    <li>Newest</li>
                    <li>Comment-Newest</li>
                </ul>
            </div>

        </header>

        <Post></Post>
    </div>
    </layout>
</template>


<script>
    import Layout from '../shared/layout';
    import Post from './_post.vue';

    export default {
        components: {
            Layout,
            Post
        },

        computed: {
            isEmpty: function () {
                return jQuery.isEmptyObject(this.data);
            }
        }
    }
</script>