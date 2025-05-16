Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C2233D88;
	Fri, 16 May 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415113; cv=none; b=ANtS1GGICuPEPRp/bMAu/AAo2JtqyHRrs0q0M8g4w56ebA4LNjjKs9YDdKwddYHthc7YdP+4w51imbPpb2O9RWo9SucOQdftjysnV69fhnbbL6y5/Qd66wW4X+oTOWx/ZqGm20ohdMVr51ZWhciTocWqB1FwLjE7k/Y9vf5ZAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415113; c=relaxed/simple;
	bh=K1l2f1KGAl9YUnOe0gj5fuXfiko+ZDJGWbeSW0adweQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=quD7cNpt6NNAZ/gr1xkc6piPrJOnOAWg8L2W0GN9mxjsJuJr9dN4EvwfpjajnseQJDAfGp4UAOiOV7CaxDxUgY1qBKi45ajHRBqWRB3iB/UcGRStjATnBLF+VDAVAncILrf1vFw1SSJNdAu4mWkKUJH28WmO2poErvFkn8vdkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwXP2dUN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwXP2dUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747415111; x=1778951111;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K1l2f1KGAl9YUnOe0gj5fuXfiko+ZDJGWbeSW0adweQ=;
  b=JwXP2dUN6dJ7pI16J3Tdpk4szb/L2OQwZhPJpDJgWRQb7fW9OURspZyH
   9FuQc96T2RMkSVdO8dkgFpeObEmjSidqWOIWPLw1QY+LmItEWWF0OWxi2
   pirT9o8jFEdWeg5AExV8fIRXfqjXaV0M2u/ivUF4Ub42DRQLiDX/IM918
   1wnNvTyJF1qmRW+TOoARyc6NydKbyglDniJhVESp7Gfsl4O7Jh552h7JD
   211nsLQ8O3EXv44bqQfQAnl8i4s5PpGh/V+TRT5F+jcdSbUa6k+BUFYu3
   cme1LePw6DDwESlws1rPx62Aqpt5UvoDc6Xc2D7KEQXiTdoI47ovfmTcB
   A==;
X-CSE-ConnectionGUID: HNMjj7weRP+q2FDnORHYeg==
X-CSE-MsgGUID: SlicgiINS1q5BY2dtm7Amw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49295882"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49295882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 10:05:10 -0700
X-CSE-ConnectionGUID: YdgmbS5sRHeaVQKI9vM17w==
X-CSE-MsgGUID: Mit3u8WOR6KtQEIjyxfhdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="138792105"
Received: from wopr.jf.intel.com ([10.54.75.146])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:05:09 -0700
From: Todd Brandt <todd.e.brandt@intel.com>
To: platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	xi.pardee@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	todd.e.brandt@linux.intel.com,
	todd.e.brandt@intel.com
Subject: [PATCH v2] platform/x86/intel/pmc Fix Arrow Lake U/H support to intel_pmc_core driver
Date: Fri, 16 May 2025 10:05:07 -0700
Message-Id: <20250516170507.4064466-1-todd.e.brandt@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARL requires that the GMA and NPU devices both be in D3Hot in order
for PC10 and S0iX to be achieved in S2idle. The original ARL-H/U addition
to the intel_pmc_core driver attempted to do this by switching them to D3
in the init and resume calls of the intel_pmc_core driver.

The problem is the ARL-H/U have a different NPU device and thus are not
being properly set and thus S0iX does not work properly in ARL-H/U. This
patch creates a new ARL-H specific device id that is correct and also
adds the D3 fixup to the suspend callback. This way if the PCI devies
drop from D3 to D0 after resume they can be corrected for the next
suspend. Thus there is no dropout in S0iX.

Fixes: bd820906ea9d ("platform/x86/intel/pmc: Add Arrow Lake U/H support to intel_pmc_core driver")
Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
---
 drivers/platform/x86/intel/pmc/arl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
index 320993bd6d31..5053e3dd8f5e 100644
--- a/drivers/platform/x86/intel/pmc/arl.c
+++ b/drivers/platform/x86/intel/pmc/arl.c
@@ -681,6 +681,7 @@ static struct pmc_info arl_pmc_info_list[] = {
 
 #define ARL_NPU_PCI_DEV			0xad1d
 #define ARL_GNA_PCI_DEV			0xae4c
+#define ARL_H_NPU_PCI_DEV		0x7d1d
 #define ARL_H_GNA_PCI_DEV		0x774c
 /*
  * Set power state of select devices that do not have drivers to D3
@@ -694,7 +695,7 @@ static void arl_d3_fixup(void)
 
 static void arl_h_d3_fixup(void)
 {
-	pmc_core_set_device_d3(ARL_NPU_PCI_DEV);
+	pmc_core_set_device_d3(ARL_H_NPU_PCI_DEV);
 	pmc_core_set_device_d3(ARL_H_GNA_PCI_DEV);
 }
 
@@ -705,6 +706,13 @@ static int arl_resume(struct pmc_dev *pmcdev)
 	return cnl_resume(pmcdev);
 }
 
+static void arl_h_suspend(struct pmc_dev *pmcdev)
+{
+	arl_h_d3_fixup();
+
+	cnl_suspend(pmcdev);
+}
+
 static int arl_h_resume(struct pmc_dev *pmcdev)
 {
 	arl_h_d3_fixup();
@@ -739,7 +747,7 @@ struct pmc_dev_info arl_h_pmc_dev = {
 	.dmu_guid = ARL_PMT_DMU_GUID,
 	.regmap_list = arl_pmc_info_list,
 	.map = &mtl_socm_reg_map,
-	.suspend = cnl_suspend,
+	.suspend = arl_h_suspend,
 	.resume = arl_h_resume,
 	.init = arl_h_core_init,
 };
-- 
2.25.1

