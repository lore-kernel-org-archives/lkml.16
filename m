Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712522E92DC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946387; cv=none; b=snLEZimtFq03foh0fvqwlcGU6FmN+vZFVPlEbsQWU+NrRsRPoHIysIYK3Uzf5kfqLPYSOzRylkw8wF+32onewKxXN/+/PSnz9f0CfyX4yQ8XgWQ+1Reevz/G52o/b30J0CIAUTrh+cQSZ61eyVe2aRhAdZ1+7a9px2sfNor++sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946387; c=relaxed/simple;
	bh=chjuspMWXk8eI76Jp3Mq4yhHE0boTd39JW8qGPEIFpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thrJSQ1bEu2pLyRxWhN6nZmXACNngpzXtsKs74j0LDp3fHlGHcPAT9QacGIhyoW8lqbXhPOJX9NnzN+Bg0d6XirsVUCj4wSBkhZyTdkYZyyHnLZrfePj9SMmy+jaC1okPheNDoXmhxRTJp3Oja1YpuhUzrjGek+ENDlrH7yNWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSMeo9jt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSMeo9jt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA1nIE015352
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P1Inwr+v5AJ
	OSvWCpAeDJxxnBzKcgTqyCl0dEEMlzt4=; b=PSMeo9jtVwztSE0ncTrXJ1WY4ZV
	GCWYOKqRGb2yVUn/V2NkSMchQvIO/2rHTHKBjda8NIsyEp8x0cz9aoXTWAmK26p+
	BBZjUgjuy009DRHOEn8QDc8n9E8Zs6Nfki4A+9Ym68PrlYv2plWMdGaOgqFcffhu
	0TekwIm936q79E9+859bF7zlzAZxypkP5nTGz83j6DMMNfyRfio05McBCp5wQekM
	X+U4ERSZW7/QUMyfBo2vBgvzt/eiEgGRt7mzoRzIuEWO+xx2R6aqouTtaTlWR3CL
	W3VU4wTxTgUOmcRurf+J4J1yQfDTVXeX/iT0kEDPRWGvMPBOGM5KxB0wjQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fd992-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so171637485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946383; x=1751551183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1Inwr+v5AJOSvWCpAeDJxxnBzKcgTqyCl0dEEMlzt4=;
        b=kRL5L4+uJBr1X6YzaMKn6Vo64QN4abE5z35sbQrPW0G5Ndau2wPJlbiO6j5eaJxXNy
         mDapd1LKZDx7rO+SKMJUhcRVaFRLVDIy7Eh6qM+PYtLIjzSnPWi+Ye3ZYtL9+owSAWTk
         HgnpOhXbshee+rUeeIrF7bqFYSjzHN+DVMW0zYMnOw9N5F/7ckqYAHarmsrUAw4sr9fl
         vTM4dtRrrS2c8nGRL1Ev1aG90emegTIwehzzboAMvSF+LzpLYSes0Wx5iDX90Y+xNtQf
         UINeBKkjr9/ObZckfvfBmjo4CJF1h6DyNIAuS5aHYV5GZosagTeilLUFY1txJcC2SCWq
         gwCg==
X-Forwarded-Encrypted: i=1; AJvYcCWQZhik8tCoNMv/ovLTTEkgFF4rcCwA4ky+TxD/RyjnvN7o/+LdjEoJqD+e1vUMSKzOoh7aZNUZfALWRvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRflukP/s5iV186EtteNOHv4PXLiOqgRhpO4cf1BSr/tGpwgjS
	BcxT8n0pylSFUq98dnd92Ln8WXY0IzJ4g23sRZmtCNnN6nkk8bG/qNaHcR8iTWNS03294I1WDOs
	s/oFpj+V+1FSwkVm1R3Ui26Uauq1j2JXZP08wWEV2JXrUYJN1w2dIY9/t5uZoDAHg41c=
X-Gm-Gg: ASbGnctmfZm9f1aXqveH/PElnph3UCZHv6OpLSBxKBbvop9GFDDXQoClIc5vY2Ye10H
	k1rMVAha5wEgW5/NZEmLCJk7QRbcdnjXbKlgeXJIGugOy7XI+/IpAf9hhm/7vAYQdK12nw87Okz
	7qTbOKryH7qyQNJen/r0D1yLjZnJLnfpbKQGalkE7V11q/Gore6ciC3NS2OAMV5Rns1Lxxtf6sD
	xkLdOrnCtvcJjlJSVvh9qUyjsgGcIOB0wWKit1mhKUPdgi0irtyskkiDZiVtA+4SclYSCFTlqor
	HlhMj5DQWbdMVHo/OUAy//eLc6q4qMoOwlYt/e6niE8SoPqjZimi7844dQ6meznOVYzaH1wo3/K
	L
X-Received: by 2002:a05:620a:4153:b0:7c5:6a35:81c1 with SMTP id af79cd13be357-7d42974b38fmr1137983185a.48.1750946383375;
        Thu, 26 Jun 2025 06:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF3lEab+MhnjBuMmiLUDuDSZ0Flwzk3O0Rv44A3LR/pbAhVimij8UTmYIC2fFRlCNqjiINkg==
X-Received: by 2002:a05:620a:4153:b0:7c5:6a35:81c1 with SMTP id af79cd13be357-7d42974b38fmr1137978485a.48.1750946382927;
        Thu, 26 Jun 2025 06:59:42 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:42 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Thu, 26 Jun 2025 15:59:30 +0200
Message-Id: <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX8CQ7NcR+cRgf
 vGp5z91jZI4pRCb+SyREvakKEHw19vmAHCco+QgGBLx5YYsAkcdqVLPdN8nBLskTfqY+7jZH7Q9
 UMei1gUr2qFVQFUwsBxCdP9E4XCy91kCCyb4p6cEHD9QumuGTdRb/h0JzWSCo4J4Rr7BtFyIgS0
 EHm1T0Lph1lfOOJUGcUznysY3jgbRfUrFK3rBu3nAEAHmBz6bOSLLdi23OlKD1FmLM190p9D+xi
 04LMjK026k8sIfitC7VNzx/T/Ts7ERDP5uJQyweOWBUeNLTp/QpP5LT4aKzEay4nNXGzbpNJ0X4
 Ju4z1EaDI27vrCuwmGlYNvaE9JzcF0MO6t8QZyzpa9kxutPKyXURkVMHxau84nzFF19HBahRbHT
 +toihRVeI1P/P1w3oO1ohib7+ktf915662LCHHG22YIXHVJtNf3NtHRo8EcEk6ixEjAz2d7d
X-Proofpoint-ORIG-GUID: uHlYCXamwtjTqb53h_5BR4itZb8aY1DS
X-Proofpoint-GUID: uHlYCXamwtjTqb53h_5BR4itZb8aY1DS
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d5250 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add a qcm2290 compatible binding to the venus core.

Video encoding support is not exposed until the relevant hardware
capabilities are enabled.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
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

