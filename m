Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E92741D4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898794; cv=none; b=Oma0Mg6ii1Di4jVEXZsilULYLHNMWuda/9MZkrnHqrLo2q12MJ3xZkLnTXP6quw6rIhAwz+RROYcIZf/Ijlu+KaujIQu1jK8aSjZhJedQhDKPn2oI1mxxsqIKwEGcWe+UzLUWIh6o8GflSC01S6FZ9cfcXwXbOgppGPfID1N75k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898794; c=relaxed/simple;
	bh=AytacF8IX6i6G1FN8eQ1htwX9lpcsnJFuCYiZeq112E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgyG+nyRirhwJNMlhG5jjXo8AfuZTykTGwV56AJdLYJNbiJAOzrJssH1TR3Q++qdFBH+BtJDjP08eqkHvUqT2NAPJArpH+G/3pZT+NCUKZSvW2/HGgXTN54H8daYv89IhP/pgSGjcdaz4UYrcQe/hlTPkgdW4V3PtHwUMewcM30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/uPqF6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/uPqF6U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqTBW020507
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6NDUslavgZOx8kuTTGLUx0Srey60wxbb+yJNYs/03o=; b=h/uPqF6UEmN2+dna
	zardzneIDQ8k7+WKj8WqnRmNMef2/WgqfmGSSynT45NfprZVcIUAODhayLTJG34W
	yEzbS+V7uwV0DBifAOrVIupOktZIzF2z7qxjbemQRN8/8vMFEyLUHs3z+MI0zJR7
	woqF5q6E6qNUGElROMlNe+gDNohpJXS6mk0M60YmNJ0HXorWGBEaXvzn4BPN3Iko
	4/ODhjRJyiRWNZWwxh67dbk4RPnueAkqNhs3uz7Rxxi6pfx6jugabE/uZ+Cw+gqR
	TaJ5v5GqJFcdt5t/KXm+fuqBpgY37RAhJ+pTFk1A1LhQjeUAcCTc/HDxAFL2mB4j
	l98ZVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jjen5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227e2faab6dso45993105ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898791; x=1746503591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6NDUslavgZOx8kuTTGLUx0Srey60wxbb+yJNYs/03o=;
        b=UiwuUcYqxGL/OLPYKPNQIqsP4uRUgaMcRn4i0vEM3x9Voj9vI9ViNqOqWGn6l92zYD
         8QMLF2O0tNcnZB1G4VuVs6kRUOB3VJ741avH72/RhyLAr/Ly/DU7asYcKcDnLwDVfdlj
         G+lkVifxm8wiVAhKFnac5cBZaexTGhcRvR3NtCUucaq7kv3+5MmeulzXqfOFd/PvJbf/
         rp9+fxabRzAlylChMNIisxWSRHMIZkVlUnt7fZJtvlfrwgkym70+aMl6/BVcB1lmN7aU
         p9iv3oY6hesLAKy9GWyTpSV+avXYRzOYKd+m9pnNxp/uP/t7mIbQSyCXEls4NrTkvYG2
         j1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVcWwCTN7gyWPZL5mVqbdgyAu6jVphpeFL7BPRb0c8dhDu121aGpnw9mXKwtjbb4n5DK+KVsyX3MlT2Wfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52DMSMhBzDnCw++yCp3TdDes0EyrkHfXt6UTPxLo15PJeWpO+
	0Ypl4QNSHqJOpLOPG0IEvUe7vX3gb/6IoGINtS1+nz9uyikIg+QvCw4RXyIfoq/0scUyT+/D8da
	wIUsOR5sCkkmXcjNVqJVQJymP/94TGvtOpnb9UlPRiIXgVcqOKpxD17XPNit3zRE=
X-Gm-Gg: ASbGnctIrQ51sRREL/lu0kcszTIEoyBcNS+FoZa3KQb802ewJBNyHh+jMumyGqeiYQo
	VTg80XYVNNqggWIJRF6XOF/ATUL87tJdsDXFiR/nPoVBQAZ6AQwFfmhJb6syIML0RxZFn+9nJR2
	efq5/5RfKbGEkElwT7GUYT4yu/ZW4MalQPPcQTcGMiA4e4G3pupEZZaYjUo0E8+C/GZA4h3jzYX
	x+E6gwfb0mHKBegcXGCK0wxZjmMWJuLw8vzXDgMGKy9rTqepDKsJ6zcmMdSi8BSxIix3kWSaM+P
	pPRFtck7F9p6uwEk7oZfEAnKbA==
X-Received: by 2002:a17:902:e5cd:b0:224:912:153 with SMTP id d9443c01a7336-22dc69f3b1cmr172161105ad.5.1745898790848;
        Mon, 28 Apr 2025 20:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUBmfQ+9kjzawyqWn958VruQ8fxXZJKgBmdQ2Z/yh+wmTC8W1vvIpXPHtTAVzYgC6/Fn2RxA==
X-Received: by 2002:a17:902:e5cd:b0:224:912:153 with SMTP id d9443c01a7336-22dc69f3b1cmr172160875ad.5.1745898790496;
        Mon, 28 Apr 2025 20:53:10 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:10 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:22:34 +0530
Subject: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing ddr
 stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=2774;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=AytacF8IX6i6G1FN8eQ1htwX9lpcsnJFuCYiZeq112E=;
 b=8wXYJ/U60BWLP/iUvPBfRZhtpCSgDOAseIhsxzLbxydIj3FgwI5/Iz/VryX05SButZs/oWGCJ
 ghS1A2C2Io9BkwVUlvVaZgZdbNPz+EQfpg2SXFKcYBIEUS56FjxnjiK
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX2f5kvd6pQPcQ MgnW5bgerY2yAdsP94BIeFbPoaadVVuiJmkOrS3CuMhbr9jV5XAxHJrfcljdiubRoaLydjbh9d9 A3GN2wssGtb/nNv7X4IyvJXrhx8fFRlNS/0XqAsk30koG/fl8QNeYeEhYDe72gkC1pTp9BCOBqe
 LvR2mjHCv7HXwx5LQvIkYzbvaHpCsBAJdGHg5FRENe//vfAUpUjxnktNtwxXUADcRHxQW891+dX H2AiCmDW9HryFdpc3GJlu9RkzZDYJkwuQbj/ZKNcS9cEfeHwOkVJH4Mvsj8c595PLo8TET/bx4P 6kBzub51iv401i7wEC6SQrhlK7az2UTclrRw5AoD0LRGYrqpfvH35qEV+tvPaZBMkknCGcHjo+f
 AqIusYcN+jAzHrWsGJYdWlPgOJKKyATPi14KWK3hRkqh3QO6b0/ZqgHkyFNEvEw2EpdHtWEK
X-Proofpoint-GUID: 7QDi-vpog4ney4Ck0cZgj-gqEavEMxhg
X-Proofpoint-ORIG-GUID: 7QDi-vpog4ney4Ck0cZgj-gqEavEMxhg
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=68104d27 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=BT90xxDHZu-g9S-RVkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
ddr stats. The duration field of ddr stats will get populated only if QMP
command is sent.

Add support to send ddr stats freqsync QMP command.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index ee11fb0919742454d40442112787c087ba8f6598..15bdb8e6a542bbab34f788ac4270f7759ca83e3c 100644
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
 		return 0;
 
+	if (qcom_stats_qmp) {
+		/*
+		 * Recent SoCs (SM8450 onwards) do not have duration field
+		 * populated from boot up onwards for both DDR LPM Stats
+		 * and DDR Frequency Stats.
+		 *
+		 * Send QMP message to Always on processor which will
+		 * populate duration field into MSG RAM area.
+		 *
+		 * Sent everytime to read latest data.
+		 */
+		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
+		if (ret)
+			seq_printf(s, "Error updating duration field %d\n", ret);
+	}
+
 	reg += DDR_STATS_ENTRY_START_ADDR;
 	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
 
@@ -310,6 +329,15 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
 	qcom_create_ddr_stat_files(root, reg, config);
+	/*
+	 * QMP is used for DDR stats syncing to MSG RAM for certain SoCs having
+	 * (SM8450 onwards). The prior SoCs do not need QMP handle as the required
+	 * stats are already present in MSG RAM, provided the DDR_STATS_MAGIC_KEY
+	 * matches.
+	 */
+	qcom_stats_qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(qcom_stats_qmp))
+		qcom_stats_qmp = NULL;
 
 	platform_set_drvdata(pdev, root);
 

-- 
2.34.1

