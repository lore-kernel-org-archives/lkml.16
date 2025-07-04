Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E21C84C7;
	Fri,  4 Jul 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639971; cv=none; b=nP0TopR+r9sdvMnzp0BKF/RF102MVG84taW+LRkdorRnSWDt2U/p3034G3nXG8bMwz78itTMeRB9LNutVZ26RxVMJxG/G2tKcyRx5DYrsAek2pNOfj11mdjUgoEsPkM6UV5inuC67tKSkqvGbG3Eic70FEY/5D8jPgaUg9UEoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639971; c=relaxed/simple;
	bh=15CM4LWYK7Wpl5txdeYXrBWZ994P2uRFaj8WRUUK88c=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=A28EDaMc/TyGJ1yyCzOWy8E9Eu0SoJB0XjIHZFJnOUew4mPaRJkgTMZMeTjKpy8h54Q4krqVaQqC0f5nuDSZb2uSlBWqbGmEEJ8rBCMTpuZAXMrVFg93oen5V4+uPIVBm/ztZ7Y1HCR68jwjvMM0b/EuUqzaVfSbwRNFpAE8jj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkFYfXwo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkFYfXwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751639970; x=1783175970;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=15CM4LWYK7Wpl5txdeYXrBWZ994P2uRFaj8WRUUK88c=;
  b=HkFYfXwoFi34CAx1vtfL5Ja2v2I1hObsWan2p5vP3YnYRxPJiPfivXKg
   ShMijX6TG8eAlKrHzvuKrlxKfyUs0YdQv7oDxhwz89HACEezwrZzbL7WN
   SnVQMnzdXlZaw9iHZBV8v/qkXKvy8ba4W2DHTKUSqRoBW3ifUSqmaxYvq
   L1u30rpCNo4hHJIIbk8OJQvojKxue6T+duA2ExwLWqSEA4t/JICH/oMrj
   VQd+/TPDqVYRD0dXSDdWLFd1RqKe8j2UPQOyUXKtboRUkS/vUyN7nSiay
   60fI5LOjtVykE+uTfPBykBk5Gxa2n8r41rtsbs54csjF1z48ltqV8M713
   A==;
X-CSE-ConnectionGUID: ivJrvhTOT/iOgV2mLy5oNw==
X-CSE-MsgGUID: YwxnKhjgQnCBxDLHoSh0qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="41601256"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="41601256"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 07:39:29 -0700
X-CSE-ConnectionGUID: mQiG27VQRlCLmhH1k/HDIQ==
X-CSE-MsgGUID: E2DPk0xJQKCYgOZ9lqVFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155140410"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 07:39:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 04 Jul 2025 17:26:33 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.16-3
Message-ID: <pdx86-pr-20250704172633-53246370@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.16.

Mostly a few lines fixed here and there except amd/isp4 which improves
swnodes relationships but that is a new driver not in any stable kernels
yet. The think-lmi driver changes also look relatively large but there
are just many fixes to it.

The i2c/piix4 change is a effectively a revert of the commit 7e173eb82ae9
("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86") but that
required moving the header out from arch/x86 under
include/linux/platform_data/.


Fixes and New HW Support

- amd/isp4: Improve swnode graph (new driver exception)

- asus-nb-wmi: Use duo keyboard quirk for Zenbook Duo UX8406CA

- dell-lis3lv02d: Add Latitude 5500 accelerometer address

- dell-wmi-sysman: Fix WMI data block retrieval and class dev unreg

- hp-bioscfg: Fix class device unregistration

- i2c: piix4: Re-enable on non-x86 + move FCH header under platform_data/

- intel/hid: Wildcat Lake support

- mellanox:

  - mlxbf-pmc: Fix duplicate event ID

  - mlxbf-tmfifo: Fix vring_desc.len assignment

  - mlxreg-lc: Fix bit-not-set logic check

  - nvsw-sn2201: Fix bus number in error message & spelling errors

- portwell-ec: Move watchdog device under correct platform hierarchy

- think-lmi: Error handling fixes (sysfs, kset, kobject, class dev unreg)

- thinkpad_acpi: Handle HKEY 0x1402 event (2025 Thinkpads)

- wmi: Fix WMI event enablement

Regards, i.


The following changes since commit e2468dc700743683e1d1793bbd855e2536fd3de2:

  Revert "platform/x86: alienware-wmi-wmax: Add G-Mode support to Alienware m16 R1" (2025-06-13 15:09:02 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-3

for you to fetch changes up to 4f30f946f27b7f044cf8f3f1f353dee1dcd3517a:

  platform/x86: think-lmi: Fix sysfs group cleanup (2025-07-02 12:01:25 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.16-3

Fixes and New HW Support

- amd/isp4: Improve swnode graph (new driver exception)

- asus-nb-wmi: Use duo keyboard quirk for Zenbook Duo UX8406CA

- dell-lis3lv02d: Add Latitude 5500 accelerometer address

- dell-wmi-sysman: Fix WMI data block retrieval and class dev unreg

- hp-bioscfg: Fix class device unregistration

- i2c: piix4: Re-enable on non-x86 + move FCH header under platform_data/

- intel/hid: Wildcat Lake support

- mellanox:

  - mlxbf-pmc: Fix duplicate event ID

  - mlxbf-tmfifo: Fix vring_desc.len assignment

  - mlxreg-lc: Fix bit-not-set logic check

  - nvsw-sn2201: Fix bus number in error message & spelling errors

- portwell-ec: Move watchdog device under correct platform hierarchy

- think-lmi: Error handling fixes (sysfs, kset, kobject, class dev unreg)

- thinkpad_acpi: Handle HKEY 0x1402 event (2025 Thinkpads)

- wmi: Fix WMI event enablement

The following is an automated shortlog grouped by driver:

asus-nb-wmi:
 -  add DMI quirk for ASUS Zenbook Duo UX8406CA

dell-lis3lv02d:
 -  Add Latitude 5500

dell-wmi-sysman:
 -  Fix class device unregistration
 -  Fix WMI data block retrieval in sysfs callbacks

hp-bioscfg:
 -  Fix class device unregistration

i2c:
 -  Re-enable piix4 driver on non-x86

intel/hid:
 -  Add Wildcat Lake support

mellanox:
 -  Fix spelling and comment clarity in Mellanox drivers

mlxbf-pmc:
 -  Fix duplicate event ID for CACHE_DATA1

mlxbf-tmfifo:
 -  fix vring_desc.len assignment

mlxreg-lc:
 -  Fix logic error in power state check

Move FCH header to a location accessible by all archs:
 - Move FCH header to a location accessible by all archs

nvsw-sn2201:
 -  Fix bus number in adapter error message

portwell-ec:
 -  Move watchdog device under correct platform hierarchy

think-lmi:
 -  Create ksets consecutively
 -  Fix class device unregistration
 -  Fix kobject cleanup
 -  Fix sysfs group cleanup

thinkpad_acpi:
 -  handle HKEY 0x1402 event

Update swnode graph for amd isp4:
 - Update swnode graph for amd isp4

wmi:
 -  Fix WMI event enablement
 -  Update documentation of WCxx/WExx ACPI methods

----------------------------------------------------------------
Alok Tiwari (4):
      platform/mellanox: mlxbf-pmc: Fix duplicate event ID for CACHE_DATA1
      platform/mellanox: Fix spelling and comment clarity in Mellanox drivers
      platform/mellanox: nvsw-sn2201: Fix bus number in adapter error message
      platform/mellanox: mlxreg-lc: Fix logic error in power state check

Armin Wolf (2):
      platform/x86: wmi: Fix WMI event enablement
      platform/x86: wmi: Update documentation of WCxx/WExx ACPI methods

David Thompson (1):
      platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment

Ivan Hu (1):
      platform/x86: portwell-ec: Move watchdog device under correct platform hierarchy

Kurt Borja (7):
      platform/x86: dell-wmi-sysman: Fix WMI data block retrieval in sysfs callbacks
      platform/x86: hp-bioscfg: Fix class device unregistration
      platform/x86: think-lmi: Fix class device unregistration
      platform/x86: dell-wmi-sysman: Fix class device unregistration
      platform/x86: think-lmi: Create ksets consecutively
      platform/x86: think-lmi: Fix kobject cleanup
      platform/x86: think-lmi: Fix sysfs group cleanup

Mario Limonciello (2):
      Move FCH header to a location accessible by all archs
      i2c: Re-enable piix4 driver on non-x86

Mark Pearson (1):
      platform/x86: thinkpad_acpi: handle HKEY 0x1402 event

Paul Menzel (1):
      platform/x86: dell-lis3lv02d: Add Latitude 5500

Pratap Nirujogi (1):
      platform/x86: Update swnode graph for amd isp4

Rahul Chandra (1):
      platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8406CA

Srinivas Pandruvada (1):
      platform/x86/intel/hid: Add Wildcat Lake support

 Documentation/wmi/acpi-interface.rst               |  14 +-
 arch/x86/kernel/cpu/amd.c                          |   2 +-
 drivers/i2c/busses/Kconfig                         |   2 +-
 drivers/i2c/busses/i2c-piix4.c                     |   2 +-
 drivers/platform/mellanox/mlxbf-pmc.c              |   2 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c           |   5 +-
 drivers/platform/mellanox/mlxreg-dpu.c             |   2 +-
 drivers/platform/mellanox/mlxreg-lc.c              |  12 +-
 drivers/platform/mellanox/nvsw-sn2201.c            |   2 +-
 drivers/platform/x86/amd/amd_isp4.c                | 181 ++++++++++++++++-----
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |   2 +-
 drivers/platform/x86/asus-nb-wmi.c                 |   9 +
 drivers/platform/x86/dell/dell-lis3lv02d.c         |   1 +
 .../x86/dell/dell-wmi-sysman/dell-wmi-sysman.h     |   5 +
 .../x86/dell/dell-wmi-sysman/enum-attributes.c     |   5 +-
 .../x86/dell/dell-wmi-sysman/int-attributes.c      |   5 +-
 .../x86/dell/dell-wmi-sysman/passobj-attributes.c  |   5 +-
 .../x86/dell/dell-wmi-sysman/string-attributes.c   |   5 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c |  12 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   4 +-
 drivers/platform/x86/intel/hid.c                   |   1 +
 drivers/platform/x86/portwell-ec.c                 |   1 +
 drivers/platform/x86/think-lmi.c                   |  94 ++++-------
 drivers/platform/x86/thinkpad_acpi.c               |   1 +
 drivers/platform/x86/wmi.c                         |  16 +-
 .../linux/platform_data/x86/amd-fch.h              |   0
 26 files changed, 250 insertions(+), 140 deletions(-)
 rename arch/x86/include/asm/amd/fch.h => include/linux/platform_data/x86/amd-fch.h (100%)
