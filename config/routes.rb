Rails.application.routes.draw do

 resources :tasks, except: [:edit, :new] do
   member do
     get 'people', to: 'tasks#people_belongs_task'
     put 'people/:person_id', to: 'tasks#assign_person_to_task'
   end
 end

 resources :people, except: [:edit, :new] do
   member do
     get 'tasks', to: 'people#tasks_belongs_person'
     put 'tasks/:task_id', to: 'people#assign_task_to_person'
   end
 end

end
