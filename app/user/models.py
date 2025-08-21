from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

# Create your models here.
class UserManager(BaseUserManager):
	def create_user(self, email, name, last_name, password=None, profile_picture=None):
		if not email:
			raise ValueError('El usuario debe tener un correo electrónico')
		email = self.normalize_email(email)
		user = self.model(
			email=email,
			name=name,
			last_name=last_name,
			profile_picture=profile_picture
		)
		user.set_password(password)
		user.save(using=self._db)
		return user

	def create_superuser(self, email, name, last_name, password=None, profile_picture=None):
		user = self.create_user(
			email,
			name,
			last_name,
			password,
			profile_picture
		)
		user.is_staff = True
		user.is_superuser = True
		user.save(using=self._db)
		return user

class User(AbstractBaseUser, PermissionsMixin):
	name = models.CharField(max_length=30)
	last_name = models.CharField(max_length=30)
	email = models.EmailField(unique=True)
	profile_picture = models.ImageField(upload_to='profile_pics/', default='profile_pics/image.png', blank=True, null=True)
	is_active = models.BooleanField(default=True)
	is_staff = models.BooleanField(default=False)

	objects = UserManager()

	USERNAME_FIELD = 'email'
	REQUIRED_FIELDS = ['name', 'last_name']

	def __str__(self):
		return self.email
