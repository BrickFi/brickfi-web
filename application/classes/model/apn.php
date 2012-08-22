<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for APNS
 *
 * @author     David Kobia <david@ushahidi.com>
 * @package	   BrickFI
 * @subpackage models
 * @copyright  BrickFI - http://www.brickfi.com
 * @license    http://www.gnu.org/copyleft/gpl.html GNU General Public License v3 (GPLv3) 
 */

class Model_Apn extends ORM
{
	/**
	 * An APN belongs to a country, provider and user
	 *
	 * @var array Relationhips
	 */
	protected $_belongs_to = array(
		'country' => array(),
		'provider' => array(),
		'user' => array()
		);

	/**
	 * An APN has many apn_comments
	 *
	 * @var array Relationhips
	 */
	protected $_has_many = array(
		'apn_comments' => array()
		);

	// Insert/Update Timestamps
	protected $_created_column = array('column' => 'created', 'format' => 'Y-m-d H:i:s');
	protected $_updated_column = array('column' => 'updated', 'format' => 'Y-m-d H:i:s');
}