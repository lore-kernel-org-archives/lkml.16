Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE71A7046
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172626; cv=none; b=T06sq342skDUOOCo9v7n8PsUMp2cXcdaXq485BlJxir0wKm8H8REp9lNjzreQcQ7T8M6i4HiI03l1P4VVCbKRGXAcXlHCc7S/KkSDH1OmbHReLnz4aD45MylE6Nr4y4p+GFX34KXdFdkM1M9DfmmTXXpsgjckX1Rd+qcFptGMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172626; c=relaxed/simple;
	bh=gMfLPv9UUnIIr3ePCONcx6NmkEgm/zgCqiGlQYseZ88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0GYbysERS8lFnqeO0HiEz629de1Y4U4odUu5eN2eEWQh2uqK7dYMlaehoeTmcP0X0M23kPxeYkwkguaoZhGdcvz1GqtfDmRg4KwuO1dwTT3Lvjag5XG6YqjhvtTC3OT8B9xxku9znytJUCLKfGrPvQZdHa1zt9YhKbD1xzGPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoweThxE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoweThxE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519Lql8b016202
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJmMNfxRFNQoAHOf8dBIWpMupTDw8D14/mVeDwq2G8I=; b=ZoweThxEqPL75PU5
	9NY0JRMd4N5tfowzfko2aY9FnKxIjYpi0DxvI++rCuylxVPgyz+99wyOLgiCwPSK
	cS87l2Gk0Wuq8rt3HE9yJooWLWEsSMjGA51FtLB2BxWFs/12jKNLOjwyLeHeN5Of
	UQDE7pCV5S8owKqnum90hRxWcAFvM+bn4E9a5PZD53GWVO5vJAcpYNJosPivkUPe
	twcZb/n7S31YAFrYt/eJzn3cyZ0uiblcr9qq8ZLsITya2FGBBOLK4E+RP2Ka+2sB
	0xq/o9OAYNnY0VRx0mHhBnwQYyWfJtloDRY0doBhfbzGSWnvPqM/cy6hnkAhINYt
	p6dkHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0fcufqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa228b4151so5841091a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172622; x=1739777422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJmMNfxRFNQoAHOf8dBIWpMupTDw8D14/mVeDwq2G8I=;
        b=ACPi4xvh14BvU9a9q+04JBakVY8lQXq/rnpFQsoG7iSqc4Qupcm+mjK0BrGMinBV3a
         JZ+2RJwN3AHivNJhuAJ7F2Ds+wGmzr0CbfEtAxj3i6Cng0HjAy9Pqeaiu8oCUdQQ8JTD
         /+dZFFsJrqmT1FI8l9nhCVb+AYtOStYtwhwEbHDUwqKNWVARCZhOpPqCcFfyT+1eijq9
         PhOZ2scgOVrMbS722vj7sGXxsYa4ki++HdSfd2L9Cla96BaX574cALXhgVnr+DEjjpGZ
         +HIw72H3qhOBVsHcCs4Mw8saeHGryDtr6aAofXcfykFhAoyqwZpkkLkWXNIfFshWIOm/
         UoEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3BRmfXZ5/XGesZv4acL9lcx78fjE5ElJJlgVWZPkg7uVXdSdI5vDawO91yvJecmoYkj4a0Dl1xlDC0RA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zTVRsaIoaUwDCaecivc0OcYAFnuAboRP4528mLNc49sPcvek
	HXg8QoxQnZpc10EZqJx1KafUBmUprHLluIRwxVR5laEB2lK5ABD2WbKuuN02gqdQFfftyl4oC0f
	vII4p4iBTtMSMm/509epNqaAFpn6gsOscU6NEzjsKnvfnPaANIJfevthysT6ZCdc=
X-Gm-Gg: ASbGncs/LIYjf7tvSuCOpqIVgNKSrG9qM2mvrHU39Om6fxXf7mLdrE43tvpqQvDWhjf
	MfzPW2uB6k9aObjf3UD28+6GfTg3azaR0x8D5MJYkXbT20tViPojhPCI/ydQpki6u9c20wOL8p6
	V0GhE2opy/eGMbPw2KeKjWeEN4+KaAYGc2s+1dsmIcSt4ZFbAAJKQixPqPbQbqm+hQfHKMTpchj
	mPklpRJHd0TpHiR62s8L1EpgPUE8xwJfv5+kvRB+ksUflxfmWopccB1MJbYJEvhd4zzGQ6+PC2k
	4PLwroL19N1tnW3Ad/7uV2w+iPXnIBlTLVqg1nOO
X-Received: by 2002:a17:90a:f94e:b0:2f2:a664:df19 with SMTP id 98e67ed59e1d1-2fa23f436d6mr20237498a91.7.1739172622554;
        Sun, 09 Feb 2025 23:30:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhS63tBINw5qq8xbtvKGNc9R5wmcpR9u/pn2/Pg/C4zsy3eLmGArmBCeuoVXU5ZpUJxHLshA==
X-Received: by 2002:a17:90a:f94e:b0:2f2:a664:df19 with SMTP id 98e67ed59e1d1-2fa23f436d6mr20237461a91.7.1739172622184;
        Sun, 09 Feb 2025 23:30:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a6fe28sm7918507a91.26.2025.02.09.23.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:30:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 13:00:00 +0530
Subject: [PATCH v6 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-preset_v6-v6-1-cbd837d0028d@oss.qualcomm.com>
References: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
In-Reply-To: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739172612; l=1811;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gMfLPv9UUnIIr3ePCONcx6NmkEgm/zgCqiGlQYseZ88=;
 b=5BiNxVQWdPVGWgiP8dsIzGFr3CmnOisZPiF9dT5F+KUJfHqe1FNdshFpEA0uUcg1yT/Vufs6y
 NmQQ9g3z8N/AoEEbBJ7yd+CaIPGFCzuhNXI+KvR4kS2Z9HpiJ6Q3GH5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: scUSv8INrHxFD5gA6XMtVFXBICvBgTIU
X-Proofpoint-ORIG-GUID: scUSv8INrHxFD5gA6XMtVFXBICvBgTIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=957 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100062

Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
rates used in lane equalization procedure.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146
---
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff..1b815d4eed5c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3209,6 +3209,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie3_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>,
+					  /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+
 			operating-points-v2 = <&pcie3_opp_table>;
 
 			status = "disabled";
@@ -3411,6 +3416,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
 			status = "disabled";
 		};
 
@@ -3538,6 +3547,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie5_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 		};
 
@@ -3662,6 +3673,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
 
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {

-- 
2.34.1

