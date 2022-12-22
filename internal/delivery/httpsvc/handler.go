package httpsvc

import (
	"net/http"

	"github.com/labstack/echo"
)

func (s *Service) welcome(c echo.Context) error {
	return c.String(http.StatusOK, "welcome to Echo CI/CD test by Bima Ahida!")
}
