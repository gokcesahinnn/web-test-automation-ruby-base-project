# <customer_name>Test Otomasyon Projesi

Bu proje <customer_name> web uygulamasının test otomasyonunu içermektedir.

# Tool stack

* **Ruby** - Development language
* **RubyMine IDE** - Development IDE
* **Allure** Multi-language test report tool
* **Cucumber** - Gherkin Syntax Framework
* **Capybara** - Web-based APP Framework
* **RSpec** - Assertion & Validation Framework
* **Selenium** - Web APP Test Automation Tool

# Kurulumlar

* Kurulumlar için Confluence'ta #{customer_name} sayfasındaki adımlar takip edilmelidir.
* Proje repository'i #{customer_name} linkinden clone alınabilir.
* Gerekli kütüphanelerin yüklenilebilmesi için proje dizininde aşağıdaki komutlar çalıştırılır.
  ```
  gem install bundler
  bundle install
  ```

# Testlerin Çalıştırılması

1. IDE üzerinden yeşil RUN butonu ile senaryo ya da feature bazlı çalıştırılabilir.


2. Terminalden ilgili proje dizininde senaryo ismi ile çalıştırma:

   `cucumber --name "Login and logout successfully"`


3. Terminalden ilgili proje dizininde scenario ya da feature tag'i ile çalıştırma:

   `cucumber --tag @success_login`


4. Farklı browser'lar ile çalıştırmak için(default value `chrome`):

   `cucumber --tag @success_login browser=firefox`


5. Headless mode'da çalıştırmak için(default value `false`):

   `cucumber --tag @success_login headless=true`

# Raporlama
* Raporlama aracı olarak allure report kullanılmaktadır.


* Allure report oluşturmak için allure pc'nizde kurulu olmalıdır.

   * Mac kurulum
   
     `brew install allure`
   
   * Windows Kurulum

     * Powershell açılır. Aşağıdaki komut çalıştırılır. Scoop kurulumu yapılır.
    
       `iwr -useb get.scoop.sh | iex`
     
     * Scoop başarılı kurulduktan sonra komut satırı açılır. Aşağıdaki komut çalıştırılır. Allure kurulumu yapılır.
    
       `scoop install allure`
    

* Allure report generate etmek için proje dizininde oluşan allure-results folder yolu verilerek aşağıdaki komut çalıştırılır.
    
  `allure serve output/allure-results `

# Project Folder Structure

```
.
├── Gemfile                         #Projenin kullanılacak kütüphanelerin yönetimi
├── config                          #Projeye ait configürasyonlar
│   └── base_config.rb
├── context
│   ├── cart_context.rb
├── model                           #Enum yapıları ve gerekli modeller tanımlamaları
│   └── product_category.rb
├── features
│   ├── pages                       #Page Object Model implementasyonu için kullanılacaktır
│   ├── step_definitions            #Senaryolara ait step tanımlamalarının yapıldığı dizin
│   ├── support                     #Hooks ve env tanımlamalarının yapıldığı dizin
│   ├── tests                       #Gherkin Synxtaxı'ndaki senaryoların bulunduğu dizin
├── utils                           #Utils class ve metodların yer aldığı dizin
│   └── general_utils.rb
└── README.md
```

# Naming Convention

Proje genelinde `snake_case` yazım şekli takip edilecektir.

İsimlendirmeler yapılırken aşağıdaki durumlar takip edilecektir.

```
folder name = my_folder

ruby file name = my_file.rb

feature file name = my_feature.rb

class name = MyClass

method name = my_method

variable name = my_variable

element name = @my_element_id @my_element_css @my_element_xpath

Enum = ALL_CAPITAL = 'value'

Global variable = $MY_VAR

Config Constant = MY_CONSTANT

Feature name = my_feature

tag name = @my_tag 
```
Elementlerin locatorları tek tırnak ile tanımlanmalı, eğer iç içe tırnak kullanımı varsa dışta çift tırnak olacak şekilde tanımlanmalıdır.

*Örnek:*

@btn_edit_address_css = '.tvEditAddress'

@btn_dropdown_choice_by_text_xpath = "//android.widget.TextView[@text='%s']"
# Web Element Standartları

| Prefix        | Örnek             | Locator      |
| ------------- |-------------------|------------- |
| btn           | btn_login_id      |  Button      |
| chk           | chk_status_css    |  Checkbox    |
| cbx           | cbx_english_xpath |  Combo box   |
| lbl           | lbl_username_css  |  Label       |
| drp           | drp_list_xpath    |  Drop down   |
| slc           | slc_list_css      |  Selectbox   |
| txt           | txt_email_css     |  Textbox     |
| img           | img_logo_xpath    |  Image       |
| rdx           | rdx_female_xpath  |  Radiobox    |

# Page Method Standartları

| Prefix | Action         | Description                |
|--------|----------------|----------------------------|
| click  | click_register | Click button or link       |
| fill   | fill_email     | Type textbox               |
| check  | check_gender   | Check a check box          |
| select | select_year    | Select value from drop down |
| verify | verify_menu    | Assertion                  |

# Senaryo Yazımı Standartları

* Senaryolar `feature` file içerisine yazılacaktır.
* ``Given, When, Then, And`` Syntax i kullanılacaktır.
* Feature file başlangıcında ``Feature`` keywordunden sonra ilgili feature ın isimlendirmesi yapılacaktır.
* Bir sonraki satırda feature in açıklaması yazılacaktır.
* Senaryolar ``Scenario`` keywordunden sonra yazılacaktır. Senaryo name unique olmalıdır.
* Her senaryo taglenmelidir. İlgili tagler senaryonun üst kısmına koyulmalıdır. @regression, @smoke gibi.
* Senaryo stepleri yazılırken aşağıdaki örnek senaryo takip edilecektir.

```gherkin
Given ön koşul
And ek koşul varsa
When aksiyonun alındığı kısım 
And ek aksiyon varsa
Then ilgili verifikasyonların yapıldığı yer
And ek verifikasyonlar 
```

**Scenario Örneği**

```gherkin
Given homepage is opened
And click on login button
And fill the valid credentials
When click on login button
Then verify my account icon
And title should changed to "My Title"
```

# Step Definition Formulü

* action + object + location

  `And click login button on homepage`


* action + object + value + location

  `And set email with "m@f.com" on homepage`


* verification action + object + location

  `Then verify the new address on my delivery addresses page`


* verification action + object + value + location

  `Then verify the new address title is "Home" on my delivery addresses page`

# Tag Yönetimi

```
@wip = Developmentı henüz tamamlanmamış senaryo / feature
@smoke = Smoke kapsamında çalışması beklenen senaryo / feature
@excluded  = Uygulama üzerinde artık var olmayan ancak senaryosu geliştirilmiş senaryo / feature
@bug_fix = Uygulama üzerinde var olan bir bugdan dolayı bug fix bekleyen senaryo / feature 
           Aşağıdaki örnek gibi bug_id tagı ile birlikte kullanılmalıdır.
           Örnek Kullanım @bug_fix @bug_id_JIRA_ID 
@prod  = Prodda koşacak senaryolar
@regression  = Regresyon sırasında koşması gereken caseler
@feature_tag = Her bir feature dosyasına verilecek tag name. Örnek: @feature_login
@scenario_tag = Her bir senaryoya verilecek ve uniq olması beklenen tag. Örnek: @success_login
```

# Commit ve PR structure

```
* Branch isimleri işin ticket idsi ile açılmalı. Örnek: QA-74
* Mümkün olduğunca commitler anlaşılır açıklamalar ile commitlenmeli.
* Commit atılırken mümkün olduğunca küçük parçalar halinde ilerlenmeli(Atomic). Böylelikle rollback daha kolay olacaktır.
* PR QA ekibinden zorunlu review ırların review etmesinden sonra master a mergelenecektir.
* Master'a mergelenmeden önce pipeline ilgili branch üzerinde çalıştırılacak ve herhangi bir problem olmadığı doğrulanacaktır.
```

# Project Feature Tags

Bu başlık altında feature tag'leri saklanmaktadır. Her yeni feature dosyası oluşturulup yeni bir feature tag'i
oluşturulduğunda mutlaka buraya açıklaması ile eklenmelidir.

* feature_search => Search ile ilgili test senaryoları
