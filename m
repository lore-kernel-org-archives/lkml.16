Received: from mail-m3272.qiye.163.com (mail-m3272.qiye.163.com [220.197.32.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F192147F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439906; cv=none; b=LsOhA36X4djb6Z0Hc6OabwnCVv2Z7a5OgXzeWSU8qq1AYGWCUF/KPUpfFe0VKqgCXz0ZwK7EbiB/cNiTpWy9lLlDTrXI+6/Go0xAp/BhhgGYM7bpnKnvI3cyRUWAMwk7BarJpv+JkHA5ncSwXTCfpQwBH1Exh9iN7+itbcbXaJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439906; c=relaxed/simple;
	bh=f97/nkeUTuQkuArGiJaplsBFm3ZSPyqqWG16TY3uKy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=avxPFgWUSBYVU6ccgLkeljsUmPQkqnWmUPrheqZFqyrMGVUwN6RzXCNVikk7V+RpDhT4hSSfJifdnokX5bJJFmiIdAc0eJJ2W1l1oy+vrpQq70J3eDJbIXbXg3Mt0pxEHHJTm2fWM9qaum6pio6SiIWGi7skuVLPHzjF1Ru+dSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=220.197.32.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 102faff97;
	Mon, 31 Mar 2025 20:15:43 +0800 (GMT+08:00)
From: HongBo Yao <andy.xu@hj-micro.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andy.xu@hj-micro.com,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH v2] perf: arm-ni: Fix list_add() corruption in arm_ni_probe()
Date: Mon, 31 Mar 2025 20:15:36 +0800
Message-ID: <20250331121536.2626552-1-andy.xu@hj-micro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkNIVh1LTUwdTEMdHh8ZQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a95ec210c3303afkunm102faff97
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6URw*GDJRDxY8EBITEBU8
	ThVPFBNVSlVKTE9IT0lISE9PT0xPVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VKT0xVSk5DWVdZCAFZQU9OQ0k3Bg++

From: Hongbo Yao <andy.xu@hj-micro.com>

When a resource allocation fails in one clock domain of an NI device,
we need to properly roll back all previously registered perf PMUs in
other clock domains of the same device.

Otherwise, it can lead to kernel panics.

Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
list_add corruption: next->prev should be prev (fffffd01e9698a18),
but was 0000000000000000. (next=ffff10001a0decc8).
pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : list_add_valid_or_report+0x7c/0xb8
lr : list_add_valid_or_report+0x7c/0xb8
Call trace:
 __list_add_valid_or_report+0x7c/0xb8
 perf_pmu_register+0x22c/0x3a0
 arm_ni_probe+0x554/0x70c [arm_ni]
 platform_probe+0x70/0xe8
 really_probe+0xc6/0x4d8
 driver_probe_device+0x48/0x170
 __driver_attach+0x8e/0x1c0
 bus_for_each_dev+0x64/0xf0
 driver_add+0x138/0x260
 bus_add_driver+0x68/0x138
 __platform_driver_register+0x2c/0x40
 arm_ni_init+0x14/0x2a [arm_ni]
 do_init_module+0x36/0x298
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops - BUG: Fatal exception
SMP: stopping secondary CPUs

Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
---
 drivers/perf/arm-ni.c | 44 +++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index fd7a5e60e963..ee85577e86b9 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -102,6 +102,7 @@ struct arm_ni_unit {
 struct arm_ni_cd {
 	void __iomem *pmu_base;
 	u16 id;
+	bool pmu_registered;
 	int num_units;
 	int irq;
 	int cpu;
@@ -571,10 +572,31 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 	err = perf_pmu_register(&cd->pmu, name, -1);
 	if (err)
 		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
+	else
+		cd->pmu_registered = true;
 
 	return err;
 }
 
+static void arm_ni_remove_cds(struct arm_ni *ni)
+{
+	for (int i = 0; i < ni->num_cds; i++) {
+		struct arm_ni_cd *cd = ni->cds + i;
+
+		if (!cd->pmu_base)
+			continue;
+
+		if (!cd->pmu_registered)
+			continue;
+
+		writel_relaxed(0, cd->pmu_base + NI_PMCR);
+		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
+		perf_pmu_unregister(&cd->pmu);
+		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
+	}
+}
+
+
 static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
 {
 	u32 reg = readl_relaxed(base + NI_NODE_TYPE);
@@ -593,6 +615,7 @@ static int arm_ni_probe(struct platform_device *pdev)
 	void __iomem *base;
 	static atomic_t id;
 	int num_cds;
+	int ret;
 	u32 reg, part;
 
 	/*
@@ -651,35 +674,28 @@ static int arm_ni_probe(struct platform_device *pdev)
 			reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
 			arm_ni_probe_domain(base + reg, &pd);
 			for (int c = 0; c < pd.num_components; c++) {
-				int ret;
-
 				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
 				arm_ni_probe_domain(base + reg, &cd);
 				ret = arm_ni_init_cd(ni, &cd, res->start);
 				if (ret)
-					return ret;
+					goto init_cd_cleanup;
 			}
 		}
 	}
 
 	return 0;
+
+init_cd_cleanup:
+	arm_ni_remove_cds(ni);
+
+	return ret;
 }
 
 static void arm_ni_remove(struct platform_device *pdev)
 {
 	struct arm_ni *ni = platform_get_drvdata(pdev);
 
-	for (int i = 0; i < ni->num_cds; i++) {
-		struct arm_ni_cd *cd = ni->cds + i;
-
-		if (!cd->pmu_base)
-			continue;
-
-		writel_relaxed(0, cd->pmu_base + NI_PMCR);
-		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
-		perf_pmu_unregister(&cd->pmu);
-		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
-	}
+	arm_ni_remove_cds(ni);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

