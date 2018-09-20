class API::V1::WebsitesController < ApplicationController
    require 'open-uri'
	def index
		websites = Website.all.map do |website|{
          website: website.url,
          content: website.contents.select(:value,:tag).map{|x| [x.value, x.tag]}}
        end
        render json: websites
	end
    

    def create
    	begin
	    	tags_to_capture=['h1','h2','h3','@href'].map{|x| "//" + x }
	    	 @website = Website.new(website_params)
	    	 if @website.save
		    	 file_content= Nokogiri::HTML(open(@website.url))
		    	 tags_to_capture.each do |tag|
		    	 	file_content.xpath(tag).each do |content_tag|
		    	 	 content = @website.contents.build(tag: tag.split("//")[1], value: content_tag.text.strip)
		    	 	 content.save
		    	 	end
		    	 end
		    	 render json: { status: 200, message: "Successfully created content of Html Page."}.to_json
		     else
		     	render json: {status: 422, message: @website.errors}.to_json

		     end

	    	rescue
	            render json: {status: 500, message: "Something went wrong"}.to_json
	    	end
    end

	def website_params
	    params.require(:website).permit(:url)
	end
end

