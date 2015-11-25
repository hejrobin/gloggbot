{Router}                = require 'express'
router                  = do Router
appMiddleware           = require 'config/middlewares/app'
AppController           = require 'controllers/App'

# Attach middleware
router.use appMiddleware

# Application routes
router.get '/', AppController.index


module.exports = router
