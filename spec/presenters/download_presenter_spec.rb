require 'rails_helper'

RSpec.describe DownloadPresenter, type: :presenter, download: true do
  let(:download) { build(:download) }
  subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:download) }
  end

  describe 'standard download' do
    it 'returns the linked title' do
      expect(download_presenter.linked_text(download.title)).to eq(link_to download.title, download)
    end

    it 'returns the summary - html formatted' do
      expect(download_presenter.summary).to eq(simple_format download.summary)
    end

    it 'returns the content - html escaped' do
      expect(download_presenter.description).to eq(raw download.description)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(download_presenter.show_image).to eq(nil)
      end

      it 'index_image should return nil' do
        expect(download_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:download) { build(:download_with_image) }
      subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view) }

      it 'show_image should not return nil' do
        expect(download_presenter.show_image(alt: download.title)).to eq(image_tag(download.image.show, alt: download.title))
      end

      it 'index image should not return nil' do
        expect(download_presenter.index_image(alt: download.title)).to eq(image_tag(download.image.index, alt: download.title))
      end
    end
  end
end