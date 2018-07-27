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
                        <li>Sign up</li>
                        <li class="divider"></li>
                        <li>
                            Log in
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    </header>
</template>
