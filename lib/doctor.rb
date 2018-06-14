class Doctor

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end

  def appointments
    appointments = Appointment.all.select { |appt| appt.doctor == self}
    appointments
  end

  def patients
    patients = []
    self.appointments.each do |appt|
      patients << appt.patient
    end
    patients
  end

  def self.all
    @@all
  end
end
