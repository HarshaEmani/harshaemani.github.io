import Filterizr from "filterizr";

document.addEventListener("DOMContentLoaded", () => {
	const holder = document.getElementById("skill-card-holder");
	if (!holder || holder.children.length === 0) return;

	const gridEl = document.querySelector(".filtr-skills");
	if (!gridEl) return;

	const initial = gridEl.dataset.defaultFilter || null;

	const fltr = new Filterizr(".filtr-skills", {
		layout: "sameWidth",
		controlsSelector: ".skill-filtr-control",
		filter: "datascience",
		callbacks: {
			onInit: () => {
				fltr.filter("datascience"); // e.g., "data-science"
				gridEl.style.visibility = ""; // show once filtered
			},
		},
	});
});
