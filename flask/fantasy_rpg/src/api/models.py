from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


class Character(db.Model):
    __tablename__ = 'characters'
    name = db.Column(db.String(128), primary_key=True)
    armor_class = db.Column(db.Integer, nullable=False)
    max_hp = db.Column(db.Integer, nullable=False)
    level = db.Column(db.Integer, nullable=False)
    is_npc = db.Column(db.Boolean, nullable=False)
    race = db.Column(db.String(128), nullable=False)
    class_ = db.Column('class', db.String(128), nullable=False)

    def __init__(self, name: str, race: str, class_: str, level: int = 1):
            self.name = name
            self.race = race
            self.class_ = class_
            self.level = level
            self.armor_class = 10
            self.max_hp = (10 + (3 * level) + (6*(level - 1)))
            self.is_npc = False 


    def serialize(self):
            return {
                'name': self.name,
                'race': self.race,
                'class': self.class_,
                'level': self.level,
                'max_hp': self.max_hp,
                'base_armor_class': self.armor_class
            }
