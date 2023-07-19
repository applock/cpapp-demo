
const cds = require('@sap/cds')

/**
 * Implementation for Risk Management service defined in ./risk-service.cds
 */
module.exports = cds.service.impl(async function() {
    this.before('READ', 'Risks', risksData => {
        const risks = Array.isArray(risksData) ? risksData : [risksData];
        console.log('Size of risks before - {}',risks.length);
    });

    this.after('READ', 'Risks', risksData => {
        const risks = Array.isArray(risksData) ? risksData : [risksData];
        console.log('Size of risks after - {}',risks.length);

        risks.forEach(risk => {
            if (risk.impact >= 100000) {
                risk.criticality = 1;
                // Highly critical
                // Run impact analysis engine - Step 1

                // Fetch impact score and based on threshold trigger mitigations

                // Also send and alert email
                
            } else {
                risk.criticality = 2;
            }
        });
    });
});