

require 'spec_helper'

describe 'dovecot::install' do
  let :default_params do
      { :packages       => [ 'dovecot-core' ],
        :package_ensure => 'installed',
      }
  end

  shared_examples 'dovecot::install shared examples' do

    it { is_expected.to compile.with_all_deps }
    it { params[:packages].each do | ipackage |
        is_expected.to contain_package( ipackage )
          .with_ensure( params[:package_ensure] )
          .with_name( ipackage )
          .with_tag('dovecot')
     end
   }
  end

  context 'with defaults' do
    let :params do
      default_params
    end 

    it_behaves_like 'dovecot::install shared examples'
  end

  context 'with non  defaults' do
    let :params do
      default_params.merge( 
	:packages       => [ 'dovecot-whatever', 'andanother-dovecot' ],
        :package_ensure => 'latest',
      )
    end
    it_behaves_like 'dovecot::install shared examples'
  end

end
