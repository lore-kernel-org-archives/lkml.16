Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD111E5B97
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163374; cv=none; b=jYAcuCiYnl2gCgyODNDUd3M1TB5iNDuFcBMyPYKm5VnV7UbBAdQh51oX1uN+CXdQ8KrtA0bOmeFffsLNFaWCwPNQwFWULme9S2E3U3kvOaaiQTUuSs3sH3DwOzZMPmSZlD8P8z6ZSzKoo5Op32+zWfajxHI24goI1ByzZsIhvpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163374; c=relaxed/simple;
	bh=AVtU54nc25opv8K+2tymcPJdIsSp8GMt9cZa3TIf5Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGwlj9if4/N5t9E7ooFvWG+l9apUbLZdnvxT/RstuXUUEcLQ9v7DBaQwfFY2RJJXfsv8c0VhdMEH/8kibiFmBTS9mlTlnSi+hOhJVe61A4iCDmKTHicqLjmNfo50a+RD5ar4e3axbuoRuDyVUdjJD4cBPeaxMk3SPY02U9gx1WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjkCu8CT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjkCu8CT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P8j3jN032671
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkOp7j3zXSAkYXiIHN6jRO+1RgVkkoDu+mIC7by/Wuk=; b=MjkCu8CTGBoEs2Ia
	laFNUmxpzwI6BGeIifZ0o+yQi2RT/PV4hl6JVa/Va+rgzyJnWjC+7J4kUPokK8lh
	A6eZHGx5Vu5MKJqzwAtssljHrXBEJJjqrAuY3/KTGtPpyvEJgtoPFoESYKVMufdb
	PkXjWVEY8rIFAQwjdFSkG9UsGp5Y1bxKBLJEpwLAeAQmZh87Vy/dD4rvSjdM3PFQ
	IiHJvj7+LYV9VdW1V6Zuxqj4+YeObTe6uzgsWAayJ7VntiJwWCVkQNUFebP8F5Ty
	AedmrH1WTxVHh3e14hxQ+aGwOR9ZrgVFegVHhoqJuRAXfBhEOTrfVDyl/X4MHqsA
	xIWMVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3thsx84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22de54b0b97so9658075ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163371; x=1748768171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkOp7j3zXSAkYXiIHN6jRO+1RgVkkoDu+mIC7by/Wuk=;
        b=GT0UA9INULYzYSK1/UDN08CJwXjJljSh7bte7Ryi63i8hBJhf+m4SFZ1AGDVd1YoCl
         ZKv2SLvY9TGvsDPQB6FOZs8xc0pdUN1U4L/BiyYXYaWN+dQZwdr0VWZ6ikkaKyMuAjBY
         4W4E8h7kNXYnUOm2Sv8y+MrmLv3K1Vq90br+bNdy/g9kIqANbGkckxGYL40WeE0vj7vX
         y5SXJLALho6SeTXLaxwOCXZQAsIyj4dOSfjsKUrSIF4VCBfx+cRuzviSOJvylsxwE7X6
         wZU3VAfAw7csVTy0Tkm9caZSAmYFghCwAmLEUY3sQ3lrzrskDmPKZauByksN/b6BaAP0
         OWNg==
X-Forwarded-Encrypted: i=1; AJvYcCW/QsigKUSkMy8pkZN7ZLFXUQ/Nodx/gUhTJOk8FxKdEAF+5cbGADuGCHYPbZmfbRJi3VUt3Zop/SxOKAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhhNtceySb2hSwZT2xLL8Zz+pd+fGrvXkpt1NRUOzp3lufPYJn
	KCU180RF7VUw4mCMb0oN9pnGVRWjNEQiEiFYGcJXj8MxyH7UyLazsKRnAo0uaYmoykSHbTueWPN
	+tJT2rKW9aUnx8Rmv4mLuiVdtnnAtQHrlYvssC/UsX3UV7a6Ky4lwMOymTeSpJcjqNkU=
X-Gm-Gg: ASbGncsB0paPoUqBod7zQpEUVNhESGMl4PyQ455L0ljiULEWH3UOzEUNCEztIBxPVFe
	eEYIP32rcjjKSZo+7t3+sdKrCs0QXfr2J0aq17kfJtRL7gotkNS1n0n7yo4OUiJpdCrB+rQlMt8
	2YBfMm/VypqUntevTIl+M/lxzZPAKw7LJ8/97yYnPnVgiuOpddQrczoJPvq8SioDgrD803ZdKBX
	t9GrQDofZXssaYM1mPHcGlmPFUjdJFd/Hoo6nhq/BW8nzbQBCO56cXTKe/2m0f8SLz+XDFBIqUW
	sUWAMrCQnTsekJqcqsa0c/siYA==
X-Received: by 2002:a17:902:cf4b:b0:224:584:6eef with SMTP id d9443c01a7336-23414fb5404mr86308965ad.41.1748163371229;
        Sun, 25 May 2025 01:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqKEWMFK6USrz4We9Zy7uWd2Rz+ButRLFAqNJb1eOogDF7vmSPsDwTFWhh8Rhw0hDm6BUntA==
X-Received: by 2002:a17:902:cf4b:b0:224:584:6eef with SMTP id d9443c01a7336-23414fb5404mr86308765ad.41.1748163370834;
        Sun, 25 May 2025 01:56:10 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:10 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 25 May 2025 14:25:58 +0530
Subject: [PATCH v3 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ddr_stats_-v3-2-49a3c1e42db7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=2878;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=AVtU54nc25opv8K+2tymcPJdIsSp8GMt9cZa3TIf5Xw=;
 b=3c7v81qedwuXioo4vYTXsR3wF4NVJMeZRwj26wnGGbr7w9rxRDIyNbC+T/fUJzrH9ez9Ncm6P
 lMySkzEof6YAKl0XB7NmY3PiYG1WPyYjh7H7uhBIRf0BrrLC+q19DzV
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: 92M0CS1Z2wb5nMcifAE11bF2CW5ArFj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfXwPRBBY1FcgFo
 qGEp0fpYv1AbZ8vhtj6eQPShZP8+ouTtd8Jn3OYSim+LCOGg/U1rKKswqiQW+ds57SBMpe68ryC
 MrQz+vTb6SwLVaBOt1lt3l1zFtNxF+utC8DB4iPV0sQQsE4o6vh66yL0YCphOFGRC/MOF/q5qg9
 4XLcUeaoMxnwxZVboMe3K5LsUxFe9QEDdJZRZkl8DTZtjaYgh+c6eI1HFImWDqBb4Yu1i0CPVq1
 8bES7/76AczUlLyN8q/C28LRwwdnf9BXlfkKOPcdwXTLAkaHNgrKRQ4bMlH9r8ohe/YrQj4wXtO
 4SWOivaNv+uVeiyUFZudn8xVd+0iNbsC/LlZkoxsTY+l9CGKS78S2REe6OJjcRRDW4CMj37vF0j
 XMJKiBNb/wkyd58a4N0AyTKhnk6lK/83iJ2YDY26fkMYMLFiceGclmEfZTxTDkOWyfIHX5Vt
X-Authority-Analysis: v=2.4 cv=e94GSbp/ c=1 sm=1 tr=0 ts=6832db2c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BT90xxDHZu-g9S-RVkkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 92M0CS1Z2wb5nMcifAE11bF2CW5ArFj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250081

Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
ddr stats. The duration field of ddr stats will get populated only if QMP
command is sent.

Add support to send ddr stats freqsync QMP command.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 33fd2a1574464768bd07289e743fbb79ba415e84..7795f0bd18c63adeee93da2b9e07ab4944c1662d 100644
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
 
@@ -310,6 +329,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
 	qcom_create_ddr_stat_files(root, reg, config);
+	/*
+	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
+	 * The prior SoCs do not need QMP handle as the required stats are already present
+	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
+	 */
+	qcom_stats_qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(qcom_stats_qmp)) {
+		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		/* We assume any other error means it's not defined/needed */
+		qcom_stats_qmp = NULL;
+	}
 
 	platform_set_drvdata(pdev, root);
 

-- 
2.34.1

