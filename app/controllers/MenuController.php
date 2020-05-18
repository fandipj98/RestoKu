<?php
declare(strict_types=1);

// use App\Models\Menu;

class MenuController extends ControllerBase
{

    public function indexAction()
    {
        $menus = Menu::find();
        $this->view->menus = $menus;
    }

    public function showAction($menuId)
    {
        $conditions = ['id' => $menuId];
        $menu = Menu::findFirst([
            'conditions' => 'id_menu = :id:',
            'bind' => $conditions,
        ]);

        $this->view->menu = $menu;
    }

    public function createAction()              // menu awal
    {
        // return ke view
    }

    public function saveAction()                // menu awal
    {
        // Ambil semua data yang ada di response
        $nama               = $this->request->getPost('nama');
        $harga              = $this->request->getPost('harga');
        $jenis              = $this->request->getPost('jenis');
        $tersedia           = $this->request->getPost('tersedia');
        $deskripsi          = $this->request->getPost('deskripsi');

        if($harga == "" || $jenis == "" || $tersedia == "" || $deskripsi == "")
        {
            $this->flash->error("It's look like some field is not filled!");
            return $this->response->redirect('/menu/create');
        }

        // $file       = $this->request->getUploadedFiles()[0];
        // $path       = 'img/menu';

        // if ($file == NULL)
        // {
        //     return $this->response->redirect('/menu/create/' . $id);
        // }
        // else
        // {
            // $ext = pathinfo($file->getName(), PATHINFO_EXTENSION);
            // if($ext == "jpg" || $ext == "jpeg")
            // {
            //     $pathfile = $path . $nama . time() . $file->getName();

            //     // $file->moveTo($pathfile);

                $tes = 'tesaja.png';
                $menu = new Menu();

                $menu->nama_menu            = $nama;
                $menu->harga_menu           = $harga;
                $menu->jenis_menu           = $jenis;
                $menu->tersedia             = $tersedia;
                $menu->deskripsi_menu       = $deskripsi;
                $menu->foto_menu            = $tes;

                $menu->create();
                $this->response->redirect("/menu/read");
            // }
            // else
            // {
            //     return $this->response->redirect('/menu/create/');
            // }
        // }
    }

    public function readAction()                // Melihat pesanan yang dipesan oleh user
    {
        
        $menus = Menu::find();
        $this->view->menus = $menus;
        
    }

    public function readOneAction($id)          // Lihat detail menu
    {

        $menu = Menu::findFirst($id);
        $this->view->menu = $menu;

    }

    public function updateAction()              // Upload pembayaran saja
    {

        $menu = Menu::findFirst($id);
        $this->view->menu = $menu;

    }

    public function changeAction()              // Save dari upload pembayaran saja
    {

        $menu = Menu::findFirst($id);

        $menu->save();

    }

    public function deleteAction($id)
    {
        if($this->session('auth')['status']==0)                      // Checking apakah admin
        {
            $menu = Menu::findFirst($id);
            $menu->delete();
            return $this->response->redirect('/menu/read');
        }
        else
        {

        }                     
        
    }

}
