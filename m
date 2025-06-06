Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22DD1E47B3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199112; cv=none; b=rSC1jue3gdtDwVwHEPEsjPqYtF+tL/5XXYTobjVwtQUjNTDXZFiG5tOMLGjZcbPbpEVtqMxOKAYNy2D3pmGydPPlmVId5VUc6x95Xk0VICCc2sciQ0oE88BUEauoV9WRit5ifxn7Bnj8CZxu0dM03+WZAem+274NqVq1nd81lQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199112; c=relaxed/simple;
	bh=sRzCi4vlmt9grEy9XjKyFZ5NjUYt6c9L8nHJ68yMFp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvKj/TedFqdJpe/WIbaF7Va/nEjYjjXWIcRUx5oy37+sE7tYSBX7Mt9Gp65HlXsw4oU0BgvhemIqLWIje5lWs2aZNIfDsTp/FodDMcJWxmBzyeApgkuR6RAw2Nr82A67h1WCFjqesPLuHeWOAcaS2Eel0mLqkfPLpj+twdIhTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E5Enp/Gi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E5Enp/Gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8269C4CEEB;
	Fri,  6 Jun 2025 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749199111;
	bh=sRzCi4vlmt9grEy9XjKyFZ5NjUYt6c9L8nHJ68yMFp4=;
	h=Date:From:To:Cc:Subject:From;
	b=E5Enp/GiHsPSVABysWjC/RM6WC0Rr3SPLvh6oziI7MpchS8hwIq0cE4uusVYOb3EZ
	 E1jsmaTEz/szMqzbhw10rkgEjdT8kVKjItL08/fGuagVEBGcsfQS+KU9YvXn/1mjpr
	 K5Kydj68dSZ9JfYKEgVgcczWtZxUX5xLiPfLMIUo=
Date: Fri, 6 Jun 2025 10:38:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver changes for 6.16-rc1
Message-ID: <aEKpBDC2WB4HgaJ6@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.16-rc1

for you to fetch changes up to 9857af0fcff385c75433f2162c30c62eb912ef6d:

  binder: fix yet another UAF in binder_devices (2025-05-25 11:25:07 +0200)

----------------------------------------------------------------
Char/Misc/IIO pull request for 6.16-rc1

Here is the big char/misc/iio and other small driver subsystem pull
request for 6.16-rc1.

Overall, a lot of individual changes, but nothing major, just the normal
constant forward progress of new device support and cleanups to existing
subsystems.  Highlights in here are:
  - Large IIO driver updates and additions and device tree changes
  - Android binder bugfixes and logfile fixes
  - mhi driver updates
  - comedi driver updates
  - counter driver updates and additions
  - coresight driver updates and additions
  - echo driver removal as there are no in-kernel users of it
  - nvmem driver updates
  - spmi driver updates
  - new amd-sbi driver "subsystem" and drivers added
  - rust miscdriver binding documentation fix
  - other small driver fixes and updates (uio, w1, acrn, hpet, xillybus,
    cardreader drivers, fastrpc and others.)

All of these have been in linux-next for quite a while with no reported
problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Ahelenia Ziemiańska (1):
      iio: ssp_sensors: optimalize -> optimize

Akshay Gupta (10):
      hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc
      misc: amd-sbi: Move protocol functionality to core file
      misc: amd-sbi: Move hwmon device sensor as separate entity
      misc: amd-sbi: Use regmap subsystem
      misc: amd-sbi: Optimize the wait condition for mailbox command completion
      misc: amd-sbi: Add support for AMD_SBI IOCTL
      misc: amd-sbi: Add support for CPUID protocol
      misc: amd-sbi: Add support for read MCA register protocol
      misc: amd-sbi: Add support for register xfer
      misc: amd-sbi: Add document for AMD SB IOCTL description

Alexander Sverdlin (2):
      counter: interrupt-cnt: Convert atomic_t -> atomic_long_t
      counter: interrupt-cnt: Protect enable/disable OPs with mutex

Anandu Krishnan E (1):
      misc: fastrpc: Add meaningful labels for exit paths

Andrew Davis (1):
      mux: mmio: Do not use syscon helper to build regmap

Andy Shevchenko (2):
      iio: amplifiers: hmc425a: Remove not fully correct comment
      coresight: cti: Replace inclusion by struct fwnode_handle forward declaration

Angelo Dureghello (11):
      iio: dac: ad3552r-hs: add debugfs reg access
      dt-bindings: iio: adc: adi,ad7606: add SPI offload properties
      doc: iio: ad7606: describe offload support
      iio: adc: ad7606: add SPI offload support
      iio: dac: adi-axi-dac: add cntrl chan check
      docs: iio: add documentation for ad3552r driver
      iio: backend: add support for data source get
      iio: dac: adi-axi-dac: add data source get
      iio: dac: ad3552r-hs: add support for internal ramp
      iio: dac: adi-axi-dac: fix bus read
      docs: iio: ad3552r: fix malformed table

AngeloGioacchino Del Regno (1):
      dt-bindings: iio: adc: Add compatible for Dimensity 1200 MT6893

Antoniu Miclaus (4):
      iio: adc: ad4851: fix ad4858 chan pointer handling
      dt-bindings: iio: dac: ad7293: add vrefin support
      iio: dac: ad7293: add adc reference configuration
      MAINTAINERS: add maintainers for ad4851 driver

Arnd Bergmann (4):
      apm-emulation: hide an unused variable
      comedi: ni_atmio: avoid warning for unused device_ids[] table
      mux: adg792a: remove incorrect of_match_ptr annotation
      nvmem: rmem: select CONFIG_CRC32

Arthur Pilone (1):
      iio: adc: ad7091r-base: Remove duplicate code on volatile reg check

Arthur-Prince (1):
      iio: adc: ti-ads1298: Kconfig: add kfifo dependency to fix module build

Bartosz Golaszewski (8):
      misc: microchip: pci1xxxx: use new GPIO line value setter callbacks
      iio: dac: ad5592r: destroy mutexes in detach paths
      iio: dac: ad5592r: use lock guards
      iio: dac: ad5592r: use new GPIO line value setter callbacks
      iio: adc: ti-ads7950: use new GPIO line value setter callbacks
      iio: adc: ad4130: use new GPIO line value setter callbacks
      iio: addac: ad74413r: use new GPIO line value setter callbacks
      iio: addac: ad74115: use new GPIO line value setter callbacks

Beatriz Viana Costa (1):
      iio: light: zopt2201: Remove code duplication in scale write functions

Brian Pellegrino (1):
      iio: filter: admv8818: Support frequencies >= 2^32

Carlos Llamas (1):
      binder: fix yet another UAF in binder_devices

Chelsy Ratnawat (2):
      HID: sensor-hub: Fix typo and improve documentation for sensor_hub_remove_callback()
      HID: sensor-hub: Fix typo and improve documentation

Chen Ni (2):
      char: xillybus: Use to_delayed_work()
      hpet: Remove unnecessary NULL check before unregister_sysctl_table()

Chenyuan Yang (1):
      misc: tps6594-pfsm: Add NULL pointer check in tps6594_pfsm_probe()

Christian Schrefl (1):
      rust: miscdevice: fix typo in MiscDevice::ioctl documentation

Colin Ian King (1):
      iio: admv1013: replace redundant ternary operator with just len

Dan Carpenter (3):
      rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
      iio: dac: ad5592r: Delete stray unlock in ad5592r_write_raw()
      iio: chemical: mhz19b: Fix error code in probe()

Daniele Palmas (1):
      bus: mhi: host: pci_generic: Add Telit FN920C04 modem support

David Heidelberg (13):
      iio: light: al3010: Use unsigned int for the indexing
      iio: light: al3320a: Use unsigned int for the indexing
      iio: light: al3010: Remove DRV_NAME definition
      iio: light: al3320a: Remove DRV_NAME definition
      iio: light: al3010: Abstract device reference in the probe function
      iio: light: al3320a: Abstract device reference in the probe function
      iio: light: al3010: Split set_pwr function into set_pwr_on and _off
      iio: light: al3320a: Split set_pwr function into set_pwr_on and _off
      iio: light: al3010: Improve al3010_init error handling with dev_err_probe()
      iio: light: al3000a: Fix an error handling path in al3000a_probe()
      iio: light: al3320a: Fix an error handling path in al3320a_probe()
      iio: light: al3010: Implement regmap support
      iio: light: al3320a: Implement regmap support

David Lechner (55):
      iio: adc: ad4030: check scan_type for error
      iio: adc: ad4030: remove some duplicate code
      iio: adc: ad4030: move setting mode to update_scan_mode
      iio: adc: ad4030: don't store scan_type in state
      iio: adc: ad4030: explain rearranging raw sample data
      iio: adc: ad7606_spi: check error in ad7606B_sw_mode_config()
      iio: adc: ad7606: add missing max sample rates
      iio: adc: ad7606: use devm_mutex_init()
      iio: adc: ad7606: fix kernel-doc comments
      iio: adc: ad7606: use kernel identifier name style
      iio: adc: ad7606: don't use address field
      iio: adc: ad7606: drop ch param from ad7606_scale_setup_cb_t
      iio: adc: ad7606: dynamically allocate channel info
      iio: adc: ad7606_par: add ad7606c chips
      iio: adc: ad7944: drop bits_per_word hack
      dt-bindings: iio: adc: ad7380: add AD7389-4
      iio: adc: ad7380: rename internal_ref_only
      iio: adc: ad7380: move internal reference voltage to chip_info
      iio: adc: ad7380: add ad7389-4
      Documentation: iio: ad7380: add AD7389-4
      iio: normalize array sentinel style
      iio: adc: ad7173: fix compiling without gpiolib
      iio: adc: ad7606: fix raw read for 18-bit chips
      iio: adc: ad7606_spi: fix reg write value mask
      iio: adc: ad7944: mask high bits on direct read
      iio: adc: mt6360-adc: use aligned_s64 for timestamp
      iio: addac: ad74413r: use aligned_s64 for timestamp
      iio: adc: hx711: use struct with aligned_s64 timestamp
      iio: orientation: hid-sensor-rotation: remove unnecessary alignment
      iio: pressure: bmp280: drop sensor_data array
      iio: adc: ad7606_spi: add offload scan mask check
      iio: adc: ad7606: explicit timestamp alignment
      iio: adc: ad4695: use u16 for buffer elements
      iio: adc: ad4030: remove bits_per_word = 8
      iio: adc: ti-tsc2046: remove bits_per_word = 8
      iio: chemical: bme680_spi: remove bits_per_word = 8
      iio: dac: ad5761: remove bits_per_word = 8
      iio: dac: ad5766: remove bits_per_word = 8
      iio: dac: ad5791: remove bits_per_word = 8
      iio: dac: ltc2688: remove bits_per_word = 8
      iio: gyro: adxrs450: remove bits_per_word = 8
      iio: imu: adis: remove bits_per_word = 8
      iio: magnetometer: hmc5843_spi: remove bits_per_word = 8
      iio: magnetometer: rm3100-spi: remove bits_per_word = 8
      iio: pressure: bmp280-spi: remove bits_per_word = 8
      iio: pressure: ms5611_spi: remove bits_per_word = 8
      iio: pressure: zpa2326_spi: remove bits_per_word = 8
      iio: make IIO_DMA_MINALIGN minimum of 8 bytes
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
      iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS
      iio: bmp280: zero-init buffer

Dharma Balasubiramani (1):
      counter: microchip-tcb-capture: Add watch validation support

Dmitry Antipov (1):
      binder: fix use-after-free in binderfs_evict_inode()

Dmitry Baryshkov (1):
      dt-bindings: arm: arm,coresight-static-replicator: add optional clocks

Dr. David Alan Gilbert (4):
      misc: rtsx: Remove deadcode
      misc: echo: Remove
      MAINTAINERS: Fix XILINX SD-FEC entry
      virt: acrn: Remove unused list 'acrn_irqfd_clients'

Eason Yang (2):
      dt-bindings: iio: adc: add NCT7201 ADCs
      iio: adc: add support for Nuvoton NCT7201

Fabrice Gasnier (1):
      counter: stm32-timer-cnt: add support for stm32mp25

Feng Wei (1):
      staging: iio: adt7316: replace irqd_get_trigger_type with irq_get_trigger_type

Gabriel Shahrouzi (2):
      iio: frequency: ad9832: Remove unused parameter from data documentation
      staging: iio: ad5933: Correct settling cycles encoding per datasheet

Geert Uytterhoeven (1):
      nvmem: Remove unused nvmem cell table support

Georgi Djakov (1):
      Merge branch 'icc-sa8775p' into icc-next

Greg Kroah-Hartman (15):
      Merge 6.15-rc4 into char-misc-next
      Revert "char: misc: make miscdevice unit test built-in only"
      Revert "char: misc: add test cases"
      Merge 6.15-rc6 into char-misc-next
      Merge tag 'counter-fixes-for-6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter into char-misc-next
      Merge tag 'counter-updates-for-6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter into char-misc-next
      Merge tag 'fpga-for-6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/fpga/linux-fpga into char-misc-next
      Merge tag 'mhi-fixes-for-v6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next
      Merge tag 'mhi-for-v6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next
      Merge tag 'mux-drv-6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux into char-misc-next
      Merge tag 'iio-fixes-for-6.15b' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-next
      Merge tag 'iio-for-6.16a-take2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-next
      Merge tag 'coresight-next-v6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux into char-misc-next
      Merge tag 'icc-6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-misc-next
      Merge tag 'counter-updates-for-6.16b' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter into char-misc-next

Gustavo A. R. Silva (4):
      misc: bcm-vk: avoid -Wflex-array-member-not-at-end warning
      iio: proximity: cros_ec_mkbp_proximity: Avoid -Wflex-array-member-not-at-end warning
      iio: cros_ec: Avoid -Wflex-array-member-not-at-end warning
      w1: Avoid -Wflex-array-member-not-at-end warnings

Gustavo Vaz (1):
      iio: accel: kxcjk-1013: Deduplicate setup interrupt functions

Gwendal Grignou (1):
      iio: cros_ec_sensors: Flush when changing the FIFO timeout

Gyeyoung Baek (4):
      dt-bindings: Add Winsen to the vendor prefixes
      dt-bindings: Add device tree support for Winsen MHZ19B CO2 sensor
      iio: chemical: Add support for Winsen MHZ19B CO2 sensor
      MAINTAINERS: Add WINSEN MHZ19B

Hans de Goede (1):
      mei: vsc: Cast tx_buf to (__be32 *) when passed to cpu_to_be32_array()

Hector Martin (1):
      nvmem: Add apple-spmi-nvmem driver

Heikki Huttu (1):
      comedi: drivers: adl_pci9118.c: Edit file so that checkpatch.pl has 0 typo errors

Ian Abbott (4):
      comedi: ni_pcidio: Do not bother filling buffer with 0xaa byte values
      comedi: access buffer data page-by-page
      comedi: remove the mapping of the Comedi buffer in vmalloc address space
      comedi: allocate DMA coherent buffer as individual pages

James Clark (8):
      coresight: Convert tag clear function to take a struct csdev_access
      coresight: Only check bottom two claim bits
      coresight: Add claim tag warnings and debug messages
      coresight: etm3x: Convert raw base pointer to struct coresight access
      coresight: Clear self hosted claim tag on probe
      coresight: Remove inlines from static function definitions
      coresight: Remove extern from function declarations
      coresight: Add a KUnit test for coresight_find_default_sink()

Jean-Baptiste Maneyrol (2):
      dt-bindings: iio: imu: icm42600: add interrupt naming support
      iio: imu: inv_icm42600: switch to use generic name irq get

Jean-Francois Bortolotti (1):
      spmi: add a spmi driver for Apple SoC

Jeff Hugo (1):
      bus: mhi: host: Fix conflict between power_up and SYSERR

Jiri Slaby (SUSE) (2):
      irqdomain: cdx: Switch to of_fwnode_handle()
      irqdomain: spmi: Switch to irq_domain_create_tree()

Jonathan Cameron (79):
      iio: adc: vf610: Move claim of direct mode to caller of vf610_read_sample and use guard(mutex)
      iio: adc: vf610: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ti-ads1100: Use guard(mutex) to allow direct returns
      iio: adc: ti-ads1100: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: ti-ads1015: Use guard(mutex) and factor out code for INFO_RAW
      iio: adc: ti-ads1015: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: mxs-lradc: Switch to sparse friendly iio_device_claim/release_direct()
      iio: adc: rcar: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: apds9306: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: gp2ap020a00f: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: isl29125: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: as73211: Use guard() and move mode switch into inner write_raw fucntion
      iio: light: as73211: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: ltr501: Factor out IIO_INFO_RAW leg of read_raw() callback.
      iio: light: ltr501: Factor out core of write_raw() where direct mode claim is held.
      iio: light: ltr501: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: opt4060: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: rohm-bu27034: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: rpr0521: Factor out handling of IIO_INFO_RAW and use guard()
      iio: light: rpr0521: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: si1145: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: st_uvis25: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: tcs3414: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: tcs3472: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: vcnl4000: Switch to sparse friendly iio_device_claim/release_direct()
      iio: light: vcnl4035: Switch to sparse friendly iio_device_claim/release_direct()
      iio: addac: ad74115: Switch to sparse friendly iio_device_claim/release_direct()
      iio: chemical: ccs811: Factor out handling of read of IIO_INFO_RAW to simplify error paths.
      iio: chemical: ccs811: Switch to sparse friendly iio_device_claim/release_direct()
      iio: chemical: atlas-sensor: Switch to sparse friendly iio_device_claim/release_direct()
      iio: chemical: scd4x: Switch to sparse friendly iio_device_claim/release_direct()
      iio: common: scmi: Switch to sparse friendly iio_device_claim/release_direct()
      iio: common: st_sensors: Switch to sparse friendly iio_device_claim/release_direct()
      iio: gyro: adxrs290: Switch to sparse friendly iio_device_claim/release_direct()
      iio: health: max30102: Switch to sparse friendly iio_device_claim/release_direct()
      iio: humidity: hdc100x: Use guard(mutex) to simplify code flow
      iio: humidity: hdc100x: Switch to sparse friendly iio_device_claim/release_direct()
      iio: humidity: hdc2010: Switch to sparse friendly iio_device_claim/release_direct()
      iio: humidity: hts211: Factor out everything under direct mode claim into helper functions.
      iio: humidity: hts211: Switch to sparse friendly iio_device_claim/release_direct()
      iio: imu: inv_icm42600: Switch to sparse friendly iio_device_claim/release_direct()
      iio: imu: inv_mpu6050: Switch to sparse friendly iio_device_claim/release_direct()
      iio: imu: smi240: Switch to sparse friendly iio_device_claim/release_direct()
      iio: imu: st_lsm6dsx: Factor out parts of st_lsm6dsx_shub_write_raw() to allow direct returns
      iio: imu: st_lsm6dsx: Switch to sparse friendly claim/release_direct()
      iio: imu: st_lsm6dsx: Switch to sparse friendly iio_device_claim/release_direct()
      iio: magnetometer: mag3110: Factor out core of read/write_raw() and use guard() to simplify code flow.
      iio: magnetometer: mag3110: Switch to sparse friendly iio_device_claim/release_direct()
      iio: magnetometer: rm3100: Switch to sparse friendly iio_device_claim/release_direct()
      iio: pressure: dlhl60d: Switch to sparse friendly iio_device_claim/release_direct()
      iio: pressure: icp10100: Switch to sparse friendly iio_device_claim/release_direct()
      iio: pressure: mpl3115: factor out core of IIO_INFO_RAW read to simplify code flow
      iio: pressure: mpl3115: Switch to sparse friendly iio_device_claim/release_direct()
      iio: pressure: ms5611: Switch to sparse friendly iio_device_claim/release_direct()
      iio: pressure: rohm-bm1390: Switch to sparse friendly iio_device_claim/release_direct()
      iio: pressure: zpa2326: Switch to sparse friendly iio_device_claim/release_direct()
      iio: proximity: hx9023s: Switch to sparse friendly iio_device_claim/release_direct()
      iio: proximity: pulsed-light: Switch to sparse friendly iio_device_claim/release_direct()
      iio: proximity: sx9500: Switch to sparse friendly iio_device_claim/release_direct()
      iio: temp: maxim_thermocouple: Switch to sparse friendly iio_device_claim/release_direct()
      iio: temp: maxim_thermocouple: Drop unused mutex.h include.
      staging: iio: ad5933: Switch to sparse friendly iio_device_claim/release_direct()
      iio: Adjust internals of handling of direct mode claiming to suit new API.
      MAINTAINERS: IIO: Update reviewers for the subsystem
      iio: introduced iio_push_to_buffers_with_ts() that takes a data_total_len argument.
      iio: dummy: Use a fixed structure to build up scan to push to buffers.
      iio: dummy: Switch to iio_push_to_buffers_with_ts() and provide size of storage
      iio: adc: ti-ads131e08: Use new iio_push_to_buffers_with_ts() to provide length sanity check.
      iio: adc: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: accel: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: accel: hid: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: chemical: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: temperature: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: resolver: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: proximity: irsd200: Use a struct for scan and iio_push_to_buffers_with_ts()
      iio: proximity: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: pressure: zpa2326: Use aligned_s64 for the timestamp
      iio: pressure: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.
      iio: magnetometer: Use iio_push_to_buffers_with_ts() to provide length for runtime checks.

Jonathan Santos (2):
      iio: adc: ad7768-1: convert driver to use regmap
      iio: adc: ad7768-1: reorganize driver headers

Jorge Marques (1):
      Documentation: ABI: add events sampling frequency in sysfs-bus-iio

Junhao He (1):
      coresight: Fixes device's owner field for registered using coresight_init_driver()

Kees Cook (3):
      EISA: Increase length of device names
      mei: Cast the cb->ext_hdr allocation type
      EISA: Move devlist.h out of obj to always

Kim Seer Paller (3):
      iio: ABI: add new DAC powerdown mode
      dt-bindings: iio: dac: Add adi,ad3530r.yaml
      iio: dac: ad3530r: Add driver for AD3530R and AD3531R

Krzysztof Kozlowski (6):
      dt-bindings: iio: Correct indentation and style in DTS example
      dt-bindings: iio: Use unevaluatedProperties for SPI devices
      dt-bindings: interconnect: Correct indentation and style in DTS example
      mux: adgs1408: simplify with spi_get_device_match_data()
      mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning
      mux: MAINTAINERS: Mark as Odd Fixes

Leo Yan (9):
      coresight: replicator: Fix panic for clearing claim tag
      coresight: etm4x: Extract the trace unit controlling
      coresight: Introduce pause and resume APIs for source
      coresight: etm4x: Hook pause and resume callbacks
      coresight: perf: Support AUX trace pause and resume
      coresight: tmc: Re-enable sink after buffer update
      coresight: perf: Update buffer on AUX pause
      Documentation: coresight: Document AUX pause and resume
      coresight: etm4x: Fix timestamp bit field handling

Long Li (1):
      uio_hv_generic: Set event for all channels on the device

Lothar Rubusch (7):
      iio: accel: adxl345: use regmap cache for INT mapping
      iio: accel: adxl345: move INT enable to regmap cache
      iio: accel: adxl345: cleanup regmap return values
      iio: accel: adxl345: introduce adxl345_push_event function
      iio: accel: adxl345: add single tap feature
      iio: accel: adxl345: add double tap feature
      iio: accel: adxl345: set the tap suppress bit permanently

Mao Jinlong (2):
      coresight: Disable MMIO logging for coresight stm driver
      coresight: tmc: fix failure to disable/enable ETF after reading

Marcelo Schmitt (5):
      iio: adc: ad4000: Add support for SPI offload
      Documentation: iio: ad4000: Add new supported parts
      Documentation: iio: ad4000: Add IIO Device characteristics section
      Documentation: iio: ad4000: Describe offload support
      iio: adc: ad4000: Avoid potential double data word read

Marcus Folkesson (3):
      iio: adc: mcp3911: fix device dependent mappings for conversion result registers
      dt-bindings: iio: adc: mcp3911: add reset-gpios
      iio: adc: mcp3911: add reset management

Marius Cristea (1):
      iio: adc: PAC1934: fix typo in documentation link

Martin Blumenstingl (2):
      dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
      iio: adc: meson: add support for the GXLX SoC

Matti Vaittinen (23):
      dt-bindings: ROHM BD79124 ADC/GPO
      property: Add functions to iterate named child
      iio: adc: add helpers for parsing ADC nodes
      iio: adc: rzg2l_adc: Use adc-helpers
      iio: adc: sun20i-gpadc: Use adc-helpers
      iio: adc: Support ROHM BD79124 ADC
      MAINTAINERS: Add IIO ADC helpers
      MAINTAINERS: Add ROHM BD79124 ADC/GPO
      dt-bindings: Add ROHM BD7970x variants
      iio: dac: bd79703 Store device address to 'address'
      iio: dac: bd79703: Add chip data
      iio: dac: bd79703: Support BD79700 and BD79701
      iio: dac: bd79703: Support ROHM BD79702
      iio: bd79124: Use set_rv and set_multiple_rv
      dt-bindings: ROHM BD79104 ADC
      iio: adc: ti-adc128s052: Simplify using be16_to_cpu()
      iio: adc: ti-adc128s052: Be consistent with arrays
      iio: adc: ti-adc128s052: Use devm_mutex_init()
      iio: adc: ti-adc128s052: Simplify using guard(mutex)
      iio: adc: ti-adc128s052: Support ROHM BD79104
      MAINTAINERS: A driver for TI/ROHM ADCs
      iio: ti-adc128s052: Drop variable vref
      dt-bindings: iio: adc: Add ROHM BD79100G

Neil Armstrong (4):
      interconnect: qcom: sm8650: enable QoS configuration
      dt-bindings: interconnect: sm8650: document the MASTER_APSS_NOC
      interconnect: qcom: sm8650: add the MASTER_APSS_NOC
      interconnect: qcom: sm8650: remove regmap config for mc_virt & clk_virt

Olivier Moysan (2):
      iio: trigger: stm32-lptimer: add support for stm32mp25
      iio: adc: stm32: add oversampling support

Peter Colberg (1):
      fpga: m10bmc-sec: change contact for secure update driver

Peter Korsgaard (1):
      nvmem: zynqmp_nvmem: unbreak driver after cleanup

Philipp Stanner (2):
      misc: cardreader: Use non-hybrid PCI devres API
      misc: cardreader: Return -EBUSY if regions are busy

Purva Yeshi (1):
      iio: adc: ad_sigma_delta: Fix use of uninitialized status_pos

Qasim Ijaz (1):
      fpga: fix potential null pointer deref in fpga_mgr_test_img_load_sgt()

Raviteja Laggyshetty (5):
      dt-bindings: interconnect: Add EPSS L3 compatible for SA8775P
      interconnect: core: Add dynamic id allocation support
      interconnect: qcom: Add multidev EPSS L3 support
      interconnect: qcom: icc-rpmh: Add dynamic icc node id support
      interconnect: qcom: sa8775p: Add dynamic icc node id support

Rengarajan S (2):
      misc: microchip: pci1xxxx: Add PCIe Hot reset disable support for Rev C0 and later devices
      misc: microchip: pci1xxxx: Add GPIO Wakeup Support

Ricky Wu (1):
      misc: rtsx: Enhance the signal handling processes in SVID/SSID 1028:0CE1 platform

Roxana Nicolescu (2):
      misc: lis3lv02d: Fix correct sysfs directory path for lis3lv02d
      char: tlclk: Fix correct sysfs directory path for tlclk

Sam Winchenbach (5):
      dt-bindings: iio: filter: Add lpf/hpf freq margins
      iio: filter: admv8818: fix band 4, state 15
      iio: filter: admv8818: fix integer overflow
      iio: filter: admv8818: fix range calculation
      iio: core: Add support for writing 64 bit attrs

Sasha Finkelstein (2):
      dt-bindings: spmi: Add Apple SPMI NVMEM
      dt-bindings: spmi: Add Apple SPMI controller

Sasha Levin (2):
      scripts: Add git-resolve tool for full SHA-1 resolution
      git-resolve: add SPDX and copyright line

Sean Nyekjaer (3):
      iio: imu: inv_icm42600: Fix temperature calculation
      iio: accel: fxls8962af: Fix temperature calculation
      iio: accel: fxls8962af: Fix temperature scan element sign

Sergio Perez (2):
      dt-bindings: iio: light: bh1750: Add reset-gpios property
      iio: light: bh1750: Add hardware reset support via GPIO

Sergiu Cuciurean (2):
      iio: adc: ad7768-1: Add reset gpio
      iio: adc: ad7768-1: Move buffer allocation to a separate function

Siddharth Menon (2):
      iio: frequency: ad9832: devicetree probing support
      iio: frequency: ad9832: Use FIELD_PREP macro to set bit fields

Srinivas Kandagatla (2):
      dt-bindings: mux: add optional regulator binding to gpio mux
      mux: gpio: add optional regulator support

Subramanian Ananthanarayanan (1):
      bus: mhi: host: pci_generic: Remove redundant assign resource usage

Sumit Kumar (1):
      bus: mhi: ep: Update read pointer only after buffer is written

Thadeu Lima de Souza Cascardo (3):
      char: misc: restrict the dynamic range to exclude reserved minors
      char: misc: add test cases
      char: misc: make miscdevice unit test built-in only

Thorsten Blum (1):
      mux: mmio: Add missing word in error message

Tiffany Y. Yang (3):
      binder: use buffer offsets in debug logs
      binder: Refactor binder_node print synchronization
      binder: Create safe versions of binder log files

Tobias Sperling (1):
      iio: adc: sort TI drivers alphanumerical

Tóth János (2):
      dt-bindings: trivial-devices: Document SEN0322
      iio: chemical: Add driver for SEN0322

Uwe Kleine-König (3):
      iio: adc: ad7124: Fix 3dB filter frequency reading
      iio: adc: ad7124: Remove ability to write filter_low_pass_3db_frequency
      iio: adc: ad7124: Make register naming consistent

WangYuli (1):
      spmi: Only use Hikey 970 SPMI controller driver when ARM64

Wolfram Sang (1):
      misc: eeprom/idt_89hpesx: use per-client debugfs directory

Wupeng Ma (1):
      VMCI: fix race between vmci_host_setup_notify and vmci_ctx_unset_notify

Yabin Cui (2):
      coresight: catu: Introduce refcount and spinlock for enabling/disabling
      coresight: core: Disable helpers for devices that fail to enable

Yeoreum Yun (3):
      coresight/etm4: fix missing disable active config
      coresight: holding cscfg_csdev_lock while removing cscfg from csdev
      coresight: prevent deactivate active config while enabling the config

Zhang Lixu (1):
      iio: hid-sensor-prox: Add support for 16-bit report size

 Documentation/ABI/testing/sysfs-bus-iio            |    3 +
 .../ABI/testing/sysfs-driver-intel-m10-bmc         |    4 +-
 .../testing/sysfs-driver-intel-m10-bmc-sec-update  |   14 +-
 .../arm/arm,coresight-static-replicator.yaml       |   13 +
 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    |   11 +
 .../devicetree/bindings/iio/adc/adi,ad7476.yaml    |   63 +-
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |    8 +
 .../bindings/iio/adc/amlogic,meson-saradc.yaml     |    1 +
 .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml   |    1 +
 .../bindings/iio/adc/microchip,mcp3911.yaml        |    5 +
 .../bindings/iio/adc/nuvoton,nct7201.yaml          |   70 ++
 .../devicetree/bindings/iio/adc/rohm,bd79104.yaml  |   69 ++
 .../devicetree/bindings/iio/adc/rohm,bd79124.yaml  |  114 ++
 .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  |  102 +-
 .../bindings/iio/chemical/winsen,mhz19b.yaml       |   33 +
 .../devicetree/bindings/iio/dac/adi,ad3530r.yaml   |  100 ++
 .../devicetree/bindings/iio/dac/adi,ad3552r.yaml   |    2 +-
 .../devicetree/bindings/iio/dac/adi,ad7293.yaml    |    2 +
 .../devicetree/bindings/iio/dac/adi,ltc2664.yaml   |    2 +-
 .../devicetree/bindings/iio/dac/adi,ltc2672.yaml   |    2 +-
 .../bindings/iio/dac/microchip,mcp4821.yaml        |    2 +-
 .../devicetree/bindings/iio/dac/rohm,bd79703.yaml  |   35 +-
 .../bindings/iio/filter/adi,admv8818.yaml          |   20 +
 .../devicetree/bindings/iio/imu/adi,adis16550.yaml |    2 +-
 .../bindings/iio/imu/invensense,icm42600.yaml      |   13 +-
 .../devicetree/bindings/iio/light/bh1750.yaml      |    6 +
 .../bindings/iio/pressure/honeywell,hsc030pa.yaml  |    2 +-
 .../iio/pressure/honeywell,mprls0025pa.yaml        |    2 +-
 .../bindings/interconnect/qcom,msm8939.yaml        |    8 +-
 .../bindings/interconnect/qcom,msm8953.yaml        |   20 +-
 .../bindings/interconnect/qcom,msm8974.yaml        |   18 +-
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../devicetree/bindings/interconnect/qcom,rpm.yaml |   12 +-
 .../bindings/interconnect/qcom,rpmh.yaml           |   28 +-
 .../bindings/interconnect/qcom,sdx75-rpmh.yaml     |   16 +-
 .../devicetree/bindings/mux/gpio-mux.yaml          |    4 +
 .../bindings/nvmem/apple,spmi-nvmem.yaml           |   54 +
 .../devicetree/bindings/spmi/apple,spmi.yaml       |   49 +
 .../devicetree/bindings/trivial-devices.yaml       |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/driver-api/nvmem.rst                 |   14 +-
 Documentation/iio/ad3552r.rst                      |   72 ++
 Documentation/iio/ad4000.rst                       |   91 +-
 Documentation/iio/ad7380.rst                       |    7 +
 Documentation/iio/ad7606.rst                       |   45 +
 Documentation/iio/index.rst                        |    1 +
 Documentation/misc-devices/amd-sbi.rst             |   99 ++
 Documentation/misc-devices/index.rst               |    1 +
 Documentation/misc-devices/lis3lv02d.rst           |    6 +-
 Documentation/trace/coresight/coresight-perf.rst   |   31 +
 Documentation/userspace-api/ioctl/ioctl-number.rst |    2 +
 MAINTAINERS                                        |   70 +-
 drivers/android/binder.c                           |  248 +++--
 drivers/android/binder_internal.h                  |    8 +-
 drivers/android/binderfs.c                         |    2 +-
 drivers/base/property.c                            |   27 +
 drivers/bus/mhi/ep/ring.c                          |   16 +-
 drivers/bus/mhi/host/pci_generic.c                 |   43 +-
 drivers/bus/mhi/host/pm.c                          |   18 +-
 drivers/cdx/cdx_msi.c                              |    4 +-
 drivers/char/Kconfig                               |    2 +-
 drivers/char/apm-emulation.c                       |    5 +-
 drivers/char/hpet.c                                |    3 +-
 drivers/char/misc.c                                |   28 +-
 drivers/char/xillybus/xillybus_core.c              |    3 +-
 drivers/comedi/comedi_buf.c                        |  155 +--
 drivers/comedi/comedi_fops.c                       |  120 +-
 drivers/comedi/drivers/adl_pci9118.c               |    4 +-
 drivers/comedi/drivers/ni_atmio.c                  |    2 +-
 drivers/comedi/drivers/ni_pcidio.c                 |    2 -
 drivers/counter/interrupt-cnt.c                    |   17 +-
 drivers/counter/microchip-tcb-capture.c            |   25 +-
 drivers/counter/stm32-timer-cnt.c                  |    7 +-
 drivers/eisa/Makefile                              |   10 +-
 drivers/eisa/eisa-bus.c                            |    2 +-
 drivers/fpga/tests/fpga-mgr-test.c                 |    1 +
 drivers/hwmon/Kconfig                              |   10 -
 drivers/hwmon/sbrmi.c                              |  357 ------
 drivers/hwtracing/coresight/Kconfig                |    9 +
 drivers/hwtracing/coresight/Makefile               |    3 +
 drivers/hwtracing/coresight/coresight-catu.c       |   39 +-
 drivers/hwtracing/coresight/coresight-catu.h       |    1 +
 drivers/hwtracing/coresight/coresight-config.h     |    2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  131 ++-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |    3 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |    2 +
 drivers/hwtracing/coresight/coresight-cti.h        |    3 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |    4 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   84 +-
 drivers/hwtracing/coresight/coresight-etm.h        |    6 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   28 +-
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |    8 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  158 ++-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |    8 +-
 drivers/hwtracing/coresight/coresight-etm4x.h      |    2 +
 drivers/hwtracing/coresight/coresight-funnel.c     |    4 +-
 .../hwtracing/coresight/coresight-kunit-tests.c    |   74 ++
 drivers/hwtracing/coresight/coresight-platform.c   |   26 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   22 +-
 drivers/hwtracing/coresight/coresight-replicator.c |    6 +-
 drivers/hwtracing/coresight/coresight-stm.c        |    8 +-
 .../coresight/coresight-syscfg-configfs.c          |    2 +-
 drivers/hwtracing/coresight/coresight-syscfg.c     |   51 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   11 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |   20 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |   26 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |    2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |   18 +-
 drivers/iio/accel/adxl345.h                        |    4 +
 drivers/iio/accel/adxl345_core.c                   |  606 ++++++++++-
 drivers/iio/accel/adxl345_i2c.c                    |    2 +
 drivers/iio/accel/adxl345_spi.c                    |    2 +
 drivers/iio/accel/adxl355_core.c                   |    4 +-
 drivers/iio/accel/adxl367_i2c.c                    |    2 +-
 drivers/iio/accel/adxl367_spi.c                    |    4 +-
 drivers/iio/accel/adxl372_i2c.c                    |    2 +-
 drivers/iio/accel/adxl372_spi.c                    |    2 +-
 drivers/iio/accel/bma180.c                         |    2 +-
 drivers/iio/accel/bma220_spi.c                     |    8 +-
 drivers/iio/accel/bma400_core.c                    |    5 +-
 drivers/iio/accel/bmc150-accel-i2c.c               |    6 +-
 drivers/iio/accel/bmc150-accel-spi.c               |    4 +-
 drivers/iio/accel/bmi088-accel-i2c.c               |    4 +-
 drivers/iio/accel/bmi088-accel-spi.c               |    4 +-
 drivers/iio/accel/da280.c                          |    4 +-
 drivers/iio/accel/da311.c                          |    2 +-
 drivers/iio/accel/dmard10.c                        |    2 +-
 drivers/iio/accel/fxls8962af-core.c                |   19 +-
 drivers/iio/accel/fxls8962af-i2c.c                 |    4 +-
 drivers/iio/accel/fxls8962af-spi.c                 |    4 +-
 drivers/iio/accel/hid-sensor-accel-3d.c            |    4 +-
 drivers/iio/accel/kxcjk-1013.c                     |   91 +-
 drivers/iio/accel/kxsd9-i2c.c                      |    2 +-
 drivers/iio/accel/kxsd9-spi.c                      |    2 +-
 drivers/iio/accel/kxsd9.c                          |    7 +-
 drivers/iio/accel/mma7455_core.c                   |    5 +-
 drivers/iio/accel/mma7660.c                        |    4 +-
 drivers/iio/accel/mma8452.c                        |    5 +-
 drivers/iio/accel/mma9551.c                        |    4 +-
 drivers/iio/accel/mma9553.c                        |    6 +-
 drivers/iio/accel/msa311.c                         |    4 +-
 drivers/iio/accel/mxc4005.c                        |    8 +-
 drivers/iio/accel/sca3000.c                        |    2 +-
 drivers/iio/accel/sca3300.c                        |   23 +-
 drivers/iio/accel/st_accel_i2c.c                   |    6 +-
 drivers/iio/accel/st_accel_spi.c                   |    4 +-
 drivers/iio/accel/stk8312.c                        |    6 +-
 drivers/iio/accel/stk8ba50.c                       |    8 +-
 drivers/iio/adc/Kconfig                            |  160 +--
 drivers/iio/adc/Makefile                           |    4 +
 drivers/iio/adc/ad4000.c                           |  387 ++++++-
 drivers/iio/adc/ad4030.c                           |   70 +-
 drivers/iio/adc/ad4130.c                           |   10 +-
 drivers/iio/adc/ad4695.c                           |   19 +-
 drivers/iio/adc/ad4851.c                           |   14 +-
 drivers/iio/adc/ad7091r-base.c                     |    9 +-
 drivers/iio/adc/ad7124.c                           |  208 ++--
 drivers/iio/adc/ad7173.c                           |   15 +-
 drivers/iio/adc/ad7266.c                           |    7 +-
 drivers/iio/adc/ad7280a.c                          |    2 +-
 drivers/iio/adc/ad7298.c                           |    4 +-
 drivers/iio/adc/ad7380.c                           |   57 +-
 drivers/iio/adc/ad7476.c                           |    4 +-
 drivers/iio/adc/ad7606.c                           |  373 +++----
 drivers/iio/adc/ad7606.h                           |  196 ++--
 drivers/iio/adc/ad7606_par.c                       |   37 +-
 drivers/iio/adc/ad7606_spi.c                       |  310 ++++--
 drivers/iio/adc/ad7768-1.c                         |  247 +++--
 drivers/iio/adc/ad7779.c                           |    3 +-
 drivers/iio/adc/ad7791.c                           |    2 +-
 drivers/iio/adc/ad7923.c                           |    4 +-
 drivers/iio/adc/ad7944.c                           |   13 +-
 drivers/iio/adc/ad799x.c                           |    2 +-
 drivers/iio/adc/ad_sigma_delta.c                   |    4 +
 drivers/iio/adc/adi-axi-adc.c                      |    2 +-
 drivers/iio/adc/at91-sama5d2_adc.c                 |   13 +-
 drivers/iio/adc/axp20x_adc.c                       |    8 +-
 drivers/iio/adc/axp288_adc.c                       |    4 +-
 drivers/iio/adc/cpcap-adc.c                        |    2 +-
 drivers/iio/adc/da9150-gpadc.c                     |    2 +-
 drivers/iio/adc/dln2-adc.c                         |    4 +-
 drivers/iio/adc/envelope-detector.c                |    4 +-
 drivers/iio/adc/fsl-imx25-gcq.c                    |    2 +-
 drivers/iio/adc/hi8435.c                           |    2 +-
 drivers/iio/adc/hx711.c                            |   11 +-
 drivers/iio/adc/imx7d_adc.c                        |    2 +-
 drivers/iio/adc/imx8qxp-adc.c                      |    2 +-
 drivers/iio/adc/imx93_adc.c                        |    2 +-
 drivers/iio/adc/ina2xx-adc.c                       |    2 +-
 drivers/iio/adc/industrialio-adc.c                 |   82 ++
 drivers/iio/adc/intel_mrfld_adc.c                  |    4 +-
 drivers/iio/adc/lpc18xx_adc.c                      |    2 +-
 drivers/iio/adc/ltc2471.c                          |    2 +-
 drivers/iio/adc/max1118.c                          |    4 +-
 drivers/iio/adc/max11410.c                         |    4 +-
 drivers/iio/adc/max1363.c                          |    8 +-
 drivers/iio/adc/max77541-adc.c                     |    2 +-
 drivers/iio/adc/mcp3911.c                          |   62 +-
 drivers/iio/adc/meson_saradc.c                     |   36 +-
 drivers/iio/adc/mt6359-auxadc.c                    |    2 +-
 drivers/iio/adc/mt6360-adc.c                       |    4 +-
 drivers/iio/adc/mt6370-adc.c                       |    2 +-
 drivers/iio/adc/mxs-lradc-adc.c                    |   17 +-
 drivers/iio/adc/nct7201.c                          |  501 +++++++++
 drivers/iio/adc/npcm_adc.c                         |    2 +-
 drivers/iio/adc/pac1921.c                          |    7 +-
 drivers/iio/adc/pac1934.c                          |    2 +-
 drivers/iio/adc/palmas_gpadc.c                     |    2 +-
 drivers/iio/adc/rcar-gyroadc.c                     |   11 +-
 drivers/iio/adc/rn5t618-adc.c                      |    2 +-
 drivers/iio/adc/rockchip_saradc.c                  |    3 +-
 drivers/iio/adc/rohm-bd79124.c                     | 1146 ++++++++++++++++++++
 drivers/iio/adc/rtq6056.c                          |    3 +-
 drivers/iio/adc/rzg2l_adc.c                        |   41 +-
 drivers/iio/adc/spear_adc.c                        |    2 +-
 drivers/iio/adc/stm32-adc-core.h                   |   17 +
 drivers/iio/adc/stm32-adc.c                        |  158 ++-
 drivers/iio/adc/stm32-dfsdm-adc.c                  |    8 +-
 drivers/iio/adc/sun20i-gpadc-iio.c                 |   41 +-
 drivers/iio/adc/sun4i-gpadc-iio.c                  |    6 +-
 drivers/iio/adc/ti-adc081c.c                       |    4 +-
 drivers/iio/adc/ti-adc0832.c                       |    4 +-
 drivers/iio/adc/ti-adc084s021.c                    |    4 +-
 drivers/iio/adc/ti-adc12138.c                      |    4 +-
 drivers/iio/adc/ti-adc128s052.c                    |  102 +-
 drivers/iio/adc/ti-ads1015.c                       |  172 ++-
 drivers/iio/adc/ti-ads1100.c                       |   44 +-
 drivers/iio/adc/ti-ads1119.c                       |    4 +-
 drivers/iio/adc/ti-ads124s08.c                     |    4 +-
 drivers/iio/adc/ti-ads131e08.c                     |    4 +-
 drivers/iio/adc/ti-ads7950.c                       |   17 +-
 drivers/iio/adc/ti-ads8688.c                       |    4 +-
 drivers/iio/adc/ti-lmp92064.c                      |    6 +-
 drivers/iio/adc/ti-tlc4541.c                       |    4 +-
 drivers/iio/adc/ti-tsc2046.c                       |    6 +-
 drivers/iio/adc/twl6030-gpadc.c                    |    2 +-
 drivers/iio/adc/vf610_adc.c                        |   46 +-
 drivers/iio/adc/xilinx-xadc-core.c                 |    2 +-
 drivers/iio/addac/ad74115.c                        |   25 +-
 drivers/iio/addac/ad74413r.c                       |   37 +-
 drivers/iio/afe/iio-rescale.c                      |    2 +-
 drivers/iio/amplifiers/ad8366.c                    |    2 +-
 drivers/iio/amplifiers/ada4250.c                   |    4 +-
 drivers/iio/amplifiers/hmc425a.c                   |    5 +-
 drivers/iio/cdc/ad7150.c                           |    4 +-
 drivers/iio/cdc/ad7746.c                           |    4 +-
 drivers/iio/chemical/Kconfig                       |   20 +
 drivers/iio/chemical/Makefile                      |    2 +
 drivers/iio/chemical/ags02ma.c                     |    4 +-
 drivers/iio/chemical/atlas-ezo-sensor.c            |    4 +-
 drivers/iio/chemical/atlas-sensor.c                |   14 +-
 drivers/iio/chemical/bme680_core.c                 |    4 +-
 drivers/iio/chemical/bme680_i2c.c                  |    4 +-
 drivers/iio/chemical/bme680_spi.c                  |   12 +-
 drivers/iio/chemical/ccs811.c                      |   83 +-
 drivers/iio/chemical/ens160_core.c                 |    4 +-
 drivers/iio/chemical/mhz19b.c                      |  316 ++++++
 drivers/iio/chemical/pms7003.c                     |    4 +-
 drivers/iio/chemical/scd30_core.c                  |    3 +-
 drivers/iio/chemical/scd4x.c                       |   10 +-
 drivers/iio/chemical/sen0322.c                     |  161 +++
 drivers/iio/chemical/sps30.c                       |    4 +-
 drivers/iio/chemical/sunrise_co2.c                 |    4 +-
 .../iio/common/cros_ec_sensors/cros_ec_lid_angle.c |    2 +-
 .../iio/common/cros_ec_sensors/cros_ec_sensors.c   |    2 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |   76 +-
 drivers/iio/common/scmi_sensors/scmi_iio.c         |   11 +-
 drivers/iio/common/ssp_sensors/ssp_dev.c           |    2 +-
 drivers/iio/common/ssp_sensors/ssp_spi.c           |    2 +-
 drivers/iio/common/st_sensors/st_sensors_core.c    |    7 +-
 drivers/iio/dac/Kconfig                            |   11 +
 drivers/iio/dac/Makefile                           |    1 +
 drivers/iio/dac/ad3530r.c                          |  517 +++++++++
 drivers/iio/dac/ad3552r-common.c                   |    4 +
 drivers/iio/dac/ad3552r-hs.c                       |  182 +++-
 drivers/iio/dac/ad3552r.h                          |    1 +
 drivers/iio/dac/ad5064.c                           |    8 +-
 drivers/iio/dac/ad5360.c                           |    2 +-
 drivers/iio/dac/ad5380.c                           |    2 +-
 drivers/iio/dac/ad5446.c                           |    6 +-
 drivers/iio/dac/ad5449.c                           |    2 +-
 drivers/iio/dac/ad5504.c                           |    4 +-
 drivers/iio/dac/ad5592r-base.c                     |  156 ++-
 drivers/iio/dac/ad5592r.c                          |    6 +-
 drivers/iio/dac/ad5593r.c                          |    6 +-
 drivers/iio/dac/ad5624r_spi.c                      |    4 +-
 drivers/iio/dac/ad5686-spi.c                       |    2 +-
 drivers/iio/dac/ad5686.c                           |    2 +-
 drivers/iio/dac/ad5696-i2c.c                       |    4 +-
 drivers/iio/dac/ad5755.c                           |    4 +-
 drivers/iio/dac/ad5758.c                           |    2 +-
 drivers/iio/dac/ad5761.c                           |    4 +-
 drivers/iio/dac/ad5766.c                           |    8 +-
 drivers/iio/dac/ad5770r.c                          |    4 +-
 drivers/iio/dac/ad5791.c                           |    4 +-
 drivers/iio/dac/ad7293.c                           |   17 +-
 drivers/iio/dac/ad7303.c                           |    6 +-
 drivers/iio/dac/ad8801.c                           |    2 +-
 drivers/iio/dac/ad9739a.c                          |    4 +-
 drivers/iio/dac/adi-axi-dac.c                      |   66 +-
 drivers/iio/dac/dpot-dac.c                         |    2 +-
 drivers/iio/dac/ds4424.c                           |    2 +-
 drivers/iio/dac/lpc18xx_dac.c                      |    2 +-
 drivers/iio/dac/ltc1660.c                          |    4 +-
 drivers/iio/dac/ltc2632.c                          |    6 +-
 drivers/iio/dac/ltc2688.c                          |   14 +-
 drivers/iio/dac/max5522.c                          |    4 +-
 drivers/iio/dac/max5821.c                          |    2 +-
 drivers/iio/dac/mcp4725.c                          |    4 +-
 drivers/iio/dac/mcp4728.c                          |    6 +-
 drivers/iio/dac/mcp4821.c                          |    4 +-
 drivers/iio/dac/mcp4922.c                          |    2 +-
 drivers/iio/dac/rohm-bd79703.c                     |  114 +-
 drivers/iio/dac/stm32-dac-core.c                   |    2 +-
 drivers/iio/dac/stm32-dac.c                        |    4 +-
 drivers/iio/dac/ti-dac082s085.c                    |    2 +-
 drivers/iio/dac/ti-dac5571.c                       |    6 +-
 drivers/iio/dac/ti-dac7311.c                       |    2 +-
 drivers/iio/dac/ti-dac7612.c                       |    4 +-
 drivers/iio/dac/vf610_dac.c                        |    4 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c        |   27 +-
 drivers/iio/filter/admv8818.c                      |  236 +++-
 drivers/iio/frequency/ad9523.c                     |    2 +-
 drivers/iio/frequency/adf4350.c                    |    6 +-
 drivers/iio/frequency/adf4371.c                    |    6 +-
 drivers/iio/frequency/adf4377.c                    |    4 +-
 drivers/iio/frequency/admv1013.c                   |    8 +-
 drivers/iio/frequency/admv1014.c                   |    4 +-
 drivers/iio/frequency/adrf6780.c                   |    4 +-
 drivers/iio/gyro/adis16080.c                       |    2 +-
 drivers/iio/gyro/adis16260.c                       |    2 +-
 drivers/iio/gyro/adxrs290.c                        |   14 +-
 drivers/iio/gyro/adxrs450.c                        |    7 +-
 drivers/iio/gyro/bmg160_i2c.c                      |    4 +-
 drivers/iio/gyro/bmg160_spi.c                      |    2 +-
 drivers/iio/gyro/hid-sensor-gyro-3d.c              |    2 +-
 drivers/iio/gyro/mpu3050-core.c                    |    2 +-
 drivers/iio/gyro/mpu3050-i2c.c                     |    4 +-
 drivers/iio/gyro/st_gyro_i2c.c                     |    4 +-
 drivers/iio/gyro/st_gyro_spi.c                     |    4 +-
 drivers/iio/health/afe4403.c                       |    4 +-
 drivers/iio/health/afe4404.c                       |    4 +-
 drivers/iio/health/max30100.c                      |    2 +-
 drivers/iio/health/max30102.c                      |    6 +-
 drivers/iio/humidity/am2315.c                      |    2 +-
 drivers/iio/humidity/hdc100x.c                     |   68 +-
 drivers/iio/humidity/hdc2010.c                     |   14 +-
 drivers/iio/humidity/hid-sensor-humidity.c         |    2 +-
 drivers/iio/humidity/hts221_core.c                 |  103 +-
 drivers/iio/humidity/hts221_i2c.c                  |    6 +-
 drivers/iio/humidity/hts221_spi.c                  |    4 +-
 drivers/iio/humidity/htu21.c                       |    4 +-
 drivers/iio/imu/adis.c                             |    9 -
 drivers/iio/imu/adis16400.c                        |    2 +-
 drivers/iio/imu/adis16460.c                        |    4 +-
 drivers/iio/imu/adis16475.c                        |    2 +-
 drivers/iio/imu/adis16480.c                        |    2 +-
 drivers/iio/imu/adis_buffer.c                      |    3 -
 drivers/iio/imu/bmi160/bmi160_i2c.c                |    6 +-
 drivers/iio/imu/bmi160/bmi160_spi.c                |    6 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600.h        |    2 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c  |   23 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   |   14 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c   |   23 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c    |    5 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |    5 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_temp.c   |   15 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c         |    2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |   14 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |    4 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c          |    4 +-
 drivers/iio/imu/kmx61.c                            |    2 +-
 drivers/iio/imu/smi240.c                           |    7 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       |   16 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c        |    6 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c        |    2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c       |   69 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c        |    4 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c        |    6 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c        |    4 +-
 drivers/iio/industrialio-backend.c                 |   28 +
 drivers/iio/industrialio-core.c                    |   41 +-
 drivers/iio/light/acpi-als.c                       |    2 +-
 drivers/iio/light/adux1020.c                       |    2 +-
 drivers/iio/light/al3000a.c                        |   11 +-
 drivers/iio/light/al3010.c                         |  111 +-
 drivers/iio/light/al3320a.c                        |  122 ++-
 drivers/iio/light/apds9306.c                       |    7 +-
 drivers/iio/light/apds9960.c                       |    2 +-
 drivers/iio/light/as73211.c                        |   42 +-
 drivers/iio/light/bh1750.c                         |   24 +
 drivers/iio/light/bh1780.c                         |    2 +-
 drivers/iio/light/cm3232.c                         |    4 +-
 drivers/iio/light/cm3323.c                         |    4 +-
 drivers/iio/light/cm3605.c                         |    2 +-
 drivers/iio/light/cros_ec_light_prox.c             |    2 +-
 drivers/iio/light/gp2ap002.c                       |    2 +-
 drivers/iio/light/gp2ap020a00f.c                   |    7 +-
 drivers/iio/light/hid-sensor-als.c                 |    2 +-
 drivers/iio/light/hid-sensor-prox.c                |    5 +-
 drivers/iio/light/isl29018.c                       |    4 +-
 drivers/iio/light/isl29028.c                       |    4 +-
 drivers/iio/light/isl29125.c                       |    7 +-
 drivers/iio/light/jsa1212.c                        |    2 +-
 drivers/iio/light/ltr390.c                         |    4 +-
 drivers/iio/light/ltr501.c                         |  170 +--
 drivers/iio/light/ltrf216a.c                       |    4 +-
 drivers/iio/light/opt4001.c                        |    2 +-
 drivers/iio/light/opt4060.c                        |    5 +-
 drivers/iio/light/pa12203001.c                     |    4 +-
 drivers/iio/light/rohm-bu27034.c                   |   14 +-
 drivers/iio/light/rpr0521.c                        |   63 +-
 drivers/iio/light/si1145.c                         |   25 +-
 drivers/iio/light/st_uvis25_core.c                 |    7 +-
 drivers/iio/light/st_uvis25_i2c.c                  |    4 +-
 drivers/iio/light/st_uvis25_spi.c                  |    4 +-
 drivers/iio/light/stk3310.c                        |    8 +-
 drivers/iio/light/tcs3414.c                        |    9 +-
 drivers/iio/light/tcs3472.c                        |    9 +-
 drivers/iio/light/tsl2563.c                        |    4 +-
 drivers/iio/light/tsl2583.c                        |    4 +-
 drivers/iio/light/tsl2591.c                        |    2 +-
 drivers/iio/light/tsl2772.c                        |    4 +-
 drivers/iio/light/us5182d.c                        |    6 +-
 drivers/iio/light/vcnl4000.c                       |   88 +-
 drivers/iio/light/vcnl4035.c                       |   42 +-
 drivers/iio/light/veml6040.c                       |    4 +-
 drivers/iio/light/veml6075.c                       |    2 +-
 drivers/iio/light/vl6180.c                         |    2 +-
 drivers/iio/light/zopt2201.c                       |   42 +-
 drivers/iio/magnetometer/af8133j.c                 |    3 +-
 drivers/iio/magnetometer/ak8974.c                  |   10 +-
 drivers/iio/magnetometer/ak8975.c                  |    8 +-
 drivers/iio/magnetometer/als31300.c                |    7 +-
 drivers/iio/magnetometer/bmc150_magn.c             |    4 +-
 drivers/iio/magnetometer/bmc150_magn_i2c.c         |    2 +-
 drivers/iio/magnetometer/bmc150_magn_spi.c         |    2 +-
 drivers/iio/magnetometer/hid-sensor-magn-3d.c      |    2 +-
 drivers/iio/magnetometer/hmc5843.h                 |    2 +-
 drivers/iio/magnetometer/hmc5843_core.c            |    4 +-
 drivers/iio/magnetometer/hmc5843_i2c.c             |    2 +-
 drivers/iio/magnetometer/hmc5843_spi.c             |    1 -
 drivers/iio/magnetometer/mag3110.c                 |  165 ++-
 drivers/iio/magnetometer/mmc35240.c                |    4 +-
 drivers/iio/magnetometer/rm3100-core.c             |   11 +-
 drivers/iio/magnetometer/rm3100-spi.c              |    1 -
 drivers/iio/magnetometer/st_magn_i2c.c             |    4 +-
 drivers/iio/magnetometer/st_magn_spi.c             |    4 +-
 drivers/iio/magnetometer/tmag5273.c                |    4 +-
 drivers/iio/magnetometer/yamaha-yas530.c           |    8 +-
 drivers/iio/multiplexer/iio-mux.c                  |    2 +-
 drivers/iio/orientation/hid-sensor-incl-3d.c       |    2 +-
 drivers/iio/orientation/hid-sensor-rotation.c      |    4 +-
 .../iio/position/hid-sensor-custom-intel-hinge.c   |    2 +-
 drivers/iio/potentiometer/ad5272.c                 |    4 +-
 drivers/iio/potentiometer/ds1803.c                 |    4 +-
 drivers/iio/potentiometer/max5432.c                |    2 +-
 drivers/iio/potentiometer/max5487.c                |    2 +-
 drivers/iio/potentiometer/mcp4018.c                |    4 +-
 drivers/iio/potentiometer/mcp41010.c               |    4 +-
 drivers/iio/potentiometer/mcp4131.c                |    4 +-
 drivers/iio/potentiometer/mcp4531.c                |    4 +-
 drivers/iio/potentiometer/tpl0102.c                |    2 +-
 drivers/iio/potentiostat/lmp91000.c                |    4 +-
 drivers/iio/pressure/abp060mg.c                    |    2 +-
 drivers/iio/pressure/bmp280-core.c                 |  110 +-
 drivers/iio/pressure/bmp280-i2c.c                  |    4 +-
 drivers/iio/pressure/bmp280-spi.c                  |   10 +-
 drivers/iio/pressure/bmp280.h                      |    8 -
 drivers/iio/pressure/cros_ec_baro.c                |    2 +-
 drivers/iio/pressure/dlhl60d.c                     |   11 +-
 drivers/iio/pressure/dps310.c                      |    4 +-
 drivers/iio/pressure/hid-sensor-press.c            |    7 +-
 drivers/iio/pressure/hp03.c                        |    2 +-
 drivers/iio/pressure/hp206c.c                      |    4 +-
 drivers/iio/pressure/hsc030pa.c                    |    4 +-
 drivers/iio/pressure/hsc030pa_i2c.c                |    4 +-
 drivers/iio/pressure/hsc030pa_spi.c                |    4 +-
 drivers/iio/pressure/icp10100.c                    |   15 +-
 drivers/iio/pressure/mpl115_spi.c                  |    2 +-
 drivers/iio/pressure/mpl3115.c                     |  101 +-
 drivers/iio/pressure/mprls0025pa_i2c.c             |    4 +-
 drivers/iio/pressure/mprls0025pa_spi.c             |    4 +-
 drivers/iio/pressure/ms5611_core.c                 |    8 +-
 drivers/iio/pressure/ms5611_spi.c                  |    1 -
 drivers/iio/pressure/ms5637.c                      |    4 +-
 drivers/iio/pressure/rohm-bm1390.c                 |   14 +-
 drivers/iio/pressure/st_pressure_i2c.c             |    6 +-
 drivers/iio/pressure/st_pressure_spi.c             |    4 +-
 drivers/iio/pressure/zpa2326.c                     |   21 +-
 drivers/iio/pressure/zpa2326_spi.c                 |    3 +-
 drivers/iio/proximity/as3935.c                     |    8 +-
 drivers/iio/proximity/cros_ec_mkbp_proximity.c     |   17 +-
 drivers/iio/proximity/hx9023s.c                    |   15 +-
 drivers/iio/proximity/irsd200.c                    |   14 +-
 drivers/iio/proximity/isl29501.c                   |    4 +-
 drivers/iio/proximity/mb1232.c                     |    6 +-
 drivers/iio/proximity/ping.c                       |    2 +-
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  |    9 +-
 drivers/iio/proximity/srf04.c                      |    2 +-
 drivers/iio/proximity/srf08.c                      |    6 +-
 drivers/iio/proximity/sx9310.c                     |    6 +-
 drivers/iio/proximity/sx9324.c                     |    2 +-
 drivers/iio/proximity/sx9500.c                     |   11 +-
 drivers/iio/proximity/sx_common.c                  |    4 +-
 drivers/iio/proximity/vcnl3020.c                   |    2 +-
 drivers/iio/proximity/vl53l0x-i2c.c                |    4 +-
 drivers/iio/resolver/ad2s1200.c                    |    2 +-
 drivers/iio/resolver/ad2s1210.c                    |    5 +-
 drivers/iio/resolver/ad2s90.c                      |    4 +-
 drivers/iio/temperature/hid-sensor-temperature.c   |    7 +-
 drivers/iio/temperature/ltc2983.c                  |    4 +-
 drivers/iio/temperature/maxim_thermocouple.c       |   37 +-
 drivers/iio/temperature/mcp9600.c                  |    4 +-
 drivers/iio/temperature/tmp006.c                   |    4 +-
 drivers/iio/temperature/tmp007.c                   |    2 +-
 drivers/iio/temperature/tsys01.c                   |    4 +-
 drivers/iio/temperature/tsys02d.c                  |    2 +-
 drivers/iio/test/iio-test-format.c                 |    2 +-
 drivers/iio/test/iio-test-gts.c                    |    2 +-
 drivers/iio/test/iio-test-rescale.c                |    2 +-
 drivers/iio/trigger/stm32-lptimer-trigger.c        |   77 +-
 drivers/iio/trigger/stm32-timer-trigger.c          |    4 +-
 drivers/interconnect/core.c                        |   82 +-
 drivers/interconnect/qcom/icc-rpmh.c               |   17 +-
 drivers/interconnect/qcom/icc-rpmh.h               |    5 +
 drivers/interconnect/qcom/osm-l3.c                 |   38 +-
 drivers/interconnect/qcom/sa8775p.c                |  952 ++++++----------
 drivers/interconnect/qcom/sm8650.c                 |  344 ++++++
 drivers/interconnect/qcom/sm8650.h                 |    1 +
 drivers/misc/Kconfig                               |    2 +-
 drivers/misc/Makefile                              |    2 +-
 drivers/misc/amd-sbi/Kconfig                       |   18 +
 drivers/misc/amd-sbi/Makefile                      |    4 +
 drivers/misc/amd-sbi/rmi-core.c                    |  474 ++++++++
 drivers/misc/amd-sbi/rmi-core.h                    |   74 ++
 drivers/misc/amd-sbi/rmi-hwmon.c                   |  120 ++
 drivers/misc/amd-sbi/rmi-i2c.c                     |  133 +++
 drivers/misc/bcm-vk/bcm_vk.h                       |    1 -
 drivers/misc/cardreader/alcor_pci.c                |   13 +-
 drivers/misc/cardreader/rts5264.c                  |   17 +
 drivers/misc/cardreader/rtsx_pcr.c                 |   46 -
 drivers/misc/cardreader/rtsx_pcr.h                 |    2 -
 drivers/misc/echo/Kconfig                          |    9 -
 drivers/misc/echo/Makefile                         |    2 -
 drivers/misc/echo/echo.c                           |  589 ----------
 drivers/misc/echo/echo.h                           |  175 ---
 drivers/misc/echo/fir.h                            |  154 ---
 drivers/misc/echo/oslec.h                          |   81 --
 drivers/misc/eeprom/idt_89hpesx.c                  |   75 +-
 drivers/misc/fastrpc.c                             |   16 +-
 drivers/misc/lis3lv02d/Kconfig                     |    4 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c    |   99 +-
 drivers/misc/mei/interrupt.c                       |    2 +-
 drivers/misc/mei/vsc-tp.c                          |    4 +-
 drivers/misc/tps6594-pfsm.c                        |    3 +
 drivers/misc/vmw_vmci/vmci_host.c                  |   11 +-
 drivers/mux/adg792a.c                              |    2 +-
 drivers/mux/adgs1408.c                             |    4 +-
 drivers/mux/gpio.c                                 |    5 +
 drivers/mux/mmio.c                                 |   15 +-
 drivers/nvmem/Kconfig                              |   14 +
 drivers/nvmem/Makefile                             |    2 +
 drivers/nvmem/apple-spmi-nvmem.c                   |   62 ++
 drivers/nvmem/core.c                               |   68 --
 drivers/nvmem/zynqmp_nvmem.c                       |    1 +
 drivers/rpmsg/qcom_smd.c                           |    2 +-
 drivers/spmi/Kconfig                               |    9 +
 drivers/spmi/Makefile                              |    1 +
 drivers/spmi/spmi-apple-controller.c               |  168 +++
 drivers/spmi/spmi-pmic-arb.c                       |    2 +-
 drivers/staging/iio/accel/adis16203.c              |    2 +-
 drivers/staging/iio/adc/ad7816.c                   |    2 +-
 drivers/staging/iio/addac/adt7316-i2c.c            |    2 +-
 drivers/staging/iio/addac/adt7316.c                |    2 +-
 drivers/staging/iio/frequency/ad9832.c             |  102 +-
 drivers/staging/iio/frequency/ad9832.h             |    1 -
 drivers/staging/iio/frequency/ad9834.c             |    4 +-
 drivers/staging/iio/impedance-analyzer/ad5933.c    |   44 +-
 drivers/uio/uio_hv_generic.c                       |   32 +-
 drivers/virt/acrn/irqfd.c                          |    2 -
 drivers/w1/w1_netlink.c                            |   42 +-
 include/dt-bindings/iio/adc/adi,ad7606.h           |    9 +
 .../dt-bindings/interconnect/qcom,sm8650-rpmh.h    |    1 +
 include/linux/comedi/comedidev.h                   |   10 +-
 include/linux/coresight.h                          |   44 +-
 include/linux/eisa.h                               |    5 +-
 include/linux/hid-sensor-hub.h                     |   19 +-
 include/linux/iio/adc-helpers.h                    |   27 +
 include/linux/iio/backend.h                        |    5 +
 include/linux/iio/buffer.h                         |   12 +
 include/linux/iio/iio.h                            |   51 +-
 include/linux/iio/timer/stm32-lptim-trigger.h      |    9 +
 include/linux/interconnect-provider.h              |   12 +
 include/linux/interconnect.h                       |    3 +
 include/linux/nvmem-provider.h                     |   24 -
 include/linux/property.h                           |   20 +
 include/linux/rtsx_pci.h                           |    2 -
 include/uapi/misc/amd-apml.h                       |  152 +++
 rust/kernel/miscdevice.rs                          |    2 +-
 scripts/git-resolve.sh                             |  201 ++++
 tools/iio/iio_generic_buffer.c                     |    2 +-
 602 files changed, 12373 insertions(+), 6149 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/winsen,mhz19b.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
 create mode 100644 Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 create mode 100644 Documentation/iio/ad3552r.rst
 create mode 100644 Documentation/misc-devices/amd-sbi.rst
 delete mode 100644 drivers/hwmon/sbrmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-kunit-tests.c
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/nct7201.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 drivers/iio/chemical/mhz19b.c
 create mode 100644 drivers/iio/chemical/sen0322.c
 create mode 100644 drivers/iio/dac/ad3530r.c
 create mode 100644 drivers/misc/amd-sbi/Kconfig
 create mode 100644 drivers/misc/amd-sbi/Makefile
 create mode 100644 drivers/misc/amd-sbi/rmi-core.c
 create mode 100644 drivers/misc/amd-sbi/rmi-core.h
 create mode 100644 drivers/misc/amd-sbi/rmi-hwmon.c
 create mode 100644 drivers/misc/amd-sbi/rmi-i2c.c
 delete mode 100644 drivers/misc/echo/Kconfig
 delete mode 100644 drivers/misc/echo/Makefile
 delete mode 100644 drivers/misc/echo/echo.c
 delete mode 100644 drivers/misc/echo/echo.h
 delete mode 100644 drivers/misc/echo/fir.h
 delete mode 100644 drivers/misc/echo/oslec.h
 create mode 100644 drivers/nvmem/apple-spmi-nvmem.c
 create mode 100644 drivers/spmi/spmi-apple-controller.c
 create mode 100644 include/dt-bindings/iio/adc/adi,ad7606.h
 create mode 100644 include/linux/iio/adc-helpers.h
 create mode 100644 include/uapi/misc/amd-apml.h
 create mode 100755 scripts/git-resolve.sh
