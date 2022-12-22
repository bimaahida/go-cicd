package console

import (
	"github.com/bimaahida/go-cicd/internal/delivery/httpsvc"

	"github.com/labstack/echo"
	"github.com/spf13/cobra"
)

var runCmd = &cobra.Command{
	Use:   "server",
	Short: "run server",
	Long:  `This subcommand start the server`,
	Run:   run,
}

func init() {
	RootCmd.AddCommand(runCmd)
}

func run(_ *cobra.Command, _ []string) {
	httpServer := echo.New()
	httpsvc.InitHTTPService(httpServer)

	httpServer.Logger.Fatal(httpServer.Start(":8080"))
}
