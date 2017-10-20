<script type="text/javascript">
    function validarLetras(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; // backspace
        if (tecla == 32)
            return true; // espacio
        if (e.ctrlKey && tecla == 86) {
            return true;
        } //Ctrl v
        if (e.ctrlKey && tecla == 67) {
            return true;
        } //Ctrl c
        if (e.ctrlKey && tecla == 88) {
            return true;
        } //Ctrl x

        patron = /[a-zA-Z]/; //patron

        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
    }
</script>

<script type="text/javascript">
    function validarNumeros(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; // backspace
        if (tecla == 32)
            return false; // espacio
        if (e.ctrlKey && tecla == 86) {
            return true;
        } //Ctrl v
        if (e.ctrlKey && tecla == 67) {
            return true;
        } //Ctrl c
        if (e.ctrlKey && tecla == 88) {
            return true;
        } //Ctrl x

        patron = /[0-9]/; //patron

        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
    }
</script>
<script type="text/javascript">
    function validarPrecios(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; // backspace
        if (tecla == 32)
            return false; // espacio
        if (e.ctrlKey && tecla == 86) {
            return true;
        } //Ctrl v
        if (e.ctrlKey && tecla == 67) {
            return true;
        } //Ctrl c
        if (e.ctrlKey && tecla == 88) {
            return true;
        } //Ctrl x

        patron = /[0-9 .]/; //patron

        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
    }
</script>
<script type="text/javascript">
        function elimina(id)
        {
            alertify.confirm("¿Seguro de borrar el registro " + id + "?", function (respuesta)
            {
                if (respuesta)
                {
                    location.href = "baja.jsp?id=" + id;
                }
            });
        }
</script>
<script>
        $(function () {
            $("#alta").dialog({
                autoOpen: false,
                show: {
                    effect: "drop",
                    duration: 1000
                },
                hide: {
                    effect: "explode",
                    duration: 1000
                }
            });
            $("#nuevo").on("click", function () {
                $("#alta").dialog("open");
            });
        }
        );

</script>
