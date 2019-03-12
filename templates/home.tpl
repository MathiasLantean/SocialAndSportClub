{extends file='_base.tpl'}

{block name=content}
    
    {if $smarty.session["user"]["user_type"] eq "admin"}
        {include file="_admin_content.tpl"}
    {else}
        {include file="_member_content.tpl"}
    {/if}
    
{/block}