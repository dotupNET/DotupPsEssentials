function Get-IfNull {
  param (
    $value,
    $default
  )

  if ($value) {
    $value;
  }
  else {
    $default;
  }
}