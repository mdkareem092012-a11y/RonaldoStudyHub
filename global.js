(function () {

    function loadTheme() {

        const savedTheme =
            localStorage.getItem("ronaldoTheme");

        if (savedTheme === "light") {

            document.body.classList.add(
                "light-mode"
            );

        }

    }


    window.toggleTheme = function () {

        document.body.classList.toggle(
            "light-mode"
        );

        const isLight =
            document.body.classList.contains(
                "light-mode"
            );

        localStorage.setItem(
            "ronaldoTheme",
            isLight ? "light" : "dark"
        );

    };


    window.exportStudyData = function () {

        const data = {};

        for (
            let i = 0;
            i < localStorage.length;
            i++
        ) {

            const key =
                localStorage.key(i);

            if (!key) {
                continue;
            }

            if (
                key.startsWith("ronaldo") ||
                key.startsWith("chapter-")
            ) {

                data[key] =
                    localStorage.getItem(key);

            }

        }


        const blob = new Blob(
            [
                JSON.stringify(
                    data,
                    null,
                    2
                )
            ],
            {
                type: "application/json"
            }
        );


        const url =
            URL.createObjectURL(blob);

        const link =
            document.createElement("a");

        link.href = url;

        link.download =
            "ronaldo-study-hub-backup.json";

        document.body.appendChild(link);

        link.click();

        link.remove();

        URL.revokeObjectURL(url);

    };


    window.importStudyData = function (file) {

        if (!file) {
            return;
        }


        const reader =
            new FileReader();


        reader.onload = function () {

            try {

                const data =
                    JSON.parse(
                        reader.result
                    );


                Object.keys(data).forEach(
                    function (key) {

                        if (
                            key.startsWith("ronaldo") ||
                            key.startsWith("chapter-")
                        ) {

                            localStorage.setItem(
                                key,
                                data[key]
                            );

                        }

                    }
                );


                alert(
                    "Study Hub data imported successfully."
                );


                location.reload();

            }
            catch (error) {

                alert(
                    "The backup file could not be imported."
                );

            }

        };


        reader.readAsText(file);

    };


    window.resetStudyData = function () {

        const confirmed =
            confirm(
                "Reset all Ronaldo Study Hub progress, test history, planner tasks, flashcards and saved settings from this browser?"
            );


        if (!confirmed) {
            return;
        }


        const keys = [];


        for (
            let i = 0;
            i < localStorage.length;
            i++
        ) {

            const key =
                localStorage.key(i);

            if (!key) {
                continue;
            }


            if (
                key.startsWith("ronaldo") ||
                key.startsWith("chapter-")
            ) {

                keys.push(key);

            }

        }


        keys.forEach(
            function (key) {

                localStorage.removeItem(
                    key
                );

            }
        );


        alert(
            "Study Hub data has been reset."
        );


        location.reload();

    };


    function registerServiceWorker() {

        if (
            !("serviceWorker" in navigator)
        ) {
            return;
        }


        /*
         Service Workers do not run on file:// pages.
         When the website is hosted using http/https,
         this registration enables offline caching.
        */

        if (
            location.protocol !== "http:" &&
            location.protocol !== "https:"
        ) {

            return;

        }


        const inChapter =
            location.pathname.includes(
                "/chapters/"
            );


        const serviceWorkerPath =
            inChapter
                ? "../sw.js"
                : "./sw.js";


        window.addEventListener(
            "load",
            function () {

                navigator.serviceWorker
                    .register(serviceWorkerPath)
                    .catch(
                        function (error) {

                            console.log(
                                "Service Worker registration failed:",
                                error
                            );

                        }
                    );

            }
        );

    }


    loadTheme();

    registerServiceWorker();


})();
