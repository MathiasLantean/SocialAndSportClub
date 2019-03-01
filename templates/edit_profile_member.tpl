{extends file='_base.tpl'}

{block name=content}
    
<div class="row justify-content-center">
    <div class="col-xl-6 col-lg-8 col-md-12 col-sm-12">
      <div class="p-5">
        <div class="text-center">
          <h1 class="h4 text-gray-900 mb-4">My Profile</h1>
        </div>
        <form class="user">
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
              <input type="text" class="form-control form-control-user" id="InputFirstName" placeholder="First Name" value="{$smarty.session["user"]["name"]}" readonly>
            </div>
            <div class="col-sm-6">
              <input type="text" class="form-control form-control-user" id="InputLastName" placeholder="Last Name" value="{$smarty.session["user"]["surname"]}" readonly>
            </div>
          </div>
          <div class="form-group">
            <input type="email" class="form-control form-control-user" id="InputEmail" placeholder="Email Address" value="{$smarty.session["user"]["email"]}" readonly>
          </div>
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
              <input type="text" class="form-control form-control-user" id="InputPhone" placeholder="Phone Number" value="{$smarty.session["user"]["phone"]}" readonly>
            </div>
            <div class="col-sm-6">
              <input type="date" class="form-control form-control-user" id="InputBirth" placeholder="Date of Birth" value="{$smarty.session["user"]["DOB"]}" readonly>
            </div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control form-control-user" id="InputAddress" placeholder="Address" value="{$smarty.session["user"]["address"]}" readonly>
          </div>  
          <hr>  
          <div class="text-xs font-weight-bold text-primary text-uppercase text-center mb-1">Change Password</div>  
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
              <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
            </div>
            <div class="col-sm-6">
              <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
            </div>
          </div>
          <input type="submit" class="btn btn-primary btn-user btn-block" value="Save">
        </form>
      </div>
    </div>
</div>
    
{/block}