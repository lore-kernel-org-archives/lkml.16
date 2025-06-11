Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261E228CA3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621865; cv=none; b=Lu2o4dwl2ApHUd2gRzznWxpKnMo7BD63VduZwgJMQsDbQ/Lc5VEjAuSHM99GL2PiTd+DsSgQoIcY9tnzaIn7VZZocZtiKTLQafq3V3I+T/XkIpsJXthZOnBVd44CJIhdr+XrAd+hdx3MMGSGTg9zx3ChD0iTasG2nKFapvUbqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621865; c=relaxed/simple;
	bh=Hontekw7JAqR4n6pY5LP8Y6uggfBawD71V6IWg/VIsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpd/HfPAXejfIIdwYjzp/GxQrrIEOnk1LX7VThO65tb7q+0d5NyE3CDEeP8eaQ6t5nhujUUtbKQX7lLgI8ONU+K08U2RfVTBTeIY4e1D/Qb4YwlF7VDhdU4T5pDL30F8hR28DuREerMcv8ryzO6ExxGCbavOkNEF2mT39dZ5MZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyeb5Dkc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyeb5Dkc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQN8B018024
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/U2ko78ta4yTdDYzRg6l9s8z7/px4CNWQMCRq8SvPM=; b=lyeb5DkcSTxRVjBN
	qVT7L6MI7TeRVYsju+sb+QZt4HMTdb9nY/Oq8Dy4MSezRiNaZ6lOr+EBf5Y29CDQ
	swapO68oZI2D3uOeQLIFaeYKx/bwSt2gPA7xLfbcE0Mk1QIzXs33ATcgDsluWl24
	rTO9OXAYv5V3aPXMSbvAaLnI769e/T8Xlck1Ynrfim5grnppjpLVsFxgZ/gMSRn0
	2ly9zxBma1yNaizxQRHMqPxXb3mvM0VEueFxsNDrN66isat6g4iFOGEW2vRP0uDU
	Vte1FqukNpPu62k/rH+0RplvgCAspPk6sqZqZxtnc1Sq3YCgFETj/f4uwCbF2J+H
	b+6miw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnbg2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so7055472a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621862; x=1750226662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/U2ko78ta4yTdDYzRg6l9s8z7/px4CNWQMCRq8SvPM=;
        b=UBWJwefg33HCM2aAukBshTWE+7MWYWQ0qs36sA8PrM5CNH7EMbywH3Z6ZHqMmQldXL
         feHpoIaSgrYbSdV4d0BVtWH3+j70cgun26PKZZXZLTuzJDOi2TJ5UvaFqsMTtvvQv+ub
         kWSFzUxx7p3MjiYUbqNBdfa+pjzqrsljE03idLzNTD7xxWGR3aReKTCNa85s8jfrhgj/
         kyVE7TsBLvwE3EzbAdO9ByV7uBlPXakCqHyuifnfgZkQXADiCYiMHb0Mzp4iU2OcX8ts
         Mx1mzfUzLB1GBuF5gLQsp1PZpId2EE2MJSJNj5XVoouId/uij3v3okLneZg27TgCDdCq
         wLKg==
X-Forwarded-Encrypted: i=1; AJvYcCUCzzjdnS63kxMKzQPMxTsyqojuOhvAjZRwNTOpLqTXcFVlXQAAWR0Qd6Yq2DBUgFWgzUi5OcFpxqI4v+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4XzxqQsNawKKKTJNUnzMw+neWg6tBK1drJdP+jOY+c7iUVLq
	20w7wmrXlzmlXOKZfq6uG98xIM/V9RS7qxkYf8IhKvdKcSlraMgcXgKngw3anekzi3v5o1wgJJc
	RjsyPRwe+5H90Z9lxsLJhSkTr0Bz9lQZ7FJBZ7p1UtRx5nnwzJPXkKafjHFn/m31rN3E=
X-Gm-Gg: ASbGncvJ74zT6pBDB9ay9iPLCY3ar1WlzRK/okv5XIPGx9BpjMJUKtbZiupNgQ/B6xV
	Fun3h2g8Iu7GPOMSD6TmSPuuQIpY3V7ZSVMUGjOjWzaqiwdoMsePq3eVji5Y6JmnamxhGSSxjMd
	wEmHxvCRLkWIBA8RoREImU7pezQbfAmMjUtnDXoKB8CN5Xd5AM6NDJQyyqejeF18jn4OI80Em2Q
	FljI+xwudI2BPrkVN796rWglhB0SjdKXSwwdzWURa7lXma9a2P8Zg9HsqUeubeAElMfdEg5P+b7
	iEi0ghBDdikWcMNHRYmosRlwLSNQVt0lXuZi
X-Received: by 2002:a17:903:1a07:b0:235:799:eca5 with SMTP id d9443c01a7336-236426b57b0mr25193145ad.44.1749621862204;
        Tue, 10 Jun 2025 23:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMxjZmPT53twTQzh8ZZmH6L/7o/HT7wOTd0MjorK64UBXP1lUJ+yTd40jDtRZQDzKKV8h4Yw==
X-Received: by 2002:a17:903:1a07:b0:235:799:eca5 with SMTP id d9443c01a7336-236426b57b0mr25192805ad.44.1749621861805;
        Tue, 10 Jun 2025 23:04:21 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff05esm79429685ad.135.2025.06.10.23.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:04:21 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:33:46 +0530
Subject: [PATCH v5 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ddr_stats_-v5-2-24b16dd67c9c@oss.qualcomm.com>
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
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749621850; l=2942;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Hontekw7JAqR4n6pY5LP8Y6uggfBawD71V6IWg/VIsY=;
 b=I4gxeEwV7xqFSxpHV9bSSGYBznYs2/H85JsPKT3KKI9IrWozWSLwIbBvBjNCau00i3TZiOnzf
 WEybwXZLFO5DqJzXfvOPbZcuNYioMbZIINu2p9NwfxxW9t9tKnhIKeM
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: 16F1wwP_2z4oZEJ4162rBHMaHgKld-AY
X-Proofpoint-GUID: 16F1wwP_2z4oZEJ4162rBHMaHgKld-AY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MiBTYWx0ZWRfXzEkRfYrEvBXr
 S2mizDMA28OHa3i1XNJIhsH+mKOsJ062izrVeL9EVs2JfSa3ZbQMANUevkTBOh7N7uN59mBzgo+
 ue+0bScT7FeLWmIZZgpquPsP6Ec9dQFZTzYQ5c2AuoPwVEqefSDVU+ApoVSkZ1Apihzjsca27G7
 q5mxKuo1g+0XYCGLfgeqmJhUEWGzfOcVNJoZxqkrYyO1mIQkE1nuUkanY+ViEjvibWiw0FmlVxe
 zvbieECiP6/mSlNrIN3Ql33U26P3ANCcEcMP2+wR+wulrs9lw/d/jj3oi1y4kcd4exoPZRYijpf
 7C/AmzUw0fbA+9VM4d8cs9EWsYw82dWSXXgYe4EEnAOWRgO80FsXxZ/rUQSbn+KIFx/aDrAwD8K
 j0pZfzmSNP5SPKjtXvTaWdi8ic6IRLa+dd++6qktRlljScDiMztZlIuwhKytUbw/VSBsw0gT
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68491c67 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=BT90xxDHZu-g9S-RVkkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110052

Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
ddr stats. The duration field of ddr stats will get populated only if QMP
command is sent.

Add support to send ddr stats freqsync QMP command.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 33fd2a1574464768bd07289e743fbb79ba415e84..2e380faf9080354fae120e74f0b9bd1f3786d3e5 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 
+#include <linux/soc/qcom/qcom_aoss.h>
 #include <linux/soc/qcom/smem.h>
 #include <clocksource/arm_arch_timer.h>
 
@@ -37,6 +38,8 @@
 #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
 #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
 
+static struct qmp *qcom_stats_qmp;
+
 struct subsystem_data {
 	const char *name;
 	u32 smem_item;
@@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
 	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
 	void __iomem *reg = (void __iomem *)s->private;
 	u32 entry_count;
-	int i;
+	int i, ret;
 
 	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
 	if (entry_count > DDR_STATS_MAX_NUM_MODES)
 		return -EINVAL;
 
+	if (qcom_stats_qmp) {
+		/*
+		 * Recent SoCs (SM8450 onwards) do not have duration field
+		 * populated from boot up onwards for both DDR LPM Stats
+		 * and DDR Frequency Stats.
+		 *
+		 * Send QMP message to Always on processor which will
+		 * populate duration field into MSG RAM area.
+		 *
+		 * Sent every time to read latest data.
+		 */
+		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
+		if (ret)
+			return ret;
+	}
+
 	reg += DDR_STATS_ENTRY_START_ADDR;
 	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
 
@@ -304,6 +323,21 @@ static int qcom_stats_probe(struct platform_device *pdev)
 
 	for (i = 0; i < config->num_records; i++)
 		d[i].appended_stats_avail = config->appended_stats_avail;
+	/*
+	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
+	 * The prior SoCs do not need QMP handle as the required stats are already present
+	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
+	 */
+	qcom_stats_qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(qcom_stats_qmp)) {
+		/* We ignore error if QMP is not defined/needed */
+		if (!of_property_present(pdev->dev.of_node, "qcom,qmp"))
+			qcom_stats_qmp = NULL;
+		else if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		else
+			return PTR_ERR(qcom_stats_qmp);
+	}
 
 	root = debugfs_create_dir("qcom_stats", NULL);
 

-- 
2.34.1

