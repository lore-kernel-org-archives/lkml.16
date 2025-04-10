Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226120C472
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276107; cv=none; b=tuiMG2m9naiP9JZZI+cSt6+7Sw1m2vmMGjnRAx5GI6889ZLvc4Z+fddimm6z4/HdeE6joJed++6WCQ7nbY/4ohZDGzLm8UP5FjQ63ppxVgqZeTtrvdZi49XfkEFmRvnIq4koTWlvFqMVWMeAZi8GhW4vmV82BGrYuF4Mi9dznyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276107; c=relaxed/simple;
	bh=dyRpH0nYuNks3GpNno7ihwa0O5nmvtWOu7ZWSkNXlcg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXHQtyVFpL01iVTNlhUjLithd2tt5+ypGzkcCOqoe9F3O8UqUmjYFCdd/Dmk6GD8KLT8IClW8AxCXpUFxbiVe2N/ejB24fa3YJbAmXqmHXwRoGjauKpFYjApQ+vMC/Lbp8IyxGIeBJjs/an2nuh9ELKeXq4iu2Gsnoc+lW+EgVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZYDWz4Zmnz27hNx;
	Thu, 10 Apr 2025 17:09:03 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id F11C11400D4;
	Thu, 10 Apr 2025 17:08:22 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Apr 2025 17:08:22 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v3 4/8] drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
Date: Thu, 10 Apr 2025 17:08:21 +0800
Message-ID: <20250410090825.13214-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250410090825.13214-1-yangyicong@huawei.com>
References: <20250410090825.13214-1-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)

From: Junhao He <hejunhao3@huawei.com>

SLLC v3 PMU has the following changes compared to previous version:
a) update the register layout
b) update the definition of SRCID_CTRL and TGTID_CTRL registers.
   To be compatible with v2, we use maximum width (11 bits)
   and mask the extra length for themselves.
c) remove latency events (driver does not need to be adapted).

SLLC v3 PMU is identified with HID HISI0264.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index 79327639ec17..852114cfe3bf 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -28,6 +28,18 @@
 #define SLLC_VERSION			0x1cf0
 #define SLLC_EVENT_CNT0_L		0x1d00
 
+/* SLLC registers definition in v3 */
+#define SLLC_V3_INT_MASK		0x6834
+#define SLLC_V3_INT_STATUS		0x6838
+#define SLLC_V3_INT_CLEAR		0x683c
+#define SLLC_V3_VERSION			0x6c00
+#define SLLC_V3_PERF_CTRL		0x6d00
+#define SLLC_V3_SRCID_CTRL		0x6d04
+#define SLLC_V3_TGTID_CTRL		0x6d08
+#define SLLC_V3_EVENT_CTRL		0x6d14
+#define SLLC_V3_EVENT_TYPE0		0x6d18
+#define SLLC_V3_EVENT_CNT0_L		0x6e00
+
 #define SLLC_EVTYPE_MASK		0xff
 #define SLLC_PERF_CTRL_EN		BIT(0)
 #define SLLC_FILT_EN			BIT(1)
@@ -40,6 +52,12 @@
 #define SLLC_TGTID_MAX_SHIFT		12
 #define SLLC_SRCID_CMD_SHIFT		1
 #define SLLC_SRCID_MSK_SHIFT		12
+
+#define SLLC_V3_TGTID_MIN_SHIFT		1
+#define SLLC_V3_TGTID_MAX_SHIFT		10
+#define SLLC_V3_SRCID_CMD_SHIFT		1
+#define SLLC_V3_SRCID_MSK_SHIFT		10
+
 #define SLLC_NR_EVENTS			0x80
 #define SLLC_EVENT_CNTn(cnt0, n)	((cnt0) + (n) * 8)
 
@@ -404,6 +422,27 @@ static const struct hisi_pmu_dev_info hisi_sllc_v2 = {
 	.private = &hisi_sllc_v2_pmu_regs,
 };
 
+static struct hisi_sllc_pmu_regs hisi_sllc_v3_pmu_regs = {
+	.int_mask = SLLC_V3_INT_MASK,
+	.int_clear = SLLC_V3_INT_CLEAR,
+	.int_status = SLLC_V3_INT_STATUS,
+	.perf_ctrl = SLLC_V3_PERF_CTRL,
+	.srcid_ctrl = SLLC_V3_SRCID_CTRL,
+	.srcid_cmd_shift = SLLC_V3_SRCID_CMD_SHIFT,
+	.srcid_mask_shift = SLLC_V3_SRCID_MSK_SHIFT,
+	.tgtid_ctrl = SLLC_V3_TGTID_CTRL,
+	.tgtid_min_shift = SLLC_V3_TGTID_MIN_SHIFT,
+	.tgtid_max_shift = SLLC_V3_TGTID_MAX_SHIFT,
+	.event_ctrl = SLLC_V3_EVENT_CTRL,
+	.event_type0 = SLLC_V3_EVENT_TYPE0,
+	.version = SLLC_V3_VERSION,
+	.event_cnt0 = SLLC_V3_EVENT_CNT0_L,
+};
+
+static const struct hisi_pmu_dev_info hisi_sllc_v3 = {
+	.private = &hisi_sllc_v3_pmu_regs,
+};
+
 static const struct hisi_uncore_ops hisi_uncore_sllc_ops = {
 	.write_evtype		= hisi_sllc_pmu_write_evtype,
 	.get_event_idx		= hisi_uncore_pmu_get_event_idx,
@@ -497,6 +536,7 @@ static void hisi_sllc_pmu_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id hisi_sllc_pmu_acpi_match[] = {
 	{ "HISI0263", (kernel_ulong_t)&hisi_sllc_v2 },
+	{ "HISI0264", (kernel_ulong_t)&hisi_sllc_v3 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_sllc_pmu_acpi_match);
-- 
2.24.0

