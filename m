Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AA623AD;
	Fri, 16 May 2025 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747360566; cv=none; b=YLzeLGKEroo6BDuszDLpLDfLbePcQ+GGl88hugqmDdUXeDKFhChPd7pKajhd3hPan8SjSHyT7vf5lOX1c+D/SuiJIqPLdi10aOoJTZx0STN7rRAT7ZRHueYjHjdyqeyCLtumTUiDcWhHr/YoGQx6ItcZHBXBmifqEuRBA66huRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747360566; c=relaxed/simple;
	bh=GL5gVAuFOk2LeSHFbYE6Y3fD6MyXSNNeP8jl2yiUPQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hKSvjdhQrHJCDvy4VM853lAtGBhvawNukCrAVnQziBcD0LoUqFdOtdbbPU08DQsL1MoLKlvGng2je6ZBj8WIUE3yclUC5flxoic8wcJudv58IQ8NzLznmsZVeHk+kIH6cjrSngm/UJwdnXqyGkPdfzhKb/lly9HF8XuqIJICisI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbUFM4le; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbUFM4le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747360563; x=1778896563;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GL5gVAuFOk2LeSHFbYE6Y3fD6MyXSNNeP8jl2yiUPQw=;
  b=dbUFM4leqw9kdMvY3M2soKQsid0bVYwBliv/6iM0Z2Es3ptPY2tSSy0s
   SDFJ+NyH4fS7pxg6+xBFJpqXunEBbqJZS6svpIQnrA+1+p0jqatMgElLX
   CrA702bpdWVYgnWdWyXnbq1T9xWg7CfXNiCqvnfTcQO/Qr9pMWScpxoX1
   wFGX4S5j9BSQw9VmcYGUkgd3Ewpf8QmeQTtz39E8LEvp5aKXS3P9uT/2e
   xNtlVfCEet2o/5LSMOtKCZHet9/swmYDjiax2jHuuj+gju06CD6WSK5HR
   jwPLw3w579RD1n+UcbejyTJDHlDWDH5kY2Ge9KkpMrTgGMK4QIGiuwKdQ
   g==;
X-CSE-ConnectionGUID: QU8mtAOhTUGL3CWVgF6ihg==
X-CSE-MsgGUID: mtyS4GBuQhWmoCz6Xa97xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49305488"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="49305488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 18:56:02 -0700
X-CSE-ConnectionGUID: Gona/V5USEaobqVLBA23VA==
X-CSE-MsgGUID: ezm2cH0fT5SpLASKbSf+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138428560"
Received: from wopr.jf.intel.com ([10.54.75.146])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2025 18:56:02 -0700
From: Todd Brandt <todd.e.brandt@intel.com>
To: platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	xi.pardee@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	todd.e.brandt@linux.intel.com,
	todd.e.brandt@intel.com
Subject: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to intel_pmc_core driver
Date: Thu, 15 May 2025 18:56:00 -0700
Message-Id: <3492e00e6e343d03e28bc58c4365b282e71e786d.1747360275.git.todd.e.brandt@intel.com>
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

