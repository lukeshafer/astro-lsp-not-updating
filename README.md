# Recreation of Astro LSP issue in Neovim

- **Neovim version:** 0.9.5
- **Astro LSP version (globally installed)**: 2.8.4
- **Astro version**: 4.6.x
- **OS**: Arch Linux 
  - Tested on a standard Arch installation and WSL 2.
  - Haven't had a chance to test my Mac yet, and can't get the LSP to work at all on Windows proper, which is its own problem and probably my lack of experience with Windows.
- **Neovim plugin versions**: see `nvim/lazy-lock.json`

## The issue
In Neovim, the Astro LSP does not seem to recognize changes made in .astro files after opening the editor, IF the file is a dynamic route.
For example, `index.astro` works, but `[param].astro` does not.
For updates to register, you must restart the language server or Neovim itself, or the LSP will act like the file never changed.

This used to work but unfortunately I haven't been able to nail down what changed to break it -- will continue looking into that.

Right now I'm unsure if the issue is with my environment, Neovim, the lspconfig, or astro-ls itself 
-- hoping to narrow it down. This problem doesn't occur in VSCode.

## To recreate:
- Place the provided `nvim/` folder in your `$HOME/.config` directory, or wherever is required to config your Neovim installation (backup any existing config if you have it)
- Start Neovim and run `:Lazy sync` to ensure the `lspconfig` package installs.
- Navigate to the `astro/` directory and open `src/pages/index.astro` (`nvim src/pages/index.astro`)
- Make the changes detailed in that file, noting the (correct) behavior.
- Repeat these steps in `src/pages/[param].astro`, noting the incorrect behavior.
- Do the same in `src/pages/[...slug].astro` and `src/pages/[param]/test.astro`, again noting the incorrect behavior.

Note - this project won't run properly because of the dynamic routes in a static site setting, 
but the addition of `getStaticProps` or changing to SSR mode does not affect this behavior,
since it's an editor problem, not runtime.
