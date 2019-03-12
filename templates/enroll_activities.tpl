{extends file='_base.tpl'}

{block name=content}

<div class="row justify-content-md-center">
{if empty($activities)}
    <div class="col-lg-6 col-md-8 text-center">
        <p class="lead text-gray-800 mb-5">Well done!</p>
        <p class="text-gray-500 mb-0">It looks like you are a busy person, you are in all the activities...</p>
    </div>
{/if}
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
                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem; height: 14rem;" src="{$item.photo}" alt="{$item.name}_photo">
              </div>
              <p>{$item.description}</p>
              <form action="doEnrollActivity.php" method="post">
                  <input type="number" name="activityId" value="{$item.id}" hidden>  
                <button type="submit" class="btn btn-success btn-icon-split float-right">
                  <span class="icon text-white-50">
                    <i class="fas fa-arrow-right"></i>
                  </span>
                  <span class="text">Enroll Activity</span>
                </button>
              </form>
            </div>
        </div>
    </div>
    
{/foreach}
</div>
    
{/block}
