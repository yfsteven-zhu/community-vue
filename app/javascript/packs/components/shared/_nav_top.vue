<template>
    <header class="navbar navbar-fixed-top navbar-inverse" style="position: relative;">
    <div class="container">
        <a href="/" id="logo">Community Prototype</a>
        <nav>
            <ul class="nav navbar-nav navbar-right">
               <li>
                   <router-link :to="{name: 'root_path'}">
                       <i class="fa fa-home" style="font-size:18px;"></i>
                   </router-link>
                </li>
                <li>
                    <router-link :to="{name: '#'}">
                        <i class="fa fa-search" style="font-size:18px;"></i>
                    </router-link>
                </li>

                <li class="dropdown">
                    <a href="#" class = "dropdown-toggle" data-toggle="dropdown" style="font-size:18px;">
                        <i class="fa fa-user-circle-o"></i> <b class="caret"></b>

                    </a>
                    <ul class="dropdown-menu" style="text-align: center; min-width: 95px;">
                        <li style="cursor: pointer" onclick="document.getElementById('id01').style.display='block'">Sign up</li>
                        <li class="divider"></li>
                        <li>
                            Log in
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>

        <div id="id01" class="modal">
            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            <form class="modal-content" v-on:submit.prevent="create">
                <div class="container signup">
                    <h1>Sign Up</h1>
                    <p>Please fill in this form to create an account.</p>
                    <hr>
                    <label><b>Username</b></label>
                    <span class="error">{{errors.user}}</span>
                    <input type="text" v-model="user.name" placeholder="Enter Username" required>

                    <label><b>Email</b></label>
                    <span class="error">{{errors.email}}</span>
                    <input type="text" v-model="user.email" placeholder="Enter Email" required>

                    <label><b>Password</b></label>
                    <span class="error">{{errors.password}}</span>
                    <input type="password" v-model="user.password" placeholder="Enter Password" required>

                    <label><b>Confirm Password</b></label>
                    <span class="error">{{errors.password_confirmation}}</span>
                    <input type="password" v-model="user.password_confirmation" placeholder="Repeat Password" required>

           <!--         <label>
                        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
                    </label> -->

                    <div class="clearfix">
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                        <button type="submit" class="signupbtn">Sign Up</button>
                    </div>
                </div>
            </form>
        </div>
    </header>
</template>

<script>
    export default {
        data: function() {
            return this.$store.state.UserStore;
        },
        mounted:
            function() {
            this.$store.dispatch('UserStore/new', this.$route.params.id)
            },
        methods: {
            create: function() {
                this.$store.dispatch('UserStore/create', this.user).then(
                    response => {
                        this.$router.push({name: 'community_path'})
                    }
                )
            }
        }

    }

</script>
