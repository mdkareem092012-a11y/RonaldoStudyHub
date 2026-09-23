const CACHE_NAME =
    "ronaldo-study-hub-v1";


const CORE_FILES = [

    "./",
    "./index.html",

    "./dashboard.html",
    "./test-center.html",
    "./daily-challenge.html",

    "./flashcards.html",
    "./quiz-arena.html",
    "./map-lab.html",

    "./study-planner.html",
    "./pdf-centre.html",
    "./exam-simulator.html",

    "./settings.html",

    "./css/style.css",
    "./css/final-polish.css",

    "./js/app.js",
    "./js/global.js",
    "./js/dashboard.js",
    "./js/test-center.js"

];


self.addEventListener(
    "install",
    function (event) {

        event.waitUntil(

            caches.open(
                CACHE_NAME
            )
            .then(
                function (cache) {

                    return cache.addAll(
                        CORE_FILES
                    );

                }
            )
            .then(
                function () {

                    return self.skipWaiting();

                }
            )

        );

    }
);


self.addEventListener(
    "activate",
    function (event) {

        event.waitUntil(

            caches.keys()
                .then(
                    function (keys) {

                        return Promise.all(

                            keys
                                .filter(
                                    function (key) {

                                        return (
                                            key !==
                                            CACHE_NAME
                                        );

                                    }
                                )
                                .map(
                                    function (key) {

                                        return caches.delete(
                                            key
                                        );

                                    }
                                )

                        );

                    }
                )
                .then(
                    function () {

                        return self.clients.claim();

                    }
                )

        );

    }
);


self.addEventListener(
    "fetch",
    function (event) {

        if (
            event.request.method !== "GET"
        ) {
            return;
        }


        event.respondWith(

            caches.match(
                event.request
            )
            .then(
                function (cached) {

                    if (cached) {
                        return cached;
                    }


                    return fetch(
                        event.request
                    )
                    .then(
                        function (response) {

                            const copy =
                                response.clone();


                            caches.open(
                                CACHE_NAME
                            )
                            .then(
                                function (cache) {

                                    cache.put(
                                        event.request,
                                        copy
                                    );

                                }
                            );


                            return response;

                        }
                    )
                    .catch(
                        function () {

                            return caches.match(
                                "./index.html"
                            );

                        }
                    );

                }
            )

        );

    }
);
