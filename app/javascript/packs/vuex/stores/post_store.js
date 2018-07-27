const PostStore = {
    namespaced: true,
    state: {
        posts: [],
        post: {}
    },
    mutations: {
        one(state, data) {
            state.post = data.post;
            return state;
        },
        many(state, data) {
            state.posts= data.posts;
            return state;
        }
    },
    actions: {
        index(context, query) {
            $.ajax({
                url: `posts`,
                type: 'get',
                data: query,
                success: function(data) {
                    context.commit('many', data)
                }
            })
        },
        show(context, id) {
            $.ajax({
                url: `posts/${id}`,
                type: 'get',
                success: function(data) {
                    context.commit('one', data)
                }
            })
        },
    }
};

export default PostStore;