Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256DE2E06F8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160322; cv=none; b=oLoFq42FFq2x22PAiUVUg+ZyzgzesiV+JvI/+XD/PInstJrE86tAeESsuxOK4p/uF06Zkd5vUPmQFFcyMLH3WjoJzr4sI+FeZDrATL6SuEORjrY90vUmBn3JR2Sw0ZyA0qFDjKvHdLoDClQM4fd/ZJqaPhz34ZpSl7GWZzAgLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160322; c=relaxed/simple;
	bh=E1iCTcsS77v3G62P/uVyBrWR5kONQvXzXySre5an/lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4EPVL6FE0CQvCutgHjqOrlqxEA/86SzlERx1ZBghUN5LAi8DNCcMcV0oTK+Ic76NQGGLnih5gBbvbe1vkrOsT6tPvvSTFzj9BQqlhS+vp/SbDuALYrNjYr5wwnuDGRxf2oVPOLV+bgLQzWcYRirilS+o4cBydNKGMkGt8R27T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pv2HGJLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pv2HGJLb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7KQAp016711
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMz4Fnkw42dvFNGDnmgQxE1WfqY819g/Fp920zyfuTA=; b=Pv2HGJLb0ujpvUug
	aBY5StzqZyNFOhoEhNVyf6QJBjObmvdgiAfGiLGApPJCdDV5WOdIEjtbEi6dxiys
	bcHP0FR2RgmcsUlC1z/yd2kQojrKoJBR3xU/BaWuuBqaALFvo9m+j6nLindT2WA0
	/d+ZFvOA67G3r1dUw+ffR7DPQXV0GDyoQbSVA80rHPTba3T2w2t0qrZiMyZFxK7i
	tZyxHOZkvFwuoswI2mw9nIEHUnHWsIhBEwVyVK1lsgkdNkFDtF2HK0AIOkdtKq/Z
	2pNfFUFolikPcl/KHE7YJKGuQDcRkpJYa8sGfHMEFj1VA94rez1V9pXOwOO8ZAYj
	vBHnMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crr045-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:38:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so5517857a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160318; x=1750765118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMz4Fnkw42dvFNGDnmgQxE1WfqY819g/Fp920zyfuTA=;
        b=nalAXqMjiYHrHQBFFknvU9NssvCC83QYUciIpL+gG8sQIYlZMzZ/mWLnMHcy1reYwY
         uPkZz7d7Hn9NPu1IEz5P3GJJ+Snnm5k8/aYtufxvJEABmWxwMcGYe9GhdQQY4R3h86hT
         S5vuhf5jr9+/Z91moVTI1+sHpRom2zpTVAxjF1by97zkgPZ16F96peOv9tgtE2tS3yZ8
         uv+efVUtbITPXdJFOp1R1e/H3AAb3Xri0RjKyx4ZGK4fBH9wwEFRx5liSSyJCJQ7/re7
         Gww8qS2xr++2zZKm5knpWglLUQmZZJsbj+QwgmTPHLV37PcqBmD2gCdmrjxVDMTQmkZO
         718Q==
X-Gm-Message-State: AOJu0YxnacTWDUqWnn1GRqc2+vwq2+dnNB9DSRMDft9pIjHlxPMXYfKP
	UccotqOosPGeGrREs0hDzG/f1Knqck/bVLSLbQJ+G4qOdckUD3bK2+6CnSsorzkuJXLOnmrRofE
	7OoblPdvefDpeytTRSP4IJyIbYGnp6VrpL7UTHPdOrvI2zDtfNoZ2hDWP0x5xK3OR3DM=
X-Gm-Gg: ASbGncsYFo3ePTrSjneOtRnAUgbh7V+mt0UeJfLMUTQ+lizqDcjKgT21yF5Spiu/KRM
	LLTS0lEdiu4LK1BsmDerBBMR8L1bYXe6FFbQPpy1TNUX5fI9RJLxdHIilNnHsI9PIfAoijqwSx8
	M7EeQdopwMwZwp4myjX9Ozc5PmGqJlaxFqsgPBdz2qsedGaHgQdGzpK5udvHsatMR4sI+hbWngi
	fgt5pOw9B6qNE5SQZbOpI1HQCn7KL1Z9Lj/hvD0IfLO3Nd/Bh9n4RkXohRQXFgaJNtKgXhhCHEL
	3jB/DMqi2woZRrJ2g5qEjnv9g7I4kz9ly/HHF9kVxCfiFXM=
X-Received: by 2002:a17:90b:5241:b0:313:2754:5910 with SMTP id 98e67ed59e1d1-313f1cfa246mr21138944a91.15.1750160318209;
        Tue, 17 Jun 2025 04:38:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZvtNTDKTZTtHD5HPpQivCD86gJ7dk0yjfKZ6IrQ6RrlfuiDM/2UhTEwkTqMMtGqXo4L6SMg==
X-Received: by 2002:a17:90b:5241:b0:313:2754:5910 with SMTP id 98e67ed59e1d1-313f1cfa246mr21138909a91.15.1750160317775;
        Tue, 17 Jun 2025 04:38:37 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1919sm78246895ad.66.2025.06.17.04.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:38:37 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Tue, 17 Jun 2025 17:08:20 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-update_phy-v5-2-2df83ed6a373@quicinc.com>
References: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
In-Reply-To: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750160301; l=1245;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=LUKDegSuWnJr6hX0g+GfZVrGfuVOoWm4/cMbstjOQQ4=;
 b=D8AYtjEvErNGeC4xuDdT2pk3k6RbH1ce/6zGxI5y4AN2K27UNlF8f2EN+DErCWTaZe1HN8ays
 t+bojCYqqOUD8V1A53RcPVMw3LK4oKE7gy4wJuk5jG1ULyRbK/LeBLM
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: NOYlpS3GW8TWw7Oz0ZjLVi6fTqwMc_jm
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=685153bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=A2jF9ndpTPISZJbatkMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NOYlpS3GW8TWw7Oz0ZjLVi6fTqwMc_jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5MiBTYWx0ZWRfX6ZdxyK3dYPu9
 abUNT5Zkh7aqoDtJJqcCsKUB7/dQfRsKF4ooyJdnU/CJxeKfIvAIHD8y8hxKtMEvucc+A7COm6R
 P9BLBjKJl2itxu60gSWsIg45ogGkNlQPI4/sN53pTjs11kcI7Y8iSvFf3XQ1rISTgIrEoOdazep
 S4tWR2rxEhAi8/uN0roq2XuDQDopHv5R7pcfqlNNoaOZms4B5IOoVIPb0HcqfDypFPQXim8SDUz
 GU4CTbCyrIYhYpUhLyYNdh5qgb9Tq/zTN9xirZqHTP0UY6FO22098bg9mKeLOCHI6ylRl2KR5OY
 l1H5F2NJNa1iCz+fmGGaSewbOMFOBSWBJp7+N7pG30MvbtzanPyut1xNS5vRJFiqH0JHBwz8IF0
 8InVU6TIxNkryQA1iUwFnMlmBYUz/VustUVsdzKsHzTb2B4dIeFRzm89qRH3Bc/sj6g836rg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=921 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170092

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

The maximum link speed was previously restricted to Gen3 due to the
absence of Gen4 equalization support in the driver.

As Gen4 equalization is already supported by the PCIe controller
driver, remove the max-link-speed property.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5bd0c03476b143444543c68cd1c1d475c3302555..b001e9a30e863d8964219c8bd61bc328be71b256 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6462,7 +6462,6 @@ pcie0_ep: pcie-ep@1c00000 {
 		power-domains = <&gcc PCIE_0_GDSC>;
 		phys = <&pcie0_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <2>;
 		linux,pci-domain = <0>;
 
@@ -6620,7 +6619,6 @@ pcie1_ep: pcie-ep@1c10000 {
 		power-domains = <&gcc PCIE_1_GDSC>;
 		phys = <&pcie1_phy>;
 		phy-names = "pciephy";
-		max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
 		num-lanes = <4>;
 		linux,pci-domain = <1>;
 

-- 
2.25.1

