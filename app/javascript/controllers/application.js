import { Application } from "@hotwired/stimulus"

const application = Application.start()
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require popper
//= require bootstrap
//= require activestorage
//= require font_awesome5
//= require tinymce
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
