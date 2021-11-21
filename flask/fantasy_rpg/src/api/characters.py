from flask import Blueprint, jsonify, abort, request
import sqlalchemy
from sqlalchemy.sql.expression import false
from sqlalchemy.sql.functions import user
from api import models

bp = Blueprint('characters', __name__, url_prefix='/characters')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    characters = models.Character.query.all() # ORM performs SELECT query
    result = []
    for c in characters:
        result.append(c.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<string:name>', methods=['GET'])
def show(name: str(128)):
    c = models.Character.query.get_or_404(name)
    return jsonify(c.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain name, race and class
    if 'name' not in request.json or 'race' not in request.json or 'class' not in request.json:
        return abort(400)
 
    # construct character
    if 'level' in request.json:
        c = models.Character(
            name=request.json['name'],
            class_=request.json['class'],
            race=request.json['race'],
            level=request.json['level']
        )
    else:
        c = models.Character(
            name=request.json['name'],
            class_=request.json['class'],
            race=request.json['race']
            )

    models.db.session.add(c) # prepare CREATE statement
    models.db.session.commit() # execute CREATE statement
    return jsonify(c.serialize())

@bp.route('/<string:name>', methods=['DELETE'])
def delete(name: str(128)):
    c = models.Character.query.get_or_404(name)
    try:
        models.db.session.delete(c) # prepare DELETE statement
        models.db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<string>', methods=['PATCH', 'PUT'])
def update(name: str(128)):
    c = models.Character.query.get_or_404(name)
    try:
        if 'level' in request.json:
            c.level = request.json['level']
        if 'name' in request.json:
            c.name = request.json['name']
        models.db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)