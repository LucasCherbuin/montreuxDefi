const Encore = require('@symfony/webpack-encore');

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

Encore
    .setOutputPath('public/build/')
    .setPublicPath('/build')
    
    .addEntry('app', './assets/app.ts')
    
    .splitEntryChunks()
    .enableSingleRuntimeChunk()
    
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())
    
    // Activer TypeScript
    .enableTypeScriptLoader()
    
    // Activer Vue.js
    .enableVueLoader(() => {}, {
        version: 3,
        runtimeCompilerBuild: false
    })
    
    // Activer SASS pour Vuetify
    .enableSassLoader()
    
    .configureBabel((config) => {
        config.plugins.push('@babel/plugin-proposal-class-properties');
    })
    
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = 3;
    })
    
    .addAliases({
        '@': __dirname + '/assets'
    })
;

module.exports = Encore.getWebpackConfig();