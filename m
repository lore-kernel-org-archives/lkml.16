Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C901F4619
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676721; cv=none; b=bE8b3/t1q3VDRQT3/htalORXkE9rzeiIByERIbXCfTLjTwAYSV7Gx5gqpiRnZ8sFeR5teYcbzfFTC74t5RHhN/stc9zAln3zgXqOziiKN+5l+RjUXy8u5nLHh6yGQFCdMa+kNRgTiqZMNaUSvx3ZG2qefOte6eI4nTvig6h42mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676721; c=relaxed/simple;
	bh=TZuSjjPVVMh5QjkxWHiyyAQuAU1YntQa8GkY3GzIpsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=App2+zyDvzxo4gx8LBhVBps2H4IMxbUOGg3YT7oMrw/PAc4b5d0Ibl9YExMTpeSAKPThNxQm6x6cpTbH442jtqkKUz3+XJeczdUZIILTox8+dTFwlbYFvEXp4VBEX7k33Xdi/ryrYjUcFYCoWfLiYM/eFnLCV5dWuNk2klrQDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 109206eca;
	Thu, 3 Apr 2025 15:09:24 +0800 (GMT+08:00)
From: Hongbo Yao <andy.xu@hj-micro.com>
To: will@kernel.org,
	robin.murphy@arm.com
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andy.xu@hj-micro.com,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH v3] perf: arm-ni: Unregister PMUs on probe failure
Date: Thu,  3 Apr 2025 15:09:18 +0800
Message-ID: <20250403070918.4153839-1-andy.xu@hj-micro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0pCVhpLHRpDGE0dS01DGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a95fa7baff103afkunm109206eca
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBw6Mzo5FzJNKQIXFkkaURk5
	GgMKCz1VSlVKTE9ITU1PSk1OQkxLVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VKT0xVSk5DWVdZCAFZQU9JS003Bg++

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
Changes in v3:
 - Simplify the fix with the existing pmu_base logic. 
 - v2: https://lore.kernel.org/linux-arm-kernel/a1cf32e8-c711-476d-a827-e3affedba780@hj-micro.com/T/#ma3347cf5dca2c3cedbfd475f76931ca7b2751019

---
 drivers/perf/arm-ni.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index bdb9e6af8732..de7b6cce4d68 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -575,6 +575,23 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 	return err;
 }
 
+static void arm_ni_remove(struct platform_device *pdev)
+{
+	struct arm_ni *ni = platform_get_drvdata(pdev);
+
+	for (int i = 0; i < ni->num_cds; i++) {
+		struct arm_ni_cd *cd = ni->cds + i;
+
+		if (!cd->pmu_base)
+			continue;
+
+		writel_relaxed(0, cd->pmu_base + NI_PMCR);
+		writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENCLR);
+		perf_pmu_unregister(&cd->pmu);
+		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
+	}
+}
+
 static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
 {
 	u32 reg = readl_relaxed(base + NI_NODE_TYPE);
@@ -657,8 +674,11 @@ static int arm_ni_probe(struct platform_device *pdev)
 				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
 				arm_ni_probe_domain(base + reg, &cd);
 				ret = arm_ni_init_cd(ni, &cd, res->start);
-				if (ret)
+				if (ret) {
+					ni->cds[cd.id].pmu_base = NULL;
+					arm_ni_remove(pdev);
 					return ret;
+				}
 			}
 		}
 	}
@@ -666,23 +686,6 @@ static int arm_ni_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void arm_ni_remove(struct platform_device *pdev)
-{
-	struct arm_ni *ni = platform_get_drvdata(pdev);
-
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
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id arm_ni_of_match[] = {
 	{ .compatible = "arm,ni-700" },
-- 
2.43.0

