
namespace :genicons do

  desc "Compile Jekyll site and copy files to necessary folders"
  task :compile do
    %x[rm -rf css && rm -rf js && rm index.html]
    %x[cd _jekyll_site && jekyll && cd ..]
    %x[cp -r _jekyll_site/_site/js . && cp -r _jekyll_site/_site/css . && cp _jekyll_site/_site/index.html .]
  end

  desc "Removes compiled/copied site files"
  task :clean do
    %x[rm -rf css && rm -rf js && rm index.html]
  end

  desc "Starts up a server to view site"
  task :server do
    %x[cd _jekyll_site && jekyll --server]
  end

end