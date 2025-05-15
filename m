Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9DA15E5DC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316881; cv=none; b=KfxlMOhwyvNAJMetTzYdBaAkZIZGx4tkWf24uLgDLX1sXFtgRhrL0tNjavNKP6pditOHSw6nsnNhkysOO5peC2sS1lPqdZS7955y0E2+pyFjn5mF5Ae0HDLEOv+d2/Z5FbWy4U84Vv9617Eencn5mmvKC3BeQvOVl0Yl/hqSE+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316881; c=relaxed/simple;
	bh=xYiG/cEswunZe121Mj9FBLZmYoON8ShYs7eKpT5Jb7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5vB+tyqwkT3N3CXtLzKUMcZ1XCB4EuLXQOBX2bdSqfH2+sWJQKWsGJ+NGWCatlc0YR0wVF08UWl6o64CcJGdmu/FjezTwy2Vh+AzoPiuOzDKqFpb1zFLxkUHGmCxuMdBLLwv+nCCBtdF5N9LGwfE7kjy2cTOrYku7VNY4wPzb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBXzytjW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBXzytjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747316879; x=1778852879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xYiG/cEswunZe121Mj9FBLZmYoON8ShYs7eKpT5Jb7k=;
  b=kBXzytjWCIk2wJ0X4kTFERepEDCZRy2HvvdazItCCbdsslkiJa3K6FmD
   Px+PPCaSDPdsW7ijq4Lr2/YLDjE4tm6mfIYTq7GaCxyyXOQREEOPNVceG
   oZPiyJ2hGf8rSddhdrg9DtN15ufclNQjPBZRpxM3U8cFe9a8xZP7isRYq
   ME7WMjhJ7K+KoujgYo/i85mdwqPRsi2eW7jMDQNhm87rtxkzqG43acaV2
   6uKeo32oVaerlaKv0g7J9r87BK1hwohOf9wFhONvZ23wxdjwC8HXn54Lk
   NjizfW/yBW10e4jg0p4inbJvciQdd/IY1CuDIDey/ySY6YMfOpkLau0lI
   g==;
X-CSE-ConnectionGUID: 82AQUiY4Sq6dOCp0K3GkhA==
X-CSE-MsgGUID: r52X2ufbSEWVbC3I5hq4CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66660594"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="66660594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:47:48 -0700
X-CSE-ConnectionGUID: 119K+P7uTLSl5fIupTbXWQ==
X-CSE-MsgGUID: zdRhAbILTzKMSx+STHJVhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138428293"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:47:41 -0700
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
	Karthik Poosa <karthik.poosa@intel.com>,
	Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v10 00/10] mtd: add driver for Intel discrete graphics
Date: Thu, 15 May 2025 16:33:35 +0300
Message-ID: <20250515133345.2805031-1-alexander.usyskin@intel.com>
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

V9: Fix checkpatch warning on non-posted erase patch.
    Add Rodrigo's review and ack.

V10: Drop master device creation patch as it now in mtd-next.
     Drop power-management patch, it will be merged lately after
     master device patch is propagated.
     Rebase over drm-tip.

Alexander Usyskin (9):
  mtd: add driver for intel graphics non-volatile memory device
  mtd: intel-dg: implement region enumeration
  mtd: intel-dg: implement access functions
  mtd: intel-dg: register with mtd
  mtd: intel-dg: align 64bit read and write
  drm/i915/nvm: add nvm device for discrete graphics
  drm/i915/nvm: add support for access mode
  drm/xe/nvm: add on-die non-volatile memory device
  drm/xe/nvm: add support for access mode

Reuven Abliyev (1):
  drm/xe/nvm: add support for non-posted erase

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
 drivers/mtd/devices/mtd_intel_dg.c    | 832 ++++++++++++++++++++++++++
 include/linux/intel_dg_nvm_aux.h      |  31 +
 19 files changed, 1225 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
2.43.0

