from flask import Flask, render_template, request, session
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail 
import json
from datetime import datetime

local_server = True
with open('config.json','r') as c:
   params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = 'True',
    MAIL_USERNAME = params['email'],
    MAIL_PASSWORD = params['password']

)
mail = Mail(app)

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

# print(params)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Contect(db.Model):
    srn = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(300), nullable=False)
    date = db.Column(db.String(50), nullable=True)

class Posts(db.Model):
    srn = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30), nullable=False)
    tag_line = db.Column(db.String(30), nullable=False)
    slug = db.Column(db.String(50), nullable=False)
    content = db.Column(db.String(300), nullable=False)
    date = db.Column(db.String(50), nullable=True)
    img_file = db.Column(db.String(50), nullable=True)



@app.route("/")
def home():
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html',params=params,posts=posts)


@app.route("/about")
def about():
    return render_template('about.html',params=params)



@app.route("/post/<string:post_slug>", methods = ['GET'])
def posts(post_slug):
    post =Posts.query.filter_by(slug = post_slug).first()
    return render_template('post.html',params=params,post = post)

@app.route("/post/", methods=['GET'])
def post_route():
    return render_template('post.html', params=params,)

@app.route("/contact", methods = ['GET', 'POST'])
def contect():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contect(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message From blog',
            sender=email,
            recipients= [params['email']],
            body= "Hey there You have a massage"
                    +message    
                    + "\n" 
                    + phone
            )
    return render_template('contact.html',params=params)

@app.route('/edit/<string:srn>', methods = ['GET','POST'])
def edit(srn):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline =  request.form.get('tline')
            slug =  request.form.get('slug')
            content =  request.form.get('content')
            img_file =  request.form.get('img_file')
            if srn == '0':
                post = Posts(title = box_title,slug= slug,content=content,date= datetime.now(),tag_line= tline,img_file=img_file)
                db.session.add(post)
                db.session.commit()
        return render_template('edit.html',params=params,srn = srn)



@app.route("/dashboard",methods = ['GET','POST'])
def signin():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params, posts = posts)
    if request.method == 'POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if (username == params['admin_user'] and password == params['admin_password']):
            # Set the Session variable
            session['user'] = username 
            return render_template('dashboard.html',params=params)

    return render_template('sign_in.html',params=params)

app.run(debug=True)