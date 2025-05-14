Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C527A926
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222660; cv=none; b=tNsZyDUpmlaeo9G6BsUJrlnaGH+48GJjZ8DMcSR5X4DWKJEQSIdzvac+pkOT2KBpjXR1/ed0TjvVN+VOiq5x5FcoN/HQvKatFhlY6chlBzpA4nWCtE+g7Tr9BtuO0fnwI+rqNEQbTOpXhn5xXywi3cHlyzSMa6gv5FlX7CozxM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222660; c=relaxed/simple;
	bh=9ozY19np9D59zhCMV9nEj2Z3kQvxFnZfxXl6FezHh9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGJu7b/gBM3j9khzbRrLCMojsXNti5ATx09jDp5mqecvsEbyNt/twYrA98+MEObWK7I0MQQkYlawieN0ZBu7uapavqsrGC/ceHI0mxSChfroa+KBWfwOrXBk8XPpFy8FroXJBsTmhm0Y6VH4Ht3HS5UCJmCKLXPROf66toaahIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTgJrQ5k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTgJrQ5k"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAvUm1013657
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCBrRVec53XJAJcr8a7rcd7CgHI9045Hz8PKjdUV4vM=; b=UTgJrQ5kDIgzKLg2
	IMmfmq6Y3nB2ARIKT66Wc64+ZdDRSS1DdA9X/aEfYLnzFo/UJevARklyYRRxGDjg
	qL99bSEY0FBHDSBHxpsZc41SmszxIlmvJaDg6Jr7N6N7pDyNcCSKjrlANyljQu+S
	jduDsXouiP1SILab/iryYqCiUTt99eOnBvQrvrykVZvw+MpkdLUKyD5gKCqOAtiG
	Ba37A7Ek/TKTUI6tZdjug0FGKCtBENQohzxcxDubuw/I4lHF5wk83crRL8xsi/r+
	YCHBFxwYte+LjIw8CK5zGnMcbWJZ/eWsMKW41mB0j2GoWO91PrICb8quZ1ZKPiyz
	GLikZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyjgs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:37:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e815dd332so109778255ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222657; x=1747827457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCBrRVec53XJAJcr8a7rcd7CgHI9045Hz8PKjdUV4vM=;
        b=Ker/bpsNqs3n5xjl9CWZpxskzHThZqyPHTqcTtIhIoRJnM90MU3YN0EKVO5QZ4oaYh
         ogUMlvf5iBmYls5Th9Z0TX5AJaB6H0ASvASSBNa0+SbafTg0WFkTRHFO9RCsDXSmSrLW
         pV3VmWPHz2ljoEwuz7z3AphPjkiGif8H/hP+VmIg8I7rA+n6eVPklolS5ySNq3+5DRsN
         oRWmtYZC/B6ADcM2pf1ToYkmvXDV68k5v5mEJGOQYkPHcigItOpeFfjxf1l21Me0zLvT
         tI2I5yoDXYxfEJuvTFqqssz5Iq/mXj9vCtZTKGbJhtTXkZ8g6BVW9RMSQCZz4l102/LB
         jPuA==
X-Gm-Message-State: AOJu0Yy5P9tALT0Xp4sZemncOhsAj/Z2hoJPYlDvm9JaegvvGmm9Gmn4
	aFQAKJ1mMQ0oVOM9sSSmiPDm0PLXsxWLrUL6is8NRqAeJBBTiRnaX1WtISNCQZQ/9UY5NfhEDIX
	9B09Pya71DyRO/3Ptkjdelz+MQ0MgBJiWCFrSspiRR0GQJQcYgasRHYrEbEjRJAo=
X-Gm-Gg: ASbGncu3xkpGZMVBKC9Ry/tmpJHEKXeFsI9N1YK7eeBTByM5njwSHIAWGJk/2Pc8G3s
	/kvvORF7tPCIhUx/qVVVHhm/sDPJjpoMD1bOfEk2DPuCkpsyCg9wut0nOHPecO5h6EXWUPErtvV
	Zj1P0JKVGQgTjf8vD6OYseG69z+SwCZC451z6tPq7jK8Zaw5lGL6SQCWYA+Um+AQ3YaJRdWbqLF
	s6qTjOW5IYN8aLRTPnJbYy4+BAA4h6j3A9jW31qvY3cjX0VW53cyP0Zp6LHn6EdMMGVTC9fC5NC
	DpQMuqaDlN4YiJZNQLzqmKb4igFzCTSZ9rjz
X-Received: by 2002:a17:903:f83:b0:22c:33b2:e420 with SMTP id d9443c01a7336-231981168b4mr43376285ad.7.1747222657438;
        Wed, 14 May 2025 04:37:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy2ANRp1W7Xo4zQgSDDtOxADd63a7Iad8Pfvn+HNLrKI1GCN73ST9TXZ0ahB44k/Td+ySQ4Q==
X-Received: by 2002:a17:903:f83:b0:22c:33b2:e420 with SMTP id d9443c01a7336-231981168b4mr43375735ad.7.1747222656913;
        Wed, 14 May 2025 04:37:36 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349ec78c3sm8652783a12.31.2025.05.14.04.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:37:36 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Date: Wed, 14 May 2025 17:07:13 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
In-Reply-To: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747222639; l=1254;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=ZrWCEywu0mWwC+jWkykM+m7UXWwtOyeU4GP0qpQ4gdA=;
 b=JrrlDAXLbKSAfIOjsEe36TVtTbiFuAkW9tkOnWiLEx8yebiEDELOZVbKb97CtcLhNlAK+CzAl
 ikKgVQ0DPySBsHujx6ShsWlrzSlE+8TqZDEAq4Z7/c5rV+dNAXOe5ft
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-GUID: hM5hp5RhiQZXM7NnfVDLQCyJ3bYonwKK
X-Proofpoint-ORIG-GUID: hM5hp5RhiQZXM7NnfVDLQCyJ3bYonwKK
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68248082 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=A2jF9ndpTPISZJbatkMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEwMSBTYWx0ZWRfXzpvOsIsFS8FD
 bdQui/8lUo12p89i2jcdwoAL+Z4Fiuel5kzbKCrt6CgjWKKwdt4SPZhkGHOmkW7hbnlLGXkmuLK
 OPyy0qCjlo7Tq2JEx4W94oR/kknhK0lD7Edal/fEyVnDLO5LqhPLRSDWnM4Ulya8lKwF1GlIwzc
 FOl8Ma5zjw4NciBNohWpKEobPpFuU+qgz88kDstRJeXjuJATuuQtNAEslD9UziA4F3IR8NBO4aW
 BAS7YS/uTT+dNITqqxtV8gaxZHU8JhNcpyD7qeB91ukOWKkwzrIPpBpInpag+1JWRSMhvbd+cHS
 FQTK41R15b4URD+vB3w8ifU1tO4Y8+L26MTvdaOAgGQo3So/e4TZqkgxISyEfNez5oUIo+l/dvL
 JbTfAVoz/mgc14d2TSOXYR/jVtca2rXcjCH9XAZl59kCfM4UXC8eSjnPptrVZ3PCkQjPE61G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=943 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140101

From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

The maximum link speed was previously restricted to Gen3 due to the
absence of Gen4 equalization support in the driver.

Add change to remove max link speed property, Since Gen4 equalization
support has already been added into the driver.

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

