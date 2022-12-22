package httpsvc

import "github.com/labstack/echo"

// Service http service
type Service struct {
	httpSvc *echo.Echo
}

// InitHTTPService API route constructor
func InitHTTPService(
	httpSvc *echo.Echo,
) {
	srv := &Service{
		httpSvc: httpSvc,
	}
	srv.initRoutes()
}

func (s *Service) initRoutes() {
	s.httpSvc.GET("/", s.welcome)
}
