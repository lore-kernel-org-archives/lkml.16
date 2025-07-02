Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26421EFF81
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474878; cv=none; b=JMNy2WrB8nFqiGWzcqfWztBoD/rKaTzXjk3kOu6Rkcv0DXj7180O16ZmUjsxhtfFrAkPLkkRG0eC7cNc8LoAn1d7v/nNG8aQrLM3wR3NTq85k0HENdjaznHiVd5y0Bu+BHAE8b8QHdhjIzyoGy8nTRKDGOGvZaA11Z/pXIE8DlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474878; c=relaxed/simple;
	bh=bJ/kR0mO6yP1Fm6QjMsMwfrHw2ayxOxCh+oR/JaHtAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t9gnUJxTa+0djL0YUmwgBhSvioVtMiYbvkdbVDAKYl3fc1JkWJJC+uZZGoQjbffuNGOhJtiAhTByOAmPFekxN+eqQA1uSFcxu3bl0wG0aCYpR/U0Q1McZVOR7jmKuQ+LWdUGWCeyE7SH2R1SLc+ieH+kGwb+cuG0FGAJf2VoqE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdPr058V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdPr058V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751474877; x=1783010877;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bJ/kR0mO6yP1Fm6QjMsMwfrHw2ayxOxCh+oR/JaHtAg=;
  b=gdPr058VyaPSKUoCVIm/OWwWzV8AdlJU/3aG9AM6tjqB526j5732IqOx
   QTtO4TqcciN2/9mvpQw3uOyFKnm0EJ5J/37Xb3tHXiLQjGi37YS8vX/Ux
   ugoEWhpkFD9/Fpeclq3WgaJ8B2av2NwV52QaD8XeAnjCCs6aAgIvgVrLL
   huTGwIiTE/doGB73Gy3pSjR5yX9VVPQcldrIBwJBWCNUGvN0dQjQ3BhH2
   oYUja8hhDEEEDbZDzBBF8lL7ro7UnJpCbhl8jcJF0R/rwxsp9RSqFTAtd
   oeue9gpxktxhcku4tB+RXqY23KYrdSREYwDtZG3l6Of/IhrYEry2neTfm
   w==;
X-CSE-ConnectionGUID: qVZO1D7qQ9OsecdmPYD1ng==
X-CSE-MsgGUID: x04FGFhfSae76+dOjTbItw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380734"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64380734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:47:55 -0700
X-CSE-ConnectionGUID: /Rwme+E6Tx+TW0jmpdo/qQ==
X-CSE-MsgGUID: 5nx2uR9uRJ++d9783IMXDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153535576"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:47:53 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v5 00/10] Introducing firmware late binding
Date: Wed,  2 Jul 2025 22:22:06 +0530
Message-Id: <20250702165216.557074-1-badal.nilawar@intel.com>
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
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 454 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  77 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   3 +
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
 20 files changed, 1054 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

