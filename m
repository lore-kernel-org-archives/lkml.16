Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328A2E36E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647579; cv=none; b=mmSkIhc7rvASJRFp/xvfPkRA+hzMI6XU+MmfzM0kwoo+szMn/c2/9MMp2TAZ2JJ0gYZxLqItsTLfZmde+0VdkD9ghBCmQzTKL3kNdo5Knc+RICdS0Xmn11v5wCr5cEc+t7QtTJ+LpUMWkdvuI14uh16/KHOm4wjcP0B/b0KhyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647579; c=relaxed/simple;
	bh=Xz+BIWfy+iqBB+Sy7bC9qdoFxADPQTx8PM1maWvJsDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fekH/VGU+RiiKmCdFB9X7hEmigeA0zk2YhJNhAAflJzSkBl9zi+QLV6SprsEO2A+g74G5xajd/kWl0RHun1MHbe4GKXj0HWwEpjjtIS5lWr/Fseq71CMSJ3AR/XniE7ZHJiRAiNaDuuc6XxdbGGQTPOzID5RgzvaHfr4yQI4mxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMJPCia5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMJPCia5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751647577; x=1783183577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xz+BIWfy+iqBB+Sy7bC9qdoFxADPQTx8PM1maWvJsDU=;
  b=aMJPCia5lTIe51rRMr0NuyJGikHqWsQmENOqbXkvso/WdLYivKw7jbKZ
   wgiaMV62chg0Nn0dTaSjz0yFlN9n+LPl3r/jTT0umbFopJ4em5K4iJ+9d
   asmqqh0rRhOmjA0wC/lCcOfYnuLsSEIULR3GDEEQspY+x4miLyImLl+RE
   TPLzHa546r9RHOV5+p8QMdU1/EKRzWO/Bb99Ttz8djidunqGeVCAflQ3Q
   6HB246xu9309xd8S652D21hC9nrl1IadWQQQ0BMZF+J1VKlWEJ1Qo8RT4
   1pD1Zx6dqk4cbKlfxA/IVPkkYatOGuu6SIAe6hZnDYn30aypGjiRi64M1
   Q==;
X-CSE-ConnectionGUID: e445fw2PQbaQ0kKR431SPQ==
X-CSE-MsgGUID: pTRTFJk8RGy2/k5l9KxJZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57755765"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="57755765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:16 -0700
X-CSE-ConnectionGUID: zpZdKF4YQB2uVvGpkmOozg==
X-CSE-MsgGUID: HNY+mPyTRWyMC514adz6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154424639"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:14 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v7 00/10] Introducing firmware late binding
Date: Fri,  4 Jul 2025 22:20:28 +0530
Message-Id: <20250704165038.1464460-1-badal.nilawar@intel.com>
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
v7:
 xe_kmd:
 - resolved kernel doc warnings
 mei:
 - Address v6 review comments (greg kh)

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
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 462 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  75 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h           |   1 +
 drivers/gpu/drm/xe/xe_pm.c                  |   8 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  66 +++
 drivers/misc/mei/Kconfig                    |  11 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/mei_late_bind.c            | 271 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  62 +++
 include/linux/mei_cl_bus.h                  |   1 +
 19 files changed, 1045 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

