Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFC61EE01F;
	Tue, 22 Apr 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311558; cv=none; b=p/xSgKe6dtA9TIKhe6Sx/D7Uv9jGf5ZqzBv2XtFC2/OOhxmJxBi8VqvgdjJxwv1QvFe8exVr90CWL6DDKEXRWEmDSSgdrun24QyZkFkN1QKcTs1S1b+rNc/im2gyHoj/AN8U9BJA6NbtKEWzfQgAiZJNPQSjYecniSD+npV0isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311558; c=relaxed/simple;
	bh=m4SCBTu6WuavCPl6m8tfaCMgYNX17NMKXBEztoh9e3o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLBnb2eLykROcGaqfhRfUwYtStHj7A9gpOaRxOwNryQ2QVpvnq5py53+tRuqRM3vo+05uxovWZWbu/QBTH/8iquTmcMV6jiBWB/jybMrpWZtvDGTywtrZrOFql+Mw+FSFty9deeg2zFtOT/+SyZSNziRpEgzongbcXX13UMm6rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbPp3Ncwz6L56K;
	Tue, 22 Apr 2025 16:44:14 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 18F24140594;
	Tue, 22 Apr 2025 16:45:54 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:45:53 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 4/5] driver/hwtracing/coresight: Use of_cpu_phandle_to_id for grabbing CPU id.
Date: Tue, 22 Apr 2025 09:43:39 +0100
Message-ID: <20250422084340.457-5-alireza.sanaee@huawei.com>
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

Use the newly created API to grab CPU id.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 .../hwtracing/coresight/coresight-cti-platform.c  | 15 +++------------
 drivers/hwtracing/coresight/coresight-platform.c  | 14 ++------------
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128..6a6e84245112 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -41,21 +41,12 @@
  */
 static int of_cti_get_cpu_at_node(const struct device_node *node)
 {
+	struct device_node *dn = NULL;
 	int cpu;
-	struct device_node *dn;
 
-	if (node == NULL)
-		return -1;
-
-	dn = of_parse_phandle(node, "cpu", 0);
-	/* CTI affinity defaults to no cpu */
-	if (!dn)
-		return -1;
-	cpu = of_cpu_node_to_id(dn);
+	cpu = of_cpu_phandle_to_id(node, dn,"cpu");
 	of_node_put(dn);
-
-	/* No Affinity  if no cpu nodes are found */
-	return (cpu < 0) ? -1 : cpu;
+	return cpu;
 }
 
 #else
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8192ba3279f0..cb953f25da82 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -167,19 +167,9 @@ of_coresight_get_output_ports_node(const struct device_node *node)
 
 static int of_coresight_get_cpu(struct device *dev)
 {
-	int cpu;
-	struct device_node *dn;
-
-	if (!dev->of_node)
-		return -ENODEV;
-
-	dn = of_parse_phandle(dev->of_node, "cpu", 0);
-	if (!dn)
-		return -ENODEV;
-
-	cpu = of_cpu_node_to_id(dn);
+	struct device_node *dn = NULL;
+	int cpu = of_cpu_phandle_to_id(dev->of_node, dn, "cpu");
 	of_node_put(dn);
-
 	return cpu;
 }
 
-- 
2.43.0

