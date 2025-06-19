Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A262124DFF3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337775; cv=none; b=n0EI4ApGx74B4B8/rbiA5+T+vTKMVClHMoGC2JdyJW/pzhq0MF88Ooy6rhZ+mAOx7s0HIUcQqJ7gBLVlpzpdn7Oxp2F1x7SrgOt/xLH9uw5LFccVQoKE9k/3MIdIe3BLdTgqwroVN7cQcBdVdzJBshulm8TRNs8h6VVVZxiyEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337775; c=relaxed/simple;
	bh=uoLgiES/dfx8er3hrl4HglCoF+f3qY2anNwqB7c8KoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FK3mLc8gjc1/utvn3w/fapbwR0kvjJZLf5hFAvuPl2WLQWIxlrIeW+uqmifw4uQ3dVeCUjRYcF190xu+a1IR/P6IWgMG+zRtUIumd5Mt1k+m6LEdhl5lFWVadLSA93FrteWspG513LODyoqkOGsTwDFvDrz/l1D8Z843Ahs80J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bNLGg1Dmyz2QTws;
	Thu, 19 Jun 2025 20:56:59 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1DA451A0188;
	Thu, 19 Jun 2025 20:56:05 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:04 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:04 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RESEND PATCH v3 2/8] drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
Date: Thu, 19 Jun 2025 20:55:51 +0800
Message-ID: <20250619125557.57372-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250619125557.57372-1-yangyicong@huawei.com>
References: <20250619125557.57372-1-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemq200018.china.huawei.com (7.202.195.108)

From: Junhao He <hejunhao3@huawei.com>

HiSilicon DDRC v3 PMU has the different interrupt register offset
compared to the v2. Add device information of v3 PMU with ACPI
HID HISI0235.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 7e3c2436e96b..26eaa6d20c00 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -43,6 +43,11 @@
 #define DDRC_V2_EVENT_TYPE	0xe74
 #define DDRC_V2_PERF_CTRL	0xeA0
 
+/* DDRC interrupt registers definition in v3 */
+#define DDRC_V3_INT_MASK	0x534
+#define DDRC_V3_INT_STATUS	0x538
+#define DDRC_V3_INT_CLEAR	0x53C
+
 /* DDRC has 8-counters */
 #define DDRC_NR_COUNTERS	0x8
 #define DDRC_V1_PERF_CTRL_EN	0x2
@@ -460,9 +465,28 @@ static const struct hisi_pmu_dev_info hisi_ddrc_v2 = {
 	.private = &hisi_ddrc_v2_pmu_regs,
 };
 
+static struct hisi_ddrc_pmu_regs hisi_ddrc_v3_pmu_regs = {
+	.event_cnt = DDRC_V2_EVENT_CNT,
+	.event_ctrl = DDRC_V2_EVENT_CTRL,
+	.event_type = DDRC_V2_EVENT_TYPE,
+	.perf_ctrl = DDRC_V2_PERF_CTRL,
+	.perf_ctrl_en = DDRC_V2_PERF_CTRL_EN,
+	.int_mask = DDRC_V3_INT_MASK,
+	.int_clear = DDRC_V3_INT_CLEAR,
+	.int_status = DDRC_V3_INT_STATUS,
+};
+
+static const struct hisi_pmu_dev_info hisi_ddrc_v3 = {
+	.counter_bits = 48,
+	.check_event = DDRC_V2_NR_EVENTS,
+	.attr_groups = hisi_ddrc_pmu_v2_attr_groups,
+	.private = &hisi_ddrc_v3_pmu_regs,
+};
+
 static const struct acpi_device_id hisi_ddrc_pmu_acpi_match[] = {
 	{ "HISI0233", (kernel_ulong_t)&hisi_ddrc_v1 },
 	{ "HISI0234", (kernel_ulong_t)&hisi_ddrc_v2 },
+	{ "HISI0235", (kernel_ulong_t)&hisi_ddrc_v3 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_ddrc_pmu_acpi_match);
-- 
2.24.0

