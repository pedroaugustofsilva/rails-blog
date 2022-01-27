# frozen_string_literal: true

User.create_or_find_by(email: 'admin@admin.dev', password: '12345678', name: 'Pedro')
