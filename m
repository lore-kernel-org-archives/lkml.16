Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB17C2F3E;
	Fri, 23 May 2025 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995526; cv=none; b=dItq0YTv3W+xDLscEAm7ELvqaolMTvQpenhKRqsln0KgA3gVU926h4kSlWmaKSd01XN2xmHSHpIWd0sFjrHOUW5/dlNjGt/Qgg1p5GB//6I2mZtdSGe1jpaE37KIpj/2QiaDNHdDtQXV5BuGUFUVyMQ0NmNSOdDn+i5V1M1bNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995526; c=relaxed/simple;
	bh=Fy38s9E9y03KrAq33nFmiJB8kK3AKrmMx6Y899eu74o=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=WAE3O37HIx/nGTdYur8GclJxHgMbzOD46EE3omJtJvKjPdHg4w+pghP5Yr54TdzM7scVuMpTNIgBVxQlRpWklWJMT1+AjwQogpzn0vWemi3sdwEqfsT6d8D7gzKPDEDsgGiLm2fr+vReeyXWpJIkorQv/a52lb8vFMCZWeSVEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSh5IXs1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSh5IXs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747995525; x=1779531525;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fy38s9E9y03KrAq33nFmiJB8kK3AKrmMx6Y899eu74o=;
  b=kSh5IXs1X2vLQ55wcq1GyCBrNM7eKRNlg+EGEHxYYdY0rrPtPRbXogqL
   l9RlGNt9cjsnjt2ZV5TeUwX8P9uNtVx+tEiyc9u8cEoIt72G8EKiP52Ft
   jT12zReNn3O1f4AYA7SHT1YUNXsC8irWg8M4cBnHZQTxZDlyVr8iUvpAq
   TyD3T6U6jlbQlomqx5F5uGl8JVQh78ktAr+P2ayIph8KIt6fnqqWKJtHg
   3cLHCdVbVTo5/yG6HeGukVb64Cbl9lcczjiGkpgeP1gJ4sn0tMQu8SoyL
   ObVqcofsysuBzVZaIOO+snowduPvfyl/7MwQrZc/b4HpA219BQ8CXISZw
   w==;
X-CSE-ConnectionGUID: apEK6hoERN6mJkiQGpq66A==
X-CSE-MsgGUID: /I3vfh8oTsWhS/52eRJuGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50194928"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="50194928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 03:18:44 -0700
X-CSE-ConnectionGUID: OW+tsV7sQ9OvqpS13EoxUw==
X-CSE-MsgGUID: phajeoXXRBWZCif8JdWxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141147204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 03:18:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 23 May 2025 12:10:19 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.15-6
Message-ID: <pdx86-pr-20250523121019-62803604@linux.intel.com>
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

The committing date is very recent due me fixing small errors in the
changelog while preparing this PR but the same code has been sitting
in the linux-next for a few days.

Fixes and new HW support

 - dell-wmi-sysman: Avoid buffer overflow in current_password_store()

 - fujitsu-laptop: Support Lifebook S2110 hotkeys

 - intel/pmc: Fix Arrow Lake U/H NPU PCI ID

 - think-lmi: Fix attribute name usage for non-compliant items

 - thinkpad_acpi: Ignore battery threshold change event notification

Regards, i.


The following changes since commit bfcfe6d335a967f8ea0c1980960e6f0205b5de6e:

  platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection (2025-05-07 15:46:34 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-6

for you to fetch changes up to f2eae58c4428bd792c8e91e3666ab0718d87b44a:

  platform/x86/intel/pmc: Fix Arrow Lake U/H NPU PCI ID (2025-05-23 12:04:54 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.15-6

Fixes and new HW support

 - dell-wmi-sysman: Avoid buffer overflow in current_password_store()

 - fujitsu-laptop: Support Lifebook S2110 hotkeys

 - intel/pmc: Fix Arrow Lake U/H NPU PCI ID

 - think-lmi: Fix attribute name usage for non-compliant items

 - thinkpad_acpi: Ignore battery threshold change event notification

The following is an automated shortlog grouped by driver:

dell-wmi-sysman:
 -  Avoid buffer overflow in current_password_store()

fujitsu-laptop:
 -  Support Lifebook S2110 hotkeys

intel/pmc:
 -  Fix Arrow Lake U/H NPU PCI ID

think-lmi:
 -  Fix attribute name usage for non-compliant items

thinkpad_acpi:
 -  Ignore battery threshold change event notification

----------------------------------------------------------------
Mark Pearson (2):
      platform/x86: thinkpad_acpi: Ignore battery threshold change event notification
      platform/x86: think-lmi: Fix attribute name usage for non-compliant items

Todd Brandt (1):
      platform/x86/intel/pmc: Fix Arrow Lake U/H NPU PCI ID

Valtteri Koskivuori (1):
      platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys

Vladimir Moskovkin (1):
      platform/x86: dell-wmi-sysman: Avoid buffer overflow in current_password_store()

 .../x86/dell/dell-wmi-sysman/passobj-attributes.c  |  2 +-
 drivers/platform/x86/fujitsu-laptop.c              | 33 +++++++++++++++++++---
 drivers/platform/x86/intel/pmc/arl.c               |  3 +-
 drivers/platform/x86/think-lmi.c                   | 26 +++++++++--------
 drivers/platform/x86/think-lmi.h                   |  1 +
 drivers/platform/x86/thinkpad_acpi.c               |  5 ++++
 6 files changed, 52 insertions(+), 18 deletions(-)
