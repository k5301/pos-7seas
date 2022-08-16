$.call = function(urlLink,data,condition,handleData,handleError){
   return $.ajax({
        type: "POST",
        contentType: "application/json",
        async : condition,
        url: urlLink,
        data: data,
        datatype: "json",
        success: function (data) {
            handleData(data);
        },

        error: function (error) {
            handleError(error)
        }
    });
}

function img_upload(wrapper_id, img_src_id, cancel_btn_id, choose_file_id) {
    
    const choose_file = document.querySelector("#" + choose_file_id);
    const wrapper = document.querySelector("#" + wrapper_id);
    const img_src = document.querySelector("#" + img_src_id);
    const cancel_btn = document.querySelector("#" + cancel_btn_id);
    

    choose_file.click();
    choose_file.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function () {
                const result = reader.result;
                img_src.src = result;
                //console.log(img.src);
                wrapper.classList.add("active");
            };
            cancel_btn.addEventListener("click", function () {
                img_src.src = "";
                wrapper.classList.remove("active");
            });
            reader.readAsDataURL(file);
        }
        //to know the name of file
        //let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
        //if (this.value) {
        //  let valueStore = this.value.match(regExp);
        //  fileName.textContent = valueStore;
        //}
    });
    
    
}