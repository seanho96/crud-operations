require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'sean', email: 'sean@example.com', password: 'password')
  end
  test 'create new article' do
    sign_in_as(@user)
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: 'Test Article',
                                               description: 'This is a new article for testing purposes' } }
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match 'Test Article', response.body
  end
end
