module.exports = {
  build: {
    "index.html": "index.html",
    "app.js": [
      "javascripts/app.js"
    ],
    "app.css": [
      "stylesheets/app.css"
    ],
    "images/": "images/"
  },
  deploy: [
    "MetaCoin",
    "ConvertLib",
    "Registry",
    "mad-science/Upgradeable",
    "mad-science/Dispatcher",
    "mad-science/Example"
  ],
  rpc: {
    host: "localhost",
    port: 8545
  }
};
