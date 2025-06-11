Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9D227BA4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621863; cv=none; b=OZU431xdCDOCni1OxauBWNolbW7dNMyBEx6sK/9vxeJieJDNxBmTeRb1+GDI9VqQbL5WisC1WnO/GTl0gMs0oSfzfwlqUHIg9t1PNJPf4BD6UCB74XqLc0epiwRjeMx7un71jdsm2FiN4pPOqUdgs5cUJUUNTb+KUbPzpSTNhCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621863; c=relaxed/simple;
	bh=OMWPxL/RJj1wZGlBCPW3BNMK3VJw9nTYMNoWG71YwMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpyI0soHhVuLVUP3LfH65GwnKCCJOZwiOKmC42ea9lf/NVgc6gqY7mWr/6cA7309PReu6ydisjFluhkvS9EOGDrq8VeJigJEMU3DKllmRXeTl+alvkpzGqi33giSPhQbGn5hlWGc9FiM8xSnobZFScad19M44vY7Op6ULvEoJlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgtEv90i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgtEv90i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPu9d010111
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mn8nakS7+FX6lZ1H5BDsVrdgaPJ+uuBfj+DDGpDXmis=; b=ZgtEv90i0YaPWff7
	/7ZS1pPqW+Kbh2ahKOWVbeDIjNOnHfW52UdAr5K+6NnrelKmMcpzLRcv5yfJSRG5
	lym+USCnmSS3JV0f7Xy+r17PG6nzOtMWqgPxVW7fp3XFdSHQgR5JbVr48NdFon3v
	kYFxlZsN9jHqiZkLa0cXjJDl1bRxDyTpDT131DVteI4LbL00rpd8JedZrfeZW5M9
	h0vkZHHAELGvRcDSqbbToAqxtIJdFKiGV2NobsDWTT1+S95rBCpCMQybznLkGjsl
	lMJxzWSEZI9tIvZeAleR4TDPL/+6BxuapVIc9Rw3TxxBEPG+092Y1oylogezxsrz
	ucezKA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d123w1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234f1acc707so52239905ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621859; x=1750226659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mn8nakS7+FX6lZ1H5BDsVrdgaPJ+uuBfj+DDGpDXmis=;
        b=ClR1VFVIYU6PFCaZdRvnBVqbtejIX5gJd9FoHjvtQyVx1L9CswgL4HzAf8v9IP6uIS
         Ob6HNEFxCji0s0UP9jiBshgGHUBMxtQsKf1r4rm0GIeLAxfIfZXYj9t8DW0MWo/lZ2zX
         OUhrkftRV/wU7aQNYCruxJAvGTjg84/NRQkGQ6VimaA+g0umyKCx0+w9G3uJqZi4+LOA
         T3yAwnywHdc+ivOuJsdo5zWqO880npZrdpCzJG9q739loljUWUTZNaGAHz2H9aFAoHfr
         TebqebjxI+ATwcOlNSHLv7h9N6W0zxYRnTnH2TIDyJKBqxmr7Vhlc8NSypti2nPejPGX
         4AqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2YzG9nw3CfOuZHwhTpCtWYDW10hxxfomovUn1GK55G48rDHneMqYyZXUjtslYxo5F0GAt5JzMKdOtn8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAOJRBW4OG+nzEEf3/ap0LKSriUDF2i95gz2oe7OakBXtwLrLt
	4Scrz4KHl2r3KC30Y6Zdk8urf+VtSenrqc6zHjLnG5Sc/oeu99vEKHtL7kqTTlfOCajqm0zcIlX
	ws5v2do99t1oBZd0jFZy3W3rtWgZbIB/V+EblNc9we/9bqoYO2tLq0tAPip20AR2flG8=
X-Gm-Gg: ASbGncu7ia3vqe59xUwok/LSbK+nIfWerXIWJK9tLY6TQSUXKIZ4tUAeQZnAxR4ajfH
	D4+wR8E6WzM4e/dxw9w+oGcgJwz/k8DTIQBK7X7AoD/vxYaynOoUOE9RBPa01qwRpE7vQMOgUvU
	bHCDuGTwq46y+26BSZTp0/DUwG4ulqiJNN+wHqdUVR6CykdhgqVAX9Dug2ykilPATJlLu53Ofqa
	c9RMYw2nH8qxrB3zYVdvvP0KYnp3wrBxecOmX8NegKB3Qd20k5sZp5yEuiaKrBBCMMLPNltfZVW
	NtKeFBCx+f9K2o376+CVfmTevw0DOJBeE/hl
X-Received: by 2002:a17:902:f690:b0:220:cb1a:da5 with SMTP id d9443c01a7336-23641b14213mr27796925ad.40.1749621858736;
        Tue, 10 Jun 2025 23:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERoNrZVeQJCFjcFNdOXb+/6hR8aEZnulnKw97bOBeyBESiWjzzsi/oaN6dKz+QkVMEKrHd8Q==
X-Received: by 2002:a17:902:f690:b0:220:cb1a:da5 with SMTP id d9443c01a7336-23641b14213mr27796535ad.40.1749621858224;
        Tue, 10 Jun 2025 23:04:18 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff05esm79429685ad.135.2025.06.10.23.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:04:17 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:33:45 +0530
Subject: [PATCH v5 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ddr_stats_-v5-1-24b16dd67c9c@oss.qualcomm.com>
References: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
In-Reply-To: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749621850; l=5388;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=OMWPxL/RJj1wZGlBCPW3BNMK3VJw9nTYMNoWG71YwMA=;
 b=OKSnQK2saL402erEUsid5mTqYUYaaQzSdlqQv7FEsZl3SNvJZt6DNZUApCKtORYdMSnZjcx18
 FZdB5H3ry3lCx7Uay0Kw2yRvTkfcT2tffCxEK99du7ahBIOtEiWB+tJ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: _cfR_eytXSrLk6s3zHdEft3WM_PB60LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MiBTYWx0ZWRfX96XZ+J48H80t
 EqH2ENFPPR5qs2Knfw4wWhWwHm/mEVHrabuWIcn2dh3vs1C5OV7PAgGe4wp9NqATyvEqd1QtPde
 vzs2xq7LRbUdY+XX+bxvMkdDESRAAnDV7bzTrSm+cyQIJqc1U2TPbsFfPsDz3jKFZx9J5aiV2Da
 dyGCbrtDZrKOw4HJRjgQl1bA5+ouciTQshBgOlD1X7d/rEvFCWjyRrXUUUVxeAePzc31yyAgsiq
 Ui4m5EgPFkrWJ0WrLfvY3yMsBf2VUQoTHLZ/pxIzU80pQ6iNGqKuFV9W0FCnWzI3A4ZWb1wXW94
 TnP2PQwA8HwTK1oBedpanOHQbea8X42sPWcLVNrlCxEwQEdR2DVljyzJwv04VGJFx0Zail10Rum
 KBoGtHIQcvUnuVG7q9vDQk+Pj0t0oNFpeFxfN5Uae0WsC+Fnsd4StFLfl/0wObks81zCFDU5
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68491c64 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4QwxTSDsR6DxlQvKCcYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _cfR_eytXSrLk6s3zHdEft3WM_PB60LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110052

DDR statistic provide different DDR LPM and DDR frequency statistic.
Add support to read from MSGRAM and display via debugfs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 5de99cf59b9fbe32c0580e371c3cc362dfabb895..33fd2a1574464768bd07289e743fbb79ba415e84 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -24,6 +26,17 @@
 #define ACCUMULATED_OFFSET	0x18
 #define CLIENT_VOTES_OFFSET	0x20
 
+#define DDR_STATS_MAGIC_KEY		0xA1157A75
+#define DDR_STATS_MAX_NUM_MODES		20
+#define DDR_STATS_MAGIC_KEY_ADDR	0x0
+#define DDR_STATS_NUM_MODES_ADDR	0x4
+#define DDR_STATS_ENTRY_START_ADDR	0x8
+
+#define DDR_STATS_CP_IDX(data)		FIELD_GET(GENMASK(4, 0), data)
+#define DDR_STATS_LPM_NAME(data)	FIELD_GET(GENMASK(7, 0), data)
+#define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
+#define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
+
 struct subsystem_data {
 	const char *name;
 	u32 smem_item;
@@ -48,12 +61,19 @@ static const struct subsystem_data subsystems[] = {
 
 struct stats_config {
 	size_t stats_offset;
+	size_t ddr_stats_offset;
 	size_t num_records;
 	bool appended_stats_avail;
 	bool dynamic_offset;
 	bool subsystem_stats_in_smem;
 };
 
+struct ddr_stats_entry {
+	u32 name;
+	u32 count;
+	u64 duration;
+};
+
 struct stats_data {
 	bool appended_stats_avail;
 	void __iomem *base;
@@ -122,8 +142,85 @@ static int qcom_soc_sleep_stats_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
+static void qcom_ddr_stats_print(struct seq_file *s, struct ddr_stats_entry *data)
+{
+	u32 cp_idx;
+
+	/*
+	 * DDR statistic have two different types of details encoded.
+	 * (1) DDR LPM Stats
+	 * (2) DDR Frequency Stats
+	 *
+	 * The name field have details like which type of DDR stat (bits 8:15)
+	 * along with other details as explained below
+	 *
+	 * In case of DDR LPM stat, name field will be encoded as,
+	 * Bits	 -  Meaning
+	 * 0:7	 -  DDR LPM name, can be of 0xd4, 0xd3, 0x11 and 0xd0.
+	 * 8:15	 -  0x0 (indicates its a LPM stat)
+	 * 16:31 -  Unused
+	 *
+	 * In case of DDR FREQ stats, name field will be encoded as,
+	 * Bits  -  Meaning
+	 * 0:4   -  DDR Clock plan index (CP IDX)
+	 * 5:7   -  Unused
+	 * 8:15  -  0x1 (indicates its Freq stat)
+	 * 16:31 -  Frequency value in Mhz
+	 */
+	switch (DDR_STATS_TYPE(data->name)) {
+	case 0:
+		seq_printf(s, "DDR LPM Stat Name:0x%lx\tcount:%u\tDuration (ticks):%llu\n",
+			   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
+		break;
+	case 1:
+		if (!data->count || !DDR_STATS_FREQ(data->name))
+			return;
+
+		cp_idx = DDR_STATS_CP_IDX(data->name);
+		seq_printf(s, "DDR Freq %luMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
+			   DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
+		break;
+	}
+}
+
+static int qcom_ddr_stats_show(struct seq_file *s, void *d)
+{
+	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
+	void __iomem *reg = (void __iomem *)s->private;
+	u32 entry_count;
+	int i;
+
+	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
+	if (entry_count > DDR_STATS_MAX_NUM_MODES)
+		return -EINVAL;
+
+	reg += DDR_STATS_ENTRY_START_ADDR;
+	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
+
+	for (i = 0; i < entry_count; i++)
+		qcom_ddr_stats_print(s, &data[i]);
+
+	return 0;
+}
+
 DEFINE_SHOW_ATTRIBUTE(qcom_soc_sleep_stats);
 DEFINE_SHOW_ATTRIBUTE(qcom_subsystem_sleep_stats);
+DEFINE_SHOW_ATTRIBUTE(qcom_ddr_stats);
+
+static void qcom_create_ddr_stat_files(struct dentry *root, void __iomem *reg,
+				       const struct stats_config *config)
+{
+	u32 key;
+
+	if (!config->ddr_stats_offset)
+		return;
+
+	key = readl_relaxed(reg + config->ddr_stats_offset + DDR_STATS_MAGIC_KEY_ADDR);
+	if (key == DDR_STATS_MAGIC_KEY)
+		debugfs_create_file("ddr_stats", 0400, root,
+				    (__force void *)reg + config->ddr_stats_offset,
+				    &qcom_ddr_stats_fops);
+}
 
 static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
 					     struct stats_data *d,
@@ -212,6 +309,7 @@ static int qcom_stats_probe(struct platform_device *pdev)
 
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
+	qcom_create_ddr_stat_files(root, reg, config);
 
 	platform_set_drvdata(pdev, root);
 
@@ -254,6 +352,7 @@ static const struct stats_config rpmh_data_sdm845 = {
 
 static const struct stats_config rpmh_data = {
 	.stats_offset = 0x48,
+	.ddr_stats_offset = 0xb8,
 	.num_records = 3,
 	.appended_stats_avail = false,
 	.dynamic_offset = false,

-- 
2.34.1

