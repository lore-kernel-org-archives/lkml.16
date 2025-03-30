Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E6524F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743359388; cv=none; b=YlLZJSuTkhm4yC+Efga0zvDzssuBrrkmrR6e66fJRne+kSL3LjIbasyzboOlUPa2B3xprz3Frv+TsKORICdBLAINpmEbTwraTGc+hr9xku7hKsXGHHAUfNFp3YtQb7catbA5oTY+ZvGYC0mVB89A888mzoX7Fli2EPiLtZO+k68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743359388; c=relaxed/simple;
	bh=GQGY9QHYYe/4F5EdH4h4vXDwOAoEHwg3C0pxbA4S2yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3Pd+L0dxSLJRdTSUrJNkFaHRpefP4e4iLCbgMQo+Krm21T9Kbi7WOIKd1ZHf306aI06lrWPhPWCwx1ZBrfwsMvahf0KiJY4HGkp0jCxVeFe9iA1HcD4G8UNUHbwqxdgT7I6nvKunN08HdlK7+G1k00daew8leE58vskXIE5DD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XN84fJ6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XN84fJ6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D888C4CEDD;
	Sun, 30 Mar 2025 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743359388;
	bh=GQGY9QHYYe/4F5EdH4h4vXDwOAoEHwg3C0pxbA4S2yI=;
	h=Date:From:To:Cc:Subject:From;
	b=XN84fJ6s1YtBW8LDbkt5JA881iALu10RPDL1+YmunkD+9l3ynUdQFRiNdU67zlOYe
	 cDjhZ6+Js6KLSYGmIERXizAEN0Ci1xAQlsu81LF+hmQZpVJho56brk6c83rsNXsP4j
	 lQPku29nMZ53QZGtYYHouA/BPAwWHXkDRJ9lYr2o=
Date: Sun, 30 Mar 2025 20:29:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver updates for 6.15-rc1
Message-ID: <Z-mNmFjLhY50cM6S@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc1

for you to fetch changes up to 5d1a5c4f121f0ec50327e899c9450978505f1560:

  Merge tag 'coresight-next-v6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux into char-misc-next (2025-03-20 06:51:51 -0700)

----------------------------------------------------------------
Char/Misc/IIO driver updates for 6.15-rc1

Here is the big set of char, misc, iio, and other smaller driver
subsystems for 6.15-rc1.  Lots of stuff in here, including:
  - loads of IIO changes and driver updates
  - counter driver updates
  - w1 driver updates
  - faux conversions for some drivers that were abusing the platform bus
    interface
  - coresight driver updates
  - rust miscdevice binding updates based on real-world-use
  - other minor driver updates

All of these have been in linux-next with no reported issues for quite a
while.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alice Ryhl (2):
      rust: miscdevice: change how f_ops vtable is constructed
      samples: rust_misc_device: fix markup in top-level docs

Alisa-Dariana Roman (3):
      dt-bindings: iio: adc: add AD7191
      iio: adc: ad7191: add AD7191
      docs: iio: add AD7191

Andy Shevchenko (4):
      iio: light: adux1020: Drop unneeded assignment for cache_type
      iio: magnetometer: af8133j: Drop unneeded assignment for cache_type
      iio: pressure: zpa2326: Drop unneeded assignment for cache_type
      virtio_console: Get rid of unneeded temporary variable

Angelo Dureghello (13):
      iio: dac: adi-axi-dac: modify stream enable
      iio: dac: adi-axi-dac: add bus mode setup
      iio: dac: ad3552r-hs: fix message on wrong chip id
      iio: dac: ad3552r-hs: use instruction mode for configuration
      iio: dac: ad3552r: share model data structures
      iio: dac: ad3552r-hs: add ad3541/2r support
      iio: dac: ad3552r-hs: update function name (non functional)
      iio: adc: adi-axi-adc: add struct axi_adc_info
      iio: adc: adi-axi-adc: add platform children support
      iio: adc: ad7606: protect register access
      iio: dac: adi-axi-dac: add io_mode check
      iio: ad7380: add support for SPI offload
      doc: iio: ad7380: describe offload support

Antoni Pokusinski (2):
      dt-bindings: iio: magnetometer: add binding for Si7210
      iio: magnetometer: si7210: add driver for Si7210

Antoniu Miclaus (12):
      dt-bindings: iio: adf4371: add refin mode
      iio: frequency: adf4371: add refin mode
      iio: frequency: adf4371: add ref doubler
      iio: backend: add API for interface get
      iio: backend: add support for data size set
      iio: backend: add API for oversampling
      iio: adc: adi-axi-adc: add interface type
      dt-bindings: iio: adc: add ad485x axi variant
      iio: adc: adi-axi-adc: set data format
      iio: adc: adi-axi-adc: add oversampling
      dt-bindings: iio: adc: add ad4851
      iio: adc: ad4851: add ad485x driver

Arnd Bergmann (1):
      fpga: versal: remove incorrect of_match_ptr annotation

Axel Haslam (1):
      iio: dac: ad5791: Add offload support

Bence Csókás (2):
      counter: microchip-tcb-capture: Add IRQ handling
      counter: microchip-tcb-capture: Add capture extensions for registers RA/RB

Bo Liu (4):
      iio: accel: msa311: convert to use maple tree register cache
      iio: accel: bma400: convert to use maple tree register cache
      iio: accel: bmi088: convert to use maple tree register cache
      iio: accel: kx022a: convert to use maple tree register cache

Chenyuan Yang (1):
      w1: fix NULL pointer dereference in probe

Christophe JAILLET (1):
      coresight: configfs: Constify struct config_item_type

Colin Ian King (1):
      iio: light: Fix spelling mistake "regist" -> "register"

Costa Shulyupin (1):
      scripts/tags.sh: tag SYM_*START*() assembler symbols

Dan Carpenter (3):
      iio: adc: ad4851: Fix signedness bug in ad4851_calibrate()
      iio: adc: ad4030: fix error pointer dereference in probe()
      Coresight: Fix a NULL vs IS_ERR() bug in probe

David Lechner (29):
      iio: adc: ad7173: move fwnode_irq_get_byname() call site
      iio: adc: ad7173: don't make copy of ad_sigma_delta_info struct
      tools/counter: gitignore counter_watch_events
      counter: add direction change event
      tools/counter: add direction change event to watcher
      counter: ti-eqep: add direction support
      spi: add basic support for SPI offloading
      spi: offload: add support for hardware triggers
      dt-bindings: trigger-source: add generic PWM trigger source
      spi: offload-trigger: add PWM trigger driver
      spi: add offload TX/RX streaming APIs
      iio: dac: ad5791: fix storage
      iio: buffer-dmaengine: split requesting DMA channel from allocating buffer
      iio: buffer-dmaengine: add devm_iio_dmaengine_buffer_setup_with_handle()
      iio: adc: ad7944: don't use storagebits for sizing
      iio: adc: ad7944: add support for SPI offload
      doc: iio: ad7944: describe offload support
      dt-bindings: iio: adc: adi,ad4695: add SPI offload properties
      iio: adc: ad4695: Add support for SPI offload
      doc: iio: ad4695: add SPI offload support
      iio: dac: ad5791: sort include directives
      gpiolib: add gpiod_multi_set_value_cansleep()
      iio: adc: ad7606: use gpiod_multi_set_value_cansleep
      iio: amplifiers: hmc425a: use gpiod_multi_set_value_cansleep
      iio: resolver: ad2s1210: use gpiod_multi_set_value_cansleep
      iio: resolver: ad2s1210: use bitmap_write
      iio: adc: ad4695: fix out of bounds array access
      iio: adc: ad4695: simplify getting oversampling_ratio
      MAINTAINERS: remove adi,ad7606.yaml from SEPS525

Dr. David Alan Gilbert (2):
      bus: mhi: host: Remove unused functions
      mei: Remove unused functions

Eddie James (1):
      eeprom: ee1004: Check chip before probing

Esteban Blanc (6):
      dt-bindings: iio: adc: add ADI ad4030, ad4630 and ad4632
      iio: adc: ad4030: add driver for ad4030-24
      iio: adc: ad4030: add averaging support
      iio: adc: ad4030: add support for ad4630-24 and ad4630-16
      iio: adc: ad4030: add support for ad4632-16 and ad4632-24
      docs: iio: ad4030: add documentation

Fabio Estevam (1):
      iio: adc: ti-ads124s08: Switch to fsleep()

Folker Schwesinger (1):
      iio: buffer-dma: Fix docstrings

Frank Li (1):
      dt-bindings: iio: adc: Add i.MX94 and i.MX95 support

Greg Kroah-Hartman (10):
      Merge 6.14-rc6 into char-misc-next
      Merge tag 'counter-updates-for-6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter into char-misc-next
      Merge tag 'iio-for-6.15a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-next
      Merge tag 'mhi-for-v6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next
      Merge tag 'fpga-for-6.15-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/fpga/linux-fpga into char-misc-next
      regulator: dummy: convert to use the faux device interface
      tlclk: convert to use faux_device
      misc: lis3lv02d: convert to use faux_device
      Merge tag 'w1-drv-6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1 into char-misc-next
      Merge tag 'coresight-next-v6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux into char-misc-next

Guillaume Ranquet (2):
      iio: introduce the FAULT event type
      iio: adc: ad7173: add openwire detection support for single conversions

Guillaume Stols (6):
      dt-bindings: iio: dac: adi-axi-adc: add ad7606 variant
      iio: adc: ad7606: move the software mode configuration
      iio: adc: ad7606: move software functions into common file
      iio: adc: adi-axi-adc: add support for AD7606 register writing
      iio: adc: ad7606: change channel macros parameters
      iio: adc: ad7606: add support for writing registers when using backend

Gustavo Silva (4):
      iio: imu: bmi270: add temperature channel
      iio: imu: bmi270: move private struct declaration to source file
      iio: imu: bmi270: rename variable bmi270_device to data
      iio: imu: bmi270: add support for data ready interrupt trigger

Gwendal Grignou (1):
      iio: cros_ec: Trace EC sensors command

Huisong Li (1):
      w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code

Ilkka Koskinen (1):
      coresight: catu: Fix number of pages while using 64k pages

James Clark (2):
      Coresight: Use coresight_etm_get_trace_id() in traceid_show()
      coresight: docs: Remove target sink from examples

Javier Carrasco (4):
      iio: light: veml6030: extend regmap to support regfields
      iio: light: veml6030: extend regmap to support caching
      iio: gts-helper: export iio_gts_get_total_gain()
      iio: light: veml6030: fix scale to conform to ABI

Jeffrey Hugo (1):
      bus: mhi: host: Fix race between unprepare and queue_buf

Jie Gan (9):
      Coresight: Add support for new APB clock name
      Coresight: Add trace_id function to retrieving the trace ID
      Coresight: Introduce a new struct coresight_path
      Coresight: Allocate trace ID after building the path
      Coresight: Change to read the trace ID from coresight_path
      Coresight: Change functions to accept the coresight_path
      dt-bindings: arm: Add Coresight TMC Control Unit hardware
      Coresight: Add Coresight TMC Control Unit driver
      coresight: add verification process for coresight_etm_get_trace_id

Jonas Karlman (2):
      dt-bindings: iio: adc: Add rockchip,rk3528-saradc variant
      iio: adc: rockchip_saradc: Add support for RK3528

Jonathan Cameron (59):
      Merge tag 'spi-offload' into togreg
      iio: core: Rework claim and release of direct mode to work with sparse.
      iio: chemical: scd30: Use guard(mutex) to allow early returns
      iio: chemical: scd30: Switch to sparse friendly claim/release_direct()
      iio: temperature: tmp006: Stop using iio_device_claim_direct_scoped()
      iio: proximity: sx9310: Stop using iio_device_claim_direct_scoped()
      iio: proximity: sx9324: Stop using iio_device_claim_direct_scoped()
      iio: proximity: sx9360: Stop using iio_device_claim_direct_scoped()
      iio: accel: adxl367: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad4000: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad4130: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad4695: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad7606: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad7625: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad7779: Stop using iio_device_claim_direct_scoped()
      iio: adc: ad9467: Stop using iio_device_claim_direct_scoped()
      iio: adc: max1363: Stop using iio_device_claim_direct_scoped()
      iio: adc: rtq6056: Stop using iio_device_claim_direct_scoped()
      iio: adc: ti-adc161s626: Stop using iio_device_claim_direct_scoped()
      iio: adc: ti-ads1119: Stop using iio_device_claim_direct_scoped()
      iio: addac: ad74413r: Stop using iio_device_claim_direct_scoped()
      iio: chemical: ens160: Stop using iio_device_claim_direct_scoped()
      iio: dac: ad3552r-hs: Stop using iio_device_claim_direct_scoped()
      iio: dac: ad8460: Stop using iio_device_claim_direct_scoped()
      iio: dummy: Stop using iio_device_claim_direct_scoped()
      iio: imu: bmi323: Stop using iio_device_claim_direct_scoped()
      iio: light: bh1745: Stop using iio_device_claim_direct_scoped()
      iio: Drop iio_device_claim_direct_scoped() and related infrastructure
      Merge tag 'gpio-set-array-helper-v6.15-rc1' into togreg
      iio: accel: mma8452: Ensure error return on failure to matching oversampling ratio
      iio: accel: mma8452: Factor out guts of write_raw() to simplify locking
      iio: accel: mma8452: Switch to sparse friendly iio_device_claim/release_direct()
      iio: accel: kx022a: Factor out guts of write_raw() to allow direct returns
      iio: accel: kx022a: Switch to sparse friendly iio_device_claim/release_direct()
      iio: accel: msa311: Fix failure to release runtime pm if direct mode claim fails.
      iio: accel: msa311: Switch to sparse friendly iio_device_claim/release_direct()
      iio: accel: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: stm32-dfsdm: Factor out core of reading INFO_RAW
      iio: adc: stm32-dfsdm: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad4030: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad7192: Factor out core of ad7192_write_raw() to simplify error handling.
      iio: adc: ad7192: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad7768-1: Move setting of val a bit later to avoid unnecessary return value check
      iio: adc: ad7768-1: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad7606: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad7791: Factor out core of ad7791_write_raw() to simplify error handling
      iio: adc: ad7791: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad7793: Factor out core of ad7793_write_raw() to simplify error handling
      iio: adc: ad7793: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad799x: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ad_sigma_delta: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: at91-sama5d2: Move claim of direct mode up a level and use guard()
      iio: adc: at91-sama5d2: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: max1027: Move claim of direct mode up one level and use guard()
      iio: adc: max1027: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: max11410: Factor out writing of sampling frequency to simplify errro paths.
      iio: adc: max11410: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: Switch to sparse friendly iio_device_claim/release_direct()
      staging: iio: accel: adis16240: Drop driver for this impact sensor

Jonathan Santos (3):
      iio: adc: ad7768-1: set MOSI idle state to prevent accidental reset
      Documentation: ABI: add wideband filter type to sysfs-bus-iio
      iio: adc: ad7768-1: remove unnecessary locking

Julien Stephan (8):
      iio: adc: ad7380: do not use iio_device_claim_direct_scoped anymore
      iio: adc: ad7380: enable regmap cache
      iio: adc: ad7380: do not store osr in private data structure
      iio: adc: ad7380: add alert support
      docs: iio: ad7380: add alert support
      iio: adc: ad7380: add adaq4381-4 support
      dt-bindings: iio: adc: ad7380: add adaq4381-4 compatible parts
      docs: iio: ad7380: add adaq4381-4

Jun Yan (2):
      iio: gyro: bmg160_i2c: add BMI088 to of_match_table
      iio: gyro: bmg160_spi: add of_match_table

Karan Sanghavi (1):
      iio: light: Add check for array bounds in veml6075_read_int_time_ms

Kever Yang (1):
      dt-bindings: iio: adc: Add rockchip,rk3562-saradc string

Krzysztof Kozlowski (7):
      dt-bindings: iio: Correct indentation and style in DTS example
      iio: Use str_enable_disable-like helpers
      coresight: catu: Constify amba_id table
      coresight: tpda: Constify amba_id table
      coresight: tpdm: Constify amba_id table
      dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
      dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'

Kuhanh Murugasen Krishnan (1):
      fpga: altera-cvp: Increase credit timeout

Linu Cherian (8):
      dt-bindings: arm: coresight-tmc: Add "memory-region" property
      coresight: tmc-etr: Add support to use reserved trace memory
      coresight: core: Add provision for panic callbacks
      coresight: tmc: Enable panic sync handling
      coresight: tmc: Add support for reading crash data
      coresight: tmc: Stop trace capture on FlIn
      coresight: config: Add preloaded configuration
      Documentation: coresight: Panic support

Lothar Rubusch (4):
      docs: iio: fix wrong driver name in documentation
      iio: accel: adxl345: reorganize measurement enable
      iio: accel: adxl345: add debug register access
      iio: accel: adxl345: reorganize irq handler

Mao Jinlong (1):
      coresight-tpdm: Add MCMB dataset support

Marcelo Schmitt (4):
      Documentation: ABI: IIO: Add filter_type documentation
      Documentation: ABI: IIO: Re-add sysfs-bus-iio-adc-ad4130
      iio: adc: ad4130: Add filter_type attributes
      Documentation: iio: Add ADC documentation

Masahiro Yamada (1):
      binder: remove unneeded <linux/export.h> inclusion from binder_internal.h

Matti Vaittinen (3):
      iio: gts: Simplify available scale table build
      iio: adc: Include cleanup.h when using guard()
      iio: adc: ti-ads7924 Drop unnecessary function parameters

Mikael Gonella-Bolduc (2):
      dt-bindings: iio: light: Add APDS9160 binding
      iio: light: Add APDS9160 ALS & Proximity sensor driver

Mrinmay Sarkar (1):
      bus: mhi: host: pci_generic: Add support for SA8775P endpoint

Nuno Sá (3):
      iio: backend: make sure to NULL terminate stack buffer
      iio: core: make use of simple_write_to_buffer()
      iio: adc: adi-axi-adc: replace of.h with mod_devicetable.h

Peter Colberg (1):
      fpga: m10bmc-sec: update email address for Peter Colberg

Rob Herring (Arm) (1):
      iio: adc: stm32: Drop unnecessary DT property presence check

Robert Budai (6):
      iio: imu: adis: Add custom ops struct
      iio: imu: adis: Add reset to custom ops
      iio: imu: adis: Add DIAG_STAT register
      dt-bindings: iio: Add adis16550 bindings
      iio: imu: adis16550: add adis16550 support
      docs: iio: add documentation for adis16550 driver

Saalim Quadri (2):
      staging: iio: ad9832: Use devm_regulator_get_enable()
      staging: iio: ad9834: Use devm_regulator_get_enable()

Sergiu Cuciurean (1):
      iio: adc: ad7768-1: Fix conversion result sign

Simon Xue (1):
      iio: adc: rockchip_saradc: add rk3562

Subramanian Mohan (4):
      pps: generators: replace copy of pps-gen info struct with const pointer
      pps: generators: Add PPS Generator TIO Driver
      Documentation: driver-api: pps: Add Intel Timed I/O PPS generator
      ABI: pps: Add ABI documentation for Intel TIO

Svyatoslav Ryhel (2):
      dt-bindings: iio: light: al3010: add al3000a support
      iio: light: Add support for AL3000a illuminance sensor

Tao Zhang (2):
      coresight-tpdm: Add support to select lane
      coresight-tpdm: Add support to enable the lane for MCMB TPDM

Thadeu Lima de Souza Cascardo (1):
      char: misc: improve testing Kconfig description

Thorsten Blum (2):
      virtio: console: Use str_yes_no() helper in port_debugfs_show()
      sonypi: Use str_on_off() helper in sonypi_display_info()

Tobias Sperling (2):
      dt-bindings: iio: adc: Introduce ADS7138
      iio: adc: Add driver for ADS7128 / ADS7138

Trevor Gamblin (5):
      iio: adc: ad7625: drop BSD license tag
      iio: adc: ad4695: make ad4695_exit_conversion_mode() more robust
      iio: adc: ad4695: add custom regmap bus callbacks
      iio: adc: ad4695: add offload-based oversampling support
      doc: iio: ad4695: describe oversampling support

Uwe Kleine-König (13):
      iio: adc: ad7124: Micro-optimize channel disabling
      iio: adc: ad7124: Really disable all channels at probe time
      iio: adc: ad7173: Grab direct mode for calibration
      iio: adc: ad7192: Grab direct mode for calibration
      iio: adc: ad_sigma_delta: Disable channel after calibration
      iio: adc: ad4130: Fix comparison of channel setups
      iio: adc: ad7124: Fix comparison of channel configs
      iio: adc: ad7173: Fix comparison of channel configs
      iio: adc: ad4130: Adapt internal names to match official filter_type ABI
      iio: adc: ad_sigma_delta: Add error checking for ad_sigma_delta_set_channel()
      iio: adc: ad7124: Implement internal calibration at probe time
      iio: adc: ad7124: Implement system calibration
      iio: adc: ad7124: Benefit of dev = indio_dev->dev.parent in ad7124_parse_channel_config()

Vasiliy Doylov (5):
      dt-bindings: iio: accel: mc3230: document mc3510c
      iio: accel: mc3230: add mount matrix support
      iio: accel: mc3230: add OF match table
      iio: accel: mc3230: add multiple devices support
      iio: accel: mc3230: add mc3510c support

Wentao Liang (1):
      greybus: gb-beagleplay: Add error handling for gb_greybus_init

William Breathitt Gray (2):
      counter: Introduce the compare component
      counter: microchip-tcb-capture: Add support for RC Compare

Wolfram Sang (1):
      coresight: etm4x: don't include '<linux/pm_wakeup.h>' directly

Yeoreum Yun (9):
      coresight: change coresight_device lock type to raw_spinlock_t
      coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
      coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
      coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
      coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
      coresight-funnel: change funnel_drvdata spinlock's type to raw_spinlock_t
      coresight-replicator: change replicator_drvdata spinlock's type to raw_spinlock_t
      coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
      coresight/ultrasoc: change smb_drv_data spinlock's type to raw_spinlock_t

Yuanfang Zhang (1):
      coresight-etm4x: add isb() before reading the TRCSTATR

sunliming (1):
      iio: imu: adis: fix uninitialized symbol warning

 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |   15 +
 Documentation/ABI/testing/sysfs-bus-counter        |    9 +
 Documentation/ABI/testing/sysfs-bus-iio            |   12 +-
 Documentation/ABI/testing/sysfs-bus-iio-adc-ad4130 |   20 +
 .../ABI/testing/sysfs-driver-intel-m10-bmc         |    4 +-
 .../testing/sysfs-driver-intel-m10-bmc-sec-update  |   14 +-
 Documentation/ABI/testing/sysfs-pps-gen-tio        |    6 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   26 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |   84 ++
 .../bindings/arm/qcom,coresight-tpda.yaml          |    3 +-
 .../bindings/arm/qcom,coresight-tpdm.yaml          |    3 +-
 .../devicetree/bindings/iio/adc/adi,ad4030.yaml    |  110 ++
 .../devicetree/bindings/iio/adc/adi,ad4695.yaml    |   13 +
 .../devicetree/bindings/iio/adc/adi,ad4851.yaml    |  153 ++
 .../devicetree/bindings/iio/adc/adi,ad7191.yaml    |  149 ++
 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    |    4 +
 .../devicetree/bindings/iio/adc/adi,axi-adc.yaml   |   72 +-
 .../devicetree/bindings/iio/adc/nxp,imx93-adc.yaml |    9 +-
 .../bindings/iio/adc/rockchip-saradc.yaml          |    2 +
 .../devicetree/bindings/iio/adc/ti,ads7138.yaml    |   63 +
 .../devicetree/bindings/iio/dac/adi,ad5380.yaml    |   18 +-
 .../devicetree/bindings/iio/frequency/adf4371.yaml |    5 +-
 .../bindings/iio/humidity/sciosense,ens210.yaml    |   12 +-
 .../devicetree/bindings/iio/imu/adi,adis16550.yaml |   74 +
 .../bindings/iio/light/brcm,apds9160.yaml          |   78 +
 .../bindings/iio/light/dynaimage,al3010.yaml       |    6 +-
 .../bindings/iio/magnetometer/silabs,si7210.yaml   |   48 +
 .../bindings/iio/temperature/maxim,max31865.yaml   |   18 +-
 .../bindings/iio/temperature/ti,tmp117.yaml        |    6 +-
 .../bindings/trigger-source/pwm-trigger.yaml       |   37 +
 .../devicetree/bindings/trivial-devices.yaml       |    2 +
 Documentation/driver-api/pps.rst                   |   27 +-
 Documentation/iio/ad4030.rst                       |  180 +++
 Documentation/iio/ad4695.rst                       |  104 +-
 Documentation/iio/ad7191.rst                       |  119 ++
 Documentation/iio/ad7380.rst                       |   56 +-
 Documentation/iio/ad7944.rst                       |   24 +-
 Documentation/iio/adis16550.rst                    |  376 +++++
 Documentation/iio/adxl380.rst                      |    2 +-
 Documentation/iio/iio_adc.rst                      |  305 ++++
 Documentation/iio/index.rst                        |    4 +
 Documentation/trace/coresight/coresight.rst        |   41 +-
 Documentation/trace/coresight/panic.rst            |  362 +++++
 Documentation/userspace-api/perf_ring_buffer.rst   |    4 +-
 MAINTAINERS                                        |   55 +-
 drivers/android/binder_internal.h                  |    1 -
 drivers/bus/mhi/host/main.c                        |   35 +-
 drivers/bus/mhi/host/pci_generic.c                 |   34 +
 drivers/bus/mhi/host/pm.c                          |   14 -
 drivers/char/sonypi.c                              |   11 +-
 drivers/char/tlclk.c                               |   32 +-
 drivers/char/virtio_console.c                      |    9 +-
 drivers/counter/microchip-tcb-capture.c            |  160 ++
 drivers/counter/ti-eqep.c                          |   32 +
 drivers/fpga/altera-cvp.c                          |    2 +-
 drivers/fpga/versal-fpga.c                         |    2 +-
 drivers/greybus/gb-beagleplay.c                    |    4 +-
 drivers/hwtracing/coresight/Kconfig                |   12 +
 drivers/hwtracing/coresight/Makefile               |    4 +-
 drivers/hwtracing/coresight/coresight-catu.c       |    4 +-
 .../hwtracing/coresight/coresight-cfg-preload.c    |    2 +
 .../hwtracing/coresight/coresight-cfg-preload.h    |    2 +
 drivers/hwtracing/coresight/coresight-cfg-pstop.c  |   83 +
 drivers/hwtracing/coresight/coresight-config.c     |    8 +-
 drivers/hwtracing/coresight/coresight-config.h     |    2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  192 ++-
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  326 ++++
 drivers/hwtracing/coresight/coresight-ctcu.h       |   39 +
 drivers/hwtracing/coresight/coresight-cti-core.c   |   44 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |   76 +-
 drivers/hwtracing/coresight/coresight-cti.h        |    2 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   15 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   26 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   27 +-
 drivers/hwtracing/coresight/coresight-etm-perf.h   |    2 +-
 drivers/hwtracing/coresight/coresight-etm.h        |    1 -
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   55 +-
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |    3 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  122 +-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  254 ++--
 drivers/hwtracing/coresight/coresight-etm4x.h      |    3 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   12 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   14 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   12 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   13 +-
 .../coresight/coresight-syscfg-configfs.c          |   12 +-
 drivers/hwtracing/coresight/coresight-syscfg.c     |   26 +-
 drivers/hwtracing/coresight/coresight-sysfs.c      |   17 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  327 +++-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |  140 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  224 ++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  106 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   20 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  124 +-
 drivers/hwtracing/coresight/coresight-tpdm.h       |   33 +-
 drivers/hwtracing/coresight/coresight-trace-id.c   |   22 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   12 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h         |    2 +-
 drivers/iio/accel/adxl345.h                        |    1 -
 drivers/iio/accel/adxl345_core.c                   |   78 +-
 drivers/iio/accel/adxl367.c                        |  194 +--
 drivers/iio/accel/adxl372.c                        |    7 +-
 drivers/iio/accel/adxl380.c                        |    7 +-
 drivers/iio/accel/bma180.c                         |    7 +-
 drivers/iio/accel/bma400_core.c                    |    2 +-
 drivers/iio/accel/bmi088-accel-core.c              |    9 +-
 drivers/iio/accel/fxls8962af-core.c                |   21 +-
 drivers/iio/accel/kionix-kx022a.c                  |  122 +-
 drivers/iio/accel/mc3230.c                         |   95 +-
 drivers/iio/accel/mma8452.c                        |   92 +-
 drivers/iio/accel/msa311.c                         |   34 +-
 drivers/iio/adc/Kconfig                            |   56 +-
 drivers/iio/adc/Makefile                           |    4 +
 drivers/iio/adc/ad4000.c                           |   64 +-
 drivers/iio/adc/ad4030.c                           | 1230 +++++++++++++++
 drivers/iio/adc/ad4130.c                           |  139 +-
 drivers/iio/adc/ad4695.c                           | 1100 ++++++++++++--
 drivers/iio/adc/ad4851.c                           | 1315 ++++++++++++++++
 drivers/iio/adc/ad7091r-base.c                     |    1 +
 drivers/iio/adc/ad7124.c                           |  343 ++++-
 drivers/iio/adc/ad7173.c                           |  707 ++++++---
 drivers/iio/adc/ad7191.c                           |  554 +++++++
 drivers/iio/adc/ad7192.c                           |  148 +-
 drivers/iio/adc/ad7266.c                           |    7 +-
 drivers/iio/adc/ad7298.c                           |    7 +-
 drivers/iio/adc/ad7380.c                           |  943 ++++++++++--
 drivers/iio/adc/ad7476.c                           |    7 +-
 drivers/iio/adc/ad7606.c                           |  174 ++-
 drivers/iio/adc/ad7606.h                           |  103 +-
 drivers/iio/adc/ad7606_bus_iface.h                 |   16 +
 drivers/iio/adc/ad7606_par.c                       |   52 +-
 drivers/iio/adc/ad7606_spi.c                       |  137 +-
 drivers/iio/adc/ad7625.c                           |   13 +-
 drivers/iio/adc/ad7768-1.c                         |   47 +-
 drivers/iio/adc/ad7779.c                           |  103 +-
 drivers/iio/adc/ad7791.c                           |   31 +-
 drivers/iio/adc/ad7793.c                           |   76 +-
 drivers/iio/adc/ad7887.c                           |    7 +-
 drivers/iio/adc/ad7923.c                           |    7 +-
 drivers/iio/adc/ad7944.c                           |  316 +++-
 drivers/iio/adc/ad799x.c                           |   14 +-
 drivers/iio/adc/ad9467.c                           |   23 +-
 drivers/iio/adc/ad_sigma_delta.c                   |   24 +-
 drivers/iio/adc/adi-axi-adc.c                      |  305 +++-
 drivers/iio/adc/at91-sama5d2_adc.c                 |   54 +-
 drivers/iio/adc/dln2-adc.c                         |    7 +-
 drivers/iio/adc/max1027.c                          |   37 +-
 drivers/iio/adc/max11410.c                         |   72 +-
 drivers/iio/adc/max1363.c                          |  163 +-
 drivers/iio/adc/max34408.c                         |    1 +
 drivers/iio/adc/pac1921.c                          |    1 +
 drivers/iio/adc/rockchip_saradc.c                  |   42 +-
 drivers/iio/adc/rtq6056.c                          |   46 +-
 drivers/iio/adc/stm32-adc-core.c                   |    6 +-
 drivers/iio/adc/stm32-adc.c                        |    7 +-
 drivers/iio/adc/stm32-dfsdm-adc.c                  |   76 +-
 drivers/iio/adc/ti-adc084s021.c                    |    9 +-
 drivers/iio/adc/ti-adc108s102.c                    |    7 +-
 drivers/iio/adc/ti-adc161s626.c                    |   14 +-
 drivers/iio/adc/ti-ads1119.c                       |   17 +-
 drivers/iio/adc/ti-ads124s08.c                     |    2 +-
 drivers/iio/adc/ti-ads1298.c                       |    7 +-
 drivers/iio/adc/ti-ads131e08.c                     |   14 +-
 drivers/iio/adc/ti-ads7138.c                       |  749 +++++++++
 drivers/iio/adc/ti-ads7924.c                       |    7 +-
 drivers/iio/adc/ti-tlc4541.c                       |    7 +-
 drivers/iio/addac/ad74413r.c                       |   14 +-
 drivers/iio/amplifiers/hmc425a.c                   |    3 +-
 drivers/iio/buffer/industrialio-buffer-dma.c       |    4 +-
 drivers/iio/buffer/industrialio-buffer-dmaengine.c |  150 +-
 drivers/iio/chemical/ens160_core.c                 |   36 +-
 drivers/iio/chemical/scd30_core.c                  |   70 +-
 drivers/iio/common/cros_ec_sensors/Makefile        |    3 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |    9 +-
 .../common/cros_ec_sensors/cros_ec_sensors_trace.c |   32 +
 .../common/cros_ec_sensors/cros_ec_sensors_trace.h |   56 +
 drivers/iio/dac/Kconfig                            |    3 +
 drivers/iio/dac/ad3552r-common.c                   |   50 +-
 drivers/iio/dac/ad3552r-hs.c                       |  333 +++-
 drivers/iio/dac/ad3552r-hs.h                       |    8 +
 drivers/iio/dac/ad3552r.c                          |   36 -
 drivers/iio/dac/ad3552r.h                          |    9 +-
 drivers/iio/dac/ad5791.c                           |  187 ++-
 drivers/iio/dac/ad8460.c                           |   18 +-
 drivers/iio/dac/adi-axi-dac.c                      |   35 +-
 drivers/iio/dummy/iio_simple_dummy.c               |  119 +-
 drivers/iio/frequency/adf4371.c                    |   45 +-
 drivers/iio/gyro/bmg160_i2c.c                      |    1 +
 drivers/iio/gyro/bmg160_spi.c                      |   10 +
 drivers/iio/humidity/dht11.c                       |    3 +-
 drivers/iio/imu/Kconfig                            |   13 +
 drivers/iio/imu/Makefile                           |    1 +
 drivers/iio/imu/adis.c                             |   35 +-
 drivers/iio/imu/adis16550.c                        | 1147 ++++++++++++++
 drivers/iio/imu/bmi270/bmi270.h                    |   17 +-
 drivers/iio/imu/bmi270/bmi270_core.c               |  374 ++++-
 drivers/iio/imu/bmi323/bmi323_core.c               |   44 +-
 drivers/iio/industrialio-backend.c                 |   64 +-
 drivers/iio/industrialio-core.c                    |    9 +-
 drivers/iio/industrialio-event.c                   |    2 +
 drivers/iio/industrialio-gts-helper.c              |  293 ++--
 drivers/iio/light/Kconfig                          |   22 +
 drivers/iio/light/Makefile                         |    2 +
 drivers/iio/light/adux1020.c                       |    1 -
 drivers/iio/light/al3000a.c                        |  209 +++
 drivers/iio/light/apds9160.c                       | 1594 ++++++++++++++++++++
 drivers/iio/light/bh1745.c                         |   18 +-
 drivers/iio/light/cm32181.c                        |    2 +-
 drivers/iio/light/cm36651.c                        |    2 +-
 drivers/iio/light/veml6030.c                       |  618 ++++----
 drivers/iio/light/veml6075.c                       |    8 +-
 drivers/iio/magnetometer/Kconfig                   |   11 +
 drivers/iio/magnetometer/Makefile                  |    2 +
 drivers/iio/magnetometer/af8133j.c                 |    1 -
 drivers/iio/magnetometer/si7210.c                  |  446 ++++++
 drivers/iio/pressure/zpa2326_i2c.c                 |    1 -
 drivers/iio/pressure/zpa2326_spi.c                 |    1 -
 drivers/iio/proximity/irsd200.c                    |    3 +-
 drivers/iio/proximity/sx9310.c                     |   19 +-
 drivers/iio/proximity/sx9324.c                     |   19 +-
 drivers/iio/proximity/sx9360.c                     |   19 +-
 drivers/iio/resolver/ad2s1210.c                    |   17 +-
 drivers/iio/temperature/tmp006.c                   |   33 +-
 drivers/misc/eeprom/ee1004.c                       |    4 +
 drivers/misc/lis3lv02d/lis3lv02d.c                 |   26 +-
 drivers/misc/lis3lv02d/lis3lv02d.h                 |    4 +-
 drivers/misc/mei/bus.c                             |   52 -
 drivers/misc/mei/client.c                          |   22 -
 drivers/misc/mei/client.h                          |    2 -
 drivers/misc/mei/hw-txe.c                          |   45 -
 drivers/misc/mei/hw-txe.h                          |    2 -
 drivers/pps/generators/Kconfig                     |   16 +
 drivers/pps/generators/Makefile                    |    1 +
 drivers/pps/generators/pps_gen-dummy.c             |    2 +-
 drivers/pps/generators/pps_gen.c                   |   14 +-
 drivers/pps/generators/pps_gen_tio.c               |  272 ++++
 drivers/pps/generators/sysfs.c                     |    6 +-
 drivers/regulator/dummy.c                          |   37 +-
 drivers/spi/Kconfig                                |   15 +
 drivers/spi/Makefile                               |    4 +
 drivers/spi/spi-offload-trigger-pwm.c              |  162 ++
 drivers/spi/spi-offload.c                          |  465 ++++++
 drivers/spi/spi.c                                  |   10 +
 drivers/staging/iio/accel/Kconfig                  |   12 -
 drivers/staging/iio/accel/Makefile                 |    1 -
 drivers/staging/iio/accel/adis16240.c              |  443 ------
 drivers/staging/iio/frequency/ad9832.c             |   37 +-
 drivers/staging/iio/frequency/ad9834.c             |   22 +-
 drivers/w1/masters/w1-uart.c                       |    4 +-
 drivers/w1/slaves/w1_therm.c                       |   12 +-
 include/dt-bindings/iio/adc/adi,ad4695.h           |    7 +
 include/linux/coresight.h                          |   47 +-
 include/linux/counter.h                            |    3 +
 include/linux/gpio/consumer.h                      |   11 +
 include/linux/iio/adc/ad_sigma_delta.h             |    4 +-
 include/linux/iio/backend.h                        |   19 +
 include/linux/iio/buffer-dmaengine.h               |    7 +-
 include/linux/iio/iio-gts-helper.h                 |    1 +
 include/linux/iio/iio.h                            |   41 +-
 include/linux/iio/imu/adis.h                       |   34 +-
 include/linux/mei_cl_bus.h                         |    5 -
 include/linux/mhi.h                                |   18 -
 include/linux/pps_gen_kernel.h                     |    4 +-
 include/linux/spi/offload/consumer.h               |   39 +
 include/linux/spi/offload/provider.h               |   47 +
 include/linux/spi/offload/types.h                  |   99 ++
 include/linux/spi/spi.h                            |   20 +
 include/uapi/linux/counter.h                       |    2 +
 include/uapi/linux/counter/microchip-tcb-capture.h |   40 +
 include/uapi/linux/iio/types.h                     |    2 +
 lib/Kconfig.debug                                  |   15 +-
 rust/kernel/miscdevice.rs                          |  303 ++--
 samples/rust/rust_misc_device.rs                   |  181 +--
 scripts/tags.sh                                    |    1 +
 tools/counter/.gitignore                           |    1 +
 tools/counter/counter_watch_events.c               |    5 +
 tools/iio/iio_event_monitor.c                      |    4 +
 277 files changed, 20294 insertions(+), 4216 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-ad4130
 create mode 100644 Documentation/ABI/testing/sysfs-pps-gen-tio
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad4851.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7191.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,ads7138.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/silabs,si7210.yaml
 create mode 100644 Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
 create mode 100644 Documentation/iio/ad4030.rst
 create mode 100644 Documentation/iio/ad7191.rst
 create mode 100644 Documentation/iio/adis16550.rst
 create mode 100644 Documentation/iio/iio_adc.rst
 create mode 100644 Documentation/trace/coresight/panic.rst
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pstop.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-core.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
 create mode 100644 drivers/iio/adc/ad4030.c
 create mode 100644 drivers/iio/adc/ad4851.c
 create mode 100644 drivers/iio/adc/ad7191.c
 create mode 100644 drivers/iio/adc/ad7606_bus_iface.h
 create mode 100644 drivers/iio/adc/ti-ads7138.c
 create mode 100644 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_trace.c
 create mode 100644 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_trace.h
 create mode 100644 drivers/iio/imu/adis16550.c
 create mode 100644 drivers/iio/light/al3000a.c
 create mode 100644 drivers/iio/light/apds9160.c
 create mode 100644 drivers/iio/magnetometer/si7210.c
 create mode 100644 drivers/pps/generators/pps_gen_tio.c
 create mode 100644 drivers/spi/spi-offload-trigger-pwm.c
 create mode 100644 drivers/spi/spi-offload.c
 delete mode 100644 drivers/staging/iio/accel/adis16240.c
 create mode 100644 include/linux/spi/offload/consumer.h
 create mode 100644 include/linux/spi/offload/provider.h
 create mode 100644 include/linux/spi/offload/types.h
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h
