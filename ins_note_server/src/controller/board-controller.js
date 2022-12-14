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

const host = [
    "https://3.34.143.144",
    "https://3.34.143.144:443",
    "http://3.34.143.144",
    "http://3.34.143.144:443",
];

router.get("/feed", async (req, res, next) => {
    console.log(req.headers.origin);
    if (host.includes(req.headers.origin)) header["Access-Control-Allow-Origin"] = req.headers.origin;

    params.id = req.query.id;
    let rows = await service.getFeed(params, res, next);
    return res.header(header).json(rows);
});

router.get("/tag", async (req, res, next) => {
    console.log(req.headers.origin);
    if (host.includes(req.headers.origin)) header["Access-Control-Allow-Origin"] = req.headers.origin;

    params.id = req.query.id;
    let rows = await service.getTag(params, res, next);
    return res.header(header).json(rows);
});

export default router;