#---
# Excerpted from "Agile Web Development with Rails", # published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
Product.destroy_all
Order.destroy_all
LineItem.destroy_all
Cart.destroy_all

product = Product.new(title: 'Debug It for Rails Applicatin',
  description: 
    %q{
        Web Design for Developers will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
     },
		 price: 23.65)
File.open(File.join(Rails.root, 'app/assets/images/debug.jpg')) do |f|
  product.image = f
end
product.save!
# . . .
product1 = Product.new(title: 'Web Design for Developers',
  description: 
    %q{
        Web Design for Developers will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
     },
  price: 42.95)
File.open(File.join(Rails.root, 'app/assets/images/wd4d.jpg')) do |f|
  product1.image = f
end
product1.save!
# . . .
product2 = Product.new(title: 'Programming Ruby 1.9',
  description:
    %q{
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
     },
  price: 49.50)
File.open(File.join(Rails.root, 'app/assets/images/ruby.jpg')) do |f|
  product2.image = f
end
product2.save!
# . . .

product3 = Product.new(title: 'Rails Test Prescriptions',
  description: 
    %q{
        Rails Test Prescriptions is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
     },
  price: 43.75)
File.open(File.join(Rails.root, 'app/assets/images/rtp.jpg')) do |f|
  product3.image = f
end
product3.save!

Order.create!(name: "talon", email: "792326645@qq.com", address: "长沙市岳麓区桐梓坡西路", pay_type: "Alipay")
Order.create!(name: "harrold", email: "123456@qq.com", address: "湘潭市雨湖区河东大道", pay_type: "Alipay")
Order.create!(name: "john", email: "654321@qq.com", address: "浏阳市官桥镇江边上", pay_type: "Alipay")

