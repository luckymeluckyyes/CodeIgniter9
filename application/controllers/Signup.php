<?php 

class Signup extends CI_Controller {

	public function __construct() {

		parent::__construct();
		$this->load->model('signup_model');
	}

	public function index() {

		$this->load->view('signup_view');
	}

	public function register_process() {



		if(!empty($_FILES['picture']['name'])){
                $config['upload_path'] = './application/uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif|pdf|doc';
                $config['file_name'] = $_FILES['picture']['name'];
                
                //Load upload library and initialize configuration
                $this->load->library('upload',$config);
                $this->upload->initialize($config);
                
                if($this->upload->do_upload('picture')){
                    $uploadData = $this->upload->data();
                    $picture = $uploadData['file_name'];
                    print_r($uploadData);
                }else{
                    $picture = 'error';
                }
            }else{
                $picture = '';
            }

		$name = $this->input->post('name');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$phone = $this->input->post('phone');

		$user = array(
			'name' => $name,
			'email' => $email,
			'password' => $password,
			'phone' => $phone,
			'userfile' => $picture
		);

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email|callback_check_avail['.$email.']');
		$this->form_validation->set_rules('password', 'Password', 'required');
		$this->form_validation->set_rules('con_password', 'Confirm Password', 'required|matches[password]');

		if($this->form_validation->run() == FALSE) {

			$this->session->set_flashdata('error', validation_errors('<p class="alert alert-danger">'));
			redirect('signup');
		} else {

			$call = $this->signup_model->register_user($user);

			if($call) {

				$this->session->set_flashdata('register_success', 'You are successfully registered. You can login now.'.anchor('signup/login_process', 'Login Here!'));
				redirect('signup');
			} else {

				redirect('signup');
			}
		}
	}

	public function check_avail($email) {

		$emailcheck = $this->signup_model->emailcheck($email);

		if($emailcheck) {

			$this->form_validation->set_message('check_avail', 'The '.$email.' already exists.');
			return FALSE;
		} else {

			return TRUE;
		}
	}

	public function login_process() {

		if($this->session->userdata('logged_in') == TRUE) {

			redirect('signup/loggedin');
		}

		$this->load->view('login');

		$email = $this->input->post('email');
		$password = $this->input->post('password');

		$this->form_validation->set_rules('email', 'Email', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

		if($this->form_validation->run() == FALSE) {

			$this->session->set_flashdata('error', validation_errors());
		} else {

			$user_id = $this->signup_model->login_user($email, $password);

			if($user_id) {

				$user_data = array(
					'user_id' => $user_id,
					'email' => $email,
					'logged_in' => TRUE
				);

				$this->session->set_userdata($user_data);
				$this->session->set_flashdata('login_success', 'You are now logged in.');
				redirect('signup/loggedin');
			} else {

				redirect('signup/login_process');
			}
		}
	}

	public function loggedin() {

		if($this->session->userdata('logged_in') == FALSE) {

			$this->session->set_flashdata('error', '<p class="alert alert-danger">Please login to view this page.</p>');
			redirect('signup/login_process');
			exit;
		}

		$user_id = $this->session->userdata('user_id');
		$user = $this->signup_model->getuserdata($user_id);
		$this->load->view('loggedin_view', $user);
	}

	public function logout() {

		$ar = array('user_id', 'email', 'logged_in');
		$this->session->unset_userdata($ar);
		$this->session->set_flashdata('logout_success', 'You are logged out successfully!');
		redirect('signup/login_process');
	}
}

 ?>