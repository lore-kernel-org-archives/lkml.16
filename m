Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76A25FA2E;
	Fri,  2 May 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202590; cv=none; b=nF0wyGG0DB9aC+Lh9rSethhZnSqgGrjn9TTS5czVOuSCeirjfR+K3hLegcYJnO+slsvLSFrT5/vZ0nDZNEY2Xx5si5QfxaI8p0ISu6uF/0lOwtxTuZv9q4DbdC8UsZRU/C7ia8M+PpoqsqqARnTkKxj74W5PVRu4tQZBC6si0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202590; c=relaxed/simple;
	bh=wKgdDF5WGHH+zvGwPArrdCnDJDg+Q1t+PYb1hHVZCxU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhJn/E5+Sv67P952GPnzoFeOhuu6vg3IhKkNV3MJZXV9lNrTtKAVMV2Zqei135KyM6ogGZ9ykLrK1SmE5t3ug+IQCVl2/Dchm2jHgV7jfvho+OpoQwx9RT7cRL8EjAexPCGepmnU+/fp8/5jy+CZ+NLVLhAe5qLp/eaGoCFuIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpwst4H8jz6M4Wn;
	Sat,  3 May 2025 00:12:02 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id CB5CE140370;
	Sat,  3 May 2025 00:16:25 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:16:24 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Date: Fri, 2 May 2025 17:13:00 +0100
Message-ID: <20250502161300.1411-7-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502161300.1411-1-alireza.sanaee@huawei.com>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
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

In the CPU map, there are two cases that only one occurs at at time.
    1) "cpu" = <phandle>
    2) "cpus" = <phandle> <index>

The first case addresses non-SMTs and the second case addresses SMTs
that the variable must be cpu(s) with an index where we later look up
the reg array with that.

    core0 {
      thread0 {
        cpus = <&cpu0 0>;
      };
      thread1 {
        cpus = <&cpu0 1>;
      };
    };

[1] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 1e8d1fa04d3c..fbd3f6d4a87f 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -186,14 +186,41 @@ EXPORT_SYMBOL(of_cpu_node_to_id);
 int of_cpu_phandle_to_id(const struct device_node *node,
 			 struct device_node **cpu_np)
 {
+	int cpu, ret;
+	bool found = false;
+	uint32_t local_thread, thread_index;
+	struct device_node *np;
+	struct of_phandle_args args;
+
 	if (!node)
 		return -1;
 
+	/*
+	 * Two cases which only one occurs at a time:
+	 * 1) cpu = <phandle>
+	 * 2) cpus = <phandle> <thread_index>
+	 */
 	*cpu_np = of_parse_phandle(node, "cpu", 0);
-	if (!cpu_np)
-		return -ENODEV;
+	if (!*cpu_np) {
+		ret = of_parse_phandle_with_fixed_args(node, "cpus", 1, 0,
+						       &args);
+		if (ret < 0)
+			return ret;
+
+		*cpu_np = args.np;
+		thread_index = args.args[0];
+		for_each_possible_cpu(cpu) {
+			np = of_get_cpu_node(cpu, &local_thread);
+			found = (*cpu_np == np) && (local_thread == thread_index);
+			of_node_put(np);
+			if (found)
+				return cpu;
+		}
 
-	return of_cpu_node_to_id(*cpu_np);
+		return -ENODEV;
+	} else {
+		return of_cpu_node_to_id(*cpu_np);
+	}
 }
 EXPORT_SYMBOL(of_cpu_phandle_to_id);
 
-- 
2.34.1

