package main

import (
	"fmt"
	"os"
	"strings"
	"time"
)

//PrettyFormat 需要两个参数
//一个是当月的第一天
//一个是今天的时间
func PrettyFormat(firstDay time.Time, now time.Time) {
	fmt.Printf("Current Month:%d-%s\n\n", firstDay.Year(), firstDay.Month())
	fmt.Println("Mon Tue Wes Thu Fri Sat Sun")
	for i := 0; i < int(firstDay.Weekday()); i++ {
		fmt.Printf("    ")
	}
	for {
		day := firstDay.Day()
		if firstDay.Month() != now.Month() {
			break
		}
		fmt.Printf("%3d", day)
		if firstDay.Day() == now.Day() {
			fmt.Printf("*")
		} else {
			fmt.Printf(" ")
		}
		// fmt.Printf("%s", firstDay.Weekday().String())
		if firstDay.Weekday().String() == "Saturday" {
			fmt.Println()
		}
		firstDay = firstDay.Add(time.Hour * 24)
	}
	fmt.Println()
	fmt.Printf("\nNext Month:%d-%s\n\n", firstDay.Year(), firstDay.Month())
}

func main() {
	arguments := os.Args
	now := time.Now()
	var temp string
	var firstDay time.Time
	loc, _ := time.LoadLocation("Asia/Shanghai")
	if len(arguments) == 2 {
		dateList := strings.Split(arguments[1], "-")
		// for i, d := range dateList {
		// 	fmt.Println(i, d)
		// }
		switch {
		case len(dateList) == 1:
			temp = dateList[0] + "-01-01"
			// fmt.Println("1号" + temp)
			//只输入年份
		case len(dateList) == 2:
			temp = dateList[0] + "-" + dateList[1] + "-01"
			// fmt.Println("2号" + temp)
			//只有年和月
		case len(dateList) == 3:
			temp = dateList[0] + "-" + dateList[1] + "-" + dateList[2]
			// fmt.Println("3号" + temp)
			//有年/月/日
		default:
			panic("unknown input")
		}
		/*
			dateList := strings.Split(arguments[1], "-")
			fmt.Println(dateList[0], dateList[1])
			y, _ := strconv.Atoi(dateList[0])
			m, _ := strconv.Atoi(dateList[1])
			firstDay = time.Date(y, m, 1, 0, 0, 0, 0, loc)
		*/
		cur, _ := time.Parse("2006-01-02", temp)
		firstDay = time.Date(cur.Year(), cur.Month(), 1, 0, 0, 0, 0, loc)
		now = time.Date(cur.Year(), cur.Month(), cur.Day(), 0, 0, 0, 0, loc)
		PrettyFormat(firstDay, now)
	} else {
		firstDay = time.Date(now.Year(), now.Month(), 1, 0, 0, 0, 0, loc)
		PrettyFormat(firstDay, now)
	}


}
