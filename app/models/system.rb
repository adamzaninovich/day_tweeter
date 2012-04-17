class System < ActiveRecord::Base
  
  # integer :user_id
  # boolean :active,          default: true
  # integer :start_time_hour, default: 7 # 7am
  # integer :start_time_min,  default: 0
  # integer :stop_time_hour,  default: 17 # 5pm
  # integer :stop_time_min,   default: 0
  # integer :daily_max,       default: 50
  
  belongs_to :user
  
  validates :daily_max,       presence: true,
                              numericality: {
                                integer_only: true,
                                greater_than: 0
                              }
  validates :start_time_hour, presence: true,
                              numericality: {
                                integer_only: true,
                                greater_than_or_equal_to: 0,
                                less_than: 24
                              }
  validates :start_time_min,  presence: true,
                              numericality: {
                                integer_only: true,
                                greater_than_or_equal_to: 0,
                                less_than: 60
                              }
  validates :stop_time_hour,  presence: true,
                              numericality: {
                                integer_only: true,
                                greater_than: 0,
                                less_than_or_equal_to: 24
                              }
  validates :stop_time_min,   presence: true,
                              numericality: {
                                integer_only: true,
                                greater_than_or_equal_to: 0,
                                less_than: 60
                              }
  
  validate :start_time_must_be_before_stop_time, :max_rate_potential_too_high
  
  def start_time_must_be_before_stop_time
    unless start_time < stop_time
      errors.add(:start_time_hour, "must be before stop time")
      errors.add(:stop_time_hour,  "must be after start time")
    end
  end
  
  def max_rate_potential_too_high
    if start_time < stop_time
      unless stop_time-start_time >= daily_max.minutes
        errors.add(:daily_max, "must be #{((stop_time-start_time)/60).to_i} or less (see mpr below)")
      end
    end
  end
  
  def start_time
    # Time.zone = time_zone
    Time.zone.parse "#{start_time_hour}:#{start_time_min}"
  end
  
  def stop_time
    # Time.zone = time_zone
    Time.zone.parse "#{stop_time_hour}:#{stop_time_min}"
  end
  
end
