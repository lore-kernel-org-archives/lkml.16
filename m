Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABDD236455;
	Thu, 17 Apr 2025 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888400; cv=none; b=uDsW3LiHqOVRD7hII2NHmBLFFLIg9HTbgmf4DLmJlypJ6rayO/IpEeU/j/WdrP3mxsNZTmNQUfRNhxt6OlgfEVToaQMlOd5w0AZgxzacxd5EGOEZVz9VMJua7h4mHfbwg+i7abVjDFnV/K5rCTfQSEW2epgBNUHgGRXnJi4yglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888400; c=relaxed/simple;
	bh=AlFyJTLGxn1D+5PMXQ3ld2oF8OOdvCw6hjycbBt+5gY=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=LjS27MWIK+dYchc0Ie0YKAlKTreu+oOkXcYGF4mDFWYs/Vfr6DAQXKfKYelu+U+aiLt3i8JLEEWtyCsAZLIEjIf2Rh3zbBhGtjwf1hQMxoIhuCYQFL8UZg3I5VmSmvRV2nqzdxbT6Nrz0rMelSyxxKBMl+mnPRBMljCQtXZB7jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkcX4A24; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkcX4A24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744888399; x=1776424399;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AlFyJTLGxn1D+5PMXQ3ld2oF8OOdvCw6hjycbBt+5gY=;
  b=PkcX4A24ajUN7+IyFy5PSkfp1REy7QIMujRx3NSuclayPti17mmSEX3n
   pBYfdNaTB2ZCltHTgPUlIrwikZCDTU68aTkumU8G2rCTKJXNH0fTlc4r9
   sz+CUJDU+kAzo5p9hdto+LSczj1wd11ifsiH7VtE4k5D3h+ML9DqPDTV2
   OC7jaMJIrbxV/PQE9bLQI00JhjK8ER6Nkz9SjeB2zfySg1zuPaIWpxZ0c
   k9pcCq3IlL+O2/GyN+qUw2lp+s/EeCu8QHtH4+HOY00LK1FeBCdSLT2Tx
   Ud8MQKsG/lxtDVPt39OtkU5zJ5WH3Ejw+LiawXFS4kuUKssJK6zGvnREe
   A==;
X-CSE-ConnectionGUID: CsyKQ4pwQA2fhIO5NppoDA==
X-CSE-MsgGUID: 2Pt2lQ/9RKmL4liGAb5vDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57854313"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57854313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:13:18 -0700
X-CSE-ConnectionGUID: yZsAbgyTQzKZkI2FLB3tzw==
X-CSE-MsgGUID: KIqVJwZwQouEnyUhqBXERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130633840"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:13:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 17 Apr 2025 14:10:51 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.15-3
Message-ID: <pdx86-pr-20250417141051-263296082@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.15.

Fixes:

 - amd/pmf: Fix STT limits

 - asus-laptop: Fix an uninitialized variable

 - intel_pmc_ipc: Allow building without ACPI

 - mlxbf-bootctl: Use sysfs_emit_at() in secure_boot_fuse_state_show()

 - msi-wmi-platform: Add locking to workaround ACPI firmware bug

New HW support:

 - alienware-wmi-wmax:
   - Extended thermal control support to:
     - Alienware Area-51m R2
     - Alienware m16 R1
     - Alienware m16 R2
     - Dell G16 7630
     - Dell G5 5505 SE
   - G-Mode support to Alienware m16 R1

 - x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V data

Regards, i.


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-3

for you to fetch changes up to baf2f2c2b4c8e1d398173acd4d2fa9131a86b84e:

  platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug (2025-04-16 11:15:22 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.15-3

Fixes:

 - amd/pmf: Fix STT limits

 - asus-laptop: Fix an uninitialized variable

 - intel_pmc_ipc: Allow building without ACPI

 - mlxbf-bootctl: Use sysfs_emit_at() in secure_boot_fuse_state_show()

 - msi-wmi-platform: Add locking to workaround ACPI firmware bug

New HW support:

 - alienware-wmi-wmax:
   - Extended thermal control support to:
     - Alienware Area-51m R2
     - Alienware m16 R1
     - Alienware m16 R2
     - Dell G16 7630
     - Dell G5 5505 SE
   - G-Mode support to Alienware m16 R1

 - x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V data

The following is an automated shortlog grouped by driver:

alienware-wmi-wmax:
 -  Add G-Mode support to Alienware m16 R1
 -  Extend support to more laptops

amd: pmf:
 -  Fix STT limits

asus-laptop:
 -  Fix an uninitialized variable

intel_pmc_ipc:
 -  add option to build without ACPI

mlxbf-bootctl:
 -  use sysfs_emit_at() in secure_boot_fuse_state_show()

msi-wmi-platform:
 -  Rename "data" variable
 -  Workaround a ACPI firmware bug

x86-android-tablets:
 -  Add "9v" to Vexia EDU ATLA 10 tablet symbols
 -  Add Vexia Edu Atla 10 tablet 5V data

----------------------------------------------------------------
Armin Wolf (2):
      platform/x86: msi-wmi-platform: Rename "data" variable
      platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug

David E. Box (1):
      platform/x86: intel_pmc_ipc: add option to build without ACPI

David Thompson (1):
      mlxbf-bootctl: use sysfs_emit_at() in secure_boot_fuse_state_show()

Denis Arefev (1):
      asus-laptop: Fix an uninitialized variable

Hans de Goede (2):
      platform/x86: x86-android-tablets: Add "9v" to Vexia EDU ATLA 10 tablet symbols
      platform/x86: x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V data

Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Add G-Mode support to Alienware m16 R1
      platform/x86: alienware-wmi-wmax: Extend support to more laptops

Mario Limonciello (1):
      platform/x86: amd: pmf: Fix STT limits

 Documentation/wmi/devices/msi-wmi-platform.rst     |   4 +
 drivers/platform/mellanox/mlxbf-bootctl.c          |   4 +-
 drivers/platform/x86/amd/pmf/auto-mode.c           |   4 +-
 drivers/platform/x86/amd/pmf/cnqf.c                |   8 +-
 drivers/platform/x86/amd/pmf/core.c                |  14 +++
 drivers/platform/x86/amd/pmf/pmf.h                 |   1 +
 drivers/platform/x86/amd/pmf/sps.c                 |  12 +-
 drivers/platform/x86/amd/pmf/tee-if.c              |   6 +-
 drivers/platform/x86/asus-laptop.c                 |   9 +-
 drivers/platform/x86/dell/alienware-wmi-wmax.c     |  48 ++++++++
 drivers/platform/x86/msi-wmi-platform.c            |  99 ++++++++++------
 drivers/platform/x86/x86-android-tablets/dmi.c     |  14 ++-
 drivers/platform/x86/x86-android-tablets/other.c   | 124 +++++++++++++++------
 .../x86/x86-android-tablets/x86-android-tablets.h  |   3 +-
 include/linux/platform_data/x86/intel_pmc_ipc.h    |   4 +
 15 files changed, 267 insertions(+), 87 deletions(-)
