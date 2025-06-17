Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D01F9C1;
	Tue, 17 Jun 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163530; cv=none; b=DIkRTWvBm9g2E2gze7twH9F7DjqczgvB6FfwYqJ2l1GyqhNaoVnQczrJ1yrIJDp6iqJPbCnXwdHU0tVjB76Ai7iNlbtD1VbWwMUJD9RohrI/eTFE3uJ/BDgEQ6L7Ak8yMs2r3lEhyzF/4HwE4sFg/gUBUjH9dHGxW111pFFBSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163530; c=relaxed/simple;
	bh=LuiDLCiBmzOtrkWiGYzaos/vIBFgUoxHOmHYolNd7Lk=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=UmWSOsh+2GayQKVKVOca5Ohq8GZjaiSxd63+j72QlotteImvJTfZiOVO2igYgIan+mpLk9h0Y/aACAI3SZGPhV0iWM4J4DtIQBB1BKgw332bfnoN8DnD4q7tMN5eG6N5Qg0WpWKWFnhrMt4/RJCIUm8HZDTl6oELujcMbEhTskg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpEX4HTj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpEX4HTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750163529; x=1781699529;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LuiDLCiBmzOtrkWiGYzaos/vIBFgUoxHOmHYolNd7Lk=;
  b=QpEX4HTjGb+kOamxXGo8exyPO0M/+hM8+233XUrO6zScTd2dkEpF5AMX
   xHcaPTVpel4QivDfaHKSabBukmop+fjq14OfDj78iWm4b0fCuPLNoSElm
   /VQUev73vKTiVKPxndUapQa2dEGfvFwvScNaWEdHWh70ETyfkGxytf9Gi
   mKPHcDO+1H6YY8AovSb1GvEoWVxEv36L0gkra0HT2RZF+sTsg2RJ3a/wc
   S9pzEvQaEpCBGceHZw4Ljfuby3jv8ThnrRt9bai/hTYZSeX2Haj0UkTjL
   KNPSCpwf/zHUFjSFCIz9ZzTrfi+7i6NqutGjgjli0/gZhF/ugHPp5OPO1
   w==;
X-CSE-ConnectionGUID: JLKRNoqkQC2waMXm/O7BwA==
X-CSE-MsgGUID: ntB2BaFeSRCQY+zUE42TXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52252406"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52252406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:30:46 -0700
X-CSE-ConnectionGUID: 8RLb4unqRnShhIEZfTrZnQ==
X-CSE-MsgGUID: pNrz+SDnSDiOy62onCbY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="153656018"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.164])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:30:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>
Date: Tue, 17 Jun 2025 15:28:16 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.16-2
Message-ID: <pdx86-pr-20250617152816-1278911842@linux.intel.com>
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

Fixes and New HW Support

- amd/hsmp: Timeout handling fixes

- amd/pmc:

  - Clear metrics table at start of cycle

  - Add PCSpecialist Lafite Pro V 14M to 8042 quirks list

- amd/pmf: Fix error handling corner cases (nth attempt)

- alienware-wmi-wmax: Revert G-Mode support as it lowers performance

- dell_rbu:

  - Fix sparse lock context warning

  - Fix list head usage

  - Don't overwrite data buffer past the size of the last packet

- ideapad-laptop: Ensure EC is not polled too frequently

- intel-uncore-freq:

  - Fail module load when plat_info is NULL

  - Avoid a non-literal format string as it triggers a compiler warning

- intel/pmc: Add Lunar Lake and Panther Lake support to SSRAM Telemetry

- intel/power-domains: Fix error code in tpmi_init()

- samsung-galaxybook: Add support for Notebook 9 Pro and others (SAM0426)

Regards, i.


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-2

for you to fetch changes up to e2468dc700743683e1d1793bbd855e2536fd3de2:

  Revert "platform/x86: alienware-wmi-wmax: Add G-Mode support to Alienware m16 R1" (2025-06-13 15:09:02 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.16-2

Fixes and New HW Support

- amd/hsmp: Timeout handling fixes

- amd/pmc:

  - Clear metrics table at start of cycle

  - Add PCSpecialist Lafite Pro V 14M to 8042 quirks list

- amd/pmf: Fix error handling corner cases (nth attempt)

- alienware-wmi-wmax: Revert G-Mode support as it lowers performance

- dell_rbu:

  - Fix sparse lock context warning

  - Fix list head usage

  - Don't overwrite data buffer past the size of the last packet

- ideapad-laptop: Ensure EC is not polled too frequently

- intel-uncore-freq:

  - Fail module load when plat_info is NULL

  - Avoid a non-literal format string as it triggers a compiler warning

- intel/pmc: Add Lunar Lake and Panther Lake support to SSRAM Telemetry

- intel/power-domains: Fix error code in tpmi_init()

- samsung-galaxybook: Add support for Notebook 9 Pro and others (SAM0426)

The following is an automated shortlog grouped by driver:

amd/pmc:
 -  Add PCSpecialist Lafite Pro V 14M to 8042 quirks list

amd: pmc:
 -  Clear metrics table at start of cycle

amd: pmf:
 -  Prevent amd_pmf_tee_deinit() from running twice
 -  Simplify error flow in amd_pmf_init_smart_pc()
 -  Use device managed allocations

dell_rbu:
 -  Bump version
 -  Fix list usage
 -  Fix lock context warning
 -  Stop overwriting data buffer

ideapad-laptop:
 -  use usleep_range() for EC polling

intel/pmc:
 -  Add Lunar Lake support to Intel PMC SSRAM Telemetry
 -  Add Panther Lake support to Intel PMC SSRAM Telemetry

intel: power-domains:
 -  Fix error code in tpmi_init()

intel-uncore-freq:
 -  avoid non-literal format string
 -  Fail module load when plat_info is NULL

MAINTAINERS: .mailmap:
 -  Update Hans de Goede's email address

platform/x86: alienware-wmi-wmax:
 - Revert: Add G-Mode support to Alienware m16 R1

samsung-galaxybook:
 -  Add SAM0426

x86/platform/amd:
 -  move final timeout check to after final sleep
 -  replace down_timeout() with down_interruptible()

----------------------------------------------------------------
Arnd Bergmann (1):
      platform/x86/intel-uncore-freq: avoid non-literal format string

Dan Carpenter (1):
      platform/x86/intel: power-domains: Fix error code in tpmi_init()

Hans de Goede (1):
      MAINTAINERS: .mailmap: Update Hans de Goede's email address

Jake Hillion (2):
      x86/platform/amd: move final timeout check to after final sleep
      x86/platform/amd: replace down_timeout() with down_interruptible()

Joshua Grisham (1):
      platform/x86: samsung-galaxybook: Add SAM0426

Kurt Borja (1):
      Revert "platform/x86: alienware-wmi-wmax: Add G-Mode support to Alienware m16 R1"

Mario Limonciello (5):
      platform/x86/amd: pmc: Clear metrics table at start of cycle
      platform/x86/amd: pmf: Use device managed allocations
      platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
      platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()
      platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V 14M to 8042 quirks list

Rong Zhang (1):
      platform/x86: ideapad-laptop: use usleep_range() for EC polling

Srinivas Pandruvada (1):
      platform/x86/intel-uncore-freq: Fail module load when plat_info is NULL

Stuart Hayes (4):
      platform/x86: dell_rbu: Fix lock context warning
      platform/x86: dell_rbu: Fix list usage
      platform/x86: dell_rbu: Stop overwriting data buffer
      platform/x86: dell_rbu: Bump version

Xi Pardee (2):
      platform/x86/intel/pmc: Add Lunar Lake support to Intel PMC SSRAM Telemetry
      platform/x86/intel/pmc: Add Panther Lake support to Intel PMC SSRAM Telemetry

 .mailmap                                           |   1 +
 MAINTAINERS                                        |  72 +++++++-------
 drivers/platform/x86/amd/hsmp/hsmp.c               |  14 ++-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |   9 ++
 drivers/platform/x86/amd/pmc/pmc.c                 |   2 +
 drivers/platform/x86/amd/pmf/core.c                |   3 +-
 drivers/platform/x86/amd/pmf/tee-if.c              | 108 ++++++++-------------
 drivers/platform/x86/dell/alienware-wmi-wmax.c     |   2 +-
 drivers/platform/x86/dell/dell_rbu.c               |  10 +-
 drivers/platform/x86/ideapad-laptop.c              |  19 +++-
 drivers/platform/x86/intel/pmc/core.h              |   7 ++
 drivers/platform/x86/intel/pmc/ssram_telemetry.c   |   3 +
 drivers/platform/x86/intel/tpmi_power_domains.c    |   4 +-
 .../uncore-frequency/uncore-frequency-common.c     |   2 +-
 .../intel/uncore-frequency/uncore-frequency-tpmi.c |   9 +-
 drivers/platform/x86/samsung-galaxybook.c          |   1 +
 16 files changed, 137 insertions(+), 129 deletions(-)
