(() => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    function create_hidden_input(id_name, value) {
        const hidden_input = document.createElement('input');
        hidden_input.hidden = true;
        hidden_input.setAttribute('name', id_name);
        hidden_input.value = value;
        return hidden_input;
    }

    $$('a[data-method=delete]').forEach(x => {
        const url = x.getAttribute('href');
        const data_method = x.getAttribute('data-method');
        const csrf = x.getAttribute('data-csrf');

        // invalid <a>
        if (!url || !data_method || !csrf) {
            console.error('invalid button: ' + data_method + ', ' + url);
            return;
        }

        x.onclick =  e => {
            if (XMLHttpRequest in window) {
                // the browser supports XMLHttpRequest
                const xmr = new XMLHttpRequest();
                xmr.setRequestHeader('X-CSRF-Token', csrf);
                xmr.open(data_method, url, true);
            }
            else {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = url;
                form.style.display = 'none';

                form.appendChild(create_hidden_input('_csrf_token', csrf));
                form.appendChild(create_hidden_input('_method', data_method));

                document.body.appendChild(form);
                form.submit();
            }
        };

        x.setAttribute('data-href', url);
        x.removeAttribute('href');
    });
})();
