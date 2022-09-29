import query from "../query/board-query.js";
import pool from "../database/pool.js";

const service = {
    getFeed: async (req, res, next) => {
        let result = await pool.query(query.getFeed, [req.id]);
        console.log(result[0])
        return result[0];
    },
    getTag: async (req, res, next) => {
        let result = await pool.query(query.getTag, [req.id]);
        console.log(result[0])
        return result[0];
    },
};

export default service;