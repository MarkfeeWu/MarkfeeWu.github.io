# frozen_string_literal: true

module MarkfeeWuChineseInterface
  class EnglishContentPages < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      known_urls = site.pages.map(&:url)
      site.posts.docs.each do |post|
        next unless (post.data['lang'] || site.config['lang'] || 'en') == 'en'
        url = '/zh' + post.url
        next if known_urls.include?(url)
        name = File.extname(post.relative_path).downcase == '.html' ? 'index.html' : 'index.md'
        page = Jekyll::PageWithoutAFile.new(site, site.source, url.sub(%r{\A/}, ''), name)
        page.data = post.data.dup
        page.data['layout'] = post.data['layout'] || 'post'
        page.data['lang'] = 'zh-CN'
        page.data['english_url'] = post.url
        page.data['permalink'] = url
        page.data['date'] = post.date
        page.content = post.content
        site.pages << page
        known_urls << url
      end

      site.pages.dup.each do |archive|
        archive_posts = archive.respond_to?(:posts) ? archive.posts : archive.data['posts']
        next unless %w[tag category].include?(archive.data['layout']) && archive_posts.is_a?(Array) && archive.url.match?(%r{\A/(tags|categories)/})
        url = '/zh' + archive.url
        next if known_urls.include?(url)
        page = Jekyll::PageWithoutAFile.new(site, site.source, url.sub(%r{\A/}, ''), 'index.html')
        page.data = archive.data.dup
        page.data['lang'] = 'zh-CN'
        page.data['english_url'] = archive.url
        page.data['permalink'] = url
        page.data['title'] = archive.respond_to?(:title) ? archive.title : archive.data['title']
        page.data['posts'] = archive_posts.select { |post| (post.data['lang'] || site.config['lang'] || 'en') == 'en' }
        site.pages << page
        known_urls << url
      end
    end
  end
end
