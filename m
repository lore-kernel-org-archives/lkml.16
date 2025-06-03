Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8FB22F767
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951649; cv=none; b=hGzmfwq/h7EXZ76+oz+Dw57UC7HtVvIKqCrqtA0MDI4+rgF4aLGhiqx2V1Gz85vVCkRl7cyHZeZV7cX+QenWZwIzaKBjN9y5WAvr5iCgf7fozK5BacuUJ/13esAOkQgq/HIU/w48pBJfgdwEs5ShBDFY+tSRs6VXQHFKAkAXe8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951649; c=relaxed/simple;
	bh=brHnIOdScb0KxCyYh6StjKNndkZEaHPzreNgxMkxZxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+cEl2G7GwrApeXym39looKjpobINbFZNk5cP2vuDa8iCpQxK/W94d7gTFWd/qihI5rum3yBigZ9kSeAQBmubxMtakZnC30BXCoIiUm866jCn/uZHQZHeWgOZ9d4r0OzDDItSEzOi4mXtCmJRQXvMzkWMIccwHtRCVrbOTKIVME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=calNgK9x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="calNgK9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748951648; x=1780487648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=brHnIOdScb0KxCyYh6StjKNndkZEaHPzreNgxMkxZxU=;
  b=calNgK9xKbNOMPZ/tqs7Gb3NA3GUo4djZSR/pAErUa7Lls0qHD2hmB+3
   IGimkxZwS/TxgXsxf8oHYV8bX5j7kqOVOsEUcF5ee6JDdiXQC+62+pfIS
   53JcNhn1UYR03fqzNGWniUdsE9Lig9Fl7W7uNcyAu59g5wFCuirHLg8qL
   uIe2EYZanr9GZVFCfrzMPpJxgdTUXrryFeipZtmqlIPLOoUasx8d5oPkx
   9J/blUkKZzdxInFAWlT5rzHMXjDOMJ3JCf2AzNYzDSOLDSWdfCFDAO1M6
   QKJyIGxn+e9RS+jUZ9SJMUKBZfqMOAc2Au1jN5lItWvGF0zHaNviqlRZR
   w==;
X-CSE-ConnectionGUID: VmofzIZXRAuY7EyVLlI7kw==
X-CSE-MsgGUID: iEoeWmugQqiimkNAM4mQ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="53616564"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="53616564"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:54:08 -0700
X-CSE-ConnectionGUID: 7S6iikLySZy+8OMx6WwHZA==
X-CSE-MsgGUID: 77pSL+LyRPqxicxawx8dkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149993363"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 04:54:02 -0700
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
Subject: [PATCH v12 07/10] drm/i915/nvm: add support for access mode
Date: Tue,  3 Jun 2025 14:39:50 +0300
Message-ID: <20250603113953.3599816-8-alexander.usyskin@intel.com>
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

Check NVM access mode from GSC FW status registers
and overwrite access status read from SPI descriptor, if needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/intel_nvm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
index ae7f9f2c01bf..4624cba26fa7 100644
--- a/drivers/gpu/drm/i915/intel_nvm.c
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -11,6 +11,7 @@
 #include "intel_nvm.h"
 
 #define GEN12_GUNIT_NVM_SIZE 0x80
+#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
 
 static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 	[0] = { .name = "DESCRIPTOR", },
@@ -23,6 +24,28 @@ static void i915_nvm_release_dev(struct device *dev)
 {
 }
 
+static bool i915_nvm_writable_override(struct drm_i915_private *i915)
+{
+	bool writable_override;
+	resource_size_t base;
+
+	if (IS_DG1(i915)) {
+		base = DG1_GSC_HECI2_BASE;
+	} else if (IS_DG2(i915)) {
+		base = DG2_GSC_HECI2_BASE;
+	} else {
+		drm_err(&i915->drm, "Unknown platform\n");
+		return true;
+	}
+
+	writable_override =
+		!(intel_uncore_read(&i915->uncore, HECI_FWSTS(base, 2)) &
+		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
+	if (writable_override)
+		drm_info(&i915->drm, "NVM access overridden by jumper\n");
+	return writable_override;
+}
+
 int intel_nvm_init(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -44,7 +67,7 @@ int intel_nvm_init(struct drm_i915_private *i915)
 
 	nvm = i915->nvm;
 
-	nvm->writable_override = true;
+	nvm->writable_override = i915_nvm_writable_override(i915);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
 	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
-- 
2.43.0

