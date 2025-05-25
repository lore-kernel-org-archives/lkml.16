Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0341519B4
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748152648; cv=none; b=Q3mXH9qL4oG7WwtC2HYZffW8jT1HYsniGwKtaRJ2xJmu+cnlw3/L9/7h4iFZlnhfusczNGfn4S7L5C02ud8Xw0ZqNA7FcqyMdDXstSNd1uyd+srH1YjG4z1eWxynR/P6WTo8YK2irivIYiGsoqETeG8kkpMxKYj063FqFuyjQjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748152648; c=relaxed/simple;
	bh=M4yYzWy8gleVqtRXThXiboA/Q16IGeGQsaMz5AQCano=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TfqsEuemEH9f0Vj0bMSAj6ss6jI/9ubiMghExpkTuz2vgmH/YU/t3hqC2Hk0jahMIv8HtIKd1tc3X/mTFt3qNFaAKLF9EZ6WiJKEJUPKDyTEWuniPe4oUW6IKu7HDsBdfEgD6lr3xHn/abJZckMY8eRMK+UPUDzFYgiVwM6RuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=km1phmYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="km1phmYV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OLtZSx015505
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=llgi6kgFU2C/nK6AV/CCxl
	Fj3993bGoSBbWghxO+Y5k=; b=km1phmYVT70YeEwezZ8ZBkM/2ZJq6lwBA4Df8j
	fEAl0IQ911eCas95zuzq9ThAILcftaFQpGxmSkalB4ueFXe1z/k+tvCS+6MeJa47
	GdyMvlLA/OWZCcd1EU1Ovks73IU6ieQuIV8B2HLKDp4gHL30+wzuPNNCy9xsEEv6
	N+MDi89YFegm2P0b5QYJA8VcOQhVuXLQnZhSDNzIUxFCxdE7OsyvY5sOwhV+FVS2
	IM39qQG4nMLX9ZhQtztpe+k/RYSFr39SCLoptJ2W4VUPYlkyKzGIV7pTs+bhLkUQ
	vCPnbtNcF7fKtWPvKgDhB0MIsG/iFcKvNnjX05wfUfSChhVA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejsjpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:57:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so885202b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 22:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748152645; x=1748757445;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llgi6kgFU2C/nK6AV/CCxlFj3993bGoSBbWghxO+Y5k=;
        b=poIABjKi/l6pmmiARqImO1/ZrItIaWDtxjfT1T09scTC2pUGWuePxdb97kk10npb2u
         lQGAiPtSEW01WC4YDEpxowAy00fxV8Vrqj15RHgu33JhAAu8sQH2Do2t+RMY14erAcjj
         ULsDPyk899S9XQ39HT6A4XF5AgWO+jQI6GHnI0vAei/QItO8r2L/AgAhbQA3rXiPl0Z8
         vNTSQdXVIz8pgtaUlXoIHWbKGIZlvuL3kCB0Zt5KOYhvujAW75DV7RwkaqoTlvd0qEAo
         5lca6TeKYTR875qogKT2B0hKBnKRA1NZRCYIKJ0UuAmwK1izHuWei5rqKwQt1CaLIxqi
         hHFA==
X-Gm-Message-State: AOJu0YwxB7kiT0iD7v/QLsqm7QhPv7CT6DP3cXE0Rjo3E6SGSwSxzMfv
	2GS9atjuADXYEGuDfEgVt9/bk3Ft5+LLpza9Zq5oZJgEs2OlxkWlAehRku1v+upTZ3Ozx4rlwIh
	xkLxizlHL52LRzvJ96724H65P2wqHDWasS2I+BkZbYT+cpc4CDQBJH/Ae2Er4nbrdazQ=
X-Gm-Gg: ASbGncvi9ZcbBNBm4zgxFv0Hxwzmm1drpD8ULGl0srmoMCq5qfeQvXX5cQOMx9ovFwC
	c2ONRj25cXCqrXtctNpjBF9mY7ljhKkqBa4emk9r/KbTMcf4n1z3omNtIZQoz52rGR9K2FJz69T
	jV7Bln/aA8WVMjSbtlB0lnwF2iXF27fJcqUPf1vs5Sr3QTgpQ4jpzPPonOH5H8LwW0RuHSPBNsU
	CE4quYcCYDf8jUAiedmTvMDn5vCyaOtEySqyGxgtRHdNMN5EjzyePspUXx7sGM5f31E4amJbMSh
	wIZKgou1mtztZXWEdp0FLT+KlpO+fm+qTrag
X-Received: by 2002:a05:6a00:ad1:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-745fdf78750mr7117960b3a.5.1748152644665;
        Sat, 24 May 2025 22:57:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLpSjErEYIbtiJZOXi1g6uxrsq6h4bNZeZUpAlLUHKaxEaEEcB8ZeiBab9LJX1FXEhTl3WkA==
X-Received: by 2002:a05:6a00:ad1:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-745fdf78750mr7117934b3a.5.1748152644258;
        Sat, 24 May 2025 22:57:24 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829a4dsm15594030b3a.107.2025.05.24.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 22:57:23 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: [PATCH v3 0/2] Update PCIe PHY settings for QCS8300 and SA8775P
Date: Sun, 25 May 2025 11:27:16 +0530
Message-Id: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADyxMmgC/03MSwrDIBSF4a2EO65Fr4Y+Rt1HCSWoqXdQTTSRh
 uDeawOFDv8D59sg2Ug2wbXZINpMiYKvIQ8NaNf7p2VkagNybHkrJFtG08/2MbqVoTZnroxBxQX
 UwxjtQO8du3e1HaU5xHW3M37XH6P+mYyMM6MGKS6IQp3UbVpIk9dHHV7QlVI+D3G0h6YAAAA=
X-Change-ID: 20250513-update_phy-2cd804dd2401
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748152639; l=1250;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=M4yYzWy8gleVqtRXThXiboA/Q16IGeGQsaMz5AQCano=;
 b=EDONMZuY/6Dx2rOmU6s3wk8xSJLxpZ87KUnGMeNXgdFtMy8OvoVeIrdnCV/Ge1reaL6sgbNmv
 4bqv3uQfE9ODnrKdrQpkJvcutEAvb+GimzUyKSU2hsmLfP+adlcJP6e
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6832b145 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=vWfPPh_LAE0cc4QMUwIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SFFakk5TLCJo0Wj9TmXYlJgfiVPm7obx
X-Proofpoint-GUID: SFFakk5TLCJo0Wj9TmXYlJgfiVPm7obx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA1MyBTYWx0ZWRfX4Kl2x0oIz9aw
 ElIstkiQoj5+OcWSz4Stof6T/8xiU7CoeiU3CMfAQyGrTriwhxJLYETvRrDgaIHheMASKrBBcKE
 meC9ETGVpdzSe2MBhhG0rXQgeygfVOwutos0BtdnLtbbpheXdtme7VTGmTbDX9X5RBK12dmdpvV
 yVqcR34ybSaBieYEY8RgTO15jjhN4q+3gjpe9AaOMtfE2TPUvt23RYE/PmkNBggr0+hx0rNpJpK
 P0GMkYWFEhdbfUZWljucFivk9qLb22nxN4o4Gi2VoscZLazun1KTLOFOzhP3UiONJwHMy1WMXkK
 Do7CRA4dowjRFK76L/QaKHMI30DEj5N5TqUBjh5lwcSWHYQsQTL1IZbhdPrabhNZ9P44Z4G1mkQ
 IE1XcqasyjrxthGOxFdW4afafdgR8PA3/btmRxmbINsG7dyreL/Eg0eJKk/UYbw7SWG6iJJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=572 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250053

This Series is to update PCIe PHY settings as per latest
hardware programming guide and remove max link speed dt 
property for SA8775P PCIe EP.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
V2 -> V3:
- update subject in patch 1 as per review comment
Link to v2: https://lore.kernel.org/r/20250514-update_phy-v2-0-d4f319221474@quicinc.com

v1 -> v2:
- Update commit message as per the review comments.
- Remove max-link-speed DT property.

---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for QCS8300 & SA8775P
      arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  2 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 66 insertions(+), 43 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-update_phy-2cd804dd2401

Best regards,
-- 
Mrinmay Sarkar <quic_msarkar@quicinc.com>

