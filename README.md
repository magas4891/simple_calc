1)A webpage should be created which will implement a simple calculator consisĕng of:
    
    a)two input fields, called a and b
    b)four buĥons labeled sum , difference , multiplication and division
    c)one textarea element with edit mode disabled (read‐only)
2)Calculator must operate only on non‐negaĕve integer numbers lower than 100. When the formis invalid, the four buĥons menĕoned above should be disabled.

3)When user fills the form and clicks one of the buĥons, the form content should be sent to theserver with AJAX POST call; and the server response put directly into textarea element.

4)Server‐side code should work in following way:

    a)in case of invalid data provided “error” text should be returned
    b)all calculaĕons previously made should be stored in the database; 
        if an operaĕon withgiven parameters hasn't been made yet,
        it should be saved; otherwise calculaĕon resultshould be fetched from DB
    c)server response should equal to 4 lines of text in following format:
        Operation: A
        Result: B
        ID: C
        Count: D , where:
            i)A will be equal to text interpretaĕon of the operaĕon
                (e.g. incase of sum ofnumbers 24 and 23 A should be equal to “24 + 23”
            ii)B will be equal to calculaĕon result
            iii)C will be an DB document/record ID where given operaĕon data is stored
            iv)D will equal to number of previous calls for given operaĕon
5)The form should be inacĕve during the data calculaĕon on the server side, 
    i.e. the user is notallowed to request another calculaĕon if the previous one is not finished

6)Write tests to the apps funcĕonality, using whatever technology you prefer