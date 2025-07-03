Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912CD22A7F9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751570807; cv=none; b=oolltlYxGYTRwNU7xZlxClZAq/Eksdgs0tsn5VzULr883gqkERegJk9Oahn0ZxzcgV+4aImqiUeFw8UtqaSPIjFGjKt3478+wCbsBWBF3mFd8CFLBWpfgvrUeJhxCLpZbbMugNDnNRFinYibQ71mvph717/85MEREmgfL4lJkgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751570807; c=relaxed/simple;
	bh=9RTluMGj1g8RD7d0i52mXsmYAFSsoM546/tWGlFWYdE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bp8wQ8Quj6wgfDNCl1XhMTrPpEsjUsQMydWtTdyg45WeoTjSRDsWBqsS8hLvU7+EmjxLZkieGOcIfkTndL36EH1XLXNghQ3Q2KBZBisjL8L5/iB7Uvg8VQIWsz3OAv4VgXxooI2uwUHxAz6lIxM7vyfx7cn3E08sPVOZpKTXvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POAMDLPg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POAMDLPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751570805; x=1783106805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9RTluMGj1g8RD7d0i52mXsmYAFSsoM546/tWGlFWYdE=;
  b=POAMDLPgZjIb6aihfl65Re186uOXUY4hKDJ8eg9w/VweHy3X0soqL4On
   Rn3ejJaiqR2WeABNFGfOigxWH5ukwWqdRkbt4881VXxc61M1jwADNUE9d
   +yOJ9OHvAHdzBXq247E6jSEWw35V4UHew58x63xvZgiZVtKjxfVue3Qvh
   Qeq9WMvsEnR2ZHGAMvdeF/6pJNrdapULWpkmbf73sriNWVYA7k+qvdglp
   SFeoB/beWwIMi0T0jP6VmGPDqivHAyUg2I3v5v3MdZXxzs/SF0h+uT67I
   O2+QGg7Du3K0hnaOC9ux/tnuZHxDNdhiCDX3Kz8q6p1D6ILtHCRRuNgW8
   g==;
X-CSE-ConnectionGUID: o1sjcdNtS7abczSitL1FRA==
X-CSE-MsgGUID: DxO764axRdWKla0L+0t0gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65361985"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="65361985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:26:45 -0700
X-CSE-ConnectionGUID: 9Dn6TtZqR+ywhu72IhBjoA==
X-CSE-MsgGUID: 5uWW33KBQ9SR0glKFo/YOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="191624617"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:26:43 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v6 00/10] Introducing firmware late binding
Date: Fri,  4 Jul 2025 01:00:56 +0530
Message-Id: <20250703193106.954536-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introducing firmware late binding feature to enable firmware loading
for the devices, such as the fan controller and voltage regulator,
during the driver probe.
Typically, firmware for these devices are part of IFWI flash image but
can be replaced at probe after OEM tuning.

v2:
 - Dropped voltage regulator specific code as binaries for it will not
   be available for upstreaming as of now.
 - Address review comments
v3:
 - Dropped fwctl patch for now
 - Added new patch to extract binary version
 - Address v2 review comments
v4:
 - Address v3 review comments
v5:
 xe_kmd:
 - Dropped mutex is worker flush in unbind blocking component
   removal while fw download is in progress
 - Handled the fw load in all 3 scenarios (probe, system resume, rpm resume)
   by holding rpm wake ref in outer bounds of worker.
 mei:
 - Most of the review comments
v6:
 - rebased
 - Disabled fw load upon error

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (8):
  drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding
  drm/xe/xe_late_bind_fw: Extract and print version info
  drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI

 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  41 ++
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 461 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  77 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h           |   1 +
 drivers/gpu/drm/xe/xe_pm.c                  |   8 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  66 +++
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  64 +++
 include/linux/mei_cl_bus.h                  |   1 +
 21 files changed, 1061 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

