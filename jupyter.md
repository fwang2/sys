
# Jupyter Notebook

To set it up with jupyterlab extension, see the following link:
https://jupyterlab.readthedocs.io/en/stable/user/extensions.html


## Useful extensions

* Font extension: https://github.com/deathbeds/jupyterlab-fonts
* Collapse headings: https://github.com/aquirdTurtle/Collapsible_Headings
* TOC: https://github.com/jupyterlab/jupyterlab-toc

## Jupyter Lab Font Customization

After installing [font
extension](https://github.com/deathbeds/jupyterlab-fonts). We can 
use "Advanced Setting Editor", we can customize the font as the following to
the liking:


```
{
    // Fonts
    // @deathbeds/jupyterlab-fonts:fonts
    // Settings for JupyterLab Fonts
    // *********************************

    // Enable Custom Fonts
    // Enable all font customizations
    "enabled": true,

    // Global Styles
    // JSS-compatible JSON applied to the Global scope
    "styles": {
        ":root": {
            "--jp-code-font-family": "Fira Mono",
            "--jp-content-font-size1": "15px",
            "--jp-code-font-size": "13px"
        }
    }
}
```