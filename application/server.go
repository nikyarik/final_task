package main

import (
  "fmt"
  "log"
  "net/http"
  "time"
)

func appHandler(w http.ResponseWriter, r *http.Request) {

  fmt.Println(time.Now(), "Hello from my new fresh server")

}

func main() {
  http.HandleFunc("/", appHandler)

  log.Println("Started, serving on port 8888")
  err := http.ListenAndServe(":8888", nil)

  if err != nil {
    log.Fatal(err.Error())
  }
}
