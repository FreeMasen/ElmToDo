import * as React from 'react';
import * as ReactDom from 'react-dom';
import { App } from './app.component';
(function() {
    ReactDom.render(
        <App />,
        document.getElementById('react-root')
    );
})()