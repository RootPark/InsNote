import express from "express";
import service from "../service/board-service.js";

const router = express.Router();

const params = {
    id: "",
};

const header = {
    "Access-Control-Allow-Origin": "",
    "Access-Control-Allow-Credentials": true,
};

//AWS public IP
const host = [
    "https://3.34.143.144",
    "https://3.34.143.144:443",
    "http://3.34.143.144",
    "http://3.34.143.144:443",
    ""
];

// /를 가지고 있고, 
router.get("/feed", async (req, res, next) => {
    console.log(req.headers.origin);
    if (host.includes(req.headers.origin)) header["Access-Control-Allow-Origin"] = req.headers.origin;

    params.id = req.query.id;
    let rows = await service.getFeed(params, res, next); //service모듈의 getFeed함수를 이용해서 DB쿼리날린후, 정보를 가져온다
    return res.header(header).json(rows); //그걸 json으로 ~, response를 보낸다.
});

router.get("/tag", async (req, res, next) => {
    console.log(req.headers.origin);
    if (host.includes(req.headers.origin)) header["Access-Control-Allow-Origin"] = req.headers.origin;

    params.id = req.query.id;
    let rows = await service.getTag(params, res, next);
    return res.header(header).json(rows);
});

export default router;