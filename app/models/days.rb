class Days < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '日帰り' },
    { id: 3, name: '1日目' },
    { id: 4, name: '2日目' },
    { id: 5, name: '3日目' },
    { id: 6, name: '4日目' },
    { id: 7, name: '5日目' },
    { id: 8, name: '6日目' },
    { id: 9, name: '7日目' },
    { id: 10, name: '8日目' },
    { id: 11, name: '9日目' },
    { id: 12, name: '10日目' },
    { id: 13, name: '11日目以降' },
    { id: 14, name: '1週目' },
    { id: 15, name: '2週目' },
    { id: 16, name: '3週目' },
    { id: 17, name: '4週目' },
    { id: 18, name: '5週目' },
    { id: 19, name: '6週目' },
    { id: 20, name: '7週目以降' }
  ]

  include ActiveHash::Associations
  has_many :plans
end