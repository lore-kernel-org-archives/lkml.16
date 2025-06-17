Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A32E4253
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168785; cv=none; b=GACkudp5fT9iIsaOdA85LLRWjgZ7MRaPtihfxO8Ak/4D8zaXJ8DXjYBjj7rqje0hXxMku1SgnlQaAuLY3I+ACXWq0K7HGvfgMlUI3V4iSnfspGte/6D5fFMwojENAym8vlbr60vXqbjDdXIhf9d5ME34OBKkncGLniAG7Y5G6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168785; c=relaxed/simple;
	bh=q0hWiCYmWKAaZmB913NuWi2bGtvj235TysVC+ofT7zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zznb9RCYjbcmTpqCd9xg6GAUbtvIG2cm2UNhRH1NTQDWFTIlTiJPeFNN/74AzrAXqpwvPTmHW8TuKZzruze5nneS/0IKeiXlrbnsk18O6k9dHS68SeAiv2MKhjRDZCbeT6ChR4PalhvdiIvvsJmnDOTKpx98X4UgU1aLX+hr6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPIO2alt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPIO2alt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750168784; x=1781704784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q0hWiCYmWKAaZmB913NuWi2bGtvj235TysVC+ofT7zg=;
  b=aPIO2altna8Ip+LpVxJyVAJlyuxpfMcrKDYwlfsAKuGQMzWZvOyM/lk4
   aXLFczeDTYJ+5EZBDCq2GHNcFY5EyhVUBl29zSdMvftv4dmqjxA+ebMNU
   08hP0U6+kIa14SJwrbxRIID0P7oOv9XwtvcaRHJGQl7Hri7zsK8sWTSEN
   SkN/dK/3f0C+mxDnYw3CYKc1cjcHVcp83sJyxOnzsC9K/NiQfP+F4gSRu
   kDPwk44RI5OG4dI5nPO9C5rPqF0+wuoFAq2kmlATDYfY9LkmPtCc/ZoZW
   hIVhJ/Myt3bDPe0kI7u1t5YHTClDqjEwKOQb+KH4KywVHH/2PRlR3CdPG
   Q==;
X-CSE-ConnectionGUID: 7EB6c8uQS3qR9rF/TP5TOg==
X-CSE-MsgGUID: vuLuyX4uSIW+gI1ERBkjMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56026567"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="56026567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:59:43 -0700
X-CSE-ConnectionGUID: Mw7D4kP0RlaIFsOMDRwH1Q==
X-CSE-MsgGUID: gnq+P81GQHqzX+BSEZXwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="153739542"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:59:37 -0700
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
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v13 06/10] drm/i915/nvm: add nvm device for discrete graphics
Date: Tue, 17 Jun 2025 16:45:28 +0300
Message-ID: <20250617134532.3768283-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617134532.3768283-1-alexander.usyskin@intel.com>
References: <20250617134532.3768283-1-alexander.usyskin@intel.com>
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
index 7c6075bc483c..ed4d15ad4cdf 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -211,6 +211,10 @@ i915-y += \
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
index c6263c6d3384..6d83f8d1a957 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -85,6 +85,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "intel_nvm.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -645,6 +647,8 @@ static int i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
+	intel_nvm_init(dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
@@ -687,6 +691,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_nvm_fini(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 5e4c49f0d5d4..ba75e7651c5e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -65,6 +65,7 @@ struct drm_i915_clock_gating_funcs;
 struct intel_display;
 struct intel_pxp;
 struct vlv_s0ix_state;
+struct intel_dg_nvm_dev;
 
 #define GEM_QUIRK_PIN_SWIZZLED_PAGES	BIT(0)
 
@@ -289,6 +290,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_dg_nvm_dev *nvm;
+
 	struct i915_hwmon *hwmon;
 
 	struct intel_gt *gt[I915_MAX_GT];
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 52a902532e6f..ea9b90d59cd3 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -277,6 +277,7 @@
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

