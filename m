Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49803230D0D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406061; cv=none; b=DC2kwal/OQjRJo4yvgcLQp0SrJGiHFM8yJIjcVXX0UAMgrhrxTDQdXO7CEUdBSIW5SPmePg3FQ0lfEtajaIjkkNQDny/aOT+4p1un+d1uQAkSeq4r6bpUDkV5bY32Wzy56dmgmO0pFsQTiwp8cdn7DuFg9GlVjobzv/W7gCZp4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406061; c=relaxed/simple;
	bh=DHoSI1dxPFY3+Yyx0f+O3lhZysn1sLnDEJ6xDZObPy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=seLZJcx6RO2+EhSTWgIVGJQ1AeBbPAoPsDXLZjeTQ7I2c1POC+Zsti9cdh7Wm6fiWJt//7BaJNi3uRgfEILoKGrYXfO/v+MlypESp9slYwdVUQrA6BBACkjdIoz+BYbUde6Wr4pniLpRDpaEC8q8VOaDKYs36XvuGvq5G6cIBN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bNqWz1btmz2y92X;
	Fri, 20 Jun 2025 15:55:11 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 028711A0188;
	Fri, 20 Jun 2025 15:54:17 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:15 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:14 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v2 3/3] coresight: tmc: Decouple the perf buffer allocation from sysfs mode
Date: Fri, 20 Jun 2025 15:54:12 +0800
Message-ID: <20250620075412.952934-4-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250620075412.952934-1-hejunhao3@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn500004.china.huawei.com (7.202.194.145)

From: Yicong Yang <yangyicong@hisilicon.com>

Currently the perf buffer allocation follows the below logic:
- if the required AUX buffer size if larger, allocate the buffer with
  the required size
- otherwise allocate the size reference to the sysfs buffer size

This is not useful as we only collect to one AUX data, so just try to
allocate the buffer match the AUX buffer size.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Link: https://lore.kernel.org/linux-arm-kernel/df8967cd-2157-46a2-97d9-a1aea883cf63@arm.com/
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 29 ++++++-------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 252a57a8e94e..94dc968a76da 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1327,9 +1327,7 @@ EXPORT_SYMBOL_GPL(tmc_etr_get_buffer);
 
 /*
  * alloc_etr_buf: Allocate ETR buffer for use by perf.
- * The size of the hardware buffer is dependent on the size configured
- * via sysfs and the perf ring buffer size. We prefer to allocate the
- * largest possible size, scaling down the size by half until it
+ * Allocate the largest possible size, scaling down the size by half until it
  * reaches a minimum limit (1M), beyond which we give up.
  */
 static struct etr_buf *
@@ -1341,33 +1339,24 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
 	unsigned long size;
 
 	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
-	/*
-	 * Try to match the perf ring buffer size if it is larger
-	 * than the size requested via sysfs.
-	 */
-	if ((nr_pages << PAGE_SHIFT) > drvdata->size) {
-		etr_buf = tmc_alloc_etr_buf(drvdata, ((ssize_t)nr_pages << PAGE_SHIFT),
-					    0, node, NULL);
-		if (!IS_ERR(etr_buf))
-			goto done;
-	}
+
+	/* Use the minimum limit if the required size is smaller */
+	size = (unsigned long)nr_pages << PAGE_SHIFT;
+	if (size < TMC_ETR_PERF_MIN_BUF_SIZE)
+		size = TMC_ETR_PERF_MIN_BUF_SIZE;
 
 	/*
-	 * Else switch to configured size for this ETR
-	 * and scale down until we hit the minimum limit.
+	 * Try to allocate the required size for this ETR, if failed scale
+	 * down until we hit the minimum limit.
 	 */
-	size = drvdata->size;
 	do {
 		etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
 		if (!IS_ERR(etr_buf))
-			goto done;
+			return etr_buf;
 		size /= 2;
 	} while (size >= TMC_ETR_PERF_MIN_BUF_SIZE);
 
 	return ERR_PTR(-ENOMEM);
-
-done:
-	return etr_buf;
 }
 
 static struct etr_buf *
-- 
2.33.0

