class BulbsController < ApplicationController
  discoverable \
    default: { if: 'urn:things', ct: 'application/cbor' },
    index:   { if: 'urn:index' }

  def index
    render json: {name: "his"}.to_json
  end
end
