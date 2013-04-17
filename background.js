chrome.app.runtime.onLaunched.addListener(function() {
  chrome.app.window.create('out/index.html', {
    'id': 'clink',
    'width': 400,
    'height': 500
  });
});
