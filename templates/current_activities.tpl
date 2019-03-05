{extends file='_base.tpl'}

{block name=content}

<div class="row">
{foreach from=$activities item=item}
    <div class="col-lg-6 mb-4">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    {$item.name}
                </h6>
            </div>
            <div class="card-body">
              <div class="text-center">
                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="{$item.photo}" alt="{$item.name}_photo">
              </div>
              <p>{$item.description}</p>
              <a href="#" class="btn btn-secondary btn-icon-split float-right">
                <span class="icon text-white-50">
                  <i class="fas fa-arrow-right"></i>
                </span>
                <span class="text">Leave Activity</span>
              </a>
            </div>
        </div>
    </div>
    
{/foreach}
</div>
    
{/block}

{block name=javascript}
{/block}