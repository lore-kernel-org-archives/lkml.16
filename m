Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47921FF2B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665002; cv=none; b=SgO2PIUlU/qZKrke4JeqRjefaG1GrsOVcqfWkDgrdH01D09NbzsSQq/CzXIw6Dyk7X3NdnL+YfGf0Sz1ILPbHPuD592YIVR1DaOW0MxF7mzzrpOPuDOrxjBgc/0vbks9EyZrGbeE6prTclYRpCjhWJYCcHYBjMZJhixCrS3HhAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665002; c=relaxed/simple;
	bh=cH+A+MjcVGC/i2HYnkR3s9WU3JModY4E/GfJacde7uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jDZNdia7BwsXepO2XRxygGx71dgTkkcHCWmPJbFv3Ag1F+aeNTTV+WT/PXpNl2k1ekvWl817xaIoVO+f+kIUyT3tFg041MuooeSSvmBtk0kijrT9fA9MdyUqNkqM2sAJ9UDTPRjNzc3Kfk2MRdgsaRUfPvHiAdmI+G71ykGet78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muVQYezh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muVQYezh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNt2Vj021620
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4xLisib0P
	UNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=; b=muVQYezhMoadTJs6WisDWTZD9gi
	jogcEItcj7Vi0F5tUZjspsf+zhPwoYNit2GBWJR4zBGWOtfZwowjADHkehOw8tos
	VTiWl6CIUkriJXH43Bvmzovc22wyFbN6ZBX56KDy2FAybdKREUA7EzYp1YEwLKw1
	I0YtfQEt0IY6sLtruhYTZyt5xdfHjB6KRWA2GCuHWCyZY7oR+gGI80ml9jPjvRGu
	6tlByTz3/qhkV+LeeIOS0Y2z1i8Jl6QlqNwlno7VEOagLT9hBoTupIvJr9WdkDqM
	jabScxQPYTPkWDQ2phpoHsywQei1mSDhayCuzkqNUkbJrgYJpTSpsljUi7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26215w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:50:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so576663085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664999; x=1751269799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J4xLisib0PUNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=;
        b=WtbS/JiOf0MCzIHrtqeJLcCVzVK0ShVMrfTiUWzmdWVQWXrQImnM4TlyKSoeIuKDGI
         aCXaYnURXTAfaom8DFnvdVz3iO3Jy5ApYkVt4uV3pNyj1xeNi3pJPx3CG0KnRzUrIRSc
         uv83mXgNNj1HPDFZNM35pXrfVKw5N8f9bbVAspCKfvcDvsbTBofCH1i/3+7I6lFZsWry
         ZPoUlQq8D2XrpsD23BxNEcweQKTdKGjKqXGRQlugk1Kv3IfsTVXAsaiTyNDgJNNhbc3G
         J83bFoUUPFLvcf302IdRFcj28tEMr43AiO8RM4vgJdgZC795fLezGkjj9y7lcpT3Lk5N
         0SWA==
X-Forwarded-Encrypted: i=1; AJvYcCX48O6r61ZcOYuHFfft9/ehxyglQCFUpXWL+yJ+GcycM8Br0VAox0MDKqkT5jEO01hLu1TgMkjQ24kcgGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiWMWeYLFESqeOGrh7DbIKkzDAD3mEwjzXVJQelTLMN8bCyHP
	3imvz2WwrDmwMz2iBFp6axU07AS07UaUi+gyCJ4KBxvjuDcVQWOi7ulfKa4JCmFEwF2VF0Kc7N7
	8SlZCBzbkYVEQya1o/jATfbQQJbq+mf3dj3LxYFSuOoXnscMXEvt7DEnmO6R7fngjRjA=
X-Gm-Gg: ASbGncuvDycgjhUnQrmqZ729Mnb3eBsFQEztw5tq+hffJg71a20KHHwqu1jPvJtv6Ao
	o65xKpncrg9LJyoPZmpxNTGlGIu/8Zp+m8jv2nJ25cFRh8asryE7pQ4YRs0dzYR3qss5ukhbI34
	1bySo7+JzuhN16GCYSj9UB8YKqWxXKDV1sAZr5Hd+rI0W14ik+rSoLOykLd2WHZCy3mp8VTjLOH
	y28Dy2GsMn1AikPE/bZ1YjD5pQxDwf5ZTdQRZtQRjrGvjFmzuksTiOwRw9pIIdKz81JNT/hlpWB
	hNST7eghpROWGG97zYgFbNR5kZ61M1ep/d4gMUBuBoR0RL0WPx7mMI1FTX4L/WjzeT6NgxRJJcC
	S
X-Received: by 2002:a05:620a:4403:b0:7d3:a52a:125 with SMTP id af79cd13be357-7d3f9923f0cmr1477815785a.26.1750664998830;
        Mon, 23 Jun 2025 00:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGGPyNOllQk9/Q2F0cGH3t0SOxPclBqyGCztEZ0NQrWXoprecRp0lVRoYZaMH2VHLGHf53KA==
X-Received: by 2002:a05:620a:4403:b0:7d3:a52a:125 with SMTP id af79cd13be357-7d3f9923f0cmr1477812985a.26.1750664998238;
        Mon, 23 Jun 2025 00:49:58 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:57 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Mon, 23 Jun 2025 09:49:39 +0200
Message-Id: <20250623074940.3445115-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX+NZ3cq9E74zz
 T704s0adJQIj//C22rgZTNKRz8nK6w1xLPJujItWgqHcvoq1rW/w6cZkIZjnGvZLhSXwqzZKfIi
 +V41iokJPAgf9n7Nr5K+5ucFVBpIobMmA0Qh7aEhZ+73pinQe0++VW9uk4AsHBRbItOR3SBL9jW
 0MMF+AJWGQl4WOCq7JvtcIu96EzK0REKGZO16ih99VAFXWyT3rLq2hG2oR68lVKWfqHHlLqf8rX
 1Kw99AoI24IFaOrNJg8IrIF4NtSaLZKevpfeFTFAW5RpEiUNvJgfbMicp8Dc/XUOceauqflOnQp
 uvNBUfLcqG16EblOOEtmAllzPn0neqnKL93KeSONEtQJyTNRL9WKa7TgGlaDpxrUhoyDa43K2ts
 ea7wlTVxXvrCbq/c3Jf169EsTKcRjEZ0B7dOvFtc4qtbMAnu/f+sd7ak+W9EVZJFvvNLv0XM
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68590728 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 12vQDyRj-jqyU4EzT24ktMJc-Ce-7xeQ
X-Proofpoint-ORIG-GUID: 12vQDyRj-jqyU4EzT24ktMJc-Ce-7xeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230045

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 736ef53d988d..81fcda8fb4a1 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,45 @@ static const struct venus_resources sc7280_res = {
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
+	.enc_nodename = "video-encoder",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1111,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1

