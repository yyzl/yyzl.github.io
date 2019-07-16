var res = [
    '/css/apollo.css',
    '/head.jpg',
    '/font/sourcesanspro.woff2'
];

var nowVersion = 'cache-v0.1.1';

self.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open(nowVersion).then(function(cache) {
            return cache.addAll(res);
        })
    );
});

// 旧版本被新版本替代的时候
// 这时候可以做一些缓存清理的工作
self.addEventListener('activate', function(event) {
    event.waitUntil(
        caches.keys().then(function(cacheNames) {
            return Promise.all(
                cacheNames.map(function(name) {
                    if (name !== nowVersion) {
                        caches.delete(name);
                    }
                })
            );
        })
    );
});

self.addEventListener('fetch', function(event) {
    event.respondWith(
        caches.match(event.request).then(function(response) {
            if (response) {
                return response;
            } else {
                return fetch(event.request.url);
            }
        })
    );
});
