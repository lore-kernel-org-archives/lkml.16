Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E219101FF;
	Tue, 27 May 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340928; cv=none; b=PrLFiBu1wbEaD71aNVk3zpFDwNrDMgkbUjg5xF78AhM1FNALXKflrjUYwK3P1/khKbqVzjO+xaQg866UzmD33B2FveToa1B1jSOWZ8bi/3IOTCs+JPJ+4nU6c7Evu7JrJd8p379tGt2p2erqHNrwYTcwUhK2+NKLhzpQ0u814XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340928; c=relaxed/simple;
	bh=vIPe6uoYgAdJdhhT/k1YM4/MWQEP6qtUvRhi9Uio3Lo=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=Cuu7IYepFfdE8MtxcbYpf3FULaf22S5Tk7w6RWAuIYeMQyOiRmhLhawLhu9NbAsqZYF8h114vmYLEIy6a+HQJNO40HS7VfLnIPgmRWcHAzKigAa2ca+Lb4P1Z45UmeN+Df/ht6Kc9TdMBUGJG5X8qf1pdqYkjr026qxgAMEhwGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFRLuybj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFRLuybj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748340926; x=1779876926;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vIPe6uoYgAdJdhhT/k1YM4/MWQEP6qtUvRhi9Uio3Lo=;
  b=ZFRLuybjDC7voNcufUrYVMcR/jDMyrEX2wFMKEoMx9oi7y0VNPKE/uD1
   qC7iwtPFYYW0/Cazoz3lAG2jyx4ekdFQsEshAmAVI8cQGe0NcOJV2OyNy
   qgmcklrXOVWQ2LtcZaXOfPtEASNjKRNNq6aYJb+rINFc3bhqYz3693fzb
   8GQVZMJVPNN6KnHupey4hQn8i+xR8Io3xUtEUmyIuEAUfMSiokUi8onnb
   mW94sOO38oKXOR0v/9IUcRaTPLHa0qIw9YDtcBStqSJ6n5AD/hlGkx49l
   i4ANNczgAQ+upUlLyLMoFEYVD1KBHRWLqyBTqrLjOZoaOObw4w4b/zCwv
   g==;
X-CSE-ConnectionGUID: dTgXykEVS/eHFb8SgzgtSg==
X-CSE-MsgGUID: /Ztf4OkdQfeB1l8H5GiP+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50203305"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="50203305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 03:15:22 -0700
X-CSE-ConnectionGUID: 0283Y79lTnWokBg7+mTd7Q==
X-CSE-MsgGUID: R3RTAr77SKuIFcTY+aX45g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143102095"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 03:15:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>, Guenter Roeck <linux@roeck-us.net>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Sebastian Reichel <sre@kernel.org>
Date: Tue, 27 May 2025 12:44:35 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.16-1
Message-ID: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v6.16.

A KNOWN CONFLICT:

x86 tree that seems to be already merged into your tree renamed:
  arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h}
which has to be adjusted also in drivers/platform/x86/amd/hsmp/hwmon.c
(a newly introduced file in this PR) while merging.

The changes are mostly business as usual. Besides pdx86 changes, there
are a few power supply changes needed for related pdx86 features, move
of oxpec driver from hwmon (oxp-sensors) to pdx86, and one FW version
warning to hid-asus. I'm expecting Pavel might want object the approach
used in the tuxedo driver, I largely relied on my co-maintainer Hans'
opinion on what to do with that change as he was much more familiar with
that discussion, and the pros and cons of each approach.

Highlights:

 - alienware-wmi-wmax:

   - Add HWMON support

   - Add ABI and admin-guide documentation

   - Expose GPIO debug methods through debug FS

   - Support manual fan control and "custom" thermal profile

 - amd/hsmp:

   - Add sysfs files to show HSMP telemetry

   - Report power readings and limits via hwmon

 - amd/isp4: Add AMD ISP platform config for OV05C10

 - asus-wmi:

   - Refactor Ally suspend/resume to work better with older FW

   - hid-asus: check ROG Ally MCU version and warn about old FW versions

 - dasharo-acpi: Add driver for Dasharo devices supporting fans and
                 temperatures monitoring

 - dell-ddv:

   - Expose the battery health and manufacture date to userspace using
     power supply extensions

   - Implement the battery matching algorithm

 - dell-pc:

  - Improve error propagation

  - Use faux device

 - int3472:

   - Add delays to avoid GPIO regulator spikes

   - Add handshake pin support

   - Make regulator supply name configurable and allow registering more
     than 1 GPIO regulator

   - Map mt9m114 powerdown pin to powerenable

 - intel/pmc: Add separate SSRAM Telemetry driver

 - intel-uncore-freq: Add attributes to show agent types and die ID

 - ISST:

   - Support SST-TF revision 2 (allows more cores per bucket)

   - Support SST-PP revision 2 (fabric 1 frequencies)

   - Remove unnecessary SST MSRs restore (the package retains MSRs
     despite CPU offlining)

 - mellanox: Add support for SN2201, SN4280, SN5610, and SN5640

 - mellanox: mlxbf-pmc: Support additional PMC blocks

 - oxpec:

   - Add OneXFly variants

   - Add support for charge limit, charge thresholds, and turbo LED

   - Distinguish current X1 variants to avoid unwanted matching to new
     variants

   - Follow hwmon conventions

   - Move from hwmon/oxp-sensors to platform/x86 to match the enlarged
     scope

 - power: supply: 

   - Add inhibit-charge-awake (needed by oxpec)

   - Add additional battery health status values ("blown fuse" and "cell
     imbalance") (needed by dell-ddv)

 - powerwell-ec: Add driver for Portwell EC supporting GPIO and watchdog

 - thinkpad-acpi: Support camera shutter switch hotkey

 - tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 - tools/power/x86/intel-speed-select:

   - Support displaying SST-PP revision 2 fields

   - Skip uncore frequency update on newer generations of CPUs

 - Miscellaneous cleanups / refactoring / improvements

Regards, i.


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-1

for you to fetch changes up to 9c96808f10d84156b5e98e16176b725ec5a1386f:

  thermal/drivers/acerhdf: Constify struct thermal_zone_device_ops (2025-05-26 15:31:27 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.16-1

Highlights:

 - alienware-wmi-wmax:

   - Add HWMON support

   - Add ABI and admin-guide documentation

   - Expose GPIO debug methods through debug FS

   - Support manual fan control and "custom" thermal profile

 - amd/hsmp:

   - Add sysfs files to show HSMP telemetry

   - Report power readings and limits via hwmon

 - amd/isp4: Add AMD ISP platform config for OV05C10

 - asus-wmi:

   - Refactor Ally suspend/resume to work better with older FW

   - hid-asus: check ROG Ally MCU version and warn about old FW versions

 - dasharo-acpi: Add driver for Dasharo devices supporting fans and
                 temperatures monitoring

 - dell-ddv:

   - Expose the battery health and manufacture date to userspace using
     power supply extensions

   - Implement the battery matching algorithm

 - dell-pc:

  - Improve error propagation

  - Use faux device

 - int3472:

   - Add delays to avoid GPIO regulator spikes

   - Add handshake pin support

   - Make regulator supply name configurable and allow registering more
     than 1 GPIO regulator

   - Map mt9m114 powerdown pin to powerenable

 - intel/pmc: Add separate SSRAM Telemetry driver

 - intel-uncore-freq: Add attributes to show agent types and die ID

 - ISST:

   - Support SST-TF revision 2 (allows more cores per bucket)

   - Support SST-PP revision 2 (fabric 1 frequencies)

   - Remove unnecessary SST MSRs restore (the package retains MSRs
     despite CPU offlining)

 - mellanox: Add support for SN2201, SN4280, SN5610, and SN5640

 - mellanox: mlxbf-pmc: Support additional PMC blocks

 - oxpec:

   - Add OneXFly variants

   - Add support for charge limit, charge thresholds, and turbo LED

   - Distinguish current X1 variants to avoid unwanted matching to new
     variants

   - Follow hwmon conventions

   - Move from hwmon/oxp-sensors to platform/x86 to match the enlarged
     scope

 - power: supply:

   - Add inhibit-charge-awake (needed by oxpec)

   - Add additional battery health status values ("blown fuse" and "cell
     imbalance") (needed by dell-ddv)

 - powerwell-ec: Add driver for Portwell EC supporting GPIO and watchdog

 - thinkpad-acpi: Support camera shutter switch hotkey

 - tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 - tools/power/x86/intel-speed-select:

   - Support displaying SST-PP revision 2 fields

   - Skip uncore frequency update on newer generations of CPUs

 - Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

ABI: testing: sysfs-class-oxp:
 -  add missing documentation
 -  add tt_led attribute documentation

Add AMD ISP platform config for OV05C10:
 - Add AMD ISP platform config for OV05C10

alienware-wmi-wmax:
 -  Add a DebugFS interface
 -  Add HWMON support
 -  Add support for manual fan control
 -  Add support for the "custom" thermal profile
 -  Expose GPIO debug methods
 -  Fix awcc_hwmon_fans_init() label logic
 -  Fix uninitialized bitmap in awcc_hwmon_fans_init()
 -  Improve ID processing
 -  Improve internal AWCC API
 -  Improve platform profile probe
 -  Modify supported_thermal_profiles[]
 -  Rename thermal related symbols

amd/hsmp: acpi:
 -  Add sysfs files to display HSMP telemetry

amd/hsmp:
 -  fix building with CONFIG_HWMON=m
 -  Report power via hwmon sensors
 -  Use a single DRIVER_VERSION for all hsmp modules

arm64: huawei-gaokun-ec:
 -  Remove unneeded semicolon

asus-wmi:
 -  fix build without CONFIG_SUSPEND
 -  Refactor Ally suspend/resume

Avoid -Wflex-array-member-not-at-end warning:
 - Avoid -Wflex-array-member-not-at-end warning

barco-p50:
 -  use new GPIO line value setter callbacks

dell-ddv:
 -  Expose the battery health to userspace
 -  Expose the battery manufacture date to userspace
 -  Implement the battery matching algorithm

dell-pc:
 -  Propagate errors when detecting feature support
 -  Transition to faux device
 -  Use non-atomic bitmap operations

docs: ABI:
 -  Fix "aassociated" to "associated"

Documentation/ABI:
 -  Add new attribute for mlxreg-io sysfs interfaces

Documentation: ABI:
 -  Add sysfs platform and debugfs ABI documentation for alienware-wmi

Documentation: admin-guide: laptops:
 -  Add documentation for alienware-wmi

Documentation: admin-guide: pm:
 -  Add documentation for agent_types
 -  Add documentation for die_id

Documentation: wmi: alienware-wmi:
 -  Add GPIO control documentation

Documentation: wmi:
 -  Improve and update alienware-wmi documentation

Do not enable by default during compile testing:
 - Do not enable by default during compile testing

hid-asus:
 -  check ROG Ally MCU version and warn

hwmon:
 -  (oxp-sensors) Add all OneXFly variants
 -  (oxp-sensors) Distinguish the X1 variants

int0002:
 -  use new GPIO line value setter callbacks

int3472:
 -  Add handshake pin support
 -  Add skl_int3472_register_clock() helper
 -  Avoid GPIO regulator spikes
 -  Debug log when remapping pins
 -  Drop unused gpio field from struct int3472_gpio_regulator
 -  Export int3472_discrete_parse_crs()
 -  For mt9m114 sensors map powerdown to powerenable
 -  Make regulator supply name configurable
 -  Move common.h to public includes, symbols to INTEL_INT3472
 -  Prepare for registering more than 1 GPIO regulator
 -  Remove unused sensor_config struct member
 -  Rework AVDD second sensor quirk handling
 -  Stop setting a supply-name for GPIO regulators
 -  Stop using devm_gpiod_get()

intel/pmc:
 -  Convert index variables to be unsigned
 -  Create Intel PMC SSRAM Telemetry driver
 -  Improve pmc_core_get_lpm_req()
 -  Move error handling to init function
 -  Move PMC Core related functions
 -  Move PMC devid to core.h
 -  Remove unneeded header file inclusion
 -  Remove unneeded io operations
 -  Rename core_ssram to ssram_telemetry
 -  Use devm for mutex_init

intel: power-domains:
 -  Add interface to get Linux die ID

intel-uncore-freq:
 -  Add attributes to show agent types
 -  Add attributes to show die_id

intel/vsec:
 -  Change return type of intel_vsec_register

Introduce dasharo-acpi platform driver:
 - Introduce dasharo-acpi platform driver

ISST:
 -  Do Not Restore SST MSRs on CPU Online Operation
 -  Support SST-PP revision 2
 -  Support SST-TF revision 2
 -  Update minor version

mellanox:
 -  Cosmetic changes to improve code style
 -  Introduce support of Nvidia smart switch
 -  Rename field to improve code readability

mlxbf-pmc:
 -  Support additional PMC blocks

mlx-platform:
 -  Add support for new Nvidia system

mlxreg-dpu:
 -  Add initial support for Nvidia DPU
 -  Fix smatch warnings

nvsw-sn2200:
 -  Add support for new system flavour
 -  Fix .items in nvsw_sn2201_busbar_hotplug

oxpec:
 -  Add a lower bounds check in oxp_psy_ext_set_prop()
 -  Add charge threshold and behaviour to OneXPlayer
 -  Add support for the OneXPlayer G1
 -  Add turbo led support to X1 devices
 -  Adhere to sysfs-class-hwmon and enable pwm on 2
 -  Convert defines to using tabs
 -  Follow reverse xmas convention for tt_toggle
 -  Make turbo val apply a bitmask
 -  Move fan speed read to separate function
 -  Move hwmon/oxp-sensors to platform/x86
 -  Move pwm_enable read to its own function
 -  Move pwm value read/write to separate functions
 -  Rename ec group to tt_toggle
 -  Rename rval to ret in tt_toggle

portwell-ec:
 -  Add GPIO and WDT driver for Portwell EC

power: supply:
 -  add inhibit-charge-awake to charge_behaviour

power: supply: core:
 -  Add additional health status values

silicom:
 -  use new GPIO line value setter callbacks

sony-laptop:
 -  Remove unused sony laptop camera code

thermal/drivers/acerhdf:
 -  Constify struct thermal_zone_device_ops

thinkpad-acpi:
 -  Add support for new hotkey for camera shutter switch

tools/power/x86/intel-speed-select:
 -  Skip uncore frequency update
 -  Support SST PP revision 2 fields
 -  v1.23 release

tuxedo:
 -  Add virtual LampArray for TUXEDO NB04 devices
 -  Prevent invalid Kconfig state

Use strscpy()/scnprintf() with acpi_device_name/class():
 - Use strscpy()/scnprintf() with acpi_device_name/class()

Merges:
 -  Merge branch 'fixes' into for-next
 -  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next

----------------------------------------------------------------
Antheas Kapenekakis (18):
      hwmon: (oxp-sensors) Distinguish the X1 variants
      hwmon: (oxp-sensors) Add all OneXFly variants
      platform/x86: oxpec: Move hwmon/oxp-sensors to platform/x86
      ABI: testing: sysfs-class-oxp: add missing documentation
      ABI: testing: sysfs-class-oxp: add tt_led attribute documentation
      platform/x86: oxpec: Rename ec group to tt_toggle
      platform/x86: oxpec: Add turbo led support to X1 devices
      platform/x86: oxpec: Move pwm_enable read to its own function
      platform/x86: oxpec: Move pwm value read/write to separate functions
      platform/x86: oxpec: Move fan speed read to separate function
      platform/x86: oxpec: Adhere to sysfs-class-hwmon and enable pwm on 2
      platform/x86: oxpec: Follow reverse xmas convention for tt_toggle
      power: supply: add inhibit-charge-awake to charge_behaviour
      platform/x86: oxpec: Add charge threshold and behaviour to OneXPlayer
      platform/x86: oxpec: Rename rval to ret in tt_toggle
      platform/x86: oxpec: Convert defines to using tabs
      platform/x86: oxpec: Make turbo val apply a bitmask
      platform/x86: oxpec: Add support for the OneXPlayer G1

Armin Wolf (6):
      platform/x86: msi-wmi-platform: Rename "data" variable
      platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug
      power: supply: core: Add additional health status values
      platform/x86: dell-ddv: Implement the battery matching algorithm
      platform/x86: dell-ddv: Expose the battery manufacture date to userspace
      platform/x86: dell-ddv: Expose the battery health to userspace

Arnd Bergmann (1):
      platform/x86/amd/hsmp: fix building with CONFIG_HWMON=m

Bartosz Golaszewski (3):
      platform/x86: barco-p50: use new GPIO line value setter callbacks
      platform/x86: int0002: use new GPIO line value setter callbacks
      platform/x86: silicom: use new GPIO line value setter callbacks

Chen Ni (1):
      platform: arm64: huawei-gaokun-ec: Remove unneeded semicolon

Christophe JAILLET (1):
      thermal/drivers/acerhdf: Constify struct thermal_zone_device_ops

Dan Carpenter (1):
      platform/x86: oxpec: Add a lower bounds check in oxp_psy_ext_set_prop()

David E. Box (1):
      platform/x86: intel_pmc_ipc: add option to build without ACPI

David Thompson (1):
      mlxbf-bootctl: use sysfs_emit_at() in secure_boot_fuse_state_show()

Denis Arefev (1):
      asus-laptop: Fix an uninitialized variable

Dr. David Alan Gilbert (1):
      platform/x86/sony-laptop: Remove unused sony laptop camera code

Gašper Nemgar (1):
      platform/x86: ideapad-laptop: add support for some new buttons

Gustavo A. R. Silva (1):
      platform/x86: Avoid -Wflex-array-member-not-at-end warning

Hans de Goede (17):
      platform/x86: x86-android-tablets: Add "9v" to Vexia EDU ATLA 10 tablet symbols
      platform/x86: x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V data
      platform/x86: int3472: Add skl_int3472_register_clock() helper
      platform/x86: int3472: Stop setting a supply-name for GPIO regulators
      platform/x86: int3472: Drop unused gpio field from struct int3472_gpio_regulator
      platform/x86: int3472: Rework AVDD second sensor quirk handling
      platform/x86: int3472: Make regulator supply name configurable
      platform/x86: int3472: Avoid GPIO regulator spikes
      platform/x86: int3472: Prepare for registering more than 1 GPIO regulator
      platform/x86: int3472: Add handshake pin support
      platform/x86: int3472: Debug log when remapping pins
      platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
      platform/x86: int3472: Move common.h to public includes, symbols to INTEL_INT3472
      platform/x86: int3472: Stop using devm_gpiod_get()
      platform/x86: int3472: Export int3472_discrete_parse_crs()
      platform/x86: int3472: Remove unused sensor_config struct member
      platform/x86: int3472: For mt9m114 sensors map powerdown to powerenable

Ilpo Järvinen (3):
      platform/x86: Use strscpy()/scnprintf() with acpi_device_name/class()
      Merge branch 'fixes' into for-next
      Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next

John Chau (1):
      platform/x86: thinkpad_acpi: Support also NEC Lavie X1475JAS

Krzysztof Kozlowski (1):
      platform: Do not enable by default during compile testing

Kurt Borja (23):
      platform/x86: alienware-wmi-wmax: Rename thermal related symbols
      platform/x86: alienware-wmi-wmax: Improve ID processing
      platform/x86: alienware-wmi-wmax: Improve internal AWCC API
      platform/x86: alienware-wmi-wmax: Modify supported_thermal_profiles[]
      platform/x86: alienware-wmi-wmax: Improve platform profile probe
      platform/x86: alienware-wmi-wmax: Add support for the "custom" thermal profile
      platform/x86: alienware-wmi-wmax: Add HWMON support
      platform/x86: alienware-wmi-wmax: Add support for manual fan control
      platform/x86: alienware-wmi-wmax: Add a DebugFS interface
      Documentation: wmi: Improve and update alienware-wmi documentation
      Documentation: admin-guide: laptops: Add documentation for alienware-wmi
      Documentation: ABI: Add sysfs platform and debugfs ABI documentation for alienware-wmi
      platform/x86: alienware-wmi-wmax: Add G-Mode support to Alienware m16 R1
      platform/x86: alienware-wmi-wmax: Extend support to more laptops
      platform/x86: alienware-wmi-wmax: Fix uninitialized variable due to bad error handling
      platform/x86: alienware-wmi-wmax: Add support for Alienware m15 R7
      platform/x86: dell-pc: Propagate errors when detecting feature support
      platform/x86: dell-pc: Use non-atomic bitmap operations
      platform/x86: dell-pc: Transition to faux device
      platform/x86: alienware-wmi-wmax: Fix uninitialized bitmap in awcc_hwmon_fans_init()
      platform/x86: alienware-wmi-wmax: Fix awcc_hwmon_fans_init() label logic
      platform/x86: alienware-wmi-wmax: Expose GPIO debug methods
      Documentation: wmi: alienware-wmi: Add GPIO control documentation

Luke D. Jones (2):
      hid-asus: check ROG Ally MCU version and warn
      platform/x86: asus-wmi: Refactor Ally suspend/resume

Luke Jones (1):
      platform/x86: asus-wmi: fix build without CONFIG_SUSPEND

Mario Limonciello (4):
      platform/x86: amd: pmf: Fix STT limits
      platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles
      drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC Policies
      drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies

Michał Kopeć (1):
      platform/x86: Introduce dasharo-acpi platform driver

Nathan Chancellor (1):
      platform: mellanox: nvsw-sn2200: Fix .items in nvsw_sn2201_busbar_hotplug

Nitin Joshi (1):
      platform/x86: thinkpad-acpi: Add support for new hotkey for camera shutter switch

Pavel Nikulin (1):
      platform/x86: asus-wmi: Disable OOBE state after resume from hibernation

Pratap Nirujogi (1):
      platform/x86: Add AMD ISP platform config for OV05C10

Runhua He (1):
      platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)

Saranya Gopal (1):
      platform/x86/intel: hid: Add Pantherlake support

Shouye Liu (1):
      platform/x86/intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug

Shravan Kumar Ramani (1):
      platform/mellanox: mlxbf-pmc: Support additional PMC blocks

Srinivas Pandruvada (12):
      platform/x86: ISST: Support SST-TF revision 2
      platform/x86: ISST: Support SST-PP revision 2
      platform/x86: ISST: Update minor version
      platform/x86: ISST: Do Not Restore SST MSRs on CPU Online Operation
      tools/power/x86/intel-speed-select: Support SST PP revision 2 fields
      tools/power/x86/intel-speed-select: Skip uncore frequency update
      tools/power/x86/intel-speed-select: v1.23 release
      platform/x86/intel-uncore-freq: Add attributes to show agent types
      Documentation: admin-guide: pm: Add documentation for agent_types
      platform/x86/intel: power-domains: Add interface to get Linux die ID
      platform/x86/intel-uncore-freq: Add attributes to show die_id
      Documentation: admin-guide: pm: Add documentation for die_id

Suma Hegde (4):
      platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive drivers
      platform/x86/amd/hsmp: Use a single DRIVER_VERSION for all hsmp modules
      platform/x86/amd/hsmp: Report power via hwmon sensors
      platform/x86/amd/hsmp: acpi: Add sysfs files to display HSMP telemetry

Sumanth Gavini (1):
      docs: ABI: Fix "aassociated" to "associated"

Vadim Pasternak (8):
      platform/mellanox: Rename field to improve code readability
      platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
      platform: mellanox: Introduce support of Nvidia smart switch
      platform: mellanox: Cosmetic changes to improve code style
      platform: mellanox: mlx-platform: Add support for new Nvidia system
      platform: mellanox: nvsw-sn2200: Add support for new system flavour
      Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
      platform/mellanox: mlxreg-dpu: Fix smatch warnings

Werner Sembach (2):
      platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
      platform/x86/tuxedo: Prevent invalid Kconfig state

Xi Pardee (11):
      platform/x86:intel/pmc: Move PMC Core related functions
      platform/x86:intel/pmc: Rename core_ssram to ssram_telemetry
      platform/x86:intel/pmc: Move PMC devid to core.h
      platform/x86:intel/pmc: Convert index variables to be unsigned
      platform/x86:intel/pmc: Remove unneeded header file inclusion
      platform/x86:intel/pmc: Remove unneeded io operations
      platform/x86:intel/vsec: Change return type of intel_vsec_register
      platform/x86:intel/pmc: Create Intel PMC SSRAM Telemetry driver
      platform/x86:intel/pmc: Use devm for mutex_init
      platform/x86:intel/pmc: Move error handling to init function
      platform/x86:intel/pmc: Improve pmc_core_get_lpm_req()

Yen-Chi Huang (1):
      platform/x86: portwell-ec: Add GPIO and WDT driver for Portwell EC

 Documentation/ABI/stable/sysfs-driver-mlxreg-io    |   98 +
 Documentation/ABI/testing/debugfs-alienware-wmi    |   64 +
 Documentation/ABI/testing/sysfs-bus-wmi            |    2 +-
 Documentation/ABI/testing/sysfs-class-power        |   13 +-
 .../ABI/testing/sysfs-platform-alienware-wmi       |   14 +
 Documentation/ABI/testing/sysfs-platform-oxp       |   25 +
 .../admin-guide/laptops/alienware-wmi.rst          |  127 +
 Documentation/admin-guide/laptops/index.rst        |    1 +
 .../pm/intel_uncore_frequency_scaling.rst          |   10 +
 Documentation/arch/x86/amd_hsmp.rst                |   30 +
 Documentation/hwmon/index.rst                      |    1 -
 Documentation/hwmon/oxp-sensors.rst                |   89 -
 Documentation/wmi/devices/alienware-wmi.rst        |  425 +--
 Documentation/wmi/devices/dell-wmi-ddv.rst         |   46 +-
 Documentation/wmi/devices/msi-wmi-platform.rst     |    4 +
 MAINTAINERS                                        |   30 +-
 drivers/hid/hid-asus.c                             |  111 +-
 drivers/hwmon/Kconfig                              |   11 -
 drivers/hwmon/Makefile                             |    1 -
 drivers/hwmon/oxp-sensors.c                        |  716 ----
 drivers/platform/arm64/Kconfig                     |    2 +-
 drivers/platform/arm64/huawei-gaokun-ec.c          |    2 +-
 drivers/platform/mellanox/Kconfig                  |   13 +
 drivers/platform/mellanox/Makefile                 |    1 +
 drivers/platform/mellanox/mlx-platform.c           | 3640 ++++++++++++++------
 drivers/platform/mellanox/mlxbf-bootctl.c          |    4 +-
 drivers/platform/mellanox/mlxbf-pmc.c              |  155 +-
 drivers/platform/mellanox/mlxreg-dpu.c             |  613 ++++
 drivers/platform/mellanox/mlxreg-hotplug.c         |    8 +-
 drivers/platform/mellanox/nvsw-sn2201.c            |  112 +-
 drivers/platform/surface/Kconfig                   |    2 +-
 drivers/platform/x86/Kconfig                       |   40 +
 drivers/platform/x86/Makefile                      |   12 +
 drivers/platform/x86/acerhdf.c                     |    4 +-
 drivers/platform/x86/amd/Kconfig                   |   11 +
 drivers/platform/x86/amd/Makefile                  |    1 +
 drivers/platform/x86/amd/amd_isp4.c                |  311 ++
 drivers/platform/x86/amd/hsmp/Kconfig              |    2 +
 drivers/platform/x86/amd/hsmp/Makefile             |    1 +
 drivers/platform/x86/amd/hsmp/acpi.c               |  270 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               |   25 +-
 drivers/platform/x86/amd/hsmp/hsmp.h               |   10 +
 drivers/platform/x86/amd/hsmp/hwmon.c              |  121 +
 drivers/platform/x86/amd/hsmp/plat.c               |   12 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |    7 +
 drivers/platform/x86/amd/pmc/pmc.c                 |    7 +-
 drivers/platform/x86/amd/pmf/auto-mode.c           |    4 +-
 drivers/platform/x86/amd/pmf/cnqf.c                |    8 +-
 drivers/platform/x86/amd/pmf/core.c                |   14 +
 drivers/platform/x86/amd/pmf/pmf.h                 |    1 +
 drivers/platform/x86/amd/pmf/sps.c                 |   12 +-
 drivers/platform/x86/amd/pmf/tee-if.c              |   29 +-
 drivers/platform/x86/asus-laptop.c                 |    9 +-
 drivers/platform/x86/asus-wmi.c                    |  162 +-
 drivers/platform/x86/barco-p50-gpio.c              |   10 +-
 drivers/platform/x86/dasharo-acpi.c                |  360 ++
 drivers/platform/x86/dell/Kconfig                  |    3 +-
 drivers/platform/x86/dell/alienware-wmi-wmax.c     | 1159 ++++++-
 drivers/platform/x86/dell/dell-pc.c                |   67 +-
 drivers/platform/x86/dell/dell-wmi-ddv.c           |  246 +-
 drivers/platform/x86/eeepc-laptop.c                |    4 +-
 drivers/platform/x86/ideapad-laptop.c              |   16 +
 drivers/platform/x86/intel/hid.c                   |   21 +-
 drivers/platform/x86/intel/int0002_vgpio.c         |    7 +-
 drivers/platform/x86/intel/int3472/Makefile        |    3 +-
 .../platform/x86/intel/int3472/clk_and_regulator.c |  173 +-
 drivers/platform/x86/intel/int3472/common.c        |    9 +-
 drivers/platform/x86/intel/int3472/discrete.c      |   69 +-
 .../platform/x86/intel/int3472/discrete_quirks.c   |   21 +
 drivers/platform/x86/intel/int3472/led.c           |    3 +-
 drivers/platform/x86/intel/int3472/tps68470.c      |    3 +-
 drivers/platform/x86/intel/pmc/Kconfig             |    4 +
 drivers/platform/x86/intel/pmc/Makefile            |    8 +-
 drivers/platform/x86/intel/pmc/arl.c               |   13 +-
 drivers/platform/x86/intel/pmc/core.c              |  240 +-
 drivers/platform/x86/intel/pmc/core.h              |   22 +-
 drivers/platform/x86/intel/pmc/core_ssram.c        |  332 --
 drivers/platform/x86/intel/pmc/mtl.c               |   10 +-
 drivers/platform/x86/intel/pmc/ssram_telemetry.c   |  204 ++
 drivers/platform/x86/intel/pmc/ssram_telemetry.h   |   24 +
 .../x86/intel/speed_select_if/isst_if_common.c     |   21 -
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |  103 +-
 drivers/platform/x86/intel/tpmi_power_domains.c    |   34 +-
 drivers/platform/x86/intel/tpmi_power_domains.h    |    1 +
 .../uncore-frequency/uncore-frequency-common.c     |   34 +
 .../uncore-frequency/uncore-frequency-common.h     |   20 +-
 .../intel/uncore-frequency/uncore-frequency-tpmi.c |   49 +
 .../x86/intel/uncore-frequency/uncore-frequency.c  |   13 +-
 drivers/platform/x86/intel/vsec.c                  |    9 +-
 drivers/platform/x86/msi-wmi-platform.c            |   99 +-
 drivers/platform/x86/oxpec.c                       | 1054 ++++++
 drivers/platform/x86/panasonic-laptop.c            |    4 +-
 drivers/platform/x86/portwell-ec.c                 |  291 ++
 drivers/platform/x86/silicom-platform.c            |   11 +-
 drivers/platform/x86/sony-laptop.c                 |  175 +-
 drivers/platform/x86/thinkpad_acpi.c               |   51 +-
 drivers/platform/x86/topstar-laptop.c              |    4 +-
 drivers/platform/x86/tuxedo/Kconfig                |    8 +
 drivers/platform/x86/tuxedo/Makefile               |    8 +
 drivers/platform/x86/tuxedo/nb04/Kconfig           |   17 +
 drivers/platform/x86/tuxedo/nb04/Makefile          |   10 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c          |  923 +++++
 drivers/platform/x86/tuxedo/nb04/wmi_util.c        |   91 +
 drivers/platform/x86/tuxedo/nb04/wmi_util.h        |  109 +
 drivers/platform/x86/x86-android-tablets/dmi.c     |   14 +-
 drivers/platform/x86/x86-android-tablets/other.c   |  124 +-
 .../x86/x86-android-tablets/x86-android-tablets.h  |    3 +-
 drivers/platform/x86/xo15-ebook.c                  |   10 +-
 drivers/power/supply/power_supply_sysfs.c          |    9 +-
 drivers/power/supply/test_power.c                  |    1 +
 include/linux/intel_vsec.h                         |    5 +-
 include/linux/platform_data/mlxreg.h               |    4 +-
 include/linux/platform_data/x86/asus-wmi.h         |   19 +
 .../linux/platform_data/x86/int3472.h              |   73 +-
 include/linux/platform_data/x86/intel_pmc_ipc.h    |    4 +
 include/linux/power_supply.h                       |    3 +
 include/linux/sony-laptop.h                        |   39 -
 include/uapi/linux/isst_if.h                       |   26 +
 tools/power/x86/intel-speed-select/isst-config.c   |   15 +-
 .../power/x86/intel-speed-select/isst-core-tpmi.c  |   12 +
 tools/power/x86/intel-speed-select/isst-display.c  |   20 +
 tools/power/x86/intel-speed-select/isst.h          |    3 +
 122 files changed, 10677 insertions(+), 3320 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-alienware-wmi
 create mode 100644 Documentation/ABI/testing/sysfs-platform-alienware-wmi
 create mode 100644 Documentation/ABI/testing/sysfs-platform-oxp
 create mode 100644 Documentation/admin-guide/laptops/alienware-wmi.rst
 delete mode 100644 Documentation/hwmon/oxp-sensors.rst
 delete mode 100644 drivers/hwmon/oxp-sensors.c
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c
 create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c
 create mode 100644 drivers/platform/x86/dasharo-acpi.c
 create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c
 delete mode 100644 drivers/platform/x86/intel/pmc/core_ssram.c
 create mode 100644 drivers/platform/x86/intel/pmc/ssram_telemetry.c
 create mode 100644 drivers/platform/x86/intel/pmc/ssram_telemetry.h
 create mode 100644 drivers/platform/x86/oxpec.c
 create mode 100644 drivers/platform/x86/portwell-ec.c
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h
 rename drivers/platform/x86/intel/int3472/common.h => include/linux/platform_data/x86/int3472.h (59%)
 delete mode 100644 include/linux/sony-laptop.h
