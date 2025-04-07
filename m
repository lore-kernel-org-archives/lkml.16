Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4652AE66;
	Mon,  7 Apr 2025 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045883; cv=none; b=I8ZuMoF8TWQwyOkNxN6TshK+N2COTIpnFNpkk2MzR3ZjKJ1BL7x+gAcArc7LgaqUQoZCJUW6YI7bDjRyYNkK2dEi85tamKNKhmFTWedePOeScq/hFUWWEdAhvzjZTUaZIwf4ukXfHG7p4MsP1IYALbe2md9Q+kTM+Dh8ZjhDjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045883; c=relaxed/simple;
	bh=8LXaPygDfni3CPkRlg6WjoVmUsQjp7rmoKFXbZwc9lk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IUr0mm7rB892EhuFBxCCPIHXu1EZtjuLiI81G9IPt+eU9JDfCSjt27fAI3AotWkCjAXUBlVIXja9E4Mh/EmZQahF9aCX9Hmhn9gbcpJxT4E+hyE9/yeGWJxLpu9vOw0FWQFoUHyHpFsAe0kDBLAkQJ5nHdRE+2hMdE6HhqmhPv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsAHywdY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsAHywdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744045882; x=1775581882;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8LXaPygDfni3CPkRlg6WjoVmUsQjp7rmoKFXbZwc9lk=;
  b=KsAHywdY/TMzyNT8uWeKHxUlNkX8BuvmVOUn5Fvhqbti5CgwRZIxWb7F
   re3ew/k/HCNw/jqFKGVK5Sf0qTWkilVDJoBim/bFUQp7G7MkyX08LZQvO
   u3iJNVpdpXaizD4yFkIgWqsWxy1PovSxIV2DsKle/j/1469w0bUM7kZFR
   Gj2Fc3L1Bp36VLzmp5O3FlJrAWpwDxgdxPe1e11JFUi+7jfJkyDl5FUMZ
   f3hB4FxpUXbdGoR6Dkslq2MncTgn9BwDcAqOtXwO2gQLHMlOEb+skTPLf
   Qlp1K+XbGRw4R1u/ahe38E6gQ0385rtFql2RmHra9rCmRvTSvKBfWTTAq
   g==;
X-CSE-ConnectionGUID: oBuGOWcHTqaXQLKhgqgmpQ==
X-CSE-MsgGUID: jav4FV5XRuytNBH7Dpbzow==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45335146"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45335146"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:11:21 -0700
X-CSE-ConnectionGUID: 6dUbJlVXTyaOyD5c1Um7ww==
X-CSE-MsgGUID: P5TtE4j2QMGMTc636ujTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132147300"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:11:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] platform/x86/intel/pmc: Rename pmc_index -> pmcidx
Date: Mon,  7 Apr 2025 20:11:12 +0300
Message-Id: <20250407171112.2255-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename pmc_index variables to pmcidx which contains the same amount
information with less characters (helps to shorten e.g. for loop
lines).

Also change pmc_idx -> pmcidx to keep formatting consistent and similar
to e.g. "pmcdev".

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/core.c       | 36 ++++++++++-----------
 drivers/platform/x86/intel/pmc/core_ssram.c | 12 +++----
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 7a1d11f2914f..f64f6369fdf5 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -257,7 +257,7 @@ static unsigned int pmc_core_lpm_get_arr_size(const struct pmc_bit_map **maps)
 }
 
 static void pmc_core_lpm_display(struct pmc *pmc, struct device *dev,
-				 struct seq_file *s, u32 offset, int pmc_index,
+				 struct seq_file *s, u32 offset, int pmcidx,
 				 const char *str,
 				 const struct pmc_bit_map **maps)
 {
@@ -276,19 +276,19 @@ static void pmc_core_lpm_display(struct pmc *pmc, struct device *dev,
 
 	for (idx = 0; idx < arr_size; idx++) {
 		if (dev)
-			dev_info(dev, "\nPMC%d:LPM_%s_%d:\t0x%x\n", pmc_index, str, idx,
+			dev_info(dev, "\nPMC%d:LPM_%s_%d:\t0x%x\n", pmcidx, str, idx,
 				lpm_regs[idx]);
 		if (s)
-			seq_printf(s, "\nPMC%d:LPM_%s_%d:\t0x%x\n", pmc_index, str, idx,
+			seq_printf(s, "\nPMC%d:LPM_%s_%d:\t0x%x\n", pmcidx, str, idx,
 				   lpm_regs[idx]);
 		for (index = 0; maps[idx][index].name && index < len; index++) {
 			bit_mask = maps[idx][index].bit_mask;
 			if (dev)
-				dev_info(dev, "PMC%d:%-30s %-30d\n", pmc_index,
+				dev_info(dev, "PMC%d:%-30s %-30d\n", pmcidx,
 					maps[idx][index].name,
 					lpm_regs[idx] & bit_mask ? 1 : 0);
 			if (s)
-				seq_printf(s, "PMC%d:%-30s %-30d\n", pmc_index,
+				seq_printf(s, "PMC%d:%-30s %-30d\n", pmcidx,
 					   maps[idx][index].name,
 					   lpm_regs[idx] & bit_mask ? 1 : 0);
 		}
@@ -305,10 +305,10 @@ static inline u8 pmc_core_reg_read_byte(struct pmc *pmc, int offset)
 }
 
 static void pmc_core_display_map(struct seq_file *s, int index, int idx, int ip,
-				 int pmc_index, u8 pf_reg, const struct pmc_bit_map **pf_map)
+				 int pmcidx, u8 pf_reg, const struct pmc_bit_map **pf_map)
 {
 	seq_printf(s, "PMC%d:PCH IP: %-2d - %-32s\tState: %s\n",
-		   pmc_index, ip, pf_map[idx][index].name,
+		   pmcidx, ip, pf_map[idx][index].name,
 		   pf_map[idx][index].bit_mask & pf_reg ? "Off" : "On");
 }
 
@@ -465,7 +465,7 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
 	struct pmc *pmc;
 	const struct pmc_reg_map *map;
 	u32 reg;
-	unsigned int pmc_index;
+	unsigned int pmcidx;
 	int ltr_index;
 
 	ltr_index = value;
@@ -473,8 +473,8 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
 	 * is based on the contiguous indexes from ltr_show output.
 	 * pmc index and ltr index needs to be calculated from it.
 	 */
-	for (pmc_index = 0; pmc_index < ARRAY_SIZE(pmcdev->pmcs) && ltr_index >= 0; pmc_index++) {
-		pmc = pmcdev->pmcs[pmc_index];
+	for (pmcidx = 0; pmcidx < ARRAY_SIZE(pmcdev->pmcs) && ltr_index >= 0; pmcidx++) {
+		pmc = pmcdev->pmcs[pmcidx];
 
 		if (!pmc)
 			continue;
@@ -491,10 +491,10 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
 		ltr_index = ltr_index - (map->ltr_ignore_max + 2) - 1;
 	}
 
-	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
+	if (pmcidx >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
 		return -EINVAL;
 
-	pr_debug("ltr_ignore for pmc%d: ltr_index:%d\n", pmc_index, ltr_index);
+	pr_debug("ltr_ignore for pmc%d: ltr_index:%d\n", pmcidx, ltr_index);
 
 	guard(mutex)(&pmcdev->lock);
 
@@ -827,7 +827,7 @@ static int pmc_core_substate_l_sts_regs_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_l_sts_regs);
 
-static void pmc_core_substate_req_header_show(struct seq_file *s, int pmc_index)
+static void pmc_core_substate_req_header_show(struct seq_file *s, int pmcidx)
 {
 	struct pmc_dev *pmcdev = s->private;
 	int mode;
@@ -846,11 +846,11 @@ static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
 	u32 sts_offset;
 	u32 sts_offset_live;
 	u32 *lpm_req_regs;
-	unsigned int mp, pmc_index;
+	unsigned int mp, pmcidx;
 	int num_maps;
 
-	for (pmc_index = 0; pmc_index < ARRAY_SIZE(pmcdev->pmcs); ++pmc_index) {
-		struct pmc *pmc = pmcdev->pmcs[pmc_index];
+	for (pmcidx = 0; pmcidx < ARRAY_SIZE(pmcdev->pmcs); ++pmcidx) {
+		struct pmc *pmc = pmcdev->pmcs[pmcidx];
 		const struct pmc_bit_map **maps;
 
 		if (!pmc)
@@ -871,7 +871,7 @@ static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
 			continue;
 
 		/* Display the header */
-		pmc_core_substate_req_header_show(s, pmc_index);
+		pmc_core_substate_req_header_show(s, pmcidx);
 
 		/* Loop over maps */
 		for (mp = 0; mp < num_maps; mp++) {
@@ -909,7 +909,7 @@ static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
 				}
 
 				/* Display the element name in the first column */
-				seq_printf(s, "pmc%d: %26s |", pmc_index, map[i].name);
+				seq_printf(s, "pmc%d: %26s |", pmcidx, map[i].name);
 
 				/* Loop over the enabled states and display if required */
 				pmc_for_each_mode(mode, pmcdev) {
diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 739569803017..7a9002e46947 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -219,9 +219,9 @@ static inline u64 get_base(void __iomem *addr, u32 offset)
 
 static int
 pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
-		 const struct pmc_reg_map *reg_map, int pmc_index)
+		 const struct pmc_reg_map *reg_map, int pmcidx)
 {
-	struct pmc *pmc = pmcdev->pmcs[pmc_index];
+	struct pmc *pmc = pmcdev->pmcs[pmcidx];
 
 	if (!pwrm_base)
 		return -ENODEV;
@@ -242,13 +242,13 @@ pmc_core_pmc_add(struct pmc_dev *pmcdev, u64 pwrm_base,
 		return -ENOMEM;
 	}
 
-	pmcdev->pmcs[pmc_index] = pmc;
+	pmcdev->pmcs[pmcidx] = pmc;
 
 	return 0;
 }
 
 static int
-pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
+pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmcidx, u32 offset)
 {
 	struct pci_dev *ssram_pcidev = pmcdev->ssram_pcidev;
 	void __iomem __free(pmc_core_iounmap) *tmp_ssram = NULL;
@@ -265,7 +265,7 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
 	if (!tmp_ssram)
 		return -ENOMEM;
 
-	if (pmc_idx != PMC_IDX_MAIN) {
+	if (pmcidx != PMC_IDX_MAIN) {
 		/*
 		 * The secondary PMC BARS (which are behind hidden PCI devices)
 		 * are read from fixed offsets in MMIO of the primary PMC BAR.
@@ -293,7 +293,7 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
 	if (!map)
 		return -ENODEV;
 
-	return pmc_core_pmc_add(pmcdev, pwrm_base, map, pmc_idx);
+	return pmc_core_pmc_add(pmcdev, pwrm_base, map, pmcidx);
 }
 
 int pmc_core_ssram_init(struct pmc_dev *pmcdev, int func)

base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
-- 
2.39.5

