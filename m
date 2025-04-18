Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E89186E2E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956293; cv=none; b=ZGMkBckHHpZzbI1xs83eLjPNCcwOxTGR0/kOFnPkgVBzuxiS3c76K4N3PlUDTk1U6MLC/DudmoAQveGgsfFGilUgcC4XRjm4mIzZjuum6uR03dCqnGbIyXszvZGxe2pegFUEvdirRo5bYtXWceY114EbAEEyu2Ii6BdkxJw2Wlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956293; c=relaxed/simple;
	bh=X4W0Iie5K8cmhGs8qziExYsbElUrP7FX1asRsw0XfCs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXwyXwL4CqH1VPK5VOEZu370JhGJZRpwrTEtt/oEXCdaniEQ+FJhyiQh7xk5OLevufA7Cp3SnPLBxmXMLmLlN4pzsNQaUDp7ooeVJoAKS0KSQu5kydbRN7skkRgYU/Tyq4uFBSA6iCi4dVNEdy/xb6zAyLOY1QIADHVv+pB8FkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Zf43N1ZN5z2TS2b;
	Fri, 18 Apr 2025 14:04:32 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B5A318001B;
	Fri, 18 Apr 2025 14:04:42 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:41 +0800
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
Subject: [PATCH 1/4] coresight: tmc: Add missing doc of tmc_drvdata::reading
Date: Fri, 18 Apr 2025 13:58:17 +0800
Message-ID: <20250418055820.3689408-2-hejunhao3@huawei.com>
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

From: Yicong Yang <yangyicong@hisilicon.com>

tmc_drvdata::reading is used to indicate whether a reading process
is performed through /dev/xyz.tmc. Document it.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 drivers/hwtracing/coresight/coresight-tmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..fdf7955e7350 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -174,6 +174,7 @@ struct etr_buf {
  * @pid:	Process ID of the process that owns the session that is using
  *		this component. For example this would be the pid of the Perf
  *		process.
+ * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
  * @len:	size of the available trace for ETF/ETB.
-- 
2.33.0

