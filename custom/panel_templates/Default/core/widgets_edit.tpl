{include file='header.tpl'}
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    {include file='navbar.tpl'}
    {include file='sidebar.tpl'}

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">{$WIDGETS}</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$LAYOUT}</li>
                            <li class="breadcrumb-item active">{$WIDGETS}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                {include file='includes/update.tpl'}

                <div class="card">
                    <div class="card-body">
                        <h5 style="display:inline">{$EDITING_WIDGET}</h5>

                        <div class="float-md-right">
                            {if isset($SETTINGS)}<a href="{$SETTINGS_LINK}" class="btn btn-primary">{$SETTINGS}</a>{/if}
                            <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                        </div>

                        <hr />

                        {if isset($SUCCESS)}
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5><i class="icon fa fa-check"></i> {$SUCCESS_TITLE}</h5>
                                {$SUCCESS}
                            </div>
                        {/if}

                        {include file='includes/errors.tpl'}

                        <form action="" method="post">
                            {foreach from=$POSSIBLE_PAGES key=module item=module_pages}
                                {if count($module_pages)}
                                    <div class="table table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>{$MODULE} {$MODULE_SEPERATOR} {$module|escape}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {foreach from=$module_pages key=page item=value}
                                                <tr>
                                                    <td>
                                                        <label for="{$page|escape}" style="font-weight: normal;">{($page|escape)|ucfirst}</label>
                                                        <div class="float-md-right">
                                                            <input class="js-switch" type="checkbox" name="pages[]" id="{$page|escape}" value="{$page|escape}"{if in_array($page, $ACTIVE_PAGES)} checked{/if} >
                                                        </div>
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                {/if}
                            {/foreach}

                            <div class="form-group">
                                <label for="inputOrder">{$WIDGET_ORDER}</label>
                                <input id="inputOrder" name="order" type="number" class="form-control" value="{$ORDER}">
                            </div>

                            <div class="form-group">
                                <label for="inputLocation">{$WIDGET_LOCATION}</label>
                                <select name="location" class="form-control" id="inputLocation">
                                    <option value="right" {if $LOCATION eq 'right' } selected{/if}>{$RIGHT}</option>
                                    <option value="left" {if $LOCATION eq 'left' } selected{/if}>{$LEFT}</option>                                    
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                            </div>
                        </form>

                    </div>
                </div>

                <!-- Spacing -->
                <div style="height:1rem;"></div>

            </div>
        </section>
    </div>

    {include file='footer.tpl'}

</div>
<!-- ./wrapper -->

{include file='scripts.tpl'}

</body>
</html>