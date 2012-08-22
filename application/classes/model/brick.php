<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for Bricks
 *
 * @author     David Kobia <david@ushahidi.com>
 * @package	   BrickFI
 * @subpackage models
 * @copyright  BrickFI - http://www.brickfi.com
 * @license    http://www.gnu.org/copyleft/gpl.html GNU General Public License v3 (GPLv3) 
 */

class Model_Brick extends ORM
{
	/**
	 * A Brick belongs to a user
	 *
	 * @var array Relationhips
	 */
	protected $_belongs_to = array(
		'user' => array()
		);

	/**
	 * A brick has many connections, locations, power
	 *
	 * @var array Relationhips
	 */
	protected $_has_many = array(
		'brick_connections' => array(),
		'brick_locations' => array(),
		'brick_power' => array()
		);

	// Insert/Update Timestamps
	protected $_created_column = array('column' => 'created', 'format' => 'Y-m-d H:i:s');
	protected $_updated_column = array('column' => 'updated', 'format' => 'Y-m-d H:i:s');
}