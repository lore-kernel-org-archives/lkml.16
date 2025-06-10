Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45128C5B8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547099; cv=none; b=h/mHSUeNJtWb79HXM6R9aCM0/6KY7B1EJTXYr3fHqEDdbsQheJQcZ4X9AfkPqtuqrXJp3y0LLEECWTOd5XijBipjAXPJFRjJWHHXdRqu7Ej1ViPU9vwUdVjI69pikFWPdl9T9eW6StYLmlinAiss7KtftupXaTAk9u214AcGqmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547099; c=relaxed/simple;
	bh=tH3QCqQ5wvaEdWI6wS1XKcUQ5WTs4pu/tOm8/RdQwGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omQjEKA+JfsJhP+Xw8E9hzigAAav+k5WnqAOcptB0kchcYN/Sw85bZUfjM/5ArWe0pv0CGr7KLwnwEUcwrrfHDgPrMkkY/fFnntTzdDtGxXfQnM01AFM8jR5+R5G81i6ftFE5W/Mqa+JJdi7l8ycZwfanZXpEarqOtw8LUVauCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7VHjR54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7VHjR54"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8XLS7012900
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l7rgTxoln5S
	nezMYY0ZuZT8QaCnNOs5V2BsaLSK4/0M=; b=D7VHjR54OWUKhIPx3D+IgNnJbC7
	GTt5HdM2qxHP7eQRofRZqEqWXPSvL890KOnd+BDlnMnA6nk+PKVMnaUz2AxmzXit
	/1liM9Zu+VkHPIuZAKZrpnwtX1TSLjF/Z1T9v/nhJyDiP/WdAyKXEy1onyHVzMN4
	pWVh0gk3vjFQnj/oo1SWpXFWSpH911msVMbTv/wRdddKhfDc4DpcV7IVbO8UnmdU
	rGRYnx9DrDFsjzYugNlZxrTqkU6Mwtxao7obGaDvUeS92HTB+tACwIUoOaZV6eVl
	AGDqOAbAfHmqBTOIos6rDP4uQTy1DLyJqoqhiV3q7IF1EmlItlBo63mML/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9rvx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2358de17665so50129905ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547096; x=1750151896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7rgTxoln5SnezMYY0ZuZT8QaCnNOs5V2BsaLSK4/0M=;
        b=weM9fUmQY0LfR/EBq8XU/yKR6fRwc2iALtEVUH8xEKMiAzc0BJ7msRPuryjnvXG1m0
         TwZcW+Wm5rpJhlhAY96iOAk5FnemCFUnd60LCApwiCpRFLPA8qTpt6EJo6DYxZmxXEc4
         GBCaMgm1YPGCQcxejAtIFGG1cqK3vttNww52IZVUBMYxKlmzP69PbFwCvw5kKxyvGEaz
         FoDqd4niP1UggxM4MbjUSoBe5lO2ExlxmVJ71Tdwy8Cgxa+Zc2Ut22nuRQsQmZzOwquf
         qtV/XmytmbgUW3a+rGjXIRTPqQRj+KIT1EvYcErfh9YvUFH3bS3cGUhvaLuLvlUcl/vV
         w+2g==
X-Gm-Message-State: AOJu0YyHnaUzwq0Qu92eZWQ3i1b/etSdlVV8jK/9O2+KnTe0TByw7aox
	+DTTp4KWACiits7YSG+1vdl+mPP2fRk8wQhNFiREOpoLXLlQhbPQsuX2vFZp1j2eObN+ONY4eQn
	8tfATzQRkpKD/ABuZWlU9k82kNYAx2hkbXblszJreRezEy2kQThLPoRXLUodOVvz+nZY=
X-Gm-Gg: ASbGncuoZPY3nFmgiTucv3JS/zEe3s1DboHkaVlHJrx1rD/YfmIdiqHTee9nBXeTPd5
	BGBMcKrtLM1uK25Lm+Bup70cCQajjjdd0U3YwkCvan9EuWCcvsZmmWEI3MUeIRnm0jkq6QzIfUR
	DZ7p0M9596hb3aGYFM0P720rY4d8GXQ7Py+kJwujMeHQkEcjbKLNiDf3YQ5iNWrIJwQ6vLHtCOf
	RaYF83kZmCuC2q9ej/16vr3dWa9z/so1JiAXlUToEsDfyD4rwOhs7HfPnlipEcqMpt+6mNeDk9T
	cqs0sDYMu5mcVGyK+2aUqKZ4FqW0onxAyYhNxJZsMR4a9S5oxnQtvoVMxskn
X-Received: by 2002:a17:902:d2c6:b0:234:cc7c:d2fc with SMTP id d9443c01a7336-23601d24945mr221214365ad.27.1749547095883;
        Tue, 10 Jun 2025 02:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFcej03vQFIMMKVmpHAGolirDjjZCEDokkK2cjPvkzor+dPuEdvovLRKg+dO8kskZkkPXUDA==
X-Received: by 2002:a17:902:d2c6:b0:234:cc7c:d2fc with SMTP id d9443c01a7336-23601d24945mr221214055ad.27.1749547095471;
        Tue, 10 Jun 2025 02:18:15 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603d14206sm66951195ad.34.2025.06.10.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:18:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8450-qrd: add pmic glink node
Date: Tue, 10 Jun 2025 14:48:04 +0530
Message-Id: <20250610091805.2997546-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SESjKs5XtGA0UeoHXV0B0iBMvsIRHkB6
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6847f859 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GRfoJ1sndLYZKjKjrdkA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SESjKs5XtGA0UeoHXV0B0iBMvsIRHkB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXzjAQsaAVvoDM
 KL+b0r9YNv3gr9S2o8zuAgxH6mmQ5GUC0ISmFSjAJD4OV+Ddfy6m6/1gHjY5PSxVMkQIDknFs0l
 DpwUfBL/FpEZWLJj9MUksW/P6JCku/gBbtGOgFS3Ht1MjxjylWZTO33gEJGj0VDPd8erwP4T9dl
 z7RLMRHWFw2DLsf0r6XgU5r1/PiMD5Sbc/VzKqL5bJOBDjkQQ7ag9KayF3xLo4pm3W9TXgNLhVt
 dyTFy0ic5RczU9qeRXuKvPj1yYssXqkdfAKbiQitNpOZvOqnUlgIo2epRYABGWiG5Mm7hFQsTAK
 NBLMQud/2W7CTjMP06k2lj6XGiIjVtkpgIbnltxhWgUKs/37ZKGBiQx9QoCIkHljKidUDjvDwPy
 lM9IGwlM54IDA/aaiRHIz8s78AxgPdy2wGQ5cQR5q+W/gjrz/XaLO0pR0VrwrzDDAR19QMF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100070

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 54 ++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 8c39fbcaad80..0580408485eb 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -37,6 +37,49 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	pmic-glink {
+		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -462,7 +505,12 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
 &usb_1_hsphy {
@@ -487,3 +535,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p91>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
-- 
2.34.1

