if dein#tap('vim-quickrun')
  let g:quickrun_config = {}
  let g:quickrun_config.swift = {
        \ 'command'   : 'xcrun',
        \ 'cmdopt'    : 'swift',
        \ 'exec'      : '%c %o %s',
        \ }
endif