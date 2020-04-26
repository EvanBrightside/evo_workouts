const Sortable = require('@shopify/draggable/lib/sortable');
import move from 'lodash-move'
import createFileList from 'create-file-list'

document.addEventListener('turbolinks:load', function() {
  let dropArea = document.getElementById('drop-area');
  let previewList = document.querySelector('ul.previews');
  var dragAndDropInput = document.getElementsByClassName('drag_n_drop_input')[0]
  const validExtensions = ["jpg", "jpeg", "png", "webp", "gif"];

  if (dropArea && previewList && dragAndDropInput) {
    function preventDefaults (e) {
      e.preventDefault();
      e.stopPropagation();
    }

    function highlight(e) {
      dropArea.classList.add('js-highlight')
    }

    function unhighlight(e) {
      dropArea.classList.remove('js-highlight')
    }

    function uploadFile(file) {
      let fileType = file.type.split('/');
      if (validExtensions.indexOf(fileType[fileType.length -1]) !== -1) {
        createLi(file);
      }
    }

    function handleDrop(e) {
      let dt = e.dataTransfer;
      let files = dt.files;
      handleFiles(files);
    }

    function handleFiles(files) {
      ([...files]).forEach(uploadFile);
    }

    function createLi(file) {
      const li = '<li class="previews__item">' +
        '<button class="delete-btn previews__delete-btn">x</button>' +
        '<div class="previews__img">' +
        '   <img src="#" alt="preview image">' +
        '</div></li>';
      previewList.insertAdjacentHTML('afterbegin', `${li}`);

      const img = previewList.querySelector('li:first-of-type img');
      const reader = new FileReader();
      reader.onload = function (e) {
        img.setAttribute('src', e.target.result);
      };

      const deleteBtn = img.parentNode.parentNode.querySelector('.delete-btn');
      deleteBtn.addEventListener('click', function (e) {
        preventDefaults(e);
        deleteBtn.parentElement.parentElement.removeChild(deleteBtn.parentNode);
      });

      reader.readAsDataURL(file);
    }

    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
      dropArea.addEventListener(eventName, preventDefaults, false);
    });
    ['dragenter', 'dragover'].forEach(eventName => {
      dropArea.addEventListener(eventName, highlight, false)
    });
    ['dragleave', 'drop'].forEach(eventName => {
      dropArea.addEventListener(eventName, unhighlight, false)
    });

    dragAndDropInput.onchange = function() {
      handleFiles(this.files);
    };

    dropArea.addEventListener('drop', handleDrop, false);

    //DRAGGABLE lib
    const sortable = new Sortable.default(document.querySelectorAll('ul'), {
      draggable: 'li'
    });

    sortable.on('sortable:stop', (e) => {
      if (dragAndDropInput.files.length !== 0) {
        let files = move(Array.from(dragAndDropInput.files).reverse(), e.data.oldIndex, e.data.newIndex)
        dragAndDropInput.files = createFileList(files)
      }
    });
  }
});
