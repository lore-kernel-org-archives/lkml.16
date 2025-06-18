Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00092F49EA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272994; cv=none; b=ARfjgVNMkFA288QRXZgQIlSZEQRZYDhYzFlwzB5X7uYrnFEf8U8Ne+r1GaS2xwt/3iB26Ef8SfG0BfNVHUggyAPX/5eqt79y9fQUWamVe6Zi65vQ1gZCU/JB0asF9KEInkHnOwCbtwuys0IonDX6totoXvKweerRSCEIblTuciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272994; c=relaxed/simple;
	bh=z9br5LrInIVljMQihGbbAUPVThEIeJYu70LptYg3ObQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JeTvXtJpsbVPjYhyRAfuWXETrMWk0rAgvzHIPQWswu4agvBaC7KzmwfHlCMNideMQuF4ih03UnDuz/92jfLYjyPclf7n4ClnuxqZp4TiirptrNCcpNIj1cJmq88h0eGQWihhOBqGvcchAS6OGG0pHkiibIbljb0J3cwpqGsNgXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOmgV6Xu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOmgV6Xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750272993; x=1781808993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z9br5LrInIVljMQihGbbAUPVThEIeJYu70LptYg3ObQ=;
  b=TOmgV6Xu97MDo5y2L3Qjuj9KvDhCpaVwdqiMmltI1F7kpaRlO0pvxcZx
   A7JBHy/LbEb5UHI+u60IZkLNRRu7ALK8hlgL/YQ/V+pZWkfNCFZZy4D4G
   ANilnTgOYN1vvDh3HR71dGfWjADHUtbtAi0TLctHIrfwA+nycTzvweXOS
   kPjpahPOk+QPZBJSAN9+2VHFIlNADVJ9vOhrNCDwAZc3V9J7bk9TQN8yf
   tNopGA91Do/+DtvDs5mDsjNdm59xAu2jO/n5K/tuhpid6taDBSGo6czRe
   nUbwT8v5nhR0CV6NCg7W4Fv+WDrXiRkLEZUQlnmQbRDn5xa0IkRs28B1l
   A==;
X-CSE-ConnectionGUID: oaFoDPMJSV28kcC+1iNFQQ==
X-CSE-MsgGUID: pzr0cvKFTTOy2f6zJIaemw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210174"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52210174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:32 -0700
X-CSE-ConnectionGUID: Whx/jbtDT3C3oKcL/+ChwQ==
X-CSE-MsgGUID: smFV4sgQTjaDsuQ175NdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="153951384"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:29 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com,
	jgg@nvidia.com
Subject: [PATCH v3 00/10] Introducing firmware late binding
Date: Thu, 19 Jun 2025 00:29:57 +0530
Message-Id: <20250618190007.2932322-1-badal.nilawar@intel.com>
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

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (8):
  drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding
  drm/xe/xe_late_bind_fw: Extract and print version info
  [CI]drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI

 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  41 ++
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 432 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  82 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   3 +
 drivers/gpu/drm/xe/xe_pm.c                  |   9 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  69 ++++
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 263 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  50 +++
 include/linux/mei_cl_bus.h                  |   1 +
 20 files changed, 1018 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

