<h1>Articles</h1>
<?= $this->Html->link('add Article', ['action' => 'add'])?>
<table>
    <tr>
        <th>Titre</th>
        <th>Créé le</th>
        <th></th>
    </tr>

    <!-- C'est ici que nous bouclons sur notre objet Query $articles pour afficher les informations de chaque article -->

    <?php foreach ($articles as $article): ?>
    <tr>
        <td>
            <?= $this->Html->link($article->title, ['action' => 'view', $article->slug]) ?>
        </td>
        <td>
            <?= $article->created->format(DATE_RFC850) ?>
        </td>
        <td>
            <?= $this->Html->link('Edit', ['action' => 'edit', $article->slug])?>
        </td>
    </tr>
    <?php endforeach; ?>
</table>
