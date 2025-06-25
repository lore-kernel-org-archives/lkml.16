Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF083074B1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834857; cv=none; b=QsBz0AnUgFuaVecXPgFikbC5wssly8csh28IE2xQxPQc9Y69eJ41wkunBbunoYOwN3/hxE0MIhRgYTPSO5AVk8dD9Sx/hgVluJT7eK+D7umh6RmYzJY8F9462sOypx+KBlfjJCGEjniodDLU1TWP22xptSj2sti1rAfsMf+1gwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834857; c=relaxed/simple;
	bh=IOojmDcfA7xALANINpGpb3cHe1paDntB33v0oamHVOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nG9BmWBYEkn/7C8EciVIR6VpknBFjPdcpcV9c+bwWLSTbHGOjpvhb3Ltn6W0dEEuU9m2ZvRHHH6j7Cq1ShpwruYcxztfF4adrL/7zFVTvQN3BEGX1YVroONICRcYp9iTfTAqLOgAmC5khTz6XTuKq2QgMHpdFHjbILWM9idTDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkbs6VOQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkbs6VOQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4ld9Q017715
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pyzM2HxTz6vkcldnXZPq//
	68fgMJwv6Rt9/cCgUKmGA=; b=dkbs6VOQuI2DV+BLwNtRkPU/722Zy3D6A25Dw7
	4YQ7zjZEDOt9kKFSPRQBx4VVlaSWUaBqdyIOleW49kgF93GextQFFsBXYlx2bQoA
	9go23sKh53SRAZ4MxpG0H3z6dZVTp/71MfCjj/WOy0oPLNdNnkgIEAD5Vso0b/A0
	RaFPEXkbFx07VslLJv653uMuWqLzqA+H/wFT4jg2MtriYB/Caw+2vHD68ZtwfXx5
	784vzZ760hMGfP1f78xIbt8n0Q+YtlCwcVKv+RA5hMteik0RWHfcN7h1Wm5nzBg7
	ycwjN9aXHAIRBk0ZUXq/JSv6D2DOVm+zVG8q1khvctFLM2ow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5qwc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:00:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31366819969so1275446a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750834853; x=1751439653;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyzM2HxTz6vkcldnXZPq//68fgMJwv6Rt9/cCgUKmGA=;
        b=wTIVs5IZ0rR5lvNcInvm/0XdsgJrOTRiuNW0afYmVaKUj16F404DkPedb0q5ha44r/
         w67dgW/FDMuqEtZRIIVY2CzRknifEFC41rvtZVUSbzI6Kn+LVqXpePvUmd44OUNC8kFK
         IzqFLZg+l3zpralGIPCTukhNxPUcQUnpTfktmFKowN1du87n5c8Bu/iiBCeGafZUeAbQ
         JikaDbC/U8IwVRM2xumXU2MksMPFR4ys6Mz9oYvutiZ7YHvM9p9cEhQgXLEVepV1C4Q0
         Dmqe4GOYilMN5v36bN/wr6nSN0U7JHVcV0Qq1AbgVkB9y2m16xioJO4G9FUOqPgtop0T
         v4HA==
X-Forwarded-Encrypted: i=1; AJvYcCX2vx/+jqso0m3MHCA0PFqPFHcAWdIq/FLTqU9GTb4uM/uN1Nl+jUTVDAbs0XDWvIL+6BqNRxlxZd3ANb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjx3xjMCklE0RDCiHNQfwNjw/b2ippCEZpXV/9+GKcVO43sjUH
	Ceo4VwRHC7nh0pZOyxAJWw4t82I8gKVxKrSz7cowZhR7dE6AUC8mb4/q3qAnjgB+9TtuZrqzDU6
	bMMi/1O4b+gi32H0xTdjk7jYyvpzG0R449zwczL5LeyXqZcugJtMtSE8v75RNIsCWKKs=
X-Gm-Gg: ASbGncvyBfAUESc6E6ydVIu7RyNsgZXUeivUnzfOzhbMwv9s3ZsUHM1z08DDWYtyKJ+
	cuubH/lhEAzYqzNvLXzFSua9391LCagptG5vrOq+1EGZI1loBvzXviJNignnXT18xy/BGiCUQjB
	H3rVHvIiX5SrDtW0gkYKyLIANlWA09hy/Fz2tXdRdB5PMyLPFLB5unsknam6M1Aexy6UzZ520XU
	kXDy2hL404xwh3nChdduJUiPzHuz7q5GoC0IW+uc49MsO8pq7rqPK3als1IV4Hl/UbfJ+o2VtFV
	0/bEdnH07J8vyJGjx+WvozXqJwQdSNJDH22O06HugAzgTzH9jQ9LJI5N3tZr5sd8O5Hm39E1F8k
	7+O5Pd7ac4KNCHRKX/Q6SGccsjP8pRqmsE3nybQHT8O0ii+ehJGdlDNlO9g==
X-Received: by 2002:a17:90b:2c85:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-315f25e7388mr3143108a91.2.1750834853113;
        Wed, 25 Jun 2025 00:00:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxulghq1aqMwRhsLHx6rKcs8jeRMiEBRz4TjDDZ8DEU2FlXcgU6xVBPD0ZuaW69ijwzrAUMA==
X-Received: by 2002:a17:90b:2c85:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-315f25e7388mr3143032a91.2.1750834852497;
        Wed, 25 Jun 2025 00:00:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6aasm968494a91.15.2025.06.25.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:00:51 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 12:30:46 +0530
Subject: [PATCH] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ2eW2gC/x3M0QpAMBSA4VfRubbiMMqrSGvmsFPMbCWSd7dcf
 hf//0CkwBShyx4IdHLk3SWUeQbGareQ4CkZsEBZNCgF+0NWFSobvb2V2Te/anaGhKnlSEgtYq0
 h5T7QzNe/7of3/QAYkKSIagAAAA==
X-Change-ID: 20250625-ipq5332_hsphy_complaince-c45be2e7224a
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750834849; l=2192;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IOojmDcfA7xALANINpGpb3cHe1paDntB33v0oamHVOM=;
 b=SfKStKtNZyQJPNsfLoRZyp+/DtgguNjygO9NJmA3gnpnwmFv0LidhX3Pu+AggbylOqiCisoe0
 YMm/lDizgcgCv3T56wFgVHhpoj6NLR9rz5wJdWsRjHDgCC/gx3LeZCe
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 94k_frHjUZycokKgrdtxIBiZAjb1XKBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MSBTYWx0ZWRfX9rKXBdnt+6Nn
 7GHGQLP5i2nrRxFe31Lr1ThFAdShxMgN2SjV0HFWMJ3Z4RUlbkhJsa35BfgluVsNHj09B2wTws0
 l8HD4X2nRuMyJMPl7HRpKGzAJ7/BYx4E32Dt7K57l60VM7yEeQW6R2LqronAPFQkZ2vwJG5YCZl
 ooMberJLHB4qr8RvhobNiqefk/LR8E536+TeTvx+RIcLp3SrQ2Bh8ZNlGO4PxPK4HV+LXTzCS6c
 kdZ9pbXSqS2obEHZXQdGa0aXwQhojWdZMQI7ofJ4rUE+aMzPki8gh0cV2WKClp/4dMraZke+D/J
 fZIe6ALfkO0IomFHM+Xfvr7YA3XURPc9giMdq+IK8/pnKtLX0WKBe07z6NFkOuIA+mEzT3mvl7U
 0RLy8qNds8U7wGaBWAPu0JR/GnFAAgDOLJUZ7vhKGoE1f91E8ub0L/esCItpg1Lp1xItXXVD
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b9ea6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j3_UZ-iYLL1He1QCjhoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 94k_frHjUZycokKgrdtxIBiZAjb1XKBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=985 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250051

The current configuration used for the IPQ5332 M31 USB PHY fails the
Near End High Speed Signal Quality compliance test. To resolve this,
update the initialization sequence as specified in the Hardware Design
Document.

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Cc: stable@kernel.org
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..1a8a0f1262cd95bc00dfbf7397a1c48d88d52327 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -58,12 +58,14 @@
  #define USB2_0_TX_ENABLE		BIT(2)
 
 #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
- #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
+ #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
  #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
  #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
 
+#define USB2PHY_USB_PHY_M31_XCFGI_9	0xDC
+#define HSTX_CURRENT_17_1MA_385MV	BIT(1)
+
 #define USB2PHY_USB_PHY_M31_XCFGI_5	0xcc
- #define ODT_VALUE_45_02_OHM		BIT(2)
  #define HSTX_PRE_EMPHASIS_LEVEL_0_55MA	BIT(0)
 
 #define USB2PHY_USB_PHY_M31_XCFGI_11	0xe4
@@ -164,7 +166,7 @@ static struct m31_phy_regs m31_ipq5332_regs[] = {
 	},
 	{
 		USB2PHY_USB_PHY_M31_XCFGI_4,
-		HSTX_SLEW_RATE_565PS | PLL_CHARGING_PUMP_CURRENT_35UA | ODT_VALUE_38_02_OHM,
+		HSTX_SLEW_RATE_400PS | PLL_CHARGING_PUMP_CURRENT_35UA | ODT_VALUE_38_02_OHM,
 		0
 	},
 	{
@@ -174,9 +176,13 @@ static struct m31_phy_regs m31_ipq5332_regs[] = {
 	},
 	{
 		USB2PHY_USB_PHY_M31_XCFGI_5,
-		ODT_VALUE_45_02_OHM | HSTX_PRE_EMPHASIS_LEVEL_0_55MA,
+		HSTX_PRE_EMPHASIS_LEVEL_0_55MA,
 		4
 	},
+	{
+		USB2PHY_USB_PHY_M31_XCFGI_9,
+		HSTX_CURRENT_17_1MA_385MV,
+	},
 	{
 		USB_PHY_UTMI_CTRL5,
 		0x0,

---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250625-ipq5332_hsphy_complaince-c45be2e7224a

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

