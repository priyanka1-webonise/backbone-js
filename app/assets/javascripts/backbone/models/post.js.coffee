class SampleBackbone.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class SampleBackbone.Collections.PostsCollection extends Backbone.Collection
  model: SampleBackbone.Models.Post
  url: '/posts'
