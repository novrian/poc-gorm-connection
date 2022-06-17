package model

type Province struct {
	ID   int    `gorm:"column:province_id"`
	Name string `gorm:"column:province_name"`
	Code string `gorm:"column:province_code"`
}

func (p Province) TableName() string {
	return "province"
}
