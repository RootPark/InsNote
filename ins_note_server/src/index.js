import express from "express";
import https from "https";
import http from "http";
import dotenv from "dotenv";
import logger from "morgan";
import controller from "./src/controller/board-controller.js";
import fs from "fs";
dotenv.config();

const app = express();

const port = process.env.PORT || 8080;

// const server = https.createServer(app);
// morgan : 로그를 좀 더 예쁘게 찍어주는 라이브러리
// combined모드가 좀 더 많은 로그 남김
if (process.env.NODE_ENV === "production") {
    app.use(logger("combined"));
} else {
    app.use(logger("dev"));
}

app.use(express.static("public"));
app.use(
    express.json({
        limit: "50mb",
    })
);
app.use(
    express.urlencoded({
        limit: "50mb",
        extended: true,
    })
);

// 라우터
//기본 경로에 진입했을 경우 실행
app.use("/", controller); 

//아래의 httpServer코드는 app.코드와 별개로 진행되기때문에 404not found가 발생하지 않아도, 아래 코드가 진행되는 것인지
// 위에서부터 순서대로 처리하므로 여기까지 왔다면 404 not found
app.get((req, res) => {
    res.status(404).send("not found");
});

// 서버 실행 코드
// app.listen(port, () => {
//     console.log(`server is listening at ${process.env.HOST}`);
// // });
// var options = {
//     key: fs.readFileSync("./private.key", "utf8"),
//     cert: fs.readFileSync("./certificate.crt", "utf8"),
//     ca: fs.readFileSync("./ca_bundle.crt", "utf8"),
// };
var httpServer = http.createServer(app);
// var httpsServer = https.createServer(options, app);
//8080포트에서 대기중
httpServer.listen(8080, () => {
    console.log(`server is listening at 8080`);
});
// httpsServer.listen(port, () => {
//     console.log(`server is listening at ${process.env.HOST}`);
// });