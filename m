Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEBC1547CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956294; cv=none; b=RSFUGXC9lyh145+i7z0sMy6TxivsU4IcKuwe8IkQwBZLE131rdCTPwrlPCFbfX1jc513i6KuyFsphQe+9emgvdPSY61c5woa8W15SOePwV3B9nOQNVFKHnp+/POVWfxDOI3F/6SAkvFr4gUl3icoIbXxNCrL1VqqqTlZcPwcRHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956294; c=relaxed/simple;
	bh=qNY7YSh2+kFRexmcSGmb5dvk+nPfGXAJ1IS4/kHj+HM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LzdNbfvhHk6Sc/AoLb2sZ/0zZGXHQuTJ1E5r3S3HfNGmtyyRHp0OiIAY8gHK0ht3eQdwmVfMzImtTl7TrP4Y/9I3GH7vWMAgsz1gMOpaQnycySUmq8LbMuITo6LGmkXINaQtBbezoiDbc/B86RsZ6zfPPcUaCaKYplFm5SQc+QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Zf44N48P5z27hDh;
	Fri, 18 Apr 2025 14:05:24 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D6361A016C;
	Fri, 18 Apr 2025 14:04:42 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:42 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:41 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <mike.leach@linaro.org>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<hejunhao3@huawei.com>
Subject: [PATCH 2/4] coresight: catu: add locking to catu enable/disable functions
Date: Fri, 18 Apr 2025 13:58:18 +0800
Message-ID: <20250418055820.3689408-3-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250418055820.3689408-1-hejunhao3@huawei.com>
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemn500004.china.huawei.com (7.202.194.145)

In the function coresight_enable_path(), all adjacent helper components
along the path are enabled first. Without proper locking, a race
condition may occur between concurrent sysfs and perf calls to these
functions, potentially leading to incorrectly obtained settings or
misconfigured CATU control-enable flags.

Requires spinlock in catu_enable()/catu_disable() to:
- Serialize sysfs/perf concurrent accesses
- Prevent corruption of CATU control-enable flags

Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 6 ++++++
 drivers/hwtracing/coresight/coresight-catu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..54ce13254d7c 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -461,6 +461,8 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 	int rc;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
+	guard(spinlock_irqsave)(&catu_drvdata->spinlock);
+
 	CS_UNLOCK(catu_drvdata->base);
 	rc = catu_enable_hw(catu_drvdata, mode, data);
 	CS_LOCK(catu_drvdata->base);
@@ -489,6 +491,8 @@ static int catu_disable(struct coresight_device *csdev, void *__unused)
 	int rc;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
+	guard(spinlock_irqsave)(&catu_drvdata->spinlock);
+
 	CS_UNLOCK(catu_drvdata->base);
 	rc = catu_disable_hw(catu_drvdata);
 	CS_LOCK(catu_drvdata->base);
@@ -523,6 +527,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
 		goto out;
 	}
 
+	spin_lock_init(&drvdata->spinlock);
+
 	/* Setup dma mask for the device */
 	dma_mask = readl_relaxed(base + CORESIGHT_DEVID) & 0x3f;
 	switch (dma_mask) {
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 141feac1c14b..eb7c9189b066 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -64,6 +64,7 @@ struct catu_drvdata {
 	struct clk *pclk;
 	void __iomem *base;
 	struct coresight_device *csdev;
+	spinlock_t spinlock;
 	int irq;
 };
 
-- 
2.33.0

