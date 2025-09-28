'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b498a1bc3927a52c971f322be5f7c2b2",
"version.json": "47724c37669ff4be126ea937b39c9d45",
"index.html": "c3933bfe26ddef9f492b526be9f7fc41",
"/": "c3933bfe26ddef9f492b526be9f7fc41",
"main.dart.js": "5e3c352310fce2af5ac29532d65a84b5",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "f951e4cda0987e654b5433886d493628",
"assets/AssetManifest.json": "9018855cc242a34500916e56fd3d48bc",
"assets/NOTICES": "60fcf8a6564e255a550111113ae60bc5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "4d457dd0878fb2e8c846a22b86d7e961",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b51869e5ee10294459bb8ca544243071",
"assets/fonts/MaterialIcons-Regular.otf": "2678e98a018c0eea6bec947b3efdef11",
"assets/assets/images/Marca_Udesc.jpg": "7267ed0c4c87f9f9a7adf19b7872f505",
"assets/assets/images/dev_photo.jpg": "9cee417e8858b57821e76864818abb71",
"assets/assets/images/totvs.png": "ae9fa9de0510b92b0c81437ccadfc3a5",
"assets/assets/images/bmptec.png": "fb615f15701c54ad0016ec19b8df524d",
"assets/assets/tcc/criacao_conta.png": "24394b9a66d196ea8bd876534eb807ca",
"assets/assets/tcc/login.png": "9d3b2680b59606ccd7b39b7b1fc9ec43",
"assets/assets/tcc/home.png": "e9b3f9d6ff1a1e7475aa4d28c9a19849",
"assets/assets/tcc/login2.png": "c797b38e8b637acd8a22fd5f0e09fa70",
"assets/assets/tcc/servico.png": "f714b5a968bfe7b59196bbca7ad9ec58",
"assets/assets/recipes/recipe.jpeg": "c956daa07e3a471e7bd29e937c616e6c",
"assets/assets/recipes/categories.jpeg": "b158b4bc5a8328659b1bf4110ec71aa1",
"assets/assets/recipes/recipes.jpeg": "499c5c61f599d365e794cf477d60aaf8",
"assets/assets/recipes/login.jpeg": "365cd7d1afc5116d9f4cef9c38aff3f1",
"assets/assets/cv/curriculo_pt.pdf": "339c369213b9a9a0c4f89f9be129e82c",
"assets/assets/cv/curriculo_en.pdf": "339c369213b9a9a0c4f89f9be129e82c",
"assets/assets/udesc_events/criacao_evento.PNG": "926cb0287e498a438d21647e07ac3156",
"assets/assets/udesc_events/feed.PNG": "e4f82e4a6c81256c915dfa7ac9cb4147",
"assets/assets/udesc_events/login.PNG": "6fc8526c8d5f6230c087d420af00f2c0",
"assets/assets/udesc_events/preferencias.PNG": "2b572634bb8460ad5a5282e805688414",
"assets/assets/udesc_events/evento1.PNG": "c92733a1a9798418338229dbdb625276",
"assets/assets/udesc_events/meus_eventos.PNG": "61a09e5d4df60c6a2dd6cff7b456a64b",
"assets/assets/udesc_events/evento3.PNG": "23ab1fe2a0ac12fe10aecc40fda57d42",
"assets/assets/udesc_events/evento2.PNG": "2a300f1e2a74661753ce060df2b92aca",
"assets/assets/udesc_events/menu_hamb.PNG": "141bcb2f9d24501fdc445eb32cb44ac0",
"assets/assets/udesc_events/configuracao_notificacao.PNG": "42448fc98f37ae92a6b570be33c9dfde",
"assets/assets/udesc_events/minhas_inscricoes.PNG": "766c7ed83657b8082145843edb1a392b",
"assets/assets/udesc_events/feed2.PNG": "5d913397c38703546a3a65006126c5db",
"assets/assets/udesc_events/criacao_evento2.PNG": "5c57081848dedf72fba48d6633c6ba5c",
"assets/assets/udesc_events/criacao_evento3.PNG": "66b2b3075d78a93b8b61ff9f3b154f7a",
"assets/assets/udesc_events/todos_eventos.PNG": "ed533285d682a4771a716ba905d5d870",
"assets/assets/udesc_events/Notificacoes.PNG": "32cdfed1dc36044955f64d82703af7b0",
"assets/assets/listin/add_produto_2.jpg": "b7356efb16f5d2b49522fc0a5c10370d",
"assets/assets/listin/hamburguer.jpg": "b2202454c11d2da21373125f0c153e32",
"assets/assets/listin/login.jpg": "3f7e3517b84a9ea0efba61a93c14595c",
"assets/assets/listin/add_produto.jpg": "1f43e1cf43479597bd3d9e6dd94f2549",
"assets/assets/listin/home.jpg": "c4dc84ed8695aff25b69311c4a5cb480",
"assets/assets/listin/ordenacao.jpg": "fb997cdedf340d89a2fef6a3f7b11863",
"assets/assets/listin/altera_produto.jpg": "583976e5c955ce31c03b4e06ae7fbbff",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
