from django.urls import path

from .views import (
    users, TaskDetailView, TaskListCreateView
) 

urlpatterns = [
    path('users/', users, name='users'),
    path('tasks/', TaskListCreateView.as_view(), name='task-list-create'),
    path('tasks/<int:pk>/', TaskDetailView.as_view(), name='task-detail'),
]