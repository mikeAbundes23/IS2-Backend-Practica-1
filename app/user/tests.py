from django.test import TestCase
from django.contrib.auth import get_user_model
from .models import Task

User = get_user_model()

class UserModelTests(TestCase):
    def test_create_user(self):
        user = User.objects.create_user(
            email="test@example.com",
            name="Test",
            last_name="User",
            password="password123"
        )
        self.assertEqual(user.email, "test@example.com")
        self.assertTrue(user.check_password("password123"))
        self.assertFalse(user.is_staff)
        self.assertTrue(user.is_active)

    def test_create_superuser(self):
        admin = User.objects.create_superuser(
            email="admin@example.com",
            name="Admin",
            last_name="User",
            password="superpassword123"
        )
        self.assertEqual(admin.email, "admin@example.com")
        self.assertTrue(admin.is_staff)
        self.assertTrue(admin.is_superuser)

    def test_user_str(self):
        user = User.objects.create_user(
            email="strtest@example.com",
            name="Str",
            last_name="User",
            password="password123"
        )
        self.assertEqual(str(user), "strtest@example.com")


class TaskModelTests(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            email="taskuser@example.com",
            name="Task",
            last_name="Owner",
            password="password123"
        )

    def test_create_task(self):
        task = Task.objects.create(
            title="Mi primera tarea",
            description="Descripción de prueba",
            owner=self.user
        )
        self.assertEqual(task.title, "Mi primera tarea")
        self.assertEqual(task.owner.email, "taskuser@example.com")
        self.assertFalse(task.status)

    def test_task_str(self):
        task = Task.objects.create(
            title="Título de prueba",
            description="Otra descripción",
            owner=self.user
        )
        self.assertEqual(str(task), "Título de prueba")