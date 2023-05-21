// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener("turbo:frame-missing", (event) => {
  const { detail: { response, visit } } = event;
  event.preventDefault();
  visit(response.url); // you have to render your "application" layout for this
});
