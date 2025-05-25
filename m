Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74371DACB1
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163371; cv=none; b=fi+ObVlUb7U6cmBK/A3xyfmzTxhdjT8oyDBgC2mkEUM61i7o/FOFF33RzTWE0Pm8U9CALYCIEkM8lvD/TftHURknDKyKCATRswKS5ytFVhwbmzYyXBLCCE7imLmvb31R9qfZZvah6krsu/qdj/ECeEC1XScLHtL/JVUCtevbOSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163371; c=relaxed/simple;
	bh=vRR6szynldY94FYUj5qNjs3DmteWmQfiTljj3mxMF78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+FK9lUPGZvOnTLJc1YrQV6HJYm41wdhANqIGrLfOfNLRbpqNoqfikg0lCLm9RH4wmeuGq1aZJz259npr3r+y3wpi+t2Zhxj7yoxWfWoxx+KZRV1F6YjMczQ5SKzq5yAP/fYQgkDudE+iD0Tbhn/HxjvWHD8U/f7qKC53pQ2F0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0v2c3QD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0v2c3QD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P8U0IE031110
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdmcYDeR3oxl4uFyKw3pkSyRmu08N2XqrqgvurqEKN0=; b=S0v2c3QDh+hdA0Eu
	TTtCzvKTBaWGJld5C6XXKEbT8Yd46mR8KDfpLlhMnfz7VQsN2sa6hDot01ZMraRs
	mYnGxoiudrs/qS8ewcpjkz0rp8dUJkebpy1VK/bSwm81WYXzAkyu2bNiEipaoajT
	qlKNJUbY1j4hd+C2knRm5H7LAHt16LPyDHh+mse8dxISq3jKaw0pGwSJhyvwXnuB
	rbNbTDXzgCymtYk4AH44KR6HR2VPV6vCwslOrBBDia+46LAte9Umhsww4xO11mgE
	m6YvmQOyyps+7YqB93az+8W/f/P7lmdyFcJt2ehC/os8rH9pI0Zhlz4dyCb6rH6p
	1EFm1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p1pjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23411e9eb5dso8834665ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163368; x=1748768168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdmcYDeR3oxl4uFyKw3pkSyRmu08N2XqrqgvurqEKN0=;
        b=YvXdo2TcqKvTgw5cGbdcBYkShDyBuvYWhVfc9DcOrq543Rf+pBDaqLUAelaBMRxm4c
         0iuNcYuG69M/YNZC6LbVFrwj2MLEnzWwlASiC61+eX925oN0EJfNnJJnS+Fn9Ce8MwD+
         RvKlepgquiPaFsXASxghFfy+e+xr87JDQxKa/tswK8D/3zD7A7x7WWKEvXeC1my9cdc1
         62PpOXjoxOne0C7LY8FlRvKsBaKW2e3nWrmkLcVxXAWBDGiw4vMGaRUTCNHaoYNoQNb7
         hiJHqo1XSdaEcMAXDwf373VG6xGL+6KZn2AP+t20vL1FjRbPzlX2EzKRhs3MUnQwV5xn
         yVAA==
X-Forwarded-Encrypted: i=1; AJvYcCUz4P/U5qZYTfLNBqtwgBuTmemL5Z2odxGu1pDgLd9+zCnFqqJyghQMDE9LADCBuVshky5pRsJ1oy5r6MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9ItIG7belbO0PzYqYp7KdgtTIpMzdq+dteYFd1+4q7Yu4WUs
	lttyjBc7gHrgRliPV43dU/TGqQ8hT/LR193uOfC3TWFzZTNP44BEowdV9dHV3FGQu10DUkAv90s
	jUmLEtE/Z50udTQKyAc/VmlcJeyZc8crROE6vX3Am9AA4g1RC+NOLicOC8gKS0sa3XHs=
X-Gm-Gg: ASbGnctV5MKNs+B9SWU6E5cjWMXFKWr93LIdEf+jhTnTmRUo9BoL/w5kYrW+nb31Gre
	a1g5WkvC9dGVQhs7dz0fPRjPB29+SEfjPlsHRrf/zOp6NCtyOWbvBkd1u3l49hwrDS1pSigLnp7
	jWpR56TMVusBdAXYox6LxhDGznsZu6sGO1uDiDIBV7miRXZohWY2T4aZYYp3Czp+wa6f+uli5Pk
	OKhG94F1UfOe7MLN2N9Hod6fYMHSOvnkFle1UQIOP4Cqv59UOB96zArA2F3qsXWsvvOFo6dEMxy
	Rvqf4KkZOdk1ax/S+kPBiBXzVQ==
X-Received: by 2002:a17:903:acf:b0:233:f903:a11 with SMTP id d9443c01a7336-23414f48f23mr78955925ad.2.1748163367920;
        Sun, 25 May 2025 01:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYWkUNVUJgm3pHRAuoZ1u3jFEnUwArxDSTKnwca1PjV2B1ONqMF9v5/FP5DvhZTWM44ZTsQ==
X-Received: by 2002:a17:903:acf:b0:233:f903:a11 with SMTP id d9443c01a7336-23414f48f23mr78955635ad.2.1748163367529;
        Sun, 25 May 2025 01:56:07 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:07 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 25 May 2025 14:25:57 +0530
Subject: [PATCH v3 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ddr_stats_-v3-1-49a3c1e42db7@oss.qualcomm.com>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
In-Reply-To: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=5260;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vRR6szynldY94FYUj5qNjs3DmteWmQfiTljj3mxMF78=;
 b=jY+Pp8gtI8tOj+7UQiz1924zun9Xp+l43QsQA5RH8nAY/eYGaqkDiLsOFrbasVEAT8ZShczQF
 CkgMCAJfBp8BqbY7Rb+SVh0AS9DvkrYAq+IBzRF/NsxiJRHEetk/IDV
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: w7poxMGt_03OBjqtUrRMQjq9gPTJJ_8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfX8JZEOJGGT+Gu
 VaHDBmwGSIqJzSVzIvvhZmCy9xP5bIStjLmFFWcAOpFuA0voT4cCgnK4Sxc50GyBG0JSFs29J8K
 i8kLnQTyqswLryaFyG9z+haa9kZyNnKTzFUkB44Ft8FzmDuSeDwxMW7J/ystr13uyf7ouoinya7
 7ihE2HvO/98slwKF9TDhGAQ+5FXicvWEbRF6SiiBXVSqSDvvyeHHdbsaIyXmSU+lMjorsDsGu3w
 562kQVeb6z/xSb5tWJJKsoYi3xQXyJc+OZyhc0jyr3yBmb7ga0a24Iqv1hxGjgBGOM5GoQBJDd+
 D6KFVbtY+m82qxW/YyhDVeKFtmZx+qVvCemiCWdc24GLs2I4d1MP47/QuFMD6SfQcoW/7OQoHBO
 MOjnsA0u+2snn4j1HRJBlUlhu7PGKet0wHarQhkILU32MPycqESoeOVp8krFDL1E7tW9Vgup
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6832db28 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4QwxTSDsR6DxlQvKCcYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: w7poxMGt_03OBjqtUrRMQjq9gPTJJ_8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250081

DDR statistic provide different DDR LPM and DDR frequency statistic.
Add support to read from MSGRAM and display via debugfs.

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

