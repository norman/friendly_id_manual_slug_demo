This is a Rails app which demonstrates how to mix-and match FriendlyId's
automatic slug generation with some manual overrides.

I am often asked for this functionality and decided the best way to explain it would
be with a working application.

The important piece to see is the override of the new_slug_needed? method in the Book class. If you override this method, it will check for the presence of a changed slug source. A simple version would be:

<code>
  def new_slug_needed?
    !slug
  end
</code>

which will check for a new slug each time. The version here is:

<code>
  def new_slug_needed?
    if user_slug.present? || generate_new_slug == "1"
      super
    else
      !slug
    end
  end
</code>
Which saves a little CPU by not updating unless we've flagged for it.