Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB10F14B945
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744690982; cv=none; b=LRtSXfaVbP8l3pY+eHBGJKk7BCnB7bn/L5VDDfU9Wz3DsSJWm2TJScIgXy0jdNnKI36B6rhWQw9gu0x2K66EJDySHGlxboCCdODB6Z6GjvmHqVjAUmnibmQLQB0XuQkAgZWrqoHZQ63KK2UBJM0nog/dBPtJjt4rFXD3NIgAY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744690982; c=relaxed/simple;
	bh=53Z3eEzhZkA+Kuk3g35Mhd2tAh9dKGMeWsA+KWs8Eeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fw1m8Rbmi50TKryUlsoNidBBl8e3mk6zk3k3WmJjvjfxPONDWRGxWz2kG92aJ55vqggekAY/Ur2tGNaChlDDjXhc9pHcUKNwq6sH4pH+vRltZ8bU4mtbCbQjGsnkvZtFsMs5rt1S3+BH4FhWS1rT9ZQAgWbAb+q+Kig4W0XVFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhpHH49b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhpHH49b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15NvJ031007
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeEaOL0Qs4hs+SU/rpDGpjPNr88zN29VG/gv5mZS6+A=; b=WhpHH49b83dosjFs
	JBKo2bxlTeSl+A/oNxR/Gl/FepbhxIlh2ALb/jKlzSfsx/t3QEWnQ5QKEf9OCopm
	QeLCMGM1mgQf1fOOtrpo18lZjke7DlltXup8MPVxxsib9LqMyPzhV8J0+TBjDAyx
	3IPmoI/Hfay06nT+G2nzIMrRkuSlfLJb3ObJCF2TQhKvRYPQ1e4FW+ATBJHbKORE
	ATQ/V9yS5z19g2FhK00SY+T8qh9bGujya+IaDSQRiUJf3XzKJUqf02o2RtOBlJ9E
	XBWoHuGg5wcl4ztJQHkE2zxdLYO3QiUcKQV48c96/t/XU7tEljm7IiPfIqMZbMCu
	mCgsKg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjxgc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:22:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso7027175a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744690978; x=1745295778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeEaOL0Qs4hs+SU/rpDGpjPNr88zN29VG/gv5mZS6+A=;
        b=dEuqeIhFs8bXj/h0IuswwOh7pxh9yVOnexcMFIM1n7UX0dgf0PyP2L/5pKU3L+n8t3
         z6/w7b8uJpwe6SYFBq//NLFf86fJP/grfLo9Ezrcv7ZaAt1sKO7/BVBuf7P4tQshR7eH
         wl1of+Gn23DJm4ldU2aEkZU1H1vVO7Btwh+1dyLiMle23uYW9jcWbEJ3beXcT1+uX0DV
         nWoBWhI6+M8rk/VgY0/leoL7kjvDJkRwjzRju7DQjHA7ssdvkXUGvHB+0m913TjGavLT
         bnzQ8RhEATpI3/K9El+p1bOzwTpayTr8RABxCQGYAqB3VuCfItO3BMVbApDM67UEyGcJ
         0vOw==
X-Forwarded-Encrypted: i=1; AJvYcCWH84zwyIh+QhLWm3rcLZ+d2YjTZqbfocVEN1UcB8guHuAgwh2OJI8DQC2MaiSO4ulb/fYiOG4/PSl2sUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywori+5+709njjDnRd0uNZDo/EXjR4UT81G30x9XCpvKKpTp0qG
	e99R7wWBzbuz0xlN1r9zB6jT40UCEoBeRd6eC4X6CNXpm7fwq7EtpahbHwMhKKpGES9k/f8jY86
	bSYXEE2p8ef8aUZEHGbpGOE2jgNDIEVYD9VEv9bd/+eF5z3Kk+stiumo+QVCYEHw=
X-Gm-Gg: ASbGncv+xBlESG7SqqIYl/9ltQ0W+D3utDN21LE2xOr/yZP/Xaj6A8AOI3XMt9BpGJJ
	Y7wyIx9vz1VqmxpW6jozNlKxNYvki8OUtLymszLticMM3kZhvdpbcPDaMCLHvzwhEGt4jiYwKNG
	sffRPOP6osXXe1071hOKb9q8FQdXcNm/JFkbGsUP74OuKg7QpVQQEYDMGTAF4/KhClYbATp57H1
	hutboCbBnTFqOIz1ecsEFRTKmeeo+u/wBxvyzMOrojZFBBP1cRQczNlyMm2K2KkiiIxRdz6xwzU
	S8MHkA6u1e8LfMEweqlzqDbxnv/ECwuugch9bzj3b6ReukhMObbdLfo9e9LHxfSz5IpF6288jAM
	nUFgefbSHtFybyUFvQIiX0+lwgxB4ltlFFavZgyHVjFykQ5I=
X-Received: by 2002:a17:90b:264b:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30823624847mr21215607a91.5.1744690978270;
        Mon, 14 Apr 2025 21:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfzmI2PN9J0on7oIn9TCegSFtS2nGZIR3JI74YzgGuLcOcaB78BG8y9xVSSNYw+WVZn3ejDw==
X-Received: by 2002:a17:90b:264b:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30823624847mr21215588a91.5.1744690977892;
        Mon, 14 Apr 2025 21:22:57 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm107381865ad.170.2025.04.14.21.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 21:22:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 09:52:50 +0530
Subject: [PATCH v3 1/2] Revert "phy: qcom-qusb2: add QUSB2 support for
 IPQ5424"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-revert_hs_phy_settings-v3-1-3a8f86211b59@oss.qualcomm.com>
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
In-Reply-To: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744690972; l=2765;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=53Z3eEzhZkA+Kuk3g35Mhd2tAh9dKGMeWsA+KWs8Eeg=;
 b=9MlHmVy3e6PakAX6zsceB4h13UGLsnzgyqPWBby671dtyrJtc11S+q/Cd9QZXIwDDJOZt/3+X
 Rsi5npFEq6wARZxTIq+qff5z0YJNKqEKC048h9JsqhtbroF/BrlPFme
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fddf23 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pdtzJwMO8baX11e5YFsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: WdlkBhPyrGI0GXTnXBDZ5nM8GTwfRel-
X-Proofpoint-ORIG-GUID: WdlkBhPyrGI0GXTnXBDZ5nM8GTwfRel-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150026

With the current settings, compliance tests especially eye diagram
(Host High-speed Signal Quality) tests are failing. Reuse the IPQ6018
settings to overcome this issue, as mentioned in the Hardware Design
Document.

So revert the change which introduced the new settings and reuse the
IPQ6018 settings in the subsequent patch.

Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1f5f7df14d5a2ff041fe15aaeb6ec5ce52ab2a81..81b9e9349c3ebb4d303cb040b5c913336bb6b6d6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -151,21 +151,6 @@ static const struct qusb2_phy_init_tbl ipq6018_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
 };
 
-static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0x00),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc3),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
-	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
-	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
-};
-
 static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc8),
 	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
@@ -359,16 +344,6 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.autoresume_en   = BIT(0),
 };
 
-static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
-	.tbl            = ipq5424_init_tbl,
-	.tbl_num        = ARRAY_SIZE(ipq5424_init_tbl),
-	.regs           = ipq6018_regs_layout,
-
-	.disable_ctrl   = POWER_DOWN,
-	.mask_core_ready = PLL_LOCKED,
-	.autoresume_en   = BIT(0),
-};
-
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.tbl            = qcs615_init_tbl,
 	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
@@ -954,9 +929,6 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
-		.compatible	= "qcom,ipq5424-qusb2-phy",
-		.data		= &ipq5424_phy_cfg,
-	}, {
 		.compatible	= "qcom,ipq6018-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1

