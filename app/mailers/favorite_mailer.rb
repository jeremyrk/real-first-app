class FavoriteMailer < ActionMailer::Base
  default from: "jeremy.rkw@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@jk-bloccit.heroku.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@jk-bloccit.heroku.com>"
    headers["References"] = "<post/#{@post.id}@jk-bloccit.heroku.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end

