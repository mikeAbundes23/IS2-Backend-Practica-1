from django.urls import path

from .views import (
    users, TaskDetailView, TaskListCreateView,
    get_routes, MyTokenObtainPairView, create_user, me, get_my_tasks
)

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns = [
    path('', get_routes, name='get_routes'),

    # Users
    path('users/', users, name='users'),
    path('user/me/', me, name='me'),
    path('user/create/', create_user, name='create_user'),
    path('user/tasks/my-tasks/', get_my_tasks, name='my-tasks'),

    # Tasks
    path('tasks/', TaskListCreateView.as_view(), name='task-list-create'),
    path('tasks/<int:pk>/', TaskDetailView.as_view(), name='task-detail'),

    # JWT
    path('token/', MyTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]