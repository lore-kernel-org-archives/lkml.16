Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0B23183F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406061; cv=none; b=ac5l/99dut+SGNOT/LX0GB6vuqoyRDw8gk8J1Ao5MMFXM12WqcW4yfpTVmfI6mIbzH8P2SpZEhZxdsS9cvFKfLEGWZZ51ZyB+Uuwf7uRQLDgl3f1DRpdi9efAFu1wu2nd1lIhXHe/I/mY+OdS8NsniGrOpCLSgH0fAlyXse9/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406061; c=relaxed/simple;
	bh=kgjUCBY7hWKvBwPgUW5DXGpOXqyEJ6NS7knjgFudS9U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B5kK/F4a/4lbMRzzTOjPhGMkNpQ1qKxVNrWFLjaC8VLgu3iKr5KgSKyIIEsH/24V0Kv4c7/c65IVwyANCVi0CeOup2I6p4LrMHLcpSxhnATU+0V6ccY3YlTyjndXkfyai6ro2mP5GIvOyMeZvzVPEQCSOI6nHacWa0W+y0vzlXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bNqT707NKz27g7Z;
	Fri, 20 Jun 2025 15:52:43 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 788DF1400D4;
	Fri, 20 Jun 2025 15:54:14 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:14 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:13 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v2 1/3] coresight: tmc: Add missing doc of tmc_drvdata::reading
Date: Fri, 20 Jun 2025 15:54:10 +0800
Message-ID: <20250620075412.952934-2-hejunhao3@huawei.com>
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

tmc_drvdata::reading is used to indicate whether a reading process
is performed through /dev/xyz.tmc. Document it.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 drivers/hwtracing/coresight/coresight-tmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..3ca0d40c580d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -220,6 +220,7 @@ struct tmc_resrv_buf {
  * @pid:	Process ID of the process that owns the session that is using
  *		this component. For example this would be the pid of the Perf
  *		process.
+ * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
  * @stop_on_flush: Stop on flush trigger user configuration.
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
-- 
2.33.0

