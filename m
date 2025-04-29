Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C022676FE;
	Tue, 29 Apr 2025 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915150; cv=none; b=lOiD0DWACPKtFc1ObnC5O/zokFLyhSI6KIL2jCqBRXtA64vok3HQ9aVwqvZ1ecNk2keS/W/J/zwgmGFhzSBN1KB5yMY5fXnRkRPDl6HUXGZIgyCr+1lTA/9bFRNBnzTBo6AkoLMh+HefafLu12RI0/hsjzNe/UzX0HMqeMlVAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915150; c=relaxed/simple;
	bh=QgHt0DPwveKMPa/0IK3wVRz2UaQ2kbL35RtctM7eAlQ=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=HOIcD4+rroodqVHiHukwoDwSMgD4DanfXLwdyxCrT0uKE0o8X6jESMvFIpiDxgx4foUuGBvV5io/wlQIuNNY/7G4UjOVK2IHcwhXLEjlSH6ZLJd0US7iDTlK1cLVU+9vGY3A7g+mcFtBQXSmAoYMutb+xu8nhOdjsUFzEtmVd6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfmfVgS7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfmfVgS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745915149; x=1777451149;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QgHt0DPwveKMPa/0IK3wVRz2UaQ2kbL35RtctM7eAlQ=;
  b=DfmfVgS7vpoWMULFvilfPebXl7qt10w+ZApAcg5JjZDqehH0yPcnXs8J
   i8JEQcI1KgvKjYl7oT5oydHXQ1DnRGg3l+6A+zE0s3vPBqulExOqTjorF
   mrRkAxZgaeQWXr7kzMlJ/my7KTrthQWNRSS1obITWPAORgs7CwsrzGo6O
   cTl0QF7aeqGbqKim9XXdqKtRzo/yqHQh3eR0/PzwhTAbs0eP9TU6DUqga
   9rgRkOVZ+zi6Fw9JtZRjc78FdOPcnnGbBbuvLzEPoAOCje/220VSBQEyt
   y/5Z1aUgDf4IHm/HPv01U/na9+5/X8f73H/2btvWQoqaijrW/RGo7pBzO
   g==;
X-CSE-ConnectionGUID: rhN2uuSLS6SfJqild0JhPg==
X-CSE-MsgGUID: iOL/VQsPTQmuo9OOHZFDvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47663910"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47663910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:25:48 -0700
X-CSE-ConnectionGUID: RDGw6uRNQtOe2o0wnDCcqg==
X-CSE-MsgGUID: 9rGvZ+rjR92jwWhushJNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134270744"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:25:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 29 Apr 2025 11:24:34 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.15-4
Message-ID: <pdx86-pr-20250429112434-323291040@linux.intel.com>
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

- amd/pmc: Require at least 2.5 seconds between HW sleep cycles

- alienware-wmi-wmax:
  - Add support for Alienware m15 R7
  - Fix error handling to avoid uninitialized variable

- asus-wmi: Disable OOBE state also on resume

- ideapad-laptop: Support a few new buttons

- intel/hid: Add Panther Lake support

- intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug

Regards, i.


The following changes since commit baf2f2c2b4c8e1d398173acd4d2fa9131a86b84e:

  platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug (2025-04-16 11:15:22 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-4

for you to fetch changes up to 02c6e43397c39edd0c172859bf8c851b46be09a8:

  platform/x86: ideapad-laptop: add support for some new buttons (2025-04-23 13:05:26 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.15-4

Fixes and new HW support

- amd/pmc: Require at least 2.5 seconds between HW sleep cycles

- alienware-wmi-wmax:
  - Add support for Alienware m15 R7
  - Fix error handling to avoid uninitialized variable

- asus-wmi: Disable OOBE state also on resume

- ideapad-laptop: Support a few new buttons

- intel/hid: Add Panther Lake support

- intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug

The following is an automated shortlog grouped by driver:

alienware-wmi-wmax:
 -  Add support for Alienware m15 R7
 -  Fix uninitialized variable due to bad error handling

amd: pmc:
 -  Require at least 2.5 seconds between HW sleep cycles

asus-wmi:
 -  Disable OOBE state after resume from hibernation

ideapad-laptop:
 -  add support for some new buttons

intel: hid:
 -  Add Pantherlake support

intel-uncore-freq:
 -  Fix missing uncore sysfs during CPU hotplug

----------------------------------------------------------------
Gašper Nemgar (1):
      platform/x86: ideapad-laptop: add support for some new buttons

Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Fix uninitialized variable due to bad error handling
      platform/x86: alienware-wmi-wmax: Add support for Alienware m15 R7

Mario Limonciello (1):
      platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles

Pavel Nikulin (1):
      platform/x86: asus-wmi: Disable OOBE state after resume from hibernation

Saranya Gopal (1):
      platform/x86/intel: hid: Add Pantherlake support

Shouye Liu (1):
      platform/x86/intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug

 drivers/platform/x86/amd/pmc/pmc.c                  |  7 +++----
 drivers/platform/x86/asus-wmi.c                     | 11 ++++++++++-
 drivers/platform/x86/dell/alienware-wmi-wmax.c      | 14 ++++++++++----
 drivers/platform/x86/ideapad-laptop.c               | 16 ++++++++++++++++
 drivers/platform/x86/intel/hid.c                    | 21 +++++++++++----------
 .../x86/intel/uncore-frequency/uncore-frequency.c   | 13 +++++++++----
 6 files changed, 59 insertions(+), 23 deletions(-)
