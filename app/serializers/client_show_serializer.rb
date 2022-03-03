class ClientShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_total

  def membership_total
    sum = 0
    self.object.memberships.map { |i| i.charge }.reduce(:+)
  end

end
