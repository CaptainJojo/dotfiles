require 'spec_helper'

casks_list= %x( brew cask list )

%w(
 charles
 google-cloud-sdk
 docker
 vagrant
 virtualbox
).each do |p|
  describe command("echo '#{casks_list}' | grep #{p}") do
    its(:exit_status) { should eq 0 }
  end
end

%w(
 bats
 bfg
 chruby
 cloc
 closure-compiler
 ctags
 diff-so-fancy
 go
 hub
 ipcalc
 hadolint
 jq
 libxml2
 nmap
 packer
 pandoc
 pgcli
 pre-commit
 python
 python3
 pv
 qemu
 ruby-install
 s3cmd
 shellcheck
 spark
 tag
 tig
 tcpdump
 tcptraceroute
 terraform
 terraform-inventory
).each do |p|
  describe package(p) do
    it { should be_installed }
  end
end
