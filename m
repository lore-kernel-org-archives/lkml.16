Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A121DE2AD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856685; cv=none; b=TAhu+/uOjsgQOdz6TSZUar8vyOBxxSB/uLtSqWMPyPG4H43Q2OSLFb80yB7gf96plvnTiWp2qQae5zsA7Po8pEEFbvicWrE5s7qCJEmm217HEBaRiJH2AkgnDyb1JuvuSJhVHF9TAM0t0X8p5064RdaBZs4QBt162ORzkH7GlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856685; c=relaxed/simple;
	bh=kyVxBAUewXc6aAhvBo+dY1wVPRkYXZ2ac+u1Lkih2IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czW30KVXSrD9Kvi0s5uaswsJgOEbxVAn4G78Ezy3FI6R3YEdV5bjxQi/94oO6zyc5excMCjPYfHLm05BKKhSyAFGU4wlrj0QaFemw6rF9T5aei9ggPdMBSORotbKgXxjThK21o+fYEyqq7GFEfC7eVp/sonFOELWL0o3650bd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDdsYny2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDdsYny2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5670LZWU019352
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 02:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dXIFfCrLj7q00eAjZeiFB/w8E21rcCty7AVkVZwJII=; b=TDdsYny2zRq/gprw
	lWod1X09QQtgNrBZnzImXv9OIYPWHLI9k9TDM8Lr2Jf5BbEV/J8SVkdbk29mGILG
	cifuEyfPBpXdFmK2WinVB95HSLHjdPXaeBbKCnXPS/yoe7sP0Q8piw0m6gwEveMH
	Av2+028qchtRN95IIB7ams9Bvza13P9ANcpAxxHcwaCNBx+U9VBT5w8xVpZABckl
	jJQeN+yVAbKZ8vzvp1NyrrgTcs/d/YAzjz1AiVoIXPx1vokjhiE829mjO2lle4tk
	nwo2qxeAWH+XOQF01kxrbvr77S8szeFAHoE5rrcf1PmukNCiOKumiokR7Zo1iSd+
	unIuiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqgq7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:51:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2355651d204so22649275ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 19:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751856681; x=1752461481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dXIFfCrLj7q00eAjZeiFB/w8E21rcCty7AVkVZwJII=;
        b=RwQlgtM1HMb18hhai/hPts3OygtqtnjgIC3QORHd1Wn5+2tQDiUh22zTA3A7LEl2P2
         hGJvpQ0zP/7ldBQo5BrP1OSwOQK+xw2UR+anUT29CFbGXcHheVr++sNcxyyXg9bFW/Bu
         aT4joGhl847yuxo0d9mp/p767Hs7w9w1Z9bbe0LZgIbIZpAjDKZaHz8g5rQ4sh34SmPq
         +qceHHw8+e0JU0TEL30eFj1fbvXGCmr1IUcT/tf9yArqxLdyvswQkqqstAJnOvmayriR
         Z5QozZua08C6uUQrVckry3VKln4kXM3bCIw597lvfWWwdXTnyZ0JJy186oyyglYYDLEb
         g12w==
X-Forwarded-Encrypted: i=1; AJvYcCV3lKeM+r38/79f3qItRMTOFjva/Fwiy1Gc73kioge1aoyofT5rqoXumawEPR6V8cedY33AShWavUotA5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLG+j4LZNc1Juc6Ad6uiKDW3laiQOgpMWF9eQL42JMHcCrF1xV
	iI8ratpGY0ygUyNXbnpITo8So1n/42RftufYgXmHyMYTg1YFro5fp8wvldm/Wn/ECufpbRe+PUT
	nTkMwqJ4gZ8FdKyxNb/bz8zXlRCguAnaHHFxWj4SibokaaE2x8Bj6FNm9keqkOStt5p4=
X-Gm-Gg: ASbGncuBpyb4AKjyz0zOO6xBtxHMPrlFoIv+NAGKcWm8UavxBlyYpJON4/iz3t8sdYE
	qF8woFKbWs2t79HNWNQxKS/bZ8iGyvk2rtQVf/tCwDFgAmr1oJMdlEEkIPMtHSDmySkFZM/eMEQ
	xjgjCz5g+P3b1YeDPqMEAd2BjDyQbUCsqvPkea88QmkoqMJ/hg95zKu9EQFcoGAWaIJFxLBBndN
	T7TtJ/lWZ2OpX18sdocOBbL/sD9iaGMB8sXEr5AKXHhl5ztDC4RENi49gRq2GU8GY9czT7ZzQSa
	c7xn1d5Tnjxp4dAOHYM41kIZnD+a1gHV/QUBY10qkhWiLTPvEo+ol+F6NmLxeJ8G8PSQZ3GJrFF
	8HvIXqZhh1Q==
X-Received: by 2002:a17:902:d492:b0:234:9656:7db9 with SMTP id d9443c01a7336-23c9100702dmr89591305ad.32.1751856681115;
        Sun, 06 Jul 2025 19:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjIAi6GzwsdPcvNnpCYlw+yB94nLVnLs8+cJ+kMD4LyNyufFX3LbgRsM2Ooq84uemtfo/0fA==
X-Received: by 2002:a17:902:d492:b0:234:9656:7db9 with SMTP id d9443c01a7336-23c9100702dmr89591085ad.32.1751856680672;
        Sun, 06 Jul 2025 19:51:20 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84593e0asm72478025ad.193.2025.07.06.19.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 19:51:20 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 10:51:06 +0800
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-615-v4-2-1a2f74d167d7@oss.qualcomm.com>
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
In-Reply-To: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751856673; l=4817;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=kyVxBAUewXc6aAhvBo+dY1wVPRkYXZ2ac+u1Lkih2IE=;
 b=cxvJOTqKtY6e9u9Enmjfkp6kZ5H1Kx7/Ak+l/12wfHLfS/w4nZHFH0dz49IKggc4ziIWSuOQl
 A+pKo8RfyqpBSPdzM1x9MJN0IWNDFJ8EvlU1U19Y1JnOj7o+3cGZHrN
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686b362a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cKvnr5XBRiLjHSnd2BMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JnCPdmPsx_2MMVxSIMLvA5SUG30e8cYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxNiBTYWx0ZWRfX+AW+zJKh6mVC
 RWlC0S4Oe7LR1taI6VYvidFQ/O4vkalFDY0e9f+jyakWzsMSRJ/eIlbDAGXLcAuU988zrOa9R1A
 tIafiaMEK0Ivl1QVs5l9dcbM7KdJm27AnT0RU4OGwwjcnv8tzkmp7L/qP6h4sYsyMbAudPEq2Kr
 TJjekGwKHHSnHpFWY+Hi/xYlSAcNQ0/EGubDx9yiNIps8jdPeuC0k+jJZdDI7NIl+vDl0SCxQuI
 hwZd5+9qrrLyusOuvjPw3BLW/JW1uGMSl4rbl6RmZjTND9tb+KHg+fPf1mAe3soI4lY/C5qmxWK
 /oy5yjO2EakP/V9rvfCjFIhGSG0g78KFWkObWK16xMpPcEcG5yE7naeu5MGUK7YbmWLA0Zl71UU
 u3QTqQVo+YTRQqSaERN2TXDH0I/k82A9EY+6wu1Oob/p7XhWd61K21xp83PDN+78jHstGNHZ
X-Proofpoint-GUID: JnCPdmPsx_2MMVxSIMLvA5SUG30e8cYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070016

Add a node for the PMU module of the WCN6855 present on the qcs615 ride
board. Assign its LDO power outputs to the existing WiFi/BT module.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 011f8ae077c256f079ce1b07720374a9bf721488..2df8e7e3c1d3b6d6353a6753b8387c7411edd927 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2;
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -47,6 +48,85 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	vreg_conn_1p8: vreg_conn_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: vreg_conn_pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_s5a>;
+		vddpmu-supply = <&vreg_conn_1p8>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		vddrfa0p95-supply = <&vreg_s5a>;
+		vddrfa1p3-supply = <&vreg_s6a>;
+		vddrfa1p9-supply = <&vreg_l15a>;
+		vddpcie1p3-supply = <&vreg_s6a>;
+		vddpcie1p9-supply = <&vreg_l15a>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -234,6 +314,25 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pcie_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,calibration-variant = "QC_QCS615_Ride";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pm8150_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio10";
@@ -257,6 +356,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs615/adsp.mbn";
 
@@ -274,6 +377,13 @@ &rpmhcc {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";
@@ -296,6 +406,13 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio98";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
 };
 
 &sdhc_1 {
@@ -336,6 +453,24 @@ &uart0 {
 	status = "okay";
 };
 
+&uart7 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;

-- 
2.34.1

