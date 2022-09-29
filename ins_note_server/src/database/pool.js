import { createPool } from "mysql2";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
    host: "localhost",
    port: 3306,
    user: " ",
    password: " ", //mysql 설치시 설정했던 비번
    database: "insnote", // db 이름
});

export default pool;