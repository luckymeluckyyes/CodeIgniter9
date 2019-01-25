<?php 

class Upload_model extends CI_Model {

	public function image_upload($user) {

		$this->db->insert('users', $user);
		return TRUE;
	}

// 	public function getuserdata($user) {

// 		$d = $this->db->select('*');
// 		$d = $this->db->from('users');
// 		$d = $this->db->where('id', $user_id);
// 		$result = $this->db->get();
// // var_dump($result);
// 		return $result->row();
// 	}
}

 ?>