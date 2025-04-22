Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A51EB199;
	Tue, 22 Apr 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311524; cv=none; b=IWpQXruchXOhYSsaHoISV7rO8d/tpfnwFeWr0TG50+AJJT4RuxVYhN+AwomBC3FK6yWBLQ/xoCDQRct+ELfceU1SXB6DHDzBzrMS5/BmeD5ePCpDffYq2Q0dfT653fsYGbfs793fe4v+7VByX4tN4W20iPpj2EiVUheDZUUXnwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311524; c=relaxed/simple;
	bh=COrlN25HZnO20YWMfJb/3b5Ae/h1Phh2+SBju7eLJmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBKr9tdi5dEkpcIuuVIwzMuGlRJgHkPQ6M8flE/9Z/3tIYbPHJJEIS06c7E6bID6FuaRDV3qrwr1C8AcmIRxnfxoAaz5TLs/VBV465aR8A1nGbygUaWvlNailobMerITqvdqLDDxHRyxVBp50qu+gvj/YneadJX8HeQ5c40ek+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbLK0RzYz6M4gc;
	Tue, 22 Apr 2025 16:41:13 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id AABD11402F3;
	Tue, 22 Apr 2025 16:45:20 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:45:20 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 3/5] driver/base/arch_topology: update CPU map to use the new API.
Date: Tue, 22 Apr 2025 09:43:38 +0100
Message-ID: <20250422084340.457-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422084340.457-1-alireza.sanaee@huawei.com>
References: <20250422084340.457-1-alireza.sanaee@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)

Cleans up the cpu-map generation using the created API.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/base/arch_topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 3ebe77566788..653a56625477 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -518,23 +518,23 @@ core_initcall(free_raw_capacity);
  */
 static int __init get_cpu_for_node(struct device_node *node)
 {
+	struct device_node *cpu_node = NULL;
 	int cpu;
-	struct device_node *cpu_node __free(device_node) =
-		of_parse_phandle(node, "cpu", 0);
 
-	if (!cpu_node)
-		return -1;
+	cpu = of_cpu_phandle_to_id(node, cpu_node, "cpu");
 
-	cpu = of_cpu_node_to_id(cpu_node);
 	if (cpu >= 0)
 		topology_parse_cpu_capacity(cpu_node, cpu);
-	else
+	else if (cpu == -ENODEV)
 		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
 			cpu_node, cpumask_pr_args(cpu_possible_mask));
+	else
+		return -1;
 
 	return cpu;
 }
 
+
 static int __init parse_core(struct device_node *core, int package_id,
 			     int cluster_id, int core_id)
 {
-- 
2.43.0

