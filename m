Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DF2DFA25
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870603; cv=none; b=RJ8HmCkPO1Z410dkiTy1pSGWJFE9k2AQQh1dheZgP/LrZt7i0ao47hNPipD70Ei9Rs4kUesRurJnwVjNy2NClgZSNh/5WlWTACaC+Gj78hm2jRoWlnMJocJ85Zvo7MV17kcRb4j92ht34YQaG9rt70M89z0dK3nuSvwHfbZxh1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870603; c=relaxed/simple;
	bh=8IGZz6GoHU56QhoX/NNABxZoluk/t+azjDJL3oPPI1c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oMd9l2K9XMVHK25tDmQuLmsaD+Ej07AyeiZorg93ETvXNWw9ZyKm/y6aoSjAcHk/EFCLJNTLZ68xNnavqRrDqiONHshdgM3GekbGbAeGfD8RcEt+LSWv8b88NvKNCAhwQGKYiZf7G+1hnGYr7KmY+EMlpsDSUFYJXRY5o+jmn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBhZIZ6N; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBhZIZ6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870601; x=1782406601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8IGZz6GoHU56QhoX/NNABxZoluk/t+azjDJL3oPPI1c=;
  b=SBhZIZ6NYqNdKGZ5H49tFgmLXOc7vinJatQR7CqN45tJA8IRD4V/sNgg
   HgtSLNRjZu/VCqnFWtA/RoVV567JhnXx4uRUZS9r/raskn4uYUKwGO5GR
   PWpFXFwTPs/Gv++DF0R4AeCp6EvjLHwUEkwuzCC0mHrqoC0PxuiaE6g59
   MqwAlWX7yD2BTnVS7jRNcaLXH+I3327bIJS3QRJE5vKA/edra7a77V5Ay
   pia2Nc7b7HsCSNl0HuPLO1Pya92V3BI6oXrBuDLwZGdyoyNhhqjdICoxd
   mRA3fhVotAqCFn0oSvtRAqWiiPjJYRXMVQp3ZX9UA6grLO/Y+G9ZM+R7W
   Q==;
X-CSE-ConnectionGUID: tFf+qjSdRwG+PuiRaV5WtA==
X-CSE-MsgGUID: 5slwP4pRRLi6sx+A4xqJBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214416"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53214416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:41 -0700
X-CSE-ConnectionGUID: jdKm/Wy/QxK3+eYaJ+RhAw==
X-CSE-MsgGUID: 58hAyJMCSQOMCv748A3KMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151696593"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:36 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v4 00/10] Introducing firmware late binding
Date: Wed, 25 Jun 2025 22:30:05 +0530
Message-Id: <20250625170015.33912-1-badal.nilawar@intel.com>
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
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 465 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  81 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   3 +
 drivers/gpu/drm/xe/xe_pm.c                  |  10 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  66 +++
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 281 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  64 +++
 include/linux/mei_cl_bus.h                  |   1 +
 20 files changed, 1080 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

