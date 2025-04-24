Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0327D79B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501918; cv=none; b=Fr8AzdIouo8Li7Qm2bHXauBoMYipPovsdnjgXreL6dZPGNo85qbXyTxMhw4gE5v57mBBtxp5RRtgQjSghexgM8/xh+CfaYiQMepcYxXpt02OlngDLmWsd3t1OQwAbxgQzMMeD45BEMkDjcpma+plYA3TGqgoDrqSmkiZphfLVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501918; c=relaxed/simple;
	bh=634r8nc1uWr9/kcljaW++l4wbVLG77iJCKi90MIkXG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDlOkHLhULWEBc3qg8soXGtzwZGeL+I/yTMNHANboA/XEyoH9zzAQZjhR/uKxRsX/gAsJ0I1TENhJeW8+vLL3+6KUmL1Fgfk6XP9CFB5YxVWgFT2rP7cbmGAQYqgpN9InzxVPh05RYICx4aZhzQss6oHs15454dwvYpPFq7oGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8syJxEW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8syJxEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745501917; x=1777037917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=634r8nc1uWr9/kcljaW++l4wbVLG77iJCKi90MIkXG0=;
  b=O8syJxEWpEvad2IcCM8Kieik8Ml8wvzs6lOcnupLIERPmt6TrdzZyb68
   KnfNrJ987rk4BI82Np/hFAuJLt9GeU6Ptbe1rYQFqxWDG8CNYo9ScPJxw
   TMz9vtdxWvW78NlMPgZi55O1BjcJB6lY1z7fgQ6JqGR58SgAZQ7RqLwy+
   XIYvircrwQl0X4Wjd2IQvu2r8CGU9dg11qE3jea6uab9yRYHOvDxEtZ4G
   1qvam712UC9L/qCkTAktst9/STFsskl8dQWBNmhoqnblQ5WxwaH/1LqNp
   mXQPI6bT7IgTY8Vgd+jc8g6RdErtDiEz9jUCU6YJjKDFBER2Bt6J0gl7V
   g==;
X-CSE-ConnectionGUID: aXTfKchKTBO8O4RfDoX0XQ==
X-CSE-MsgGUID: 2Ml7kLEvQpmM1DKBt2W7gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46368198"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="46368198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:38:36 -0700
X-CSE-ConnectionGUID: qoSatV/RQQmq486icfpKnA==
X-CSE-MsgGUID: aHg33qnoTwKpIqAmyd2bgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="136701446"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:38:31 -0700
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
Subject: [PATCH v9 11/12] drm/xe/nvm: add support for access mode
Date: Thu, 24 Apr 2025 16:25:35 +0300
Message-ID: <20250424132536.3043825-12-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424132536.3043825-1-alexander.usyskin@intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check NVM access mode from GSC FW status registers
and overwrite access status read from SPI descriptor, if needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  4 +++
 drivers/gpu/drm/xe/xe_heci_gsc.c      |  5 +---
 drivers/gpu/drm/xe/xe_nvm.c           | 37 ++++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 7702364b65f1..9b66cc972a63 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -16,6 +16,10 @@
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
 
+#define DG1_GSC_HECI2_BASE	0x00259000
+#define PVC_GSC_HECI2_BASE	0x00285000
+#define DG2_GSC_HECI2_BASE	0x00374000
+
 #define HECI_H_CSR(base)	XE_REG((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
 #define   HECI_H_CSR_IS		REG_BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 27d11e06a82b..6d7b62724126 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -11,15 +11,12 @@
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
+#include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
 
-#define DG1_GSC_HECI2_BASE			0x259000
-#define PVC_GSC_HECI2_BASE			0x285000
-#define DG2_GSC_HECI2_BASE			0x374000
-
 static void heci_gsc_irq_mask(struct irq_data *d)
 {
 	/* generic irq handling */
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 26de7d4472c8..8aec20bc629a 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -6,8 +6,11 @@
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/pci.h>
 
+#include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_mmio.h"
 #include "xe_nvm.h"
+#include "regs/xe_gsc_regs.h"
 #include "xe_sriov.h"
 
 #define GEN12_GUNIT_NVM_BASE 0x00102040
@@ -25,6 +28,38 @@ static void xe_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool xe_nvm_writable_override(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	resource_size_t base;
+	bool writable_override;
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		base = DG2_GSC_HECI2_BASE;
+		break;
+	case XE_PVC:
+		base = PVC_GSC_HECI2_BASE;
+		break;
+	case XE_DG2:
+		base = DG2_GSC_HECI2_BASE;
+		break;
+	case XE_DG1:
+		base = DG1_GSC_HECI2_BASE;
+		break;
+	default:
+		drm_err(&xe->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writable_override =
+		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writable_override)
+		drm_info(&xe->drm, "NVM access overridden by jumper\n");
+	return writable_override;
+}
+
 void xe_nvm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -49,7 +84,7 @@ void xe_nvm_init(struct xe_device *xe)
 
 	nvm = xe->nvm;
 
-	nvm->writeable_override = false;
+	nvm->writable_override = xe_nvm_writable_override(xe);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0

