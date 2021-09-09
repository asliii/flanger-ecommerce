document.addEventListener("turbolinks:load", function() {

    var instrumentImage = document.querySelector('.instrument-image');

    function handleFileSelect(evt) {
        var files = evt.target.files; // FileList object

        for (var i = 0, f; f = files[i]; i++) {

            if (!f.type.match('image.*')) {
                continue;
            }

            var reader = new FileReader();

            reader.onload = (function(theFile) {
                return function(e) {
                    var span = document.createElement('span');
                    span.innerHTML = ['<img class="instrument-preview-thumb" src="', e.target.result,
                        '" title="', escape(theFile.name), '"/>'
                    ].join('');
                    document.getElementById('list').insertBefore(span, null);
                };
            })(f);
            reader.readAsDataURL(f);
        }
    }

    if (instrumentImage) {
        this.addEventListener('change', handleFileSelect, false);
    }

});