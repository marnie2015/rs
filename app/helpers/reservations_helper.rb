module ReservationsHelper
  def edit_save_cancel_btn(field, table)
    "
    <span class='input-group-addon edit-btn-span' id='edit-#{field}' data-field='#{field}' data-table='#{table}' data-val=''>
      <span class='glyphicon glyphicon-pencil'></span>
    </span>
    <span class='input-group-addon save-btn-span' id='save-#{field}' data-field='#{field}' data-table='#{table}'>
      <span class='glyphicon glyphicon-ok'></span>
    </span>
    <span class='input-group-addon cancel-btn-span' id='cancel-#{field}' data-field='#{field}' data-table='#{table}' data-val=''>
      <span class='glyphicon glyphicon-remove'></span>
    </span>
    ".html_safe
  end
end
