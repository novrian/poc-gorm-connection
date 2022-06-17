package main

import (
	"flag"
	"math"
	"sync"

	"github.com/go-resty/resty/v2"
)

func main() {
	client := resty.New()
	requests := flag.Int("requests", 1000000, "number of requests to send")
	flag.Parse()

	concurrentLimit := 100
	iteration := math.Floor(float64(*requests) / float64(concurrentLimit))

	var wg sync.WaitGroup
	for i := 0; i < int(iteration); i++ {
		wg.Add(concurrentLimit * 2)

		for ii := 0; ii < concurrentLimit; ii++ {
			go func() {
				_, err := client.R().Get("http://localhost:8080/read")
				if err == nil {
					wg.Done()
					return
				}
				wg.Done()
			}()

			go func() {
				_, err := client.R().Put("http://localhost:8080/update")
				if err == nil {
					wg.Done()
					return
				}
				wg.Done()
			}()
		}

		wg.Wait()
	}

}
