INSERT INTO races (name,description)
VALUES
	('human',  'Humans are the most adaptable and ambitious people among the common races. They have widely varying tastes, morals, and customs in the many different lands where they have settled. When they settle, though, they stay: they build cities to last for the ages, and great kingdoms that can persist for long centuries. An individual human might have a relatively short life span, but a human nation or culture preserves traditions with origins far beyond the reach of any single humans memory.'),
    ('elf',  'Elves are a magical people of otherworldly grace, living in the world but not entirely part of it. They live in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light, where soft music drifts through the air and gentle fragrances waft on the breeze. Elves love nature and magic, art and artistry, music and poetry, and the good things of the world.'),
    ('dwarf',  'Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal. Though they stand well under 5 feet tall, dwarves are so broad and compact that they can weigh as much as a human standing nearly two feet taller. Their courage and endurance are also easily a match for any of the larger folk.'),
    ('dragonborn',  'Dragonborn look very much like dragons standing erect in humanoid form, though they lack wings or a tail. The first dragonborn had scales of vibrant hues matching the colors of their dragon kin, but generations of interbreeding have created a more uniform appearance. Their small, fine scales are usually brass or bronze in color, sometimes ranging to scarlet, rust, gold, or copper-green. They are tall and strongly built, often standing close to 6½ feet tall and weighing 300 pounds or more. Their hands and feet are strong, talonlike claws with three fingers and a thumb on each hand.'),
    ('gnome', 'A gnomes energy and enthusiasm for living shines through every inch of his or her tiny body. Gnomes average slightly over 3 feet tall and weigh 40 to 45 pounds. Their tan or brown faces are usually adorned with broad smiles (beneath their prodigious noses), and their bright eyes shine with excitement. Their fair hair has a tendency to stick out in every direction, as if expressing the gnomes insatiable interest in everything around.');



INSERT INTO classes (name)
VALUES
        
    ('barbarian'),
    ('bard'),
    ('cleric'),
    ('druid'),
    ('paladin'),
    ('ranger'),
    ('rogue'),
    ('warlock'),
    ('wizard');


INSERT INTO abilities(name,description,level,effect)
VALUES
    ('rage', 'Fight with primal ferocity. While raging you have advantage on Strength checks and saving throws, bonus damage to attacks, and gain resistance to physical damage.', 1,'Rage'),
    ('reckless attack', 'Throw aside all concern for defense to attack with fierce desperation.', 2, 'Advantage on attacks from and against.'),
    ('frenzy', 'Gain an extra attack each turn', 3,'Become exhausted until the next long rest.'),
    ('intimidating presence', 'Use your action to frighten someone within 30 feet with your menacing precense.' ,10,'Enemy become feared.'),
    ('bardic inspiration', 'Inspire someone within 60 feet with your words or music.',1,'Assists an ally.'),
    ('song of rest','use soothing music to help revitalize wounded allies during a short rest.',2,'Heal all allies up to 6 hit points.'),
    ('vicious mockery', 'You unleash a string of insults laced with subtle enchantments at a creature in range.',1,'Up to 4 damage and the target had disadvantage on the next attack it makes.'),
    ('dimension door','You teleport to another spot within 500 feet.',6,NULL),
    ('eyebite', 'One creature of choice within 60 feet suffers the effect of your choice. Sleep - the target falls unconscious waking up if it takes damage or is awoken by another creature, fear - the target must run away from you until the effect ends, or sickened - disadvantage on attacks.', 8,'Target is feared, unconscious, or has disadvantage on all attacks.'),
    ('turn undead', 'As an action, you speak a prayer censuring the undead, all undead in 30 feet are feared.',2,'feared'),
    ('destroy undead', 'As an action, all undead in 30 feet are destroyed.',5,NULL),
    ('sacred flame', 'Flame-like radiance descends on a creature that you can see within range.', 1,'Up to 8 damage'),
    ('spare the dying', 'Touch a living creature that has 0 hit points. The creature becomes stable.',1,'Save someone on deaths door.'),
    ('cure wounds', 'Heal a creature for up to 8 hit points.' , 1, 'Healed for up to 8 hit points.')



