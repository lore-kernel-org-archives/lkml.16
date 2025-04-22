Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386D266F0D;
	Tue, 22 Apr 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311591; cv=none; b=RcagBz6PGsghrap60Zx0hozAcyc4zTLOKnSbSS0YtDyH5r/VRiNhBSDMq1/xzsULwCriJ9Lw6BNnkVLZ+cD04egFWR8pm14gxIWPmxRqGKDv77ZE1bIcqW4MswbDPt4+4Wl5tT8Zsi9Ca5v3Fc93SDDY/HrsGdBLE8HXdLSbCsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311591; c=relaxed/simple;
	bh=MRSFNtkiXxF2rLRCNQwIhpaDs/Mwc0t61v5PuBsLqUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YT0wcNgntWrv8ipSRiqhWtFsrkJjMXdPAZqqyAlLqa2/pInf+iYXLOSBLUEAVrz41clsu3d65dgiU1USJWDndlH0KZVFbYhfYUGSqD8Nd5nCPdP9kS7djUMwUEgzzrgBPWtcbI7D4vj2KaOcF6G0bPauUbZthXhcnotoFsueYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbQR5kGNz6FCB6;
	Tue, 22 Apr 2025 16:44:47 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 7195A1402F3;
	Tue, 22 Apr 2025 16:46:27 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:46:26 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 5/5] DT: of_cpu_phandle_to_id to support SMT threads
Date: Tue, 22 Apr 2025 09:43:40 +0100
Message-ID: <20250422084340.457-6-alireza.sanaee@huawei.com>
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

Enhance the API to support SMT threads, this will allow sharing resources among
multiple SMT threads.

Enabled the sharing of resources, such as L1 Cache and clocks, between SMT
threads. It introduces a fix that uses thread IDs to match each CPU thread in
the register array within the cpu-node. This ensures that the cpu-map or any
driver relying on this API is fine even when SMT threads share resources.

Additionally, I have tested this for CPU based on the discussions in [1], I
adopted the new cpu-map layout, where the first parameter is a phandle and the
second is the local thread index, as shown below:

Used a new variable in CPU node "#cpu-cells", in which I describe the
number of parameters when parsing the phandle with arg to find the local
thread ID. This variable is not mandatory, and is indeed
backward-compatible.  The API first look for this particular variable,
if it does not exists, it just assume thread 0, which is the existing approach.

    core0 {
      thread0 {
        cpu = <&cpu0 0>;
      };
      thread1 {
        cpu = <&cpu0 1>;
      };
    };

[1] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index c2d729999a4e..2df07aea184e 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -189,21 +189,26 @@ int of_cpu_phandle_to_id(const struct device_node *node,
 			 const char * prop)
 {
 	bool found = false;
-	int cpu, ret;
+	int cpu, ret = -1;
+	uint32_t local_thread, thread_index;
 	struct device_node *np;
 	struct of_phandle_args args;
 
 	if (!node || !prop)
-		return -1;
-
-	ret = of_parse_phandle_with_args(node, prop, NULL, 0, &args);
-	if (ret < 0)
 		return ret;
 
+	ret = of_parse_phandle_with_args(node, prop, "#cpu-cells", 0, &args);
+	if (ret < 0) {
+		ret = of_parse_phandle_with_args(node, prop, NULL, 0, &args);
+		if (ret < 0)
+			return ret;
+	}
+
 	cpu_np = args.np;
+	thread_index = args.args_count == 1 ? args.args[0] : 0;
 	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
-		found = (cpu_np == np);
+		np = of_get_cpu_node(cpu, &local_thread);
+		found = (cpu_np == np) && (local_thread == thread_index);
 		of_node_put(np);
 		if (found)
 			return cpu;
-- 
2.43.0

