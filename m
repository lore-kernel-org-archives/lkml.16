Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BB1A8F8A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316915; cv=none; b=ISXAerCNeaUA7BpWrbyKODEQk7XS4j5jSQoerPDwLYRjZylau5kV9b1xSDBOU89wGCMvcd+/8lKDm19nFUNf+Wed6Ie5rHgmE33mblnWyOQ16a0i6V+MQJ0O9lYCa5bn26q9Rbu8LPCwSlCb6ptt9fwGLhqk7O+JpUzKYBRPvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316915; c=relaxed/simple;
	bh=FzksxZT5SETtP/CkGvZ+uMnxHvBwdUXiNNdofavngiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/gvBxC7On6QhXMXq2iZ90VSJrp72pa7YcXvyMqDlzd3VKduomiLV49baFy56sV2UecjLUO5kg0qGrJ08wobLJsHq06MH9VwyRXeS/+2qX1wwwLKiIrOwYnN7VET4SS3TRqzZQ5wxAnUMo4vDrtOJqDHEIKn3Ad3d/aQFV5gBxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESNXikGV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESNXikGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747316914; x=1778852914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FzksxZT5SETtP/CkGvZ+uMnxHvBwdUXiNNdofavngiA=;
  b=ESNXikGVprhYaEB/Zqc84IsVtWTUQs8MLBcM2vxQOsUsiaUORNaLEusJ
   AKtr5mbq9Lw2DND3D2uY3goY2faLpSSr/PYK1iKPs/YrSceFYKRpwgY+f
   2mKUB8eQpncauEphtr7ERQUwrpZwgrAS0swvlezpiA8fKX75MrWoKFqm8
   S8mIJQX7RyE0gE90NNwis9cM27C19nMxpBjWs1OUx/Lhw90y1aKX1Nwqd
   JG4+bDKBTu2VBhPeJwUYkRxXes5Ky0yvBapT5xe45QMHiDcKK/AH6caL6
   Jz1tI+dzHv98jHNdvt5wo/oCyGE+F3frOckh74uoNRO3IWdrZiWatDa8k
   g==;
X-CSE-ConnectionGUID: Zw+IEZubR3CX+aQQE2JdIQ==
X-CSE-MsgGUID: okoJ7jZsS8WN27oMDkBRrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66660869"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="66660869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:48:34 -0700
X-CSE-ConnectionGUID: 3jgLyC3VTFObMyloCQysNg==
X-CSE-MsgGUID: NfRl2ielTGW/Rhr+XIq8eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138428366"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:48:27 -0700
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
Subject: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory device
Date: Thu, 15 May 2025 16:33:43 +0300
Message-ID: <20250515133345.2805031-9-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515133345.2805031-1-alexander.usyskin@intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable access to internal non-volatile memory on DGFX
with GSC/CSC devices via a child device.
The nvm child device is exposed via auxiliary bus.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_nvm.c          | 101 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
 drivers/gpu/drm/xe/xe_pci.c          |   6 ++
 6 files changed, 134 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4bf484d4121..4c51fe3520dc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -80,6 +80,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_nvm.o \
 	xe_oa.o \
 	xe_observation.o \
 	xe_pat.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d4b6e623aa48..845b38aea692 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -46,6 +46,7 @@
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_nvm.h"
 #include "xe_oa.h"
 #include "xe_observation.h"
 #include "xe_pat.h"
@@ -884,6 +885,8 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	xe_nvm_init(xe);
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -941,6 +944,8 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
+	xe_nvm_fini(xe);
+
 	drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 50b2bfa682ac..938cf1a440de 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,6 +35,7 @@
 #include "intel_display_device.h"
 #endif
 
+struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -319,6 +320,8 @@ struct xe_device {
 		u8 has_fan_control:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
+		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
+		u8 has_gsc_nvm:1;
 		/** @info.has_heci_cscfi: device has heci cscfi */
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
@@ -544,6 +547,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @nvm: discrete graphics non-volatile memory */
+	struct intel_dg_nvm_dev *nvm;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
new file mode 100644
index 000000000000..26de7d4472c8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_nvm_aux.h>
+#include <linux/pci.h>
+
+#include "xe_device_types.h"
+#include "xe_nvm.h"
+#include "xe_sriov.h"
+
+#define GEN12_GUNIT_NVM_BASE 0x00102040
+#define GEN12_GUNIT_NVM_SIZE 0x80
+#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
+
+static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void xe_nvm_release_dev(struct device *dev)
+{
+}
+
+void xe_nvm_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct intel_dg_nvm_dev *nvm;
+	struct auxiliary_device *aux_dev;
+	int ret;
+
+	if (!xe->info.has_gsc_nvm)
+		return;
+
+	/* No access to internal NVM from VFs */
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* Nvm pointer should be NULL here */
+	if (WARN_ON(xe->nvm))
+		return;
+
+	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!xe->nvm)
+		return;
+
+	nvm = xe->nvm;
+
+	nvm->writeable_override = false;
+	nvm->bar.parent = &pdev->resource[0];
+	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
+	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
+	nvm->bar.flags = IORESOURCE_MEM;
+	nvm->bar.desc = IORES_DESC_NONE;
+	nvm->regions = regions;
+
+	aux_dev = &nvm->aux_dev;
+
+	aux_dev->name = "nvm";
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
+		       PCI_DEVID(pdev->bus->number, pdev->devfn);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = xe_nvm_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
+		return;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		return;
+	}
+}
+
+void xe_nvm_fini(struct xe_device *xe)
+{
+	struct intel_dg_nvm_dev *nvm = xe->nvm;
+
+	if (!xe->info.has_gsc_nvm)
+		return;
+
+	/* No access to internal NVM from VFs */
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* Nvm pointer should not be NULL here */
+	if (WARN_ON(!nvm))
+		return;
+
+	auxiliary_device_delete(&nvm->aux_dev);
+	auxiliary_device_uninit(&nvm->aux_dev);
+	kfree(nvm);
+	xe->nvm = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
new file mode 100644
index 000000000000..5487764c180f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_nvm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2025 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_NVM_H__
+#define __XE_NVM_H__
+
+struct xe_device;
+
+void xe_nvm_init(struct xe_device *xe);
+
+void xe_nvm_fini(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b68c90910d82..6aa9850bb342 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -63,6 +63,7 @@ struct xe_device_desc {
 
 	u8 has_display:1;
 	u8 has_fan_control:1;
+	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
@@ -271,6 +272,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(DG1),
 	.dma_mask_size = 39,
 	.has_display = true,
+	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
 };
@@ -282,6 +284,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
+	.has_gsc_nvm = 1, \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
@@ -318,6 +321,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
@@ -346,6 +350,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.needs_scratch = true,
 };
@@ -589,6 +594,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
+	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
-- 
2.43.0

