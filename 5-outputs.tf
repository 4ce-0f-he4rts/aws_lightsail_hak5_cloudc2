output "terminal_message_0_hak5_cloudc2_web_app_public_ip" {
  value = "Static, Public IP: (1-2 min & Refresh Browser) http://${aws_lightsail_static_ip.this.ip_address}:8080"
}
output "terminal_message_1_hak5_cloudc2_ssh_public_ip" {
  value = "ssh ${var.remote_user}@${aws_lightsail_static_ip.this.ip_address} -i ${var.private_key_filename}"
}
output "terminal_message_2_hak5_cloudc2_setup_token_location" {
  value = "Setup Token Location (Remote Server): 'cat /var/log/cloud-init-output.log' & 'cat ~/hak5_cloudc2_setup_token.txt'"
}
##################################################
output "terminal_message_3_hak5_cloudc2_path_module" {
  value = "path_module: ${path.module}"
}
output "terminal_message_4_hak5_cloudc2_path_root" {
  value = "path_root: ${path.root}"
}
output "terminal_message_5_hak5_cloudc2_6_path_cwd" {
  value = "path_cwd: ${path.cwd}"
}
