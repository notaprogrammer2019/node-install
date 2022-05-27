# Install Friction node guide

Official [github](https://github.com/Friktion-Labs) and official [install node guide](https://gist.github.com/bradenkeith/528901a7067645a65bf3f16aefed0126)
-
  _P.S.: If you want to install everything at once (section 1-3), just use this command_:

    . <(wget -qO- https://raw.githubusercontent.com/notaprogrammer2019/node-install/main/friction/install.sh)

1. Install Yarn & [NodeJS](https://github.com/nodesource/distributions#debinstall):

       apt remove cmdtest yarn && apt purge nodejs -y && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt update && apt install yarn nodejs node-typescript -y && echo nodejs version && node -v

2. Install [Solana CLI](https://docs.solana.com/wallet-guide)

       sh -c "$(curl -sSfL https://release.solana.com/stable/install)" && export PATH="/root/.local/share/solana/install/active_release/bin:$PATH" && echo solana cli version && solana --version

3. Downloads source code Friktion

       mkdir $HOME/friktion && cd $HOME/friktion && git clone https://github.com/Friktion-Labs/entropy-client.git && cd $HOME/friktion/entropy-client && yarn && cd

4. Changing the path to the wallet

       nano $HOME/friktion/entropy-client/src/keeper.ts
      Replace the string  `entropy-mainnet-authority` into `id`
      
5. Create or restore solana wallet (**SAVING SEED PHASE**). The wallet should have some SOL (0.1 SOL or more)

    Create new wallet

       solana-keygen new -o $HOME/.config/solana/id.json
       
    Restore wallet
    
       solana-keygen recover
       
    Useful Commands
       
       solana address - show public key
       solana transfer - transfer SOL

6. Running the keeper as a Daemon

       nano /usr/local/bin/keeper.sh
      and paste
       
       #!/bin/bash
       cd $HOME/friktion/entropy-client
       yarn keeper
      than
      
       printf "[Unit]
       Description=keeper
       After=network.target
       StartLimitIntervalSec=20
       [Service]
       Type=simple
       Restart=always
       RestartSec=1
       User=root
       ExecStart=/usr/local/bin/keeper.sh
       
       [Install]
       WantedBy=multi-user.target" > /etc/systemd/system/keeper.service
7. Give permissions to files and enable keeper as a Daemon

       chmod 744 /usr/local/bin/keeper.sh && chmod 644 /etc/systemd/system/keeper.service && systemctl enable keeper.service

8. Start keeper

       systemctl restart keeper.service
9. Logs

       sudo journalctl -u keeper.service -f
