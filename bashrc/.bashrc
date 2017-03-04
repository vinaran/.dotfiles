# load dircolors, this allows different filetypes to have different colors when 
# running 'ls -lrt' 
eval `dircolors ~/.dircolors/dircolors.solarized`

# always run ls with the colors option so we see colors added above 
alias ls='ls --color=auto'

# run firefox in background so it does not need to have a terminal window running
# redirect logs so they don't keep being outputted
alias firefox='nohup firefox > /tmp/firefox.log &'
