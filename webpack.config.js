const path = require('path');
module.exports = function(env) {
    let opts = {
        entry: {
            'app': path.resolve(__dirname, 'src', 'app.ts'),
        },
        resolve: {
            extensions: ['.wasm', '.mjs', '.js', '.json', '.tsx', '.ts', '.jsx']
        },
        module: {
            rules: [{
                exclude: /node_modules/,
                test: /\.tsx?$/,
                use: 'ts-loader'
            }],
        },
        mode: 'development'
    }
    return opts
}