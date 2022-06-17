package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/novrian/go-database-connection/internal/pkg/model"
	"github.com/novrian/go-database-connection/pkg/mysql"
	"gorm.io/gorm"
)

var (
	DB *gorm.DB
)

func main() {
	var (
		err error
	)
	engine := gin.Default()

	DB, err = mysql.GetResolver()
	if err != nil {
		log.Fatal("failed established database connection")
	}

	engine.GET("/read", read)
	engine.PUT("/update", update)

	engine.Run()
}

func read(c *gin.Context) {
	db := DB.WithContext(c)

	time.Sleep(time.Second * 1)

	province := &model.Province{}
	if err := db.Model(model.Province{}).Where("province_id = ?", 10001).First(&province).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	time.Sleep(time.Second * 1)

	c.JSON(http.StatusOK, gin.H{
		"data": province,
	})
}

func update(c *gin.Context) {
	db := DB.WithContext(c)

	time.Sleep(time.Second * 1)

	province := &model.Province{}
	if err := db.Model(model.Province{}).Where("province_id = ?", 10001).First(&province).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	if err := db.Model(&province).Updates(&model.Province{}).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}

	time.Sleep(time.Second * 1)

	c.JSON(http.StatusOK, gin.H{
		"data": province,
	})
}
