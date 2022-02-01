window.onload = () => {
  // chats list functions -----------------------------------------
  const chatScrollContainer = document.querySelector(".chats__list-container");
  const chatList = document.querySelector(".chats__list");
  chatScrollContainer.scrollTo(0, chatList.offsetHeight);


  // chats form functions -----------------------------------------
  const chatForm = document.querySelector(".chats__form");
  const input = document.querySelector(".chats__form__input");

  // text editor setting
  // - change enter event to submit event
  // - replace to shift + enter for line change
  const quill = new Quill('#editor', {
    theme: 'snow',
    placeholder: 'Compose an epic...',
    modules: {
      toolbar: ['bold', 'italic', 'strike', 'code-block'],
      keyboard: {
        bindings: {
          shift_enter: {
            key: 13,
            shiftKey: true,
            handler: (range, ctx) => {
              // console.log(range, ctx);
              editor.insertText(range.index, '\n');
            }
          },
          enter: {
            key: 13,
            handler: () => {
              input.value = document.querySelector(".ql-editor").innerHTML;
              chatForm.submit();
            }
          }
        }
      }
    }
  });

  quill.focus();

  // fill the text with input value when a user click edit chat
  document.querySelector(".ql-editor").innerHTML = input.value;

  // send a text contents as a value when form is submitted
  chatForm.addEventListener("submit", function(e){
    input.value = document.querySelector(".ql-editor").innerHTML;
  });
}