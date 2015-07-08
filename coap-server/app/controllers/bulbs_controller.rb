class BulbsController < ApplicationController
  discoverable \
    default: { ct: :turtle }


  def index
    render text: "<http://itm.uni-luebeck.de/time1> <http://itm.uni-luebeck.de/seconds> 3536", content_type: "n3/turtle"

  end

  def show
    render text: "<http://itm.uni-luebeck.de/time1> <http://itm.uni-luebeck.de/minutes> 21"
  end

end
