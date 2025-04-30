Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE2188A0E;
	Wed, 30 Apr 2025 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048078; cv=none; b=tdOlW5SXHgxcL/azjys77SmoLMwpBUk5GUoLpRPcO93jHMevxrelQiSb+9fCO/0LbppsNyPmgErBpS/B9Z3H7hd/wYzrqk/C456fMK6tvan5fwJhkXMNWtM1DhsT7xNozXnVNlW7wKTcsx2k/4plwOaAoed3JiV0rBrSwr+F1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048078; c=relaxed/simple;
	bh=fuSiUxAxLqJh6jgx7pov6srdo4jhQp82tTuqF//n1pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tyYig+DJ154WiTVLiSOQPua8myMD6WJr3rzqwKpzhfWQ7NhOP5Pp+F/77d01p2ZMx7CyiyH8/Gdui9Gt/LtOCB4kcX2KSdnTpfSTEfgWK6kPLkyOuntKSfQV+KoUoLvtxB5IuMWr3pQTQXuQf7IYg4MFnxOkxh7s9dxFEk92D5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/Z6NqIh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/Z6NqIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048077; x=1777584077;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fuSiUxAxLqJh6jgx7pov6srdo4jhQp82tTuqF//n1pc=;
  b=K/Z6NqIh1qVZjQZI/RFv4YPabnWaajVspxhaXQ+XrX7ATU1PujhAnuV+
   NXD04al102fFew8XotkwGSUfplLaNEXRbUARyRNNerJS+Kt+EQ3YgUWOY
   ws1IFBv6uehrJ4AZVeK0rWkaq1lfcCUT3+WXqbRzVMtrEpJ99Sk1LhxoY
   7iAGAiYcoiz28US0SPzViXWrvp8XkUvZm1dTLdz+sb8+AQlqfg0Hja5ns
   VjJcinqw3Io9QN1ePA6PrFCiUKSGTUXbhlWl/Datzj0pJ3UtZlqO97iy3
   bgCwggkoXIodSFRC/Vahg2cIu13yY5HfHgHJsyWDSfPs/g8YNk5ucufUY
   g==;
X-CSE-ConnectionGUID: AVxt3+Z2RtK3Gj1AL+bgaQ==
X-CSE-MsgGUID: 9Ufu9qQnQ6il9DqBWo+htg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257530"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
X-CSE-ConnectionGUID: WaJJVR+cQ1eVfjdY1ghtdA==
X-CSE-MsgGUID: ivsd4NugQRWms092jLczow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972265"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
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
Subject: [PATCH 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Date: Wed, 30 Apr 2025 14:20:49 -0700
Message-ID: <20250430212106.369208-1-david.e.box@linux.intel.com>
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

 .../testing/sysfs-class-intel_pmt-features    | 128 ++++
 MAINTAINERS                                   |   2 +
 drivers/platform/x86/intel/plr_tpmi.c         |   3 +-
 drivers/platform/x86/intel/pmt/Kconfig        |  27 +
 drivers/platform/x86/intel/pmt/Makefile       |   4 +
 drivers/platform/x86/intel/pmt/class.c        |  35 +-
 drivers/platform/x86/intel/pmt/class.h        |   9 +
 .../platform/x86/intel/pmt/discovery-kunit.c  | 116 ++++
 drivers/platform/x86/intel/pmt/discovery.c    | 633 ++++++++++++++++++
 drivers/platform/x86/intel/pmt/features.c     | 205 ++++++
 drivers/platform/x86/intel/pmt/telemetry.c    |  94 ++-
 .../intel/speed_select_if/isst_tpmi_core.c    |   9 +-
 .../uncore-frequency/uncore-frequency-tpmi.c  |   5 +-
 drivers/platform/x86/intel/vsec.c             | 358 +++++++++-
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 drivers/powercap/intel_rapl_tpmi.c            |   9 +-
 include/linux/intel_pmt_features.h            | 157 +++++
 include/linux/intel_tpmi.h                    |  26 +-
 include/linux/intel_vsec.h                    |  97 ++-
 19 files changed, 1865 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-features
 create mode 100644 drivers/platform/x86/intel/pmt/discovery-kunit.c
 create mode 100644 drivers/platform/x86/intel/pmt/discovery.c
 create mode 100644 drivers/platform/x86/intel/pmt/features.c
 create mode 100644 include/linux/intel_pmt_features.h


base-commit: 67e2635fe0cca5f0383c0780db986d8237e83f0a
--=20
2.43.0

