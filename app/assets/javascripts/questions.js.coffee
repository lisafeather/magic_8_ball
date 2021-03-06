 $ ->
  $('form').submit (event) ->
    event.preventDefault()
    $text = $('#question_text')

    question = {text: $text.val()}
    post = $.ajax(url:"questions", type: "post", data: {question: question})
    # clear the questions div to make room for next question & answer pair
    $("#questions").html("")
    # post form data then append to 8-ball
    post.done (data)-> 
      $("#questions").append(data["question"]["text"]).animate
        opacity: 0.9, 1000, -> $("#questions").append("<p> " + data["answer"]["text"] + "</p>")
      $("#past_questions").prepend("<p>" + data["question"]["text"] + "<br> ☆ " + data["answer"]["text"] + " ☆ </p>")
    # clear the text box
    $text.val("")
    
