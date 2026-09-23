let selectedSubject = "All";

function filterSubject(subject) {
selectedSubject = subject;

```
document.querySelectorAll(".filter-btn").forEach(button => {
    button.classList.toggle(
        "active",
        button.textContent.trim() === subject
    );
});

searchChapters();
```

}

function searchChapters() {
const searchValue = document
.getElementById("search")
.value.toLowerCase()
.trim();

```
const cards = document.querySelectorAll(".chapter-card");
let visibleCount = 0;

cards.forEach(card => {
    const title = card.innerText.toLowerCase();
    const subject = card.dataset.subject;

    const matchesSearch = title.includes(searchValue);
    const matchesSubject =
        selectedSubject === "All" ||
        subject === selectedSubject;

    if (matchesSearch && matchesSubject) {
        card.style.display = "";
        visibleCount++;
    } else {
        card.style.display = "none";
    }
});

document.getElementById("noResults").style.display =
    visibleCount === 0 ? "block" : "none";
```

}
