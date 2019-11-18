module.exports = function (service) {

  service.before ('CREATE', 'Incidents', (req) => {
    const incident = req.data
    if (incident.category_code == 'safety') {
      incident.priority == 'High'
    }
  })

}