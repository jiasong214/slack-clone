window.onload = () => {
  // chats list functions -----------------------------------------
  // scroll to bottom to show the recent msgs first
  setTimeout(() => {
    const chatScrollContainer = document.querySelector(".chats__list-container");
    const chatList = document.querySelector(".chats__list");

    chatScrollContainer.scrollTo(0, chatList.offsetHeight);
  },0)


  // chats form functions -----------------------------------------
  const chatForm = document.querySelector(".chats__form");
  const input = document.querySelector(".chats__form__input");

  // text editor setting
  // - change new line event(enter) to submit event
  // - change to shift + enter for line change
  const quill = new Quill('#editor', {
    theme: 'snow',
    modules: {
      toolbar: ['bold', 'italic', 'strike', 'code-block',{ 'list': 'ordered'}, { 'list': 'bullet' }],
      keyboard: {
        bindings: {
          shift_enter: {
            key: 13,
            shiftKey: true,
            handler: (range, ctx) => {
              console.log(range, ctx);
              quill.insertText(range.index, '\n');
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

  // fill the editor with the input value when a user clicks edit chat
  document.querySelector(".ql-editor").innerHTML = input.value;

  // send editor contents as a value when form is submitted
  chatForm.addEventListener("submit", function(e){
    input.value = document.querySelector(".ql-editor").innerHTML;
  });


  // channel info modal -----------------------------------------
  // 1. modal open and close
  const channelInfoBtn = document.querySelector(".channel__infoBtn");
  const modal = document.querySelector(".modal-container");
  const modalBackground = document.querySelector(".modal-background");
  const modalCloseBtn = document.querySelector(".modal-container .closeBtn");

  const toggleModal = () => {
    if(modal.classList.contains("active")){
      modal.classList.remove("active");
    }else {
      modal.classList.add("active");
    }
  }

  channelInfoBtn.addEventListener("click", () => toggleModal());
  modalBackground.addEventListener("click", () => toggleModal());
  modalCloseBtn.addEventListener("click", () => toggleModal());


  // 2. modal tab click
  const tabBtns = document.querySelectorAll(".tabMenu > button");
  const tabMenus = document.querySelectorAll(".modal__contents ul")

  const clickTabMenu = (e, id) => {
    // remove all active UI
    tabBtns.forEach(el => el.classList.remove("active"));
    tabMenus.forEach(el => el.classList.remove("active"));

    // find current tab id, and get elements with it
    const menuId = id ? id : e.target.dataset.id;
    const menu = document.querySelector(`ul[data-id="${menuId}"]`);
    const btn = document.querySelector(`button[data-id="${menuId}"]`);

    menu.classList.add("active");
    btn.classList.add("active");
  }

  const addMemberBtn = document.querySelector(".modal-container .addBtn");
  const seeMemberBtn = document.querySelector(".modal__contents .membersBtn");
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