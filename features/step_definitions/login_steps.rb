Dado("estou na página de login") do
    visit "/index.php\?controller\=my-account"
end

Dado("que tenha um usuário cadastrado") do
  visit "/index.php\?controller\=my-account"
  @data = create_mass_data
  create_account.create_account(@data)
  create_account.fill_form_create_account(@data)
  create_account.btn_log_out.click
end

Quando("realizar o login com dados válidos") do
  login.log_in(@data)
end

Quando("tentar realizar o login com os seguintes dados:") do |table|
  data = table.hashes
  @msg = []
  data.each do |values|
    login.log_in(values)
    @msg.push('Mensagem' => login.message.text)
  end
end

Então("deve ser apresentado a seguinte mensagem de erro:") do |table|
  expect(@msg).to eql table.hashes
end

Então("o login é realizado com sucesso") do
  expect(page).to have_content "MY ACCOUNT"
end

