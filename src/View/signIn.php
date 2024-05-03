<h1>Connexion</h1>
<form action="index.php?page=SignIn" method="post">
    <div>
        <label for="email">Votre email</label>
        <input type="email" name="email" id="email">
    </div>
    <div>
        <label for="password">Votre mot de passe</label>
        <input type="password" name="password" id="password">
    </div>
    <button type="submit">Se connecter</button>


    <?php var_dump($_SESSION)?>
</form>