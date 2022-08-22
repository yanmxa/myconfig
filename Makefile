basic:
	./centos/install_packages.sh

.PHONY: bash
bash:
	./centos/install_bash.sh

.PHONY: zsh
zsh:
	./centos/install_zsh.sh

zsh-plugin:
	./centos/install_zsh_plugin.sh
