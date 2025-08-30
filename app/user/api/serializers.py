from rest_framework.serializers import ModelSerializer
from user.models import User, Task

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class PrivateUserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['name', 'profile_picture']  # Excluye el campo de contraseña

class TaskSerializer(ModelSerializer):
    class Meta:
        model = Task
        fields = ['id', 'title', 'description', 'owner']  # ajusta según tu modelo
        read_only_fields = ['owner']  # <- esto es importante
