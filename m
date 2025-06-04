Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA91DF258
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018975; cv=none; b=hdbV9iCkflw8tC0dJbyCQ5OgIJz5BJwFa3qLGYrNIMIvz0uxaKbV95qEBBN6GePd2CegIS8WLtLa8C6qdd4fKCsE1iucBIdxoFs43VC3FnHA680RKIKSZ+l5nC2jzAS1wRJKFn1/uP9Y6oR8TyBQ30hR6/xljBL6e1vwgeippA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018975; c=relaxed/simple;
	bh=uzen6Ng/v2BITz7jwC3XuGTzN7eqisBIWb7fDr1caWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBza69HL5U44QRMazNNb6UKRsPfc8aUO18rM2Hie9eaRaNh2qlqpI94oSZoVHqvo/jgJNMpnN3jF+i0wG4LaxH7Hh0y5FSstlpCGKnvkekjSsG4OIRmrJ2IIrAMgVCpAebk591MeR+LSHgo/Bq+ETcUdzbt2Wi0scN26KHbKi0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2fwgCha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2fwgCha"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553JWoAm028374
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 06:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NE3nENNbgV22Ph1JMC8Akt7MvA+95loyFI9VpKGLt0=; b=X2fwgChaehEK1W6U
	ixhSRV+AsOuRZAUP6rlKSHG1Bht5eeIiko6KiDELbL2H9mk13Q+sdjBDVdMRd3wY
	ceJzxPUH2fFDmMDGzlcqhRnF57wd98wSYKym3KhyBOLE/nn4AakdncQzPPfb1gHJ
	Zhzp+hSnQhSRsPIAjDTg85A2hz8BBU43iD9p/N9vC2hkGosnyzKJE+rZYC7eXC1L
	XHoNphlur3BLh6KR4gKXTVKToIvzsdGCum/Dp/19Uf3wZ49audUATnDhY2GrZLAj
	qEVjqVvEv7N2ATXcehE7HkoLLEmk5ApiKeTm+jlaZplJzEOyyzyqCl7TqWFQCmKU
	aMBnQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tw320-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:36:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so6454859a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018971; x=1749623771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NE3nENNbgV22Ph1JMC8Akt7MvA+95loyFI9VpKGLt0=;
        b=GmMJwbo7xIOniKN3TweoDcmEvTIgIBCYHq21zAvAb8Fvzy2ChqwhUFJvZWxjrQOYB1
         jEpwQjzcVDKdAmxsldECcExN+qvuO2Rv/kPBThh1xkurlyJ4b1z7uxQ1Nic0zoWJRbff
         BX8DwxxE7+RUVF2Utwo+jBYb6uAJwAHhoBS9QeSA+1O+1nUwU07I2ZvnbTMQlQSHyKoL
         QxfBwoBcaD9/dgHxtTNHp38DhkCf6mJ8E3/0jHU2rPiukBEcFyDbug/RP8uADLJLDDTJ
         DUCpBzcP2YFGFRzKngCRMdlT0HqSzQ/vgXsiOJ2y+kX1eD6E3+GLVJgZYGvtTN1XFjKI
         cTGw==
X-Gm-Message-State: AOJu0Yx7zxncWH0W2k62rx7dX60aFxXlt12h6AQn3blzIAQME6/ulHW2
	68COIOpSbuvrDiv6frYqsUKZnShStD78nUzc7xLnbYD1pCZGYzjVrWhRWuWk7dWB6aLljgp7b/I
	AvHiGOwHmZd22U7pJSU8aMj5ajOKZVLWdkSIYOqShCySojZxn8MO/qLEgeGcUXwf9AKs=
X-Gm-Gg: ASbGncuSRlzFRqBjx46YJ4WPOS/0xREiKTj19RgTvjrkb1tceg+PUpX1iMIW3lBV1Pf
	e5LOqWI3byqJNgNPeQmylUKOkNhPJjHr3A2lyLSzcPCBzvlPAjxfyThb76JkO+/FST7VtIHOWZL
	DJDHRrGvRFWVGBz68nnZkMogh3fdpE8uqza45mXWtwWPbbSiXxGEKV3lZullnrArBI5ymIJdmNC
	oN34Z8UTjlPNMFkjTXDuh9KzBQpqxgtgI1uMdlroDBprAubKVIj3iLjQdPsFq6Cmu3j/QF59poa
	LbGpoanf6TtNXeH0EJC/NnVjghlZ5n+OTUk8
X-Received: by 2002:a17:90b:3f84:b0:311:b0ec:134b with SMTP id 98e67ed59e1d1-3130ce74cddmr2201407a91.32.1749018970859;
        Tue, 03 Jun 2025 23:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDX0rdPP3xHZ9ryEN1lTZfKHMlWcEL6DFa3OpEnziV+XSq9O2MU+wVZE/xQVT44QlTIavg9g==
X-Received: by 2002:a17:90b:3f84:b0:311:b0ec:134b with SMTP id 98e67ed59e1d1-3130ce74cddmr2201368a91.32.1749018970330;
        Tue, 03 Jun 2025 23:36:10 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c298esm8286693a91.15.2025.06.03.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:36:09 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Wed, 04 Jun 2025 12:05:57 +0530
Subject: [PATCH v4 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 QCS8300 & SA8775P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-update_phy-v4-1-d04b12bb89f2@quicinc.com>
References: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
In-Reply-To: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749018959; l=14792;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=vqAqShyk3tqr6NG3BIwVxL93G2RInb/ZupUPYginZfE=;
 b=YAsh0hbqOyDmwgVPvkhwlPseUMQLnkC6zeyO+s/27uSLTbQIj9Doiz5bDwxg5z80GsJOOqgiS
 Bt6AGoSTT4tB+jZLNMhkDY+++CawBwTA/05B3l7u+3sGHuOuu3LXr1c
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-GUID: VGr_smEBjtLxqHbnMbgX_LpOMaWfo0BR
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683fe95c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5DODS05Qq6CApmbB4pQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1NSBTYWx0ZWRfXxMCCBKsnKDvl
 6si7LQLbL+C+Ft6/KmNnm4CFdUefE6HCmXSs4kLvSRg56ZGMie4CXBUx5lF72QAa9QtTaW4ll5I
 kKy1lH4rUgz+fD4G8okhwowdPFDfsr+wUSAUnJNVz+YXXSgKksAKTO+NKYJBTU8OJzaD5l82273
 a/m/kyBkcGuweNHnvZWSXIeWIi0sQzRMmzeHf9hhVso953h3CPJiRndJqhuoDuzAKlMK9fi0Jwc
 t2ikbtKJYhmNpC260dkJOHr1zYUHMQUCjljhfeEt8QwAAyx6h3aCgm4Z/+oww0mI9ovka7frO5H
 T3U0MK4zkAwnWUl9EqJhYPYSHa9f2dUB8BNj/WbiwVeIrkZO3MOG92ILQgFwm7dn1HTe35LgxFJ
 44alYfMtHz4bhtsgoN0+RGOWUitd9NOFMn4qFDrPojuqP8sRtH+obutOa9t/YMQs6wxWM+N9
X-Proofpoint-ORIG-GUID: VGr_smEBjtLxqHbnMbgX_LpOMaWfo0BR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040055

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

Make changes to update the PHY settings to align with the latest
PCIe PHY Hardware Programming Guide for both PCIe controllers
on the SA8775P platform.

Add the ln_shrd region for SA8775P, incorporating new register
writes as specified in the updated Hardware Programming Guide.

Update pcs table for QCS8300, since both QCS8300 and SA8775P are
closely related and share same pcs settings.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 5 files changed, 66 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ab90aafb313e6e759c0f88589013632bb6277807..cf7122a2b8bac3af591daceba01be1bb791c53cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2639,29 +2639,29 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_rc_serdes_alt_tbl[]
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_rx_alt_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xe4),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x29),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xfb),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xe4),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xec),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xb3),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xec),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd6),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf5),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x5e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xe5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x8d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x7e),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_PHPRE_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3, 0x37),
@@ -2680,12 +2680,12 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x7c),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_IDAC_SAOFFSET, 0x10),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_DAC_ENABLE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 };
@@ -2699,6 +2699,8 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_tx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V5_20_PCS_G3_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V5_20_PCS_G4_RXEQEVAL_TIME, 0x27),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_EQ_CONFIG1, 0x16),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5, 0x02),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
@@ -2711,11 +2713,19 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
 };
 
-static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl[] = {
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4_pcie_pcs_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG4, 0x16),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG5, 0x22),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_G3S2_PRE_GAIN, 0x2e),
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_RX_SIGDET_LVL, 0x66),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LOCK_DETECT_CONFIG1, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG2, 0x50),
+};
+
+static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x2_pcie_ln_shrd_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_v5_LN_SHRD_UCDR_PI_CTRL2, 0x00),
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rx_alt_tbl[] = {
@@ -2739,27 +2749,27 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xd2),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xb6),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xd2),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xf0),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xb3),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf6),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xee),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xe6),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf9),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x7e),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2, 0x0c),
@@ -2767,14 +2777,7 @@ static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
-};
-
-static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG4, 0x16),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_EQ_CONFIG5, 0x22),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_G3S2_PRE_GAIN, 0x2e),
-	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_RX_SIGDET_LVL, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x06),
 };
 
 static const struct qmp_phy_init_tbl sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl[] = {
@@ -3191,6 +3194,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
 	.rx		= 0x0200,
 	.tx2		= 0x0800,
 	.rx2		= 0x0a00,
+	.ln_shrd	= 0x0e00,
 };
 
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {
@@ -3398,8 +3402,8 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
 		.rx		= qcs8300_qmp_gen4x2_pcie_rx_alt_tbl,
 		.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x2_pcie_rx_alt_tbl),
-		.pcs		= sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl,
-		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
 		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
 	},
@@ -4067,12 +4071,15 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
 		.rx		= sa8775p_qmp_gen4x2_pcie_rx_alt_tbl,
 		.rx_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_rx_alt_tbl),
-		.pcs		= sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl,
-		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
-		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
 		.pcs_lane1	= sdx65_qmp_pcie_pcs_lane1_tbl,
 		.pcs_lane1_num	= ARRAY_SIZE(sdx65_qmp_pcie_pcs_lane1_tbl),
+		.ln_shrd		= sa8775p_qmp_gen4x2_pcie_ln_shrd_tbl,
+		.ln_shrd_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ln_shrd_tbl),
+
 	},
 
 	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
@@ -4112,8 +4119,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
 		.rx			= sa8775p_qmp_gen4x4_pcie_rx_alt_tbl,
 		.rx_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_rx_alt_tbl),
-		.pcs		= sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl,
-		.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_pcs_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
 		.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
 	},
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
index 283d63c8159338b57a5026b6c2a86e3cce21097c..951de964dc1242a15efee135266ddeb10ce598df 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
@@ -13,6 +13,8 @@
 #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS		0x090
 #define QPHY_V5_20_PCS_PCIE_EQ_CONFIG1			0x0a0
 #define QPHY_V5_20_PCS_PCIE_PRESET_P10_POST		0x0e0
+#define QPHY_PCIE_V5_20_PCS_G3_RXEQEVAL_TIME		0x0f0
+#define QPHY_PCIE_V5_20_PCS_G4_RXEQEVAL_TIME		0x0f4
 #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG2		0x0fc
 #define QPHY_V5_20_PCS_PCIE_G4_EQ_CONFIG5		0x108
 #define QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN			0x15c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h
index d3ad5b7f54259f27aa5e97991b9d7372e378cddb..bbee68df4e143b187ae02b5148be63ef7e37ef59 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h
@@ -8,8 +8,12 @@
 
 #define QPHY_V5_20_PCS_INSIG_SW_CTRL7			0x060
 #define QPHY_V5_20_PCS_INSIG_MX_CTRL7			0x07c
+#define QPHY_V5_20_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V5_20_PCS_LOCK_DETECT_CONFIG2		0x0c8
 #define QPHY_V5_20_PCS_G3S2_PRE_GAIN			0x170
 #define QPHY_V5_20_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG1		0x1b8
+#define QPHY_V5_20_PCS_ALIGN_DETECT_CONFIG2		0x1bc
 #define QPHY_V5_20_PCS_EQ_CONFIG2			0x1d8
 #define QPHY_V5_20_PCS_EQ_CONFIG4			0x1e0
 #define QPHY_V5_20_PCS_EQ_CONFIG5			0x1e4
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h
new file mode 100644
index 0000000000000000000000000000000000000000..68c38fdfc1d826f1ca986469932ef6c0835248db
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_LN_SHRD_V5_H_
+#define QCOM_PHY_QMP_QSERDES_LN_SHRD_V5_H_
+
+#define  QSERDES_v5_LN_SHRD_UCDR_PI_CTRL2		0x04c
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index d0f41e4aaa855fc3ee088afc833b214277b7e2b0..6a7ae5199bba6f34d228ace15ab2b452fc0d50a9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -25,6 +25,7 @@
 #include "phy-qcom-qmp-qserdes-txrx-v6.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6_20.h"
 #include "phy-qcom-qmp-qserdes-txrx-v6_n4.h"
+#include "phy-qcom-qmp-qserdes-ln-shrd-v5.h"
 #include "phy-qcom-qmp-qserdes-ln-shrd-v6.h"
 
 #include "phy-qcom-qmp-qserdes-com-v7.h"

-- 
2.25.1

