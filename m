Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD302D23A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823476; cv=none; b=K2CkJrGZ0Eg7two8+935ZD4TYNJRF2YOnMxkEiTUyF/LzYCc0chUQukxqKo3Of6xtPePeMlPvJ3i0NNSAXcisCTDy1Bi5ALpGF8gHjEK7QSvpdQFUJFibemZ3n6h9Q2jPp3heRpRdowFyUIgooPhnt4QIJWmW2w6BvJWv9ZXPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823476; c=relaxed/simple;
	bh=R3NiWYA6kgddHMiBWO3ir8vpi4s+0r3d1/p6pCY92uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RwpGPKq5zZpZc02DwsUYoDyVMtLe1Lh5b5sZzvm0uhn6cgxAiOGT/FJiMN2TUtNnjTDu1cGcrmBuq8LVCgEaOFvFp+iO8jPPxnSyN+aEU7QKnRi3Yvuuy1wztzfAuKsk/BrW8M2nxFDMWbW2i8lznE77pf5bISAuLCxWNOBrngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzWy+4yJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzWy+4yJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D1xJ1C024101
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imWvnWvbJlX
	5oc0s6sKOCcLJcc3gmwA4+SPySO+ydLU=; b=YzWy+4yJeRfNTX8XeSouAcdGnAK
	ZrXS5ggkFYyeyAwXXTzDhxZLoWYnExFjDok5ED5s35S0U4dMbFyTgNQgDcRT7mfG
	0LAQrkbHp4cZ0IqSxE6SqDBHh3oFBhF2ZLzpGtetLq6uI017RsGaj5OK4HbI1VJF
	FYxv/tPg/tHOw6ececAec4SnCzl/CBCzm0gwGv/kr6rex7K7eS98yxdk8F9FE1pi
	TDYqrCmWKxMYZ1EsndJ/ofBXcqHa6I58LtdHhTeUfrPCc9IqlkQKth4WPRAx8qZI
	A+SMry/TNpUUp//k4OduMBukFWfWzrDd/QaRrDj5j7OFbW890kv8oows/ig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477y3gu4hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234b133b428so15438275ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823473; x=1750428273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imWvnWvbJlX5oc0s6sKOCcLJcc3gmwA4+SPySO+ydLU=;
        b=OfIBLTKF/eXfNsXL1K4Uxbgelv/9+sqazDBe/tlJhVNBZkAEwGmsqh+rQDOfs4AqOy
         LBJ3pUtLXtP5f8X5fEUW7gz2k4BfFGWWSovXPv+hHnxyF7JcIEy2Vu5WuWVPFqqDVEUd
         9/Rn9XgVSIkctojZaqcaodjjfeuO7q4zZ/79rP1CJGYTnl/ibTQvs+DyCuQ/x2GeEqdJ
         xG+QIinxmNlgg7KR/5vXqE+U1CaLPkr0vIkbxyBd6kOR8QvI1NuLaE1qUwNbnvD5ckGD
         GhkxI1cwvT9DJdVjxCPZACa1pvSTn+lxI3pjGDE/g3KusBIeCu1FqdSyHO5z3/OJXduw
         57VA==
X-Forwarded-Encrypted: i=1; AJvYcCXGFK483nL5gjX6lAmgxYRM8OujWUj9ssiobzV21GjpWloTA0qA5UCZ4Z6OLQg84HxKD8NioRGICT4bQpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwsINAZQnYzYfNbqmQma7BWVns0b9oNTLNcfknScKAQNvhvJNn
	3nZJT9uM7KL/Sk8cRK9U/rP+DqgBOpv/rnoHZvVhIkkOhCMrY8FPo3g/g4ZKhR/cqe7AV+UZVXS
	VqnmAios5e6hsuGubWQJbI08DxxeoR3RsKHnhgnME7UrJITKDSPBx9DdJlanB0ktYSnM=
X-Gm-Gg: ASbGncuje0MDyq9hvm8zeMCOXhyPKLAt01ZhxAIOg/oaX0cN2ERRBiPl2YuD97aXCn7
	Uzey1PwhW77jD+TmnHZyKK2Vp3MKF/a9K9JOaUlXdvnsyO8bfl/Q7hPxsTp42SiD2rQJrjuLYyw
	6OK3jr2273H11Lw4+U+RoZsXhZMd/a9tfD1Svx+nfp9i8lADFXv/T9hjqZhIl5kOu5BKVh+53by
	Lps7voZOr7OftMOsvnBBLQ8An4dzDjPoeMj+JZPE+DZwMzV0pY8/fGgn5h6ohA2+KsZ23luQ6xH
	TWyIe+XYYjnknTOaBWc/ghMjZNNTwQ81i3n92pzdc168yGtVPEhQMzYNJTw0mEYkDyh5msJrk3i
	E
X-Received: by 2002:a17:902:dac4:b0:223:4537:65b1 with SMTP id d9443c01a7336-2365dc34597mr46375945ad.36.1749823472559;
        Fri, 13 Jun 2025 07:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGokbzd2JnXLw/G0v+GhIQGYqaRbjI8iFogXgFN8uc9fiV1mee+ivB1odTvwJXOn83pvOiTng==
X-Received: by 2002:a17:902:dac4:b0:223:4537:65b1 with SMTP id d9443c01a7336-2365dc34597mr46374855ad.36.1749823471406;
        Fri, 13 Jun 2025 07:04:31 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Fri, 13 Jun 2025 16:04:02 +0200
Message-Id: <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SdvFIZbRGit2GV7NeVJU8wkUYdg1z7Ks
X-Proofpoint-ORIG-GUID: SdvFIZbRGit2GV7NeVJU8wkUYdg1z7Ks
X-Authority-Analysis: v=2.4 cv=DPqP4zNb c=1 sm=1 tr=0 ts=684c2ff1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5jRkx2jbz5RiTHLqnWMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMiBTYWx0ZWRfX1paXoHHrh5vE
 mhXcqI2ioPWy5kOII2Fvr+1Kh0OZtX6GcBgEmPEDC19VfvirgEYedOQIfPSLWMKnB1hTsihAuHU
 jMoqcKWf5aS1+5gBc4K32VwI0Qg0JiaffJr2v6XKhyjPSUQZi8StiJPtmaEmjGWQZy1WE+VbG9l
 QhySmjyE0mEmQY9qMhKJon7/p9u0kTUvU7TXfYebDu9uHtL+30HXqnNZYSwMXDLEvGLjOVQvkPa
 KMH0PKBgNvXxnGesiOsA5uTFECytFjOrLbg5rD35XZ4P6TbWxoNvfJvCk7HT9chLzubb2GYHWxK
 9rHFW9jIOlnkoeQHE88xAw/n0e82m+YiA2z6Zs3Q27INcp1JCDorUYulqoOkPmnBwYG1cfCCI5b
 dWE9q79xNqvbXUinxK2Bqd5sgyBVTaKF1YvdIWYo0ivVKyc7d8yNJg/kEZGArQEpQXg18zdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130102

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 736ef53d988d..f1f211ca1ce2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl qcm2290_freq_table[] = {
+	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
+	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
+};
+
+static const struct venus_resources qcm2290_res = {
+	.freq_tbl = qcm2290_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX_LITE,
+	.vpu_version = VPU_VERSION_AR50_LITE,
+	.max_load = 352800,
+	.num_vpp_pipes = 1,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1

