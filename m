Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5722FE02
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951644; cv=none; b=Twd1QrU5dfraoC+eXJxwMGNseDMUjQUkt0eLKbuUm9BtsCVqvGkrCAdFKQsqZMTPmXfvL45BITIPyF+FgwGfTjxVEuG9MVwTpHKgUN6/U2N45a5le51WnHQfMqfenDFEvM50vVhwZqIb4AP6dCVlR3e7+QbYy2Y2iNMzBZRdGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951644; c=relaxed/simple;
	bh=12QsiCuGoHCubRfpXftCU3zZKpyp9XRRkhXynQ2ULTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5L3y9VbdFw10lw5ORGX6Iy32I5HMEDCwhGnJ0wJujh3iIrGgRBomOxx4i1eeHEUmVtxS9qJIlLOYPX/r/bVLqQ2uAJhcMk7uvFhQ6lPUO4qrbMSQeAlZzvIV97CGohmQHw75+pXL58F/lR7oCrOpljr0CYzZ6cMpgl0e7x+X4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyf+fxB7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyf+fxB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748951642; x=1780487642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=12QsiCuGoHCubRfpXftCU3zZKpyp9XRRkhXynQ2ULTA=;
  b=gyf+fxB7sQ8+juh+ViGgtmrn3pm7CyUQ3Cu2obu0zLsniLcLSFBA6YKO
   bnzMT3XzZBsPUcy1UDfBpFNYa8MtPcrel19XlDNdlXrEMt9brxhhVGiOX
   ok0TBrt2GOpM6ZIq6ZIRFSVUua5JTUK2VYUMRS9q4bGQ7YZCfE+cWGC8s
   1qfUM4mUHYvUUTXz3PWcyLRKi/18/p6lRhr9aorREKT82vQDDUsT2dSv4
   ebxaR7zJkq8j4UGeHfNXHJLlxPOtmpCiXerFli08i3GEWUEwCROG85GsJ
   htcqF2tsZcLARIXaDhTGPXZCcI3Oyn12jjmAzHpY3CISa57IY8hsi/3/4
   g==;
X-CSE-ConnectionGUID: MRUxDXfPS6ew8DhZbzWugA==
X-CSE-MsgGUID: sn2apYL7S4O9GepBlZuykg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="53616519"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="53616519"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:54:02 -0700
X-CSE-ConnectionGUID: JxOBkSObT26M4apRzCaspQ==
X-CSE-MsgGUID: tdkAGN2kTpipatiW6rKeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149993355"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:53:56 -0700
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
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v12 06/10] drm/i915/nvm: add nvm device for discrete graphics
Date: Tue,  3 Jun 2025 14:39:49 +0300
Message-ID: <20250603113953.3599816-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603113953.3599816-1-alexander.usyskin@intel.com>
References: <20250603113953.3599816-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable access to internal non-volatile memory on
DGFX devices via a child device.
The nvm child device is exposed via auxiliary bus.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |  4 ++
 drivers/gpu/drm/i915/i915_driver.c |  6 ++
 drivers/gpu/drm/i915/i915_drv.h    |  3 +
 drivers/gpu/drm/i915/i915_reg.h    |  1 +
 drivers/gpu/drm/i915/intel_nvm.c   | 98 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_nvm.h   | 15 +++++
 6 files changed, 127 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1a90eb1f180a..2e0fa85491a8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -212,6 +212,10 @@ i915-y += \
 i915-y += \
 	gt/intel_gsc.o
 
+# graphics nvm device (DGFX) support
+i915-y += \
+	intel_nvm.o
+
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += \
 	i915_hwmon.o
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 3b0bda74697d..4d91d5075fde 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -84,6 +84,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "intel_nvm.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -643,6 +645,8 @@ static int i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
+	intel_nvm_init(dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
@@ -685,6 +689,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_nvm_fini(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b6c632bd522c..d6203a49335c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -64,6 +64,7 @@ struct drm_i915_clock_gating_funcs;
 struct intel_display;
 struct intel_pxp;
 struct vlv_s0ix_state;
+struct intel_dg_nvm_dev;
 
 #define GEM_QUIRK_PIN_SWIZZLED_PAGES	BIT(0)
 
@@ -309,6 +310,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_dg_nvm_dev *nvm;
+
 	struct i915_hwmon *hwmon;
 
 	struct intel_gt *gt[I915_MAX_GT];
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8822c639a4f4..9d35af6fa76e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -321,6 +321,7 @@
 #define DG2_GSC_HECI2_BASE	0x00374000
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
+#define GEN12_GUNIT_NVM_BASE	0x00102040
 
 #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
new file mode 100644
index 000000000000..ae7f9f2c01bf
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_nvm_aux.h>
+#include <linux/irq.h>
+#include <linux/pci.h>
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "intel_nvm.h"
+
+#define GEN12_GUNIT_NVM_SIZE 0x80
+
+static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void i915_nvm_release_dev(struct device *dev)
+{
+}
+
+int intel_nvm_init(struct drm_i915_private *i915)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	struct auxiliary_device *aux_dev;
+	struct intel_dg_nvm_dev *nvm;
+	int ret;
+
+	/* Only the DGFX devices have internal NVM */
+	if (!IS_DGFX(i915))
+		return 0;
+
+	/* Nvm pointer should be NULL here */
+	if (WARN_ON(i915->nvm))
+		return -EFAULT;
+
+	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!i915->nvm)
+		return -ENOMEM;
+
+	nvm = i915->nvm;
+
+	nvm->writable_override = true;
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
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) | pci_dev_id(pdev);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = i915_nvm_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
+		goto err;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		goto err;
+	}
+	return 0;
+
+err:
+	kfree(nvm);
+	i915->nvm = NULL;
+	return ret;
+}
+
+void intel_nvm_fini(struct drm_i915_private *i915)
+{
+	struct intel_dg_nvm_dev *nvm = i915->nvm;
+
+	/* Only the DGFX devices have internal NVM */
+	if (!IS_DGFX(i915))
+		return;
+
+	/* Nvm pointer should not be NULL here */
+	if (WARN_ON(!nvm))
+		return;
+
+	auxiliary_device_delete(&nvm->aux_dev);
+	auxiliary_device_uninit(&nvm->aux_dev);
+	kfree(nvm);
+	i915->nvm = NULL;
+}
diff --git a/drivers/gpu/drm/i915/intel_nvm.h b/drivers/gpu/drm/i915/intel_nvm.h
new file mode 100644
index 000000000000..a9e4046b830f
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_nvm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_NVM_H__
+#define __INTEL_NVM_H__
+
+struct drm_i915_private;
+
+int intel_nvm_init(struct drm_i915_private *i915);
+
+void intel_nvm_fini(struct drm_i915_private *i915);
+
+#endif /* __INTEL_NVM_H__ */
-- 
2.43.0

