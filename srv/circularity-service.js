
const cds = require('@sap/cds')

/**
 * Implementation for Circularity Management service defined in ./circularity-service.cds
 */
module.exports = cds.service.impl(async function() {
/*    this.before('READ', 'Circularity', circData => {
        const circs = Array.isArray(circData) ? circData : [circData];
        console.log('Size of circs before - {}',circs.length);
    });
*/
    this.after('READ', 'Circularity', circData => {
        const circs = Array.isArray(circData) ? circData : [circData];
        console.log('Size of circs after - {}',circs.length);

    });
    
});