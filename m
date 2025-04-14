Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0E27EC9C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631605; cv=none; b=egSEe0VSLuwxyJV8bwxLziooaD1aEgBod9tLjQov0Fo2JrrFwNHdT5/lRoSiGEabxta9aKuyYcTetxWcqKHVHpgIw6bAXhttRqBcgNCW1XPelq8OtgTvcZmULzClFpMOdpnwTtmgdLpoPV+/oBy3uBuGDrUNq7f/ht9oPtcmQ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631605; c=relaxed/simple;
	bh=6yw3TIsSk+fi4n/Vx0e4/+C/cuCzBTjdJ6X1LsUILcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=roH4rRdVLflB17aCIoSW20XLYTaf7APYqBT6V1S/LuSUgmof05lGnj0EEGXZSyiZnjIEnO032/Wp8vUf0jzaOut+TcfVUlSF8H38h12HF/Q5WQMJK1WwIP2pd7Ukf3bhIQ5V42k867vD5ttu+Hi8tDanouvq9gp9DHIZupZhZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTkFxhfU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTkFxhfU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99ran016360
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4eQZ+dFk+f8kp4GW5geWITsRLjJdQNXKTH3mNGn2Jk=; b=mTkFxhfUZmQv+Ha2
	xGxq9rz+GrL/Uut9a67pe4Rwea1aMZqbVA7SUr0/oNSKT+TSm0yKh4GKNe5ium4n
	fJ5gGWs6IRWlmovKIoxywN8RW9LCaR1GrFCTdUAOCdiPLqMUxLrM8yQnC8GHz1uN
	WKMLXlId4KzpusmU33QyQo8Gspy4zo60FdE27iKCGYS1k8SW5hUjLjDgECpZTCdq
	5MRp4Q3J1NgfP3R1n7+fysgbd8Z1dFbSI0YdwsKE45EkplITABo7fFzh8eN48v+j
	U3HiZddGdumtTlpTEiAZsHJsTFbiVteeJvSBfZ+ZeP5UGfhm2ynpudjyOTlwyI+Z
	EIwZtA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjce61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:53:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so2917495a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631577; x=1745236377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4eQZ+dFk+f8kp4GW5geWITsRLjJdQNXKTH3mNGn2Jk=;
        b=T9z9gsd2Y+SCKDh/HxYiaZxnekA6td2Dq3dSu5jVb3yfB3ciyrJvKoni0Qp8xoMJvd
         p2/lGADXxZg6nSAE+0D3cFN8lcXtqIZXIN44gqeXaOroOTp0aXadDwbUaFSigbjX9AWZ
         4vPve2aogSU1YrNok4wG1mHkC5VKWprrXT2QjUrIs6qLvYXVaQbfjAO2fVjIHwtqVm6A
         c6Z63WPevi2/hiOVz5iEMX3pIL5ttzpqRYwBjPOflDtZ06mVpyHWOv8y+D7Am8uJOoqY
         zatbxTs91z4/EfaeDzhhMsPibbiWYqX1yvBIbA+FI3jyMDiB+lMbiaqt1o80G7RXrlVP
         iq1A==
X-Forwarded-Encrypted: i=1; AJvYcCUcLmaIef522B7bu68uFCfpztZiPvCFCDFbTWju1X2wK2QkRRTK9toEw3RSinxSxU/DXoBMEzpkZVxV3LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YynsjWWOLW+79QOEUnWJs/koUFQqguYfu9Jp1aFK8WInWg5Ktv6
	wFDJEc1ntt4KTqzNyQd2zYFktSglG9t/9XN0MOLhCXzfWFQsJyigSHg5LDdNo1ZK/0KSVKyiiGg
	qyPXkG7U2QJKrtO6EAaPKmQjtPLrwSjS11hpj1jrUDixuolhjPnL0dJgLW41jFEU=
X-Gm-Gg: ASbGncucOYtbiYKMba96ijTl+5cod/JC8jsAMCDfBjpCimM0JBQKMJwaiFyk57NXud0
	dZNAwy4HPXGXtF//Ja+N8ekhRaaNwgcSnZPKxHRoIFC2OIjYSjtGzQkm6oA9aUOrqLjrAf26Nmf
	Og9CZvOI9JRfaQYUDCOC8X7VqxpKnGliHJiYZhLsZ2nQI60nQOFVzCYpHyqiev/TFEv+pfVGb+F
	tGKXrgMIQrhyOuoZzzvsGoazTyDAqW/w5qdV9/ZwCnIbgFXqrZo5QMynr+XTmh5TyoQimcS+8ko
	LCWmjD6JzvmJejSGc0bhaVPsiPsHvyfaHtb2GCE2pGoc8cUm6REy6Hr9mPC5xsNAWDDkCgqOfSn
	gPkFRjnhCLLHtohatFC4j4aRQkOoft6mrvn40SJISxFEZ8AQ=
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr182958515ad.12.1744631576772;
        Mon, 14 Apr 2025 04:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHsHPFfgUQeWJLdBCHGOe9nTEe4mD33k4b5yyMFUTnsr1hKZT/8yXc+mGOgsW1hkr/LRWb1A==
X-Received: by 2002:a17:902:cec4:b0:224:e33:889b with SMTP id d9443c01a7336-22bea4ade03mr182958245ad.12.1744631576441;
        Mon, 14 Apr 2025 04:52:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm96425735ad.86.2025.04.14.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:52:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 17:22:49 +0530
Subject: [PATCH v2 1/2] Revert "phy: qcom-qusb2: add QUSB2 support for
 IPQ5424"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-revert_hs_phy_settings-v2-1-25086e20a3a3@oss.qualcomm.com>
References: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744631571; l=2743;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6yw3TIsSk+fi4n/Vx0e4/+C/cuCzBTjdJ6X1LsUILcw=;
 b=E0yilhCU1zZvO9ftjOqRNoWih3UVAMwNo7/Nyz2O4KrVW0ZDLa2oMYE+Ao9NUH68MFShy98ck
 /MEmkscH1aUAk7KUB0wthNN6D+ow9navIrnig8fkvvEQB1iP3AeWENk
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: B4flvFHxsH0KPPZB1F7cA8iAlmcQRc25
X-Proofpoint-ORIG-GUID: B4flvFHxsH0KPPZB1F7cA8iAlmcQRc25
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fcf732 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pdtzJwMO8baX11e5YFsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140087

With the current settings, complaince tests especially eye diagram
(Host High-speed Signal Quality) tests are failing. Design team
requested to reuse the IPQ6018 settings to overcome this issue.

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

