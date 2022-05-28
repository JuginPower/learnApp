from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('blog', __name__)

@bp.route('/')
def index():
    db = get_db()

    posts = {
        "faecher": db.execute('SELECT * FROM fach_learn').fetchall(), 
        "themen": db.execute('SELECT * FROM thema_learn').fetchall(),
        "quests": db.execute('SELECT * FROM quest_learn').fetchall()
        }

    return render_template('blog/index.html', posts=posts)
