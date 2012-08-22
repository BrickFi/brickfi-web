<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for Brick_Power
 *
 * @author     David Kobia <david@ushahidi.com>
 * @package	   BrickFI
 * @subpackage models
 * @copyright  BrickFI - http://www.brickfi.com
 * @license    http://www.gnu.org/copyleft/gpl.html GNU General Public License v3 (GPLv3) 
 */

class Model_Brick_Power extends ORM
{
	/**
	 * A Brick_Power belongs to a brick
	 *
	 * @var array Relationhips
	 */
	protected $_belongs_to = array(
		'brick' => array()
		);

	// Table Name -- because 'power' can't necessarily be plural in the table name
	protected $_table_name = 'brick_power';

	// Insert Timestamps
	protected $_created_column = array('column' => 'created', 'format' => 'Y-m-d H:i:s');
}