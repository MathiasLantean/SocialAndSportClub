{extends file='_base.tpl'}

{block name=content}
    
<div class="row justify-content-center">
    <div class="card shadow mb-4">
    <div class="card-header py-3">
      Filter by activity
      <select id="statusFilter">
            <option value="">All</option>
            {foreach from=$activities item=activity}
                <option value="{$activity["id"]}">{$activity["name"]}</option>
            {/foreach}
      </select>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th></th>  
              <th>Name</th>
              <th>Surname</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Address</th>
              <th>DOB</th>
              <th></th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>

</div>
    
{/block}

{block name=javascript}
  <script src="templates/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="templates/vendor/datatables/dataTables.bootstrap4.min.js"></script>
   <script src="templates/js/listMembers.js"></script>
{/block}