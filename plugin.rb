# name: discourse-user-locale
# version: 0.1

after_initialize do

  ApplicationHelper.class_eval do
    alias_method :super_html_classes, :html_classes

    def html_classes
      super_html_classes + current_user_locale
    end

    def current_user_locale
      if current_user && SiteSetting.allow_user_locale
        user_locale = current_user.locale
        '' == user_locale ? 'user-locale-default' : "user-locale-#{user_locale}"
      else
        ''
      end
    end

  end

end