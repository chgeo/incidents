module.exports = function (service) {

  // sets default priority dependending on category
  service.before ('CREATE', 'Incidents', (req) => {
    const incident = req.data
    if (!incident.priority_code) {
      switch (incident.category_code) {
        case 'safety': return incident.priority_code = 'high'
        default      : return incident.priority_code = 'normal'
      }
    }
  })

}