class BulbsController < ApplicationController
  discoverable \
    default: { if: 'urn:things', ct: 'application/cbor' },
    index:   { if: 'urn:index' },
    show: { if: 'urn:show' }

  def index
    render json: {name: "hallo"}.to_json
  end

  def show
    render json: {name: "yup"}.to_json
  end
end
