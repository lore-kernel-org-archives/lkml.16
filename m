Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC7319307F;
	Tue, 17 Jun 2025 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124452; cv=none; b=bUrfFCQzBgj9tggCaPzrqnJz6ZiFiWekwZYse/wad0jDex+mY4AyzjvbPxAmxv3h9bn4DbC6mhmeFMQ+PYhwk7E+I4m6cdyv6qfOgzh9+pDuuqK7cPcqxLz4mJZztCu5PPD2EOd83vuWauBiBB353PbeqkGwt5D/kFh0AHvf52o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124452; c=relaxed/simple;
	bh=wQ6MZV7f9lscQoKIvT/a+AYvr5KBF/pwE0GYxjHI5S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uej/+cjxszWsHeNATztas26NWkK0a2gw/NKjsGjWRZTgvPst0RzTYDnxfkzLp0XXWCvlLY7LjWSCM/Xc+aVC8GFPL2LJSS3t/lpr8i0PF/x1a6ck3df7ns4tDqT7YNNDpsFEaaWLcuC9qxmIMPUq4Yi5TBeYl4NHn9b9Yj1zBbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViGJH6j7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViGJH6j7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124451; x=1781660451;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wQ6MZV7f9lscQoKIvT/a+AYvr5KBF/pwE0GYxjHI5S8=;
  b=ViGJH6j7bgopSHPYG+OmcDswDQp456dwtYj6CyA+MgrnGN77lXF/03Yg
   pihln6fEY2Jscc3UzzmiJc2sI2IvVnnAOHJF4pg2X+PZydntvbeDUY0T4
   Bup06Yk4wwCh+0zvZHQIfAylWyjwnPc6eM7QhpCpiXuIyZQ9lODSaSnE7
   e2JZ06dTF1tEb2PsYq0VoUTm2et0uWMlW87o6MXBQfuTTx63OSBn8lJcM
   7KedN3oUHIrRaXTbzqYw1bQp6WXPfr+lgC0PwIYjtOoB3fvKElN6/KD5S
   6wVgXIfAuUfKhwEjxqAevu+qZh1FQUi2iqJXU1yif0q2gbkZR1/oKX91X
   Q==;
X-CSE-ConnectionGUID: owyQ0EQvRtSuRs7O0csm4A==
X-CSE-MsgGUID: YgiIDKGURg+TxLF2bP4OxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556528"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556528"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:50 -0700
X-CSE-ConnectionGUID: aQGb1JIUSBOcSwQJI5Dmtw==
X-CSE-MsgGUID: VovBetjjRJOfvND9v1n9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989433"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:49 -0700
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
Subject: [PATCH V2 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Date: Mon, 16 Jun 2025 18:40:24 -0700
Message-ID: <20250617014041.2861032-1-david.e.box@linux.intel.com>
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
 drivers/platform/x86/intel/vsec.c             | 363 +++++++++-
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 drivers/powercap/intel_rapl_tpmi.c            |   9 +-
 include/linux/intel_pmt_features.h            | 157 +++++
 include/linux/intel_tpmi.h                    |  27 +-
 include/linux/intel_vsec.h                    |  97 ++-
 19 files changed, 1877 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-features
 create mode 100644 drivers/platform/x86/intel/pmt/discovery-kunit.c
 create mode 100644 drivers/platform/x86/intel/pmt/discovery.c
 create mode 100644 drivers/platform/x86/intel/pmt/features.c
 create mode 100644 include/linux/intel_pmt_features.h


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
--=20
2.43.0

