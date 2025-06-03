Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE86B2AD02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944896; cv=none; b=tfLToXOyASRU8hT9q97ebJNURhrplOw01lO2Xrp/4L4Ff1xiCG3dq6Y/J1kUFPlBW1PQWk1ylxktnOVhn8DqA4H17GYNKVcB2kumPEpcXI0hMDge2BQR+T8cBvoPq8P1VOBhD1gfP6r4CbWrxxHDrV2XymwG+3jrWxj4NONOOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944896; c=relaxed/simple;
	bh=bhUQSJT37BwnybJSvBTp18NkMZ6E9ttwpcVQ0cS4p3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twXgtsxUVsKEOTGFClDKE7H1mT5y2yFwsP9LxPvFkAA7uT/OLEOxG9gbZqp5OOImvjxs25vlCz/BooOyJtVaGwyghROqL9v/NyqfQ9nfVPjQHBkVDStvucHD+4JGFQ93zID+X3KR8Is/7lq+mFVhOpqhIvypq7GYAd07vh4Alq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4hDsGeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4hDsGeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC86C4CEED;
	Tue,  3 Jun 2025 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748944896;
	bh=bhUQSJT37BwnybJSvBTp18NkMZ6E9ttwpcVQ0cS4p3I=;
	h=Date:From:To:Cc:Subject:From;
	b=W4hDsGeWJFH4S04LdvvElJ5xcjNg2rtaBAxbsBYbm0L4qyqocxF/sPNQ0ymSghnYH
	 TjNKkt/F9q2lAVox0qGjY+N9Aj8/hIOoFJTOxjViWVzR7G0nzrtukB7srA0bpbDRJB
	 VNwccaZTBsimreRzs/cO+2waGpWuVK880vil93MyIC/9XMhywfYoUtc15s5nhwP50v
	 Pb8wnfYS0SeW4SduDZugYzlcss4PEWgHkUGtb+Lvkq8xugoKq+92+3k/LPQ6OIg+xy
	 GISir7ozet44Co4Jgl9PHEgO5p4CGEojgGQ3NzPElXF6nfUKl0bleF1L0dFbo3ocur
	 Xz43ch67MwYQw==
Date: Tue, 3 Jun 2025 11:01:32 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [GIT PULL] LEDs for v6.16
Message-ID: <20250603100132.GD7758@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Good morning Linus,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git leds-next-6.16

for you to fetch changes up to b338a2ae9b316df1d81b5289badcc8cbbbfe1b2b:

  leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver (2025-05-22 09:24:51 +0100)

----------------------------------------------------------------
LEDs for v6.16

  * LED Triggers:
    * Allow writing "default" to the sysfs 'trigger' attribute to set an LED to its default trigger
    * If the default trigger is "none", writing "default" will remove the current trigger
    * Updated sysfs ABI documentation for the new "default" trigger functionality
  * LED KUnit Testing:
    * Provide a skeleton KUnit test suite for the LEDs framework
    * Expand the LED class device registration KUnit test to cover more scenarios, including
      `brightness_get` behavior
    * Add KUnit tests for the LED lookup and get API (`led_add_lookup`, `devm_led_get`)
  * LED Flash Class:
    * Add support for setting flash/strobe duration through a new `duration_set` op and
      `led_set_flash_duration()` function, aligning with `V4L2_CID_FLASH_DURATION`
  * Texas Instruments TPS6131x:
    * Add a new driver for the TPS61310/TPS61311 flash LED controllers
    * The driver supports the device's three constant-current sinks for flash and torch modes

  * LED Core:
    * Prevent potential `snprintf()` truncations in LED names by checking for buffer overflows
  * ChromeOS EC LEDs:
    * Avoid a -Wflex-array-member-not-at-end GCC warning by replacing an on-stack flexible structure
      definition with a utility function call
  * Multicolor LEDs:
    * Fix issue where setting multi_intensity while software blinking is active could stop blinking
  * PCA955x LEDs:
    * Avoid potential buffer overflow when creating default labels by changing a field's type to
      `u8` and updating format specifiers
  * PCA995x LEDs:
    * Fix a typo (stray space) in an `of_device_id` entry in the `pca995x_of_match` table
  * Kconfig:
    * Prevent LED drivers from being enabled by default when `COMPILE_TEST` is set

  * Device Property API:
    * Split `device_get_child_node_count()` into a new helper `fwnode_get_child_node_count()` that
      doesn't require a device struct, making the API more symmetrical
  * Driver Modernization (using `fwnode_get_child_node_count()`):
    * Update `leds-pwm-multicolor`, `leds-ncp5623` and `leds-ncp5623` to use the new
      `fwnode_get_child_node_count()` helper, removing their custom implementation
    * As above in the USB Type-C TCPM driver
  * Driver Modernization (using new GPIO setter callbacks):
    * Convert `leds-lgm-sso` to use new GPIO line value setter callbacks which return an integer
      for error handling
    * Convert `leds-pca955x`, `leds-pca9532` and `leds-tca6507` to use new GPIO setter callbacks
  * Documentation:
    * Remove the `.rst` extension for `leds-st1202` in the documentation index for consistency
  * LP8860 LEDs:
    * Use `regmap_multi_reg_write()` for EEPROM writes instead of manual looping
    * Use scoped mutex guards and `devm_mutex_init()` to simplify function exits and ensure
      automatic cleanup
    * Remove default register definitions that are unused when regmap caching is not active
    * Use `devm_regulator_get_enable_optional()` to handle the optional regulator, simplifying
      enabling and removing manual disabling
    * Refactor `lp8860_unlock_eeprom()` to only perform the unlock operation, removing the lock
      part and an unnecessary parameter
    * Use a `devm` action to disable the enable-GPIO, simplifying cleanup and error paths, and
      remove the now-empty `.remove()` function
  * Turris Omnia LEDs:
    * Drop unnecessary commas in terminator entries of `struct attribute` and
      `struct of_device_id` arrays
  * MT6370 RGB LEDs:
    * Use the `LINEAR_RANGE()` for defining `struct linear_range` entries to improve robustness

  * Texas Instruments TPS6131x:
    * Add new devicetree bindings for the TI TPS61310/TPS61311 flash LED driver

----------------------------------------------------------------
Andrew Davis (6):
      leds: lp8860: Use regmap_multi_reg_write for EEPROM writes
      leds: lp8860: Use new mutex guards to cleanup function exits
      leds: lp8860: Remove default regs when not caching
      leds: lp8860: Enable regulator using enable_optional helper
      leds: lp8860: Only unlock in lp8860_unlock_eeprom()
      leds: lp8860: Disable GPIO with devm action

Andy Shevchenko (6):
      device property: Split fwnode_get_child_node_count()
      leds: pwm-multicolor: Use fwnode_get_child_node_count()
      leds: ncp5623: Use fwnode_get_child_node_count()
      usb: typec: tcpm: Use fwnode_get_child_node_count()
      leds: core: Bail out when composed name can't fit the buffer
      leds: pca955x: Avoid potential overflow when filling default_label

Bartosz Golaszewski (4):
      leds: lgm-sso: Use new GPIO line value setter callbacks
      leds: pca955x: Use new GPIO line value setter callbacks
      leds: pca9532: Use new GPIO line value setter callbacks
      leds: tca6507: Use new GPIO line value setter callbacks

Christophe JAILLET (1):
      leds: rgb: leds-mt6370-rgb: Improve definition of some struct linear_range

Craig McQueen (1):
      leds: led-triggers: Improvements for default trigger

Gustavo A. R. Silva (1):
      leds: leds-cros_ec: Avoid -Wflex-array-member-not-at-end warning

Jesse Karjalainen (1):
      leds: pca995x: Fix typo in pca995x_of_match's of_device_id entry

Krzysztof Kozlowski (1):
      leds: Do not enable by default during compile testing

Lee Jones (4):
      leds: Provide skeleton KUnit testing for the LEDs framework
      leds: led-test: Remove standard error checking after KUNIT_ASSERT_*()
      leds: led-test: Fill out the registration test to cover more test cases
      leds: led-test: Provide tests for the lookup and get infrastructure

Manuel Fombuena (1):
      Documentation: leds: Remove .rst extension for leds-st1202 on index

Marek Behún (1):
      leds: turris-omnia: Drop commas in the terminator entries

Matthias Fend (2):
      dt-bindings: leds: Add Texas Instruments TPS6131x flash LED driver
      leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver

Richard Leitner (1):
      leds: flash: Add support for flash/strobe duration

Sven Schwermer (1):
      leds: multicolor: Fix intensity setting while SW blinking

 Documentation/ABI/testing/sysfs-class-led          |   6 +
 .../devicetree/bindings/leds/ti,tps61310.yaml      | 120 +++
 Documentation/leds/index.rst                       |   2 +-
 MAINTAINERS                                        |   7 +
 drivers/base/property.c                            |  12 +-
 drivers/leds/.kunitconfig                          |   4 +
 drivers/leds/Kconfig                               |  11 +-
 drivers/leds/Makefile                              |   1 +
 drivers/leds/blink/leds-lgm-sso.c                  |   6 +-
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-tps6131x.c                 | 815 +++++++++++++++++++++
 drivers/leds/led-class-flash.c                     |  15 +
 drivers/leds/led-class-multicolor.c                |   3 +-
 drivers/leds/led-core.c                            |  43 +-
 drivers/leds/led-test.c                            | 132 ++++
 drivers/leds/led-triggers.c                        |  13 +
 drivers/leds/leds-cros_ec.c                        |  21 +-
 drivers/leds/leds-lp8860.c                         | 214 ++----
 drivers/leds/leds-pca9532.c                        |  11 +-
 drivers/leds/leds-pca955x.c                        |  28 +-
 drivers/leds/leds-pca995x.c                        |   2 +-
 drivers/leds/leds-tca6507.c                        |  11 +-
 drivers/leds/leds-turris-omnia.c                   |   4 +-
 drivers/leds/rgb/leds-mt6370-rgb.c                 |  16 +-
 drivers/leds/rgb/leds-ncp5623.c                    |   5 +-
 drivers/leds/rgb/leds-pwm-multicolor.c             |   7 +-
 drivers/usb/typec/tcpm/tcpm.c                      |   6 +-
 include/linux/led-class-flash.h                    |  16 +
 include/linux/property.h                           |   7 +-
 30 files changed, 1290 insertions(+), 260 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tps61310.yaml
 create mode 100644 drivers/leds/.kunitconfig
 create mode 100644 drivers/leds/flash/leds-tps6131x.c
 create mode 100644 drivers/leds/led-test.c
 
-- 
Lee Jones [李琼斯]
