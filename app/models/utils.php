<div class="form-group">
        <select value="{{ @POST.userid }}" name="userid" id="userid">

            <repeat group="{{@user_rows}}" value="{{@row}}">
                <check if="{{@row.id==@POST.userid}}">
                    <true>
                            <option value="{{@row.id}}" selected>{{@row.name}}</option>
                    </true>
                    <false>
                            <option value="{{@row.id}}">{{@row.name}}</option>
                    </false>

                </check>
            </repeat>

        </select>
        <label class="control-label col-sm-2" for="userid">
            <i class="icon-envelope icon-black"></i> Person</label>
</div>