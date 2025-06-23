Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A423E33F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675882; cv=none; b=QIzG907lID0+wJyBPlLDR9iEwLywovmZM9a6QVM5cCUYZDb73BCwGiKcsK6/UzY7qODWXyC1bTDV84GKVzlt5+tWhqh81x8FsySVgIEKsLnS+4ASIGQM5qiE1y3q+XsDv5uAYi8FUWcpo2KciJJONMZr+N7sX8qYfdz1R1rNymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675882; c=relaxed/simple;
	bh=cH+A+MjcVGC/i2HYnkR3s9WU3JModY4E/GfJacde7uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sSAUk+A+otasfH4eGH8Knx78so1x8REDd91BDI4Culabdst0dx8s7lO+be8hdM2gw9sqCL25RWmmmVixhmTpqVsyMDfIHUvV0eIevB6o3qeEAiQs/fbq0kQHXN8i2CibTETYvuY6MJ4GK0orL/fLCh2SI933rF2rcns107XluJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ote4D8um; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ote4D8um"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fYJb021714
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4xLisib0P
	UNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=; b=Ote4D8umSziSOav4Wfcp0O++Nxx
	flvPPlzXub+bseSdeBMWp7UhdCft0dcW0alzpkBydlzWk9T6wQjggNLhi3r1C3Yu
	DRSKAw5nWF6gTxA1kUpn6w4MmW07u7TMC7vAp4In60lZzE60vfKPHE1rp/bYF0mv
	nY7O5lfUxuq/GZG60g9kPDfSdseiQMUMNzkgdN9r8qm/laa3MRhQpVEN/e/hZWj1
	BtjA4+CfMM0b8JlMUe+fKA27vZ3QUCIoGDs5hnusVXOsnIA4/cTOT+RLeX2sk7Ba
	1JP9ArWHMjn+diiYaLPiDrut+qkmNOHQBh5MexoG1vI8nmuiNqwMdRRIdQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rprh4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3f0958112so606325085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675877; x=1751280677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J4xLisib0PUNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=;
        b=fjXs6c7BetLDyOSQ9klDWpXNTDdVh3378hzKeXhrS0WrRelolC/Q5tmEm0m/a2MrRo
         9LPGsVJ44NWGq7/4Pe1A5jug86Y6CKfEaCVrxr0jAulBXpcRd2q23AedBpUli2NAKaKv
         2dF9epiMXjV2HfxR//p8Xvb3YAnRrRkmPf0vgHgTyOtomeQcpubhmOJAnJAjyOHz19AW
         LuIITqxKj6cF3ltTYKjhkYNsyUanw1yp8qoZWghCrUpQW4aEStJyBZ2aQlCKYfoLeATg
         PzcbNkOSbvZjsS3sZoEZ5Gsr0YqP8kCVNEqAAHUiRcxGRJNxIy2UtyqDzu1HBME0qbRz
         z7pA==
X-Forwarded-Encrypted: i=1; AJvYcCXkBhIpiMW2IY5UI3yaF+xMke5uyhf8tXlMSiF2r8XDadXNJBvcsEfos3GGKxusCGqTMwbmXJiM4q0ypVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90O1REC7G2uASeJrGZxKmu7/ZarV/lp9F4O1wWNjhJpfDRwKu
	WCyzLKVg7kxsgxMX5G61bRlhdEnkh3MnJjNHNFcQwFCrvWk01pOl/oZwBuzQ3C78b/W2ZT6Z+06
	wlPl7IwURskyAoFGkupTBGZlGmi5Rm06vlk0tUjNVfKw1AtTeWZ24P55v9YnvBrozv04=
X-Gm-Gg: ASbGncv2MXd+x7A9Eo1oqpRdzo/gYln6fEdNXUMk0q9o7uMzxZi5DPdWHmFUs9jZUTd
	iRwsFhU2uofRgonsw8yTWLrRpte44SHURj1a+rsVPmcTFKMDroZw3ka8ewPVsJpWBEkkwxTt8GF
	qV6EFgM5acSTc0Fq+wxGt7Utw76dZgqog11ICMxV9NrMiY9nuxmYuFSkVz/75oKjRhHm7+ZD4SB
	JY9n3F1i9K4r9/p4E3wI2WUBu8iNZYzN2Igz15IRwhogT/QtV7RJ5b9oUR2h/llYRgbG9eMMLZq
	BbzcQDMDHwpovAVjuzoz0eb/9wsfemLqHcpHAt+2Rxl1RqmQEV3rKSspVnAkkufRx6wLOgBDPhz
	T
X-Received: by 2002:a05:620a:8014:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7d3f9947e23mr1940422385a.49.1750675877299;
        Mon, 23 Jun 2025 03:51:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAYc7H2G9B9LeRlYdXSdWLBowJZ1IDPdn8TvJI+9hSsq518lLZTPwLA5xkLp8gZUzH4g6NMg==
X-Received: by 2002:a05:620a:8014:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7d3f9947e23mr1940419585a.49.1750675876869;
        Mon, 23 Jun 2025 03:51:16 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:16 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Mon, 23 Jun 2025 12:51:06 +0200
Message-Id: <20250623105107.3461661-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685931a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfX6o1EWdvl41ny
 UuxIYwa0xrquVW0lI/Jo6BCIrjYopremhU08tvtUnQU8ihH+J0l7o/7LNenFrQOaEJgBnH6NgwN
 rATr3JISvr/yBICNB8IORUNmyOoncKXNmn27JfCRXs4F+OSnskcDMkjIgVE3yl/plmqYXHbqp5G
 yxDCmYFuo1fRlu5NkPzT7xNu/tgimJc1TwXrB8B7Rz3vnHwvhn5U+x5sda3Pl5ljo6ldfeclTNr
 7uDKlPpON6uv9KdtCELbhGq4E53SI/3GRrGGzF8POZqJkhq1bEOOHyXGZiqSPUcI8/HWCKx1mOf
 6shNJz1nz+S4yfu+mSpRm39xxy2Tv+ABiPaxCwmCmHp0h7XLXEgCA4M4lxiky8H2uqH6gQy0wGY
 oV8Uh6o96VTOZ3h7JLIjDsFC8uydS1dqeufvDGVdMuXEYvj194cClktQnHnFXa4VbgcVkUJk
X-Proofpoint-ORIG-GUID: nj8oxwsYeWIBizxlMrBmrWXd_ohX2XMo
X-Proofpoint-GUID: nj8oxwsYeWIBizxlMrBmrWXd_ohX2XMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230065

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

