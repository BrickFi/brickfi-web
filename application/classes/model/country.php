<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for Countries
 *
 * @author     David Kobia <david@ushahidi.com>
 * @package	   BrickFI
 * @subpackage models
 * @copyright  BrickFI - http://www.brickfi.com
 * @license    http://www.gnu.org/copyleft/gpl.html GNU General Public License v3 (GPLv3) 
 */

class Model_Country extends ORM
{
	/**
	 * A country has many apns
	 * A country has and belongs to many providers
	 *
	 * @var array Relationhips
	 */
	protected $_has_many = array(
		'apns' => array(),
		'providers' => array(
			'model' => 'provider',
			'through' => 'countries_providers'
			),
		);

	// Insert/Update Timestamps
	protected $_created_column = array('column' => 'created', 'format' => 'Y-m-d H:i:s');
	protected $_updated_column = array('column' => 'updated', 'format' => 'Y-m-d H:i:s');
}