db = db.getSiblingDB("admin")
db.createUser({
    user: 'mongo1',
    pwd: 'pwd',
    roles: [{"role":"readWrite", "db":"admin"}]
})
db.createUser({
    user: 'mongo2',
    pwd: 'pwd',
    roles: [{"role":"readWrite", "db":"admin"}]
})
