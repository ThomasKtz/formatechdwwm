<h1>Ajouter un admin</h1>

<form action="index.php?page=AddAdmin" method='post'>
    <div>
        <label for="civility">Civilité</label>
        <select name="civility" id="civility">
            <option value="">Veuillez choisir</option>
            <option value="0">M.</option>
            <option value="1">Mme</option>
        </select>
    </div>
    <div>
        <label for="firstname">Prénom</label>
        <input type="text" name="firstname" id="firstname">
    </div>
    <div>
        <label for="lastname">Nom de famille</label>
        <input type="text" name="lastname" id="lastname">
    </div>
    <div>
        <label for="phone">Numéro de téléphone</label>
        <input type="tel" name='phone' id='phone'>
    </div>
    <div>
        <label for="email">Email</label>
        <input type="email" name="email" id="email">
    </div>
    <div>
        <label for="password">Mot de passe</label>
        <input type="password" name='password' id='password'>
    </div>
    <div>
        <label for="street">Nom de la rue</label>
        <input type="text" name="street" id="street">
    </div>
    <div>
        <label for="zipcode">Code postal</label>
        <input type="text" name="zipcode" id="zipcode">
    </div>
    <div>
        <label for="city">Ville</label>
        <input type="text" name="city" id="city">
    </div>
    <div>
        <label for="country">Pays</label>
        <input type="text" name="country" id="country">
    </div>
    <button type="submit">Ajouter Admin</button>
</form>