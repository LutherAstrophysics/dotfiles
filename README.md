This repo contains the dotfiles used in the m23 server!
These dotfiles are symlinked to various places in the server. For
example, gitconfig to `.gitconfig`, `bash_profile` to `.bash_profile`
and more. 

One of the more important things used in the dotfiles is the
`PYTHONPATH` environment variable that contains the link to the
python-helpers folder that contains the `m23` library we use.
By setting this environment variable we are able to use   

```
import m23
```

in our python environment!
