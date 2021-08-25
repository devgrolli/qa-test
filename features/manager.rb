class Manager
  def initialize
    open
  end

  def self.get_cadastro(tag)
    DATA_MANAGER['cadastros'].find { |cadastro| !cadastro[:tag].index(/#{tag}/i).nil? }
  end

  def self.get_login(tag)
    DATA_MANAGER['login'].find { |login| !login[:tag].index(/#{tag}/i).nil? }
  end
end
