module OfficeAutomationEmployee
  class User 
    include Mongoid::Document
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable

    ## Database authenticatable
    field :email,              :type => String, :default => ""
    field :encrypted_password, :type => String, :default => ""

    ## Recoverable
    field :reset_password_token,   :type => String
    field :reset_password_sent_at, :type => Time

    ## Rememberable
    field :remember_created_at, :type => Time

    ## Trackable
    field :sign_in_count,      :type => Integer, :default => 0
    field :current_sign_in_at, :type => Time
    field :last_sign_in_at,    :type => Time
    field :current_sign_in_ip, :type => String
    field :last_sign_in_ip,    :type => String

    ## Confirmable
    # field :confirmation_token,   :type => String
    # field :confirmed_at,         :type => Time
    # field :confirmation_sent_at, :type => Time
    # field :unconfirmed_email,    :type => String # Only if using reconfirmable

    ## Lockable
    # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
    # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
    # field :locked_at,       :type => Time

    # user-fields
    field :status, :type => String, :default => 'pending'
    field :role, :type => Array

    # validations
    validates :role, :email, presence: true
    validates_uniqueness_of :email

    # relationships
    embeds_one :public_profile, class_name: 'OfficeAutomationEmployee::PublicProfile'
    embeds_one :private_profile, class_name: 'OfficeAutomationEmployee::PrivateProfile'
  end
end
