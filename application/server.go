package main

import (
  "fmt"
  "log"
  "net/http"
  "time"
)

func appHandler(w http.ResponseWriter, r *http.Request) {

  fmt.Println(time.Now(), "Hello this new fresh server")

}

func appServerGO(w http.ResponseWriter, r *http.Request) {

  fmt.Fprintf(w, "ITEA course DevOps!")

}

func appAWS(w http.ResponseWriter, r *http.Request) {

//  fmt.Fprintf(w, "AWS")
    w.Header().Set("Content-Type", "text/html")
    w.WriteHeader(http.StatusOK)
    _, _ = fmt.Fprintf(w, <img src="https://c.tenor.com/uUrXSnCQQcAAAAAC/amazon-cash.gif" alt="AWS this is big MONEY">)
}


func main() {
//  http.HandleFunc("/time", appHandler)

  http.HandleFunc("/server_go", appServerGO)
  http.HandleFunc("/", appAWS)


  log.Println("Started, serving on port 8080")
  err := http.ListenAndServe(":8080", nil)

  if err != nil {
    log.Fatal(err.Error())
  }
}
