Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197E42571A9;
	Fri,  2 May 2025 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202521; cv=none; b=UwwLYjNerPrzEY5k2A/YTeFinkn7IPlQg0zhrJAgTVYkw1w6bL9M1yOD1OE+EPxANOP9TFkYTXV2oDr3TSllvqiv6v+JlGVuwo3152JZFqRSzI8dI5m25omoFn802qK9PharWk2EyLNZQN8bpTQT6UEMzhFuUfkp1nAMOSSOv/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202521; c=relaxed/simple;
	bh=vsy3oN2Z7oNpTxQaL3FUY7WXhnGdXGwmIVjzlZnknNI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLpa43v0Xsheo9wl89awXA6nwUZRdRxbfXmjLB66GhWP4jYeEOJOztJgV60YCfQM4OGs/US6zeDVYXWbSDeGakAzzlXDUxhKPv7XimhsVUCXJJ5/QCS1k3W5QOtg5HR+3lPGsimI5weam63NtAxMWRNEM/Irrk+Swn/sfoLtOp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpwrb00Wnz6M4fN;
	Sat,  3 May 2025 00:10:54 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 3ADC11402F8;
	Sat,  3 May 2025 00:15:18 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:15:17 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 4/6] coresight: Use of_cpu_phandle_to_id for grabbing CPU id
Date: Fri, 2 May 2025 17:12:58 +0100
Message-ID: <20250502161300.1411-5-alireza.sanaee@huawei.com>
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

Use the newly created API to grab CPU id.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8192ba3279f0..be20caf965c9 100644
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
+	int cpu = of_cpu_phandle_to_id(dev->of_node, &dn);
 	of_node_put(dn);
-
 	return cpu;
 }
 
-- 
2.34.1

