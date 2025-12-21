'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "63613074bd6f0d6671224c1e17ba51ae",
"assets/AssetManifest.bin.json": "eff7526da127264e8a55d890eb62f622",
"assets/assets/cv/curriculo_en.pdf": "339c369213b9a9a0c4f89f9be129e82c",
"assets/assets/cv/curriculo_pt.pdf": "8575e2e0497a9e7ec984a1200f23516f",
"assets/assets/images/accenture.png": "95dd624319a1d828baf07a7baffb9db1",
"assets/assets/images/bmptec.png": "fb615f15701c54ad0016ec19b8df524d",
"assets/assets/images/dev_photo.jpg": "6707ddbc916f9e7cae418180c5fbfd53",
"assets/assets/images/icon-removebg-preview.png": "ed427c9e653275b7ecb516b1d934911a",
"assets/assets/images/Marca_Udesc.jpg": "7267ed0c4c87f9f9a7adf19b7872f505",
"assets/assets/images/totvs.png": "ae9fa9de0510b92b0c81437ccadfc3a5",
"assets/assets/listin/add_produto.jpg": "1f43e1cf43479597bd3d9e6dd94f2549",
"assets/assets/listin/add_produto_2.jpg": "b7356efb16f5d2b49522fc0a5c10370d",
"assets/assets/listin/altera_produto.jpg": "583976e5c955ce31c03b4e06ae7fbbff",
"assets/assets/listin/hamburguer.jpg": "b2202454c11d2da21373125f0c153e32",
"assets/assets/listin/home.jpg": "c4dc84ed8695aff25b69311c4a5cb480",
"assets/assets/listin/login.jpg": "3f7e3517b84a9ea0efba61a93c14595c",
"assets/assets/listin/ordenacao.jpg": "fb997cdedf340d89a2fef6a3f7b11863",
"assets/assets/recipes/categories.jpeg": "b158b4bc5a8328659b1bf4110ec71aa1",
"assets/assets/recipes/login.jpeg": "365cd7d1afc5116d9f4cef9c38aff3f1",
"assets/assets/recipes/recipe.jpeg": "c956daa07e3a471e7bd29e937c616e6c",
"assets/assets/recipes/recipes.jpeg": "499c5c61f599d365e794cf477d60aaf8",
"assets/assets/tcc/criacao_conta.png": "24394b9a66d196ea8bd876534eb807ca",
"assets/assets/tcc/home.png": "e9b3f9d6ff1a1e7475aa4d28c9a19849",
"assets/assets/tcc/login.png": "9d3b2680b59606ccd7b39b7b1fc9ec43",
"assets/assets/tcc/login2.png": "c797b38e8b637acd8a22fd5f0e09fa70",
"assets/assets/tcc/servico.png": "f714b5a968bfe7b59196bbca7ad9ec58",
"assets/assets/udesc_events/configuracao_notificacao.PNG": "42448fc98f37ae92a6b570be33c9dfde",
"assets/assets/udesc_events/criacao_evento.PNG": "926cb0287e498a438d21647e07ac3156",
"assets/assets/udesc_events/criacao_evento2.PNG": "5c57081848dedf72fba48d6633c6ba5c",
"assets/assets/udesc_events/criacao_evento3.PNG": "66b2b3075d78a93b8b61ff9f3b154f7a",
"assets/assets/udesc_events/evento1.PNG": "c92733a1a9798418338229dbdb625276",
"assets/assets/udesc_events/evento2.PNG": "2a300f1e2a74661753ce060df2b92aca",
"assets/assets/udesc_events/evento3.PNG": "23ab1fe2a0ac12fe10aecc40fda57d42",
"assets/assets/udesc_events/feed.PNG": "e4f82e4a6c81256c915dfa7ac9cb4147",
"assets/assets/udesc_events/feed2.PNG": "5d913397c38703546a3a65006126c5db",
"assets/assets/udesc_events/login.PNG": "6fc8526c8d5f6230c087d420af00f2c0",
"assets/assets/udesc_events/menu_hamb.PNG": "141bcb2f9d24501fdc445eb32cb44ac0",
"assets/assets/udesc_events/meus_eventos.PNG": "61a09e5d4df60c6a2dd6cff7b456a64b",
"assets/assets/udesc_events/minhas_inscricoes.PNG": "766c7ed83657b8082145843edb1a392b",
"assets/assets/udesc_events/Notificacoes.PNG": "32cdfed1dc36044955f64d82703af7b0",
"assets/assets/udesc_events/preferencias.PNG": "2b572634bb8460ad5a5282e805688414",
"assets/assets/udesc_events/todos_eventos.PNG": "ed533285d682a4771a716ba905d5d870",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2678e98a018c0eea6bec947b3efdef11",
"assets/NOTICES": "9f6fd43861dd94a53dc1b7b01579d6df",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "1e486158084c63aa18f1629e14de2713",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "f6df2f707b56b9a348361f18df055e78",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5a9ef843ac3d19c3b1ad30f9d0620344",
"/": "5a9ef843ac3d19c3b1ad30f9d0620344",
"main.dart.js": "c806866f3f8a5d03800ddafcf3a09065",
"manifest.json": "6c2ab38980b347810e07e38f6b01eb0b",
"version.json": "47724c37669ff4be126ea937b39c9d45"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
