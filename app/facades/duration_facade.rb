class DurationFacade
  def self.duration(from, to)
    json = DurationService.get_duration(from, to)
  end
end
