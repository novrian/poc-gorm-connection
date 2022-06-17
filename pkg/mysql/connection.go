package mysql

import (
	"fmt"
	"log"
	"os"
	"sync"
	"time"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/plugin/dbresolver"
)

type Connection struct {
	Host     string
	Port     int
	Username string
	Password string
	Database string
	Retry    int
}

func makeDsn(c Connection) string {
	return fmt.Sprintf(
		"%s:%s@tcp(%s:%d)/%s?parseTime=True&loc=Local&charset=utf8",
		c.Username,
		c.Password,
		c.Host,
		c.Port,
		c.Database,
	)
}

func GetResolver() (*gorm.DB, error) {
	mainDsn := makeDsn(Connection{
		Host:     "localhost",
		Username: "main",
		Password: "main",
		Port:     3306,
		Database: "bollywood",
	})
	secondaryDsn := makeDsn(Connection{
		Host:     "localhost",
		Username: "secondary",
		Password: "secondary",
		Port:     3306,
		Database: "bollywood",
	})

	gormLogger := logger.New(
		log.New(os.Stdout, "\r\n", log.LstdFlags),
		logger.Config{
			SlowThreshold: time.Second,
			LogLevel:      logger.Info,
			Colorful:      true,
		},
	)

	gormConfig := &gorm.Config{
		DryRun: false,
		Logger: gormLogger,
	}

	var (
		dbOnce                  sync.Once
		mainConn, secondaryConn gorm.Dialector
		conn                    *gorm.DB
		err                     error
	)
	dbOnce.Do(func() {
		// @DEBUG
		fmt.Println("connecting to database")

		mainConn = mysql.Open(mainDsn)
		secondaryConn = mysql.Open(secondaryDsn)

		conn, err = gorm.Open(mainConn, gormConfig)

		conn.Use(
			dbresolver.Register(dbresolver.Config{
				Replicas: []gorm.Dialector{secondaryConn},
			}).
				SetConnMaxIdleTime(
					time.Second * 60,
				).
				SetConnMaxLifetime(
					time.Second * 60,
				).
				SetMaxIdleConns(4).
				SetMaxOpenConns(6),
		)

		// @DEBUG
		fmt.Println("connected to database")
	})

	return conn, err
}
