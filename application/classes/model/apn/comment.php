<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for APN_Comments
 *
 * @author     David Kobia <david@ushahidi.com>
 * @package	   BrickFI
 * @subpackage models
 * @copyright  BrickFI - http://www.brickfi.com
 * @license    http://www.gnu.org/copyleft/gpl.html GNU General Public License v3 (GPLv3) 
 */

class Model_Apn_Comment extends ORM
{
	/**
	 * An APN_Comment belongs to an apn and user
	 *
	 * @var array Relationhips
	 */
	protected $_belongs_to = array(
		'apn' => array(),
		'user' => array()
		);

	// Insert/Update Timestamps
	protected $_created_column = array('column' => 'created', 'format' => 'Y-m-d H:i:s');
	protected $_updated_column = array('column' => 'updated', 'format' => 'Y-m-d H:i:s');
}