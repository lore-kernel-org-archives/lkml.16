Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B41E9B3D;
	Thu,  3 Jul 2025 02:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509721; cv=none; b=lrS29XKg4r8Yqae5WaubWp/4LAv6NsWnnMG8GbgsSPvEYiPxXVKy6TS2jApmp3DJeFmC8QCzgnqv6gvpeLpdAW3KA+LhMo/Q9GelEGDRspuKgHc07QG70e8aZM9W5SV5HzNjkv8LcNWdsdbVE+LwVW66BcUf4OauLlHkTmwHyrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509721; c=relaxed/simple;
	bh=aU8FEVOH9p4QlopgS3RyFqvauECgUG+suhNF7f5naI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uEnBcK+U7AFRLPanuXLZ/ig5JP5MCg4KAqWeUT19eL8NgWEROE+Cc5x6NhCPS7vIKZI6yMeT18Be/qR+BPS+5PMf2+/8j+h/UARU77rpdskj0mUukOixo8TTuxe3mcVVJYcbvD0icgdT8rfOQmHygndF5SXpGZClU4q0twx/fA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gixsSHoc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gixsSHoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509720; x=1783045720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aU8FEVOH9p4QlopgS3RyFqvauECgUG+suhNF7f5naI8=;
  b=gixsSHoc1xk78TKtWNafZb7MEVWOsBqd+vBHqrXeuDO+3VczaCD9dNxH
   K9Smy0VIrY1ReZpUepMXTN0zn6EJ8oeD/LOZp2xQLhD6gsyfemjI3IyBq
   iQATQ4EZ6TfNyUgiN+TdU1nfYEDPRln05xp0U0zTM6E8gwjPY7No7j5IN
   F/6v1rceLpIvxvnW4MaUB6fj0+I5ain3HgyzU0qlPUD3zZv5ZTpDyuM4+
   gM+i/6jB/oSC/Yr8DbZmaClzkZjyA9MmG7vRqYFwUG2EddOGBCp6nb2Sl
   aH4XXtK/JaGuT98NKddGHm/GOzCaXuVCSUDtrHCaBALmOVGTO132lYnCa
   w==;
X-CSE-ConnectionGUID: m+WwS58mSfuvW2xmu5bFXw==
X-CSE-MsgGUID: Ue9WPEmESdmYH2cvWdZwGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450225"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:39 -0700
X-CSE-ConnectionGUID: v5xkgAXdQJ2ivHdMXrT4kA==
X-CSE-MsgGUID: rxPOhIkwRwWgNJLy4zSvCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594008"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:38 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH V3 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Date: Wed,  2 Jul 2025 19:28:15 -0700
Message-ID: <20250703022832.1302928-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch series introduces a new discovery driver for Intel Platform
Monitoring Technology (PMT) and a set of supporting changes to improve
telemetry integration across Intel VSEC features.

The primary goal of this series is to add the PMT Discovery driver, which
enumerates and exposes telemetry attributes by parsing hardware-provided
discovery tables from OOBMSM devices. In particular, the discovery driver
gathers detailed capability information (such as telemetry region
attributes) that will later enable direct access to telemetry regions via a
new API (intel_pmt_get_regions_by_feature()). This API is crucial for
retrieving data like per-RMID counters.

The remainder of the series consists of several preparatory and testing
patches:

1. Private Data and CPU Mapping:  The VSEC driver now includes
per-device private data to store the OOBMSM-to-CPU mapping. The TPMI driver
copies its platform info into this common area (via
intel_vsec_set_mapping()), allowing other VSEC features to access CPU
mapping information without redundant queries.

2. Device Links Enhancements:  With telemetry now depending on both the
TPMI driver (for CPU mapping) and the new discovery driver (for telemetry
region attributes), device links have been added and optimized. These
changes ensure that supplier drivers are probed and registered before
consumer drivers, enforcing the proper dependency order for reliable
telemetry feature access.

4. Discovery Driver and API:  The core of the series is the addition of
the PMT Discovery driver. This driver not only implements discovery of
telemetry attributes and capability data (exposed via sysfs) but also
introduces an API to retrieve telemetry regions by feature, which is
essential for features like per-RMID telemetry counters.

5. Testing:  A simple KUNIT test is provided for the enhanced discovery
API to ensure its reliability and correctness.

Together, these patches provide a foundation for future telemetry
enhancements in the Intel VSEC framework. They enable a unified interface
for accessing hardware telemetry capabilities and ensure that inter-driver
dependencies are properly managed through device links.

David E. Box (15):
  MAINTAINERS: Add link to documentation of Intel PMT ABI
  platform/x86/intel/vsec: Add private data for per-device data
  platform/x86/intel/vsec: Create wrapper to walk PCI config space
  platform/x86/intel/vsec: Add device links to enforce dependencies
  platform/x86/intel/vsec: Skip absent features during initialization
  platform/x86/intel/vsec: Skip driverless features
  platform/x86/intel/vsec: Add new Discovery feature
  platform/x86/intel/pmt: Add PMT Discovery driver
  docs: Add ABI documentation for intel_pmt feature directories
  platform/x86/intel/tpmi: Relocate platform info to intel_vsec.h
  platform/x86/intel/vsec: Set OOBMSM to CPU mapping
  platform/x86/intel/tpmi: Get OOBMSM CPU mapping from TPMI
  platform/x86/intel/pmt/discovery: Get telemetry attributes
  platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry
    regions by feature
  platform/x86/intel/pmt: KUNIT test for PMT Enhanced Discovery API

 .../testing/sysfs-class-intel_pmt-features    | 134 ++++
 MAINTAINERS                                   |   2 +
 drivers/platform/x86/intel/plr_tpmi.c         |   3 +-
 drivers/platform/x86/intel/pmt/Kconfig        |  27 +
 drivers/platform/x86/intel/pmt/Makefile       |   4 +
 drivers/platform/x86/intel/pmt/class.c        |  35 +-
 drivers/platform/x86/intel/pmt/class.h        |   9 +
 .../platform/x86/intel/pmt/discovery-kunit.c  | 116 ++++
 drivers/platform/x86/intel/pmt/discovery.c    | 635 ++++++++++++++++++
 drivers/platform/x86/intel/pmt/features.c     | 205 ++++++
 drivers/platform/x86/intel/pmt/telemetry.c    |  94 ++-
 .../intel/speed_select_if/isst_tpmi_core.c    |   9 +-
 .../uncore-frequency/uncore-frequency-tpmi.c  |   7 +-
 drivers/platform/x86/intel/vsec.c             | 372 +++++++++-
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 drivers/powercap/intel_rapl_tpmi.c            |   9 +-
 include/linux/intel_pmt_features.h            | 157 +++++
 include/linux/intel_tpmi.h                    |  27 +-
 include/linux/intel_vsec.h                    |  98 ++-
 19 files changed, 1885 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-features
 create mode 100644 drivers/platform/x86/intel/pmt/discovery-kunit.c
 create mode 100644 drivers/platform/x86/intel/pmt/discovery.c
 create mode 100644 drivers/platform/x86/intel/pmt/features.c
 create mode 100644 include/linux/intel_pmt_features.h


base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
--=20
2.43.0

