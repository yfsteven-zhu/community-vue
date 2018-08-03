<template>
    <div class = "community_post">
        <ol class="posts">
        <li v-for="post in posts" v-bind:id="'post-'+post.id" class="post_li">
            <aside class="avatar_img">
                <!-- need determine whether user upload own avatar
                     and create a link between avatar picture and user profile-->
                <a href="#">
                <img class="img-circle" src="/default.jpg">
                </a>
            </aside>
            <section class="post_body" style="overflow:auto">
                <span class="title">
                <router-link :to="{ name: 'post_path', params: {id: post.id} }">{{ post.title }}</router-link>
                </span>

                <span class="timestamp">
                 Posted by
                    {{post.name}},
                   <!-- <router-link :to="{ name: 'user_path', params: {id: user.id} }">{{ user.name }}</router-link>-->
                    {{post.created_at}} ago
                </span>

                <div class="article">
                  <div class="text-body short">
                    <div class="posttext">
                        <!-- need sanitize -->
                        {{post.content}}
                    </div>
                  </div>
                  <div class="expand-style" style="background: linear-gradient(rgba(255,255,255,0),#fff);
    float:left;margin-top: -40px;position:absolute;
    height: 4rem;
    width: 550px;"></div>
                  <span class="readmore"></span>
                  <div class="picture_slide"></div>
                </div>

            <span class="post_info">
                <div class="post_info_view">
                    <img style="margin-top:-3px;margin-right:8px;" src="/assets/view-icon.png" width="20" height="18">

                </div>
                <div class="post_info_comment">
                    <img style="margin-right:10px;" src="/assets/comment_icon.png" width="15" height="15">
                 </div>
            </span>
            </section>
        </li>
        </ol>

    </div>
</template>


<script>

    export default {

        data: function(){
            return this.$store.state.PostStore;
        },

        mounted: function(){
            this.$store.dispatch('PostStore/index');
        }
    }
</script>