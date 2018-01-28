2. Create a bare clone of the repository.
   ``` command-line
   $ git clone --bare https://{{ site.data.variables.command_line.codeblock }}/<em>exampleuser</em>/<em>old-repository</em>.git
   ```
3. Mirror-push to the new repository.
   ``` command-line
   $ cd <em>old-repository</em>.git
   $ git push --mirror https://{{ site.data.variables.command_line.codeblock }}/<em>exampleuser</em>/<em>new-repository</em>.git
   ```
