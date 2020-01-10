const webpack = require('webpack');
module.exports = {
    configureWebpack: (config) => {
        config.plugins.push(
          new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery',
            'windows.jQuery': 'jquery',
            Popper: ['popper.js', 'default']
          })
        )
    }
}