# frozen_string_literal: true

module MarkfeeWuBilingual
  class ArchivePages < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      known_urls = site.pages.map(&:url)
      archives = site.pages.select do |page|
        %w[tag category].include?(page.data["layout"]) &&
          page.data["posts"].is_a?(Array) &&
          page.url.match?(%r{\A/(tags|categories)/})
      end

      archives.each do |archive|
        all_posts = archive.data["posts"].dup
        archive.data["lang"] = "en"
        archive.data["posts"] = all_posts.select { |post| (post.data["lang"] || site.config["lang"] || "en") == "en" }
        chinese_url = "/zh#{archive.url}"
        next if known_urls.include?(chinese_url)

        directory = chinese_url.sub(%r{\A/}, "")
        translated = Jekyll::PageWithoutAFile.new(site, site.source, directory, "index.html")
        translated.data = archive.data.dup
        translated.data["lang"] = "zh-CN"
        translated.data["english_url"] = archive.url
        translated.data["posts"] = all_posts.select { |post| post.data["lang"] == "zh-CN" }
        translated.data["sitemap"] = false if translated.data["posts"].empty?
        site.pages << translated
        known_urls << chinese_url
      end
    end
  end
end
