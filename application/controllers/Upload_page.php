<?php
  defined('BASEPATH') OR exit('No direct script access allowed');

  class Upload_page extends CI_Controller {

        public function __construct()
        {
            parent::__construct();
            $this->load->helper(array('form', 'url'));
            $this->load->library('form_validation');
            $this->load->model('upload_model'); 
        }

        public function index()
        {
         $this->load->view('upload', array('error' => ' ' ));
        }

        public function upload_file()
        {
            if(!empty($_FILES['userfile']['name'])){
                $config['upload_path']          = './uploads/';
                $config['allowed_types']        = 'gif|jpg|png|pdf|doc';
                $config['file_name']            = $_FILES['userfile']['name'];
                // $config['max_size']             = 100;
                // $config['max_width']            = 1024;
                // $config['max_height']           = 768;

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ( ! $this->upload->do_upload('userfile'))
                {

                        
                    $this->form_validation->set_error_delimiters('<p class="error">', '</p>');

                    $error = array('error' => $this->upload->display_errors());

                    $this->load->view('upload', $error);
                }
                else
                {
                    $userfile = $this->upload->data();
                    $picture = $userfile['file_name'];
                    print_r($userfile);
                    $data = array('userfile' => $picture);
                    echo implode( ", ", $data );
$call = $this->upload_model->image_upload($data);
                    $this->load->view('success', $data);

                }
            }
        }
}