from flask import Flask,request,render_template
import ibm_db
import re

app = Flask(__name__)

app.secret_key = 'a'

conn = ibm_db.connect("DATABASE=bludb;HOSTNAME=125f9f61-9715-46f9-9399-c8177b21803b.c1ogj3sd0tgtu0lqde00.databases.appdomain.cloud;PORT=30426;SECURITY=SSL;SSLServerCertificate=Cert.crt;UID=pcj17018;PWD=MPcY3wjqbL7MbLBm",'','')

@app.route("/")
def reg():
    return render_template('Registration.html')

@app.route("/login",methods=['GET','POST'])
def login():
    global userid
    msg=''

    if request.method == 'POST':
        username = request.form['name']
        password = request.form['password']
        sql = "SELECT * FROM users WHERE username =? AND password=?"
        stmt = ibm_db.prepare(conn,sql)
        ibm_db.bind_param(stmt,1,username)
        ibm_db.bind_param(stmt,2,password)
        ibm_db.execute(stmt)
        account = ibm_db.fetch_assoc(stmt)
        print(account)
        if account:
            userid = account['USERNAME']
            msg = 'Logged in Successfully'
            return render_template('Welcome.html',name = userid,msg = msg)
        else:
            msg = 'Incorrect username/Password!'
            return render_template('Login.html',msg = msg)
    else:
        msg = ''
        return render_template('Login.html')

@app.route('/register',methods = ['GET','POST'])
def register():
    msg=''
    if request.method == 'POST':
        username = request.form['name']
        email = request.form['email']
        password=request.form['password']
        sql = "SELECT * FROM users WHERE username =?"
        stmt = ibm_db.prepare(conn,sql)
        ibm_db.bind_param(stmt,1,username)
        ibm_db.execute(stmt)
        account = ibm_db.fetch_assoc(stmt)
        print(account)
        if(account):
            msg="Account already exist"
        elif not re.match(r'[^@]+@[^@]+\.[^@]+',email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+',username):
            msg = 'name must contain only characters and numbers!'
        else:
            insert_sql = " INSERT INTO users VALUES (?,?,?)"
            prep_stmt = ibm_db.prepare(conn,insert_sql)
            ibm_db.bind_param(prep_stmt,1,username)
            ibm_db.bind_param(prep_stmt,2,email)
            ibm_db.bind_param(prep_stmt,3,password)
            ibm_db.execute(prep_stmt)
            msg = "you have successfully registered!"

    else:
        msg = 'Please fill out the form!'
    return render_template('Registration.html',msg = msg)

@app.route('/logout')
def logout():
    return render_template("Login.html")

if __name__ == '__main__':
    app.run(host='0.0.0.0')