Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23DE1B3929
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624157; cv=none; b=u28A1ES+UVj0h+0zrP0ry78riAz/h+N1PkMJyeSjbRlafk+m9REqwltNdJGUHMC79kz6UXNi7g5Ji/a8k31Jr02MTdLyyClwou6JdmixF9s3GCTZAVFND7wvwKBntfYAh0qWodPEZIKquVk2naUca5FciKAYI3bryUgPbeGJnz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624157; c=relaxed/simple;
	bh=ndzYPRIDm/AVgAGmvgd5p3a/hBleFEOnvNJbaFIqhS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEbMNHyBhFp5Dpwu2wP6T07NXxocdpSE1SsI4ZbKQNh69JpsAPUi8G91Z0pGG8VoL2FwH7CAJzZAqfCVYEaXOc5cFhn2Ou5T4rXUa4D8kqRGdg42ZmlhyPZpsHBPUSEkfZDgTpFlXh+m2/BAKlprMbB7i4wVx0hzdlf4aE01N/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5whGEHk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5whGEHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744624156; x=1776160156;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ndzYPRIDm/AVgAGmvgd5p3a/hBleFEOnvNJbaFIqhS0=;
  b=K5whGEHkWaQUIB2qJMDDCHpTIAL6JtCllkrRu4hk9X0IZmfgaJEY4oSr
   vd70ui3hnZrV+D3SseKkuYDKgWQ1uct68N1F/AqtgWAo4syT+6K6LSv2L
   15kPbcjTXFoi2uKzonXYrN+c/9DINeCZMraOwMDsjMUSylMCiG5x3gklI
   I1BuX0pLOr1RjtJCLR4gX6heCIvYsyt1eKXmXhU0oWBjqbVPJp2b6lXWD
   7sLY5QADZGOJmiE7GGW++vUvF1nU32rPiBm88xDiwLe3qHKNbK1T25wsH
   tg9Mhg9WlX6R2RTAj1ivWGBBCQk7Py1jjKqM60Fjqn2njq3cz3rsbHkAC
   Q==;
X-CSE-ConnectionGUID: FVcizCcjRR+ZTSMAnldF0Q==
X-CSE-MsgGUID: vE0DvlzbTiW2LDlxBLOXEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45222589"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45222589"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:49:15 -0700
X-CSE-ConnectionGUID: +n11DQa5QV+XqyUoJY2YtA==
X-CSE-MsgGUID: vuGzZh5QTsiWpLUTN3ez2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="152954810"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:49:09 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v8 00/12] mtd: add driver for Intel discrete graphics
Date: Mon, 14 Apr 2025 12:37:51 +0300
Message-ID: <20250414093803.2133463-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for access to Intel discrete graphics card
internal NVM device.
Expose device on auxiliary bus by i915 and Xe drivers and
provide mtd driver to register this device with MTD framework.

This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
and "spi: add driver for Intel discrete graphics"
series with connection to the Xe driver and splitting
the spi driver part to separate module in mtd subsystem.

This series intended to be pushed through drm-xe-next.

V2: Replace dev_* prints with drm_* prints in drm (xe and i915) patches.
    Enable NVM device on Battlemage HW (xe driver patch)
    Fix overwrite register address (xe driver patch)
    Add Rodrigo's r-b

V3: Use devm_pm_runtime_enable to simplify flow.
    Drop print in i915 unload that was accidentally set as error.
    Drop HAS_GSC_NVM macro in line with latest Xe changes.
    Add more Rodrigo's r-b and Miquel's ack.

V4: Add patch that always creates mtd master device
    and adjust mtd-intel-dg power management to use this device.

V5: Fix master device creation to accomodate for devices without
    partitions (create partitoned master in this case)
    Rebase over latest drm-xe-next
    Add ack's
V6: Fix master device release (use rigth idr in release)
    Rebase over latest drm-xe-next
    Grammar and style fixes

V7: Add patch with non-posted erase support (fix hang on BMG)
    Rebase over latest drm-xe-next

V8: Create separate partition device under master device, if requested
    and configure parent of usual partitions to this partition.
    Rebase over drm-tip.

Abliyev, Reuven (1):
  drm/xe/nvm: add support for non-posted erase

Alexander Usyskin (11):
  mtd: core: always create master device
  mtd: add driver for intel graphics non-volatile memory device
  mtd: intel-dg: implement region enumeration
  mtd: intel-dg: implement access functions
  mtd: intel-dg: register with mtd
  mtd: intel-dg: align 64bit read and write
  mtd: intel-dg: wake card on operations
  drm/i915/nvm: add nvm device for discrete graphics
  drm/i915/nvm: add support for access mode
  drm/xe/nvm: add on-die non-volatile memory device
  drm/xe/nvm: add support for access mode

 MAINTAINERS                           |   7 +
 drivers/gpu/drm/i915/Makefile         |   4 +
 drivers/gpu/drm/i915/i915_driver.c    |   6 +
 drivers/gpu/drm/i915/i915_drv.h       |   3 +
 drivers/gpu/drm/i915/i915_reg.h       |   1 +
 drivers/gpu/drm/i915/intel_nvm.c      | 115 ++++
 drivers/gpu/drm/i915/intel_nvm.h      |  15 +
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   6 +
 drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
 drivers/gpu/drm/xe/xe_nvm.c           | 161 +++++
 drivers/gpu/drm/xe/xe_nvm.h           |  15 +
 drivers/gpu/drm/xe/xe_pci.c           |   6 +
 drivers/mtd/devices/Kconfig           |  11 +
 drivers/mtd/devices/Makefile          |   1 +
 drivers/mtd/devices/mtd_intel_dg.c    | 884 ++++++++++++++++++++++++++
 drivers/mtd/mtdchar.c                 |   2 +-
 drivers/mtd/mtdcore.c                 | 152 +++--
 drivers/mtd/mtdcore.h                 |   2 +-
 drivers/mtd/mtdpart.c                 |  16 +-
 include/linux/intel_dg_nvm_aux.h      |  29 +
 include/linux/mtd/partitions.h        |   2 +-
 24 files changed, 1398 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
2.43.0

