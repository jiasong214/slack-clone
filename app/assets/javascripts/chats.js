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
    // const actualText = document.querySelector(".ql-editor > p").innerHTML;
    input.value = document.querySelector(".ql-editor").innerHTML;
  });


  // channel info modal -----------------------------------------
  // 1. modal open and close
  const channelInfoBtn = document.querySelector(".channel__infoBtn");
  const modal = document.querySelector(".modal-container");
  const modalBackground = document.querySelector(".modal-background");
  const modalCloseBtn = document.querySelector(".modal-container .closeBtn")

  const toggleModal = () => {
    if(modal.classList.contains("active")){
      modal.classList.remove("active")
    }else {
      modal.classList.add("active")
    }
  }

  channelInfoBtn.addEventListener("click", () => toggleModal());
  modalBackground.addEventListener("click", () => toggleModal());
  modalCloseBtn.addEventListener("click", () => toggleModal());


  // 2. modal tab click
  const tabBtns = document.querySelectorAll(".tabMenu > button");
  const tabMenus = document.querySelectorAll(".modal__contents ul")

  const clickTabMenu = (e, id) => {
    tabBtns.forEach(el => el.classList.remove("active"));
    tabMenus.forEach(el => el.classList.remove("active"));

    const menuId = id ? id : e.target.dataset.id;
    const menu = document.querySelector(`ul[data-id="${menuId}"]`);
    const btn = document.querySelector(`button[data-id="${menuId}"]`);

    menu.classList.add("active");
    btn.classList.add("active");
  }

  const addMemberBtn = document.querySelector(".modal-container .addBtn");
  const seeMemberBtn = document.querySelector(".modal-container .membersBtn");
  const memberThumbnail = document.querySelector(".header__member");

  tabBtns.forEach((btn) => {
    btn.addEventListener("click", (e) => clickTabMenu(e));
  });
  addMemberBtn.addEventListener("click", (e) => clickTabMenu(e, 3));
  seeMemberBtn.addEventListener("click", (e) => clickTabMenu(e, 2));
  memberThumbnail.addEventListener("click", (e) => {
    toggleModal();
    clickTabMenu(e, 2);
  });
}