import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'imgPhoto' ]

  changeImgSrc(e) {
    this.imgPhotoTarget.src = URL.createObjectURL(e.target.files[0])
  }

  selectNewPhoto() {
    this.photoFieldTarget.click()
  }
}
