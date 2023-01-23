const query = {
    // getContent: "SELECT ? FROM anAlyst.analyst WHERE class = ? AND gender =?",
    getFeed: "SELECT * FROM insnote.feed WHERE id = ?",
    getTag: "SELECT * FROM insnote.tag WHERE id = ?",
};

export default query;