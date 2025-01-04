document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.post-link').forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        const postId = e.target.dataset.postId;
  

        fetch(`/posts/${postId}`)
          .then(response => response.text())
          .then(html => {
            document.getElementById('post-details-container').innerHTML = html;
          });
      });
    });
  });
  