{extends file='_base.tpl'}

{block name=content}
    
<div class="row justify-content-center">
    <div class="col-xl-6 col-lg-8 col-md-12 col-sm-12">
      <div class="p-5">
        <div class="text-center">
          <h1 class="h4 text-gray-900 mb-4">Edit Member</h1>
        </div>
        <form id="formUpdateUser" class="user" method="POST" action="doEditMember.php" enctype="multipart/form-data">
          <input type="number" name="id" value="{$user["id"]}" hidden>  
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="InputFirstName" name="name" placeholder="First Name" value="{$user["name"]}">
            </div>
            <div class="col-sm-6">
              <input type="text" class="form-control form-control-user" id="InputLastName" name="surname" placeholder="Last Name" value="{$user["surname"]}">
            </div>
          </div>
          <div class="form-group">
              <input type="email" class="form-control form-control-user" id="InputEmail" name="email" placeholder="Email Address" value="{$user["email"]}">
          </div>  
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
              <input type="text" class="form-control form-control-user" id="InputPhone" name="phone" placeholder="Phone Number" value="{$user["phone"]}">
            </div>
            <div class="col-sm-6">
              <input type="date" class="form-control form-control-user" id="InputBirth" name="dob" placeholder="Date of Birth" value="{$user["DOB"]}">
            </div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control form-control-user" id="InputAddress" name="address" placeholder="Address" value="{$user["address"]}">
          </div>
          <div class="form-group">
              <label for="InputPhoto">Profile picture </label>
              <input type="file" name="photo" id="InputPhoto" accept=".png, .jpg"/>
          </div>
          <div class="card bg-danger text-white shadow" id="error-card-update"  style="display: none">
              <div class="card-body">
                 <div class="text-white-80 small text-center" id="error-text-update"></div>
              </div>
          </div>
          
          {if isset($smarty.session["status"]) and $smarty.session["status"] == True}
            <div class="card bg-success text-white shadow msg-server" id="success-card">
                <div class="card-body">
                   <div class="text-white-80 small text-center" id="success-text">
                       {$smarty.session["message"]}
                   </div>
                </div>
            </div>   
          {/if}
          {if isset($smarty.session["status"]) and $smarty.session["status"] == False}
            <div class="card bg-danger text-white shadow msg-server" id="error-card-server">
              <div class="card-body">
                  <div class="text-white-80 small text-center" id="error-text-server">
                      {$smarty.session["message"]}
                  </div>
                </div>
            </div>
          {/if}
          <input type="submit" class="btn btn-primary btn-user btn-block" value="Save">
        </form>
      </div>
    </div>
</div>
    
{/block}

{block name=javascript}
    <script src="templates/js/utils.js" type="text/javascript"></script>
    <script src="templates/js/editProfile.js" type="text/javascript"></script>
    <script src="templates/js/editProfileAdmin.js" type="text/javascript"></script>
{/block}