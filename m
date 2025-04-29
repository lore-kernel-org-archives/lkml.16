Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D12741B7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898792; cv=none; b=p2y2ADW7Z/t4GAXSXjdVuxX2OScTSL/Gu2MJ4FIxqHvAr83cXC2C08Yjyhv1bOGByuVFR5/HnXYZadbeoKr56AITHyhfNBTDRvtl4uSsFKT1wlzAJeZ61EmM2rmJh7cXwOaJXcVGni/vUG4/i6H0t0VP4bhpyLaf87vEbhrRv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898792; c=relaxed/simple;
	bh=KBLVRw4EQ8n87HBdGxGZz0NBPnzcgQ3qqKwMHrpwiy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KA6DfmUntoSi6S8t93xzjyymvirv6F7/GzWrjweUCcCBDdYWiQnAf74UGdKQlRDH2zMcZ5h3Ik7Bt5NcEdDLxnsgqWxhV5A9+n9d4hJ0+TI6LTLMQHvMwbuL5E0ZNutqTlTFPI7WuTjxaA19UqDGkNfWM3We/6/nURXyKqpMU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qjy4WSpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qjy4WSpJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqItq025620
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2m1IDBjD0TjZMEvSLlP6dKihhi0FrOlQ9FbxHyc3VOc=; b=Qjy4WSpJ8hkhWP7M
	JQI8swUaxPwD7v3VyCdN/W//2Jezt/dHCvXd4O9PQxfSe6FNxfFaYdQREDKS1UP2
	bn1OwzSb9181uzedRQ9AtolpO/SXuc8Sgy1EXeUdUDV0nkwA72wPcQ86wPPikt5o
	kMCLIMjjYcj1VYqSCyW6V36NiMmyd2gX2v2dB45Fe5eRhAFHqQJ7SEgtg39iWodN
	29adIIkbCtSYKungOhvZEmwBWItYECEmZJzk+/+1ceTqfZyy6Uu1CnMfAv38rl2F
	quplGJ1/Trk1kmxFslFm7Z0AfwswS2n7CIV3ilpvC8c32/YGuLvVNLYb8GFf+3/7
	LFH2dg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkbbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-306b590faaeso4161808a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898788; x=1746503588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m1IDBjD0TjZMEvSLlP6dKihhi0FrOlQ9FbxHyc3VOc=;
        b=A0BLoO6chNheZImNf/6znBcMSnT0lvZbv8+6xEOmX7rOtWcWCvy+ia5BZ/JG0QmXFU
         I0BKoj9NmzAc7qjlIHkpfFMPSPN+PfKDzP/2roI7lBTJ0bpWJxwkvUDQeQY3Uzm65oBD
         s0Z4bwxH03IVDubysK7GI0oYHFwHHx2hEjwq1K963401TnO8wKfX9VJZLSttS4ILoma1
         wwqyMJ19xNbQXiUkEt6RL0Xkoz3Mfr03cWy7xXOIMyeuRdH5qk/P0MzMTajyjCDEt8GG
         ijkwSjcdsMPWo1wEVo1SiqKsSVh73smJhPxLtFVfHOBVlo5S3Gw/4Z4rAXvs61/6TKcU
         x/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWVuI7W8Q8IlRcDWATkpszjg4LN4LO+o1BuK6IXG8iHNDJGfd5G2sUQ9OUOZrw0SFJYQxByZ8MiEOwryac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Nc2YVUZVrnqVwyS/p10W5lVrnfk3As78kYMFCo4LpY+oBfUu
	XWzkqEh/JUXtNce8G6IdEfYlHSgcUZuCajUqZ/fr5LMm+Z7gEWLkefq1ytX3NurRsiPeC4X47wo
	8GxLlQcwJbR+9PAEmfTPYY0sjzaMWxIqz50ZblzHT18hTzLzieqMp1J+7jcq9/y8=
X-Gm-Gg: ASbGncsfb3NTwJKtzm1RTJ2ZK7w9bNWHCnHa0nu3Kpq+tS2WMo9fZTVH8u9Xa66pKy6
	EhV0Cj/3AQghz1GmeZcLjGpm5Pr0E5EScGvU0/3nD6TZNHGA2g2C3Do8FwwcuJ3SiZI8lYbp7eP
	tfJg5RLtKfoPOKTcuZkUqHIJwTh4nn9+xujMVQAGLRMQZ6CZ1a07QySO2AGbjSBHb8cWPfWI/CT
	muWB06qI+0OmBqGCwDpa1O60dF+DANOg7TXzaa4cql/xsbHx8l9JF2c/YoA30p91111l1aJIMdT
	BL7PNdj1SkZVwjHUt6IDe+9t/Q==
X-Received: by 2002:a17:90b:180d:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30a2155e3a9mr2893527a91.19.1745898787614;
        Mon, 28 Apr 2025 20:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1q4t1m3f4GvYJbXnKaMCxaGgbZDgtqDg7V77DGHIyDPWC3NyYh4PdtUYfHdknPZWwBPYZmQ==
X-Received: by 2002:a17:90b:180d:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30a2155e3a9mr2893499a91.19.1745898787237;
        Mon, 28 Apr 2025 20:53:07 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:22:33 +0530
Subject: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ddr_stats_-v1-1-4fc818aab7bb@oss.qualcomm.com>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
In-Reply-To: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=5276;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=KBLVRw4EQ8n87HBdGxGZz0NBPnzcgQ3qqKwMHrpwiy8=;
 b=jvfrpmCuDX3A2WMdlLy9dc+yPuxLUDhMVexQtph/E3DHCI2h6+8VcfU7HExxKmmpoe+LEsh3X
 iMmglpf78YQC0EtqPgjbl/8smS0fRGPXNrZjh8XcfDu/9UYbeZyQ09Y
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX1ZUB8ul90bRO oHkjbsTnh5VdTktcI2HmBrPgQyv0AhVIXBQySryEP/t8NacAFak0hkztYFexDNHxoRgadsvKe7l YIEEgtOkpMMiVce9ftCuwDho52qLAHD9OwSOBUo3gCw6/JvDNF2rSmy1WXO6DVPrcgcg90h9f6X
 8/opD4wqgEcJrdWIkyWWlHTEcgEXQ4AREVj9TrTUS2s786jlXNbZAmVSiEIRyDy20caedXivZ9o 1kU4jKlsW5prrFYCcPl8WJwIodaTIYWfGf8QNbAqkHot61KuNEmEqXfE/DCg5l70eBY6/zJlv1m Psfxb1MjuqVDkZyRAZw1bQDCcne1TVDXMLOSByiZET8bl7w860ZqxsMO9knb9m7cfQhuLDAH11/
 b5CzBHNC1vDH/Gy7NANyrHC/rAA+dYuHUl79+51H7xkhQbPttteYINiaZUHZKWpYjew4TDH0
X-Proofpoint-GUID: Zl6ZodW_rHHvrEchAbjtpiQ6xeE4kDhr
X-Proofpoint-ORIG-GUID: Zl6ZodW_rHHvrEchAbjtpiQ6xeE4kDhr
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68104d25 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=K4m-N6GZnQPiituObOwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

DDR statistic provide different DDR LPM and DDR frequency statistic.
Add support to read from MSGRAM and display via debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 5de99cf59b9fbe32c0580e371c3cc362dfabb895..ee11fb0919742454d40442112787c087ba8f6598 100644
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
+#define DDR_STATS_MAX_NUM_MODES		0x14
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
+	u32 cp_idx, name;
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
+	name = DDR_STATS_TYPE(data->name);
+	if (name == 0x0) {
+		name = DDR_STATS_LPM_NAME(data->name);
+		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
+			   name, data->count, data->duration);
+	} else if (name == 0x1) {
+		name = DDR_STATS_FREQ(data->name);
+		if (!name || !data->count)
+			return;
+
+		cp_idx = DDR_STATS_CP_IDX(data->name);
+		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
+			   name, cp_idx, data->count, data->duration);
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
+		return 0;
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

