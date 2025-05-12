Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066162676CD;
	Mon, 12 May 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048486; cv=none; b=UylQVuDiz7ihpe+IuCpmdgvNEnX2j9u4VJ8yrhx+HS+5L8RZDY69h/tU9LYYGcxQ9pBPB9gmRcUPoVCY9Kul0V7Wgno1LTAk/bw+Px3fAilHaj4pn7iy4XfEIm56alFncdtPhoCGhAa8NL92i/nSrT38whL0wYk9jAoYjyZ9zf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048486; c=relaxed/simple;
	bh=6EmgmCvjRa47+4NjQxLC6tai47iBwAe4uyjQHadtNMA=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=NyQxUEVx9cv2hHdhrP6pYIGrepmUZBGDV/8+QKW1tNzAiEVBSz866vAu2QX169INvzS0YmFWfJgRoByjX3HrLw1UQBknbMplMr3KwA/h6UXvrIzfYFAwcUHYyc3YCa9HMl0NhWoFA+Oh8jHg4RWI7SIWKSym53+X5+Qyp0x76Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5eWEKNp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5eWEKNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747048485; x=1778584485;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6EmgmCvjRa47+4NjQxLC6tai47iBwAe4uyjQHadtNMA=;
  b=g5eWEKNp46KDi9Zz1JLJx/vbHkhUV0pLArwg70LCFXAKLxnekaLQTBdH
   2oITXdcNUp7vWS0JuKASZDPg0wluQxECJ5y+IufNWZWrhPp5Ff8UiIjZF
   eMOK4iBQNtMf3DrSg8S+YqLIpiePTr0DtO0vRAK1TLt1sPO9rCBRnuOar
   E2zwLjbV2FFkCbqONdlDzfpBlPCNRl99p9m0cn81BQjaeK/m7TL507C2C
   IDDHjW5bAYxUP7PqOzC1Rw8hjuYxEMv50lVaUGy+YHoq+m5tuSH+WndTS
   t70fAto1QEbRtwlgR8eSlEcYycM7twyGgElDcqHBMDBV7Z+/0go/djVLb
   w==;
X-CSE-ConnectionGUID: RHCiMNCpScuXCIyisTIjFQ==
X-CSE-MsgGUID: 9adHrIygTYeoaXv/WAmTlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48959469"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="48959469"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 04:14:44 -0700
X-CSE-ConnectionGUID: fEAUJk9iTtitR3u5+nmJWQ==
X-CSE-MsgGUID: Sbeo6BClRZ+pwou8bB0Fhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137371079"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 04:14:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 12 May 2025 14:12:46 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.15-5
Message-ID: <pdx86-pr-20250512141246-1833516743@linux.intel.com>
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

Fixes and new HW support

 - amd/pmc: Use spurious 8042 quirk with MECHREVO Wujie 14XA

 - amd/pmf:
   - Ensure Smart PC policies are valid
   - Fix memory leak when the engine fails to start

 - amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive drivers

 - asus-wmi: Fix wlan_ctrl_by_user detection

 - thinkpad_acpi: Add support for NEC Lavie X1475JAS
 
Regards, i.


The following changes since commit 02c6e43397c39edd0c172859bf8c851b46be09a8:

  platform/x86: ideapad-laptop: add support for some new buttons (2025-04-23 13:05:26 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-5

for you to fetch changes up to bfcfe6d335a967f8ea0c1980960e6f0205b5de6e:

  platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection (2025-05-07 15:46:34 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.15-5

Fixes and new HW support

 - amd/pmc: Use spurious 8042 quirk with MECHREVO Wujie 14XA

 - amd/pmf:
   - Ensure Smart PC policies are valid
   - Fix memory leak when the engine fails to start

 - amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive drivers

 - asus-wmi: Fix wlan_ctrl_by_user detection

 - thinkpad_acpi: Add support for NEC Lavie X1475JAS

The following is an automated shortlog grouped by driver:

amd/hsmp:
 -  Make amd_hsmp and hsmp_acpi as mutually exclusive drivers

amd/pmc:
 -  Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)

asus-wmi:
 -  Fix wlan_ctrl_by_user detection

drivers/platform/x86/amd: pmf:
 -  Check for invalid sideloaded Smart PC Policies
 -  Check for invalid Smart PC Policies

thinkpad_acpi:
 -  Support also NEC Lavie X1475JAS

----------------------------------------------------------------
Hans de Goede (1):
      platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection

John Chau (1):
      platform/x86: thinkpad_acpi: Support also NEC Lavie X1475JAS

Mario Limonciello (2):
      drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC Policies
      drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies

Runhua He (1):
      platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)

Suma Hegde (1):
      platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive drivers

 drivers/platform/x86/amd/hsmp/acpi.c      |  3 +--
 drivers/platform/x86/amd/hsmp/hsmp.h      |  1 +
 drivers/platform/x86/amd/hsmp/plat.c      |  6 +++++-
 drivers/platform/x86/amd/pmc/pmc-quirks.c |  7 +++++++
 drivers/platform/x86/amd/pmf/tee-if.c     | 23 ++++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.c           |  3 ++-
 drivers/platform/x86/thinkpad_acpi.c      |  2 ++
 7 files changed, 40 insertions(+), 5 deletions(-)
