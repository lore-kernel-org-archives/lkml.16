Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE3262FD9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611423; cv=none; b=kBf3O4WgLHZoWlV6MON1CzkljuUsmgQdhNFOVq15luZRPmmPNWkKuABGVQ7rvRS+/3UCkayC4tx4kch4Az9ii7cbNFhivvqdapa5Ku/nTopuQZwgEVK9PHNvy7rpWYDaAXqL6YXDqLu/yIVhdRxqjdHrCMAWZNeB5cfAYoSuUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611423; c=relaxed/simple;
	bh=Y7okKbQ+abWkqsZR3FSBPtlNKOlDb1SKPlwBBSOrJ0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NulKnQDV44traRl3be2OYpSK9T/VrN+YJTGdHSdKw/l4ItCb4xROJvCDCAIL9HHiSL4r5y9fLsNu4/LuRXzFrVV95M1iKCBpofRj/tRAuVDzc68txTX163ufQYSL7m5IxNDUPZqOtdhmRmHDn/L1O3EA8Xexyz6ZVcILBYgtEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9hi0tk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9hi0tk2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645k746024702
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 06:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XY4mycc9eGNoFjLkdL3V/aOO4QflX+QnXB06ZfuD9dg=; b=Z9hi0tk2usSXxtBv
	a/zkTBJQruU+zy2J1O6AaO9ZBWZgtSu+WuKV2lGhvFOO2J7vKkXeICUgDz8jL35y
	MINDQQ1zRIbtihWITwQU4x8TQH3zj9jVA5yWeVVwJHJ3keTGpC30Mhge1l5/B+l4
	NC5Il/tTedcpzgUcZAKyVGK+T2T8Lz35P7mv5XDVSK/tMpUwAMvkjdZ1Uq5g0vld
	MpUM3KyeSdVPhjEpEy7OzUKoSDE3u0gRmtF8OHB07uQadQHgtRoTaSRlfKwjprQo
	r0O5kOdf9YvmkG7IUQU2sToC1Jc3K2e7h65cgOIC5GD733flFSYBOk9WpcwtllzP
	V++iMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9tt5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:43:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313f8835f29so1317853a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611419; x=1752216219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XY4mycc9eGNoFjLkdL3V/aOO4QflX+QnXB06ZfuD9dg=;
        b=gOyJm7Oxp2jZzRyeFXVNd3cxQg4cZ95TTwwntn7ocDInN06JSxHig51qDKXQpyv2+3
         zOv39St1IEZEfxp4Y+554jsPUk3W4a2VYyV3QnlepW4UgeQm/4B1/3MOaw0YPmQ0Q3Um
         3kwSPODw1KHvWNxZKNdhSEw4ru81IYZi6krwQA4wQbh76rNFBTkP6SxnzhuViJiui+Vc
         hvv0Rw8jTozbrtTS2nr+0DhE1o+z3Zi23136uiteEMPZURDRw9aTjKuWCVRkn2cXs/7d
         5z5FnwzYWrojsDzqHjujqWJ7sghXM+dTkbXY/tQoVVL8t7UW9qsyrkoJs0WSRX4dzIFL
         lUQA==
X-Forwarded-Encrypted: i=1; AJvYcCVehdFu3NhZ8zO3bwOnrEYQ4o09D30a/jxvsk+udZoFYwe3AYjo5ZaAGOujZk+yLrS8/GNHaIPwfTBOK6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzF2f3lW60DXEkrFXecDSBQNv55U6Rj+bThT6j1nDRE3vSPwEs
	v45cau50MKlHG/p+RqP27b5QfwPG9RNv7QJvttquJt7DP+NVwVRzTfllPGdt7ZWbt1Taff5Zjc+
	cwseS/XO6V7I+3dfGwUnP3VgPGPuq4So3RIq7nEpDv2vcvKXk6FKpqEAYABR4Ek2ODPE=
X-Gm-Gg: ASbGnctq4hpgfAVTPTbstTJ2vYTwN2rpimhWaTQkjlc9LZEszcxPeHq1Fx7RgqlyQ4o
	l9/qBlqrEnTcBLiJFZJtX7iXayUXd8cD7JxUGnVD19f6YHjE4w6Fw3GRg4dvc9cqU1Y2Hh2Jc5k
	FICuJhzSrPtF+UleXCpW+53B4E4c3dfwiYKhQ+t8mXGoBNntj1xYSyoh0IFN0FDqbz97AgrnqiF
	a28Q2gAd6JLUHRvYUFyFJTmzkQ20kEz8e3cVVl5i3C2UJl84h0yb62BYAFiZY9ha0w1ZxwjbK0y
	5sKR8NwnWYYx0IE8Bn5RfAEeZ7ZbR9GFELcE9RsoHRpYF1BEE/6zd4NmfD6fgWN/dsx22xocdT4
	Oyz2Z3EZ5Gw==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr2535361a91.10.1751611419081;
        Thu, 03 Jul 2025 23:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPVGGwwAqSgxWpv+FpYeN5/LOE4UCVIYAMsBEHzg/oj6y2VXO0m2Zdc5WReer63LHGOEjuhA==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr2535319a91.10.1751611418516;
        Thu, 03 Jul 2025 23:43:38 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e24asm1260338a91.5.2025.07.03.23.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:43:38 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 14:43:21 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-615-v3-2-6c384e0470f2@oss.qualcomm.com>
References: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
In-Reply-To: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611410; l=4826;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=Y7okKbQ+abWkqsZR3FSBPtlNKOlDb1SKPlwBBSOrJ0Y=;
 b=7RXT+Bc91c+xUDmJiV/YiILIGEgvh3KUheky5OeXLU/rnK6J9hUdLnb5VC9QN7fm0afmub8we
 SP1Wi1jLIjMBmdhZ506O64lkHIaBwkE8iQvw+mrIso4Bejy09oJsRNX
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6867781c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cKvnr5XBRiLjHSnd2BMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: K44YcRYQMl2iWfHN_Duu8yyIdXAq3ix7
X-Proofpoint-GUID: K44YcRYQMl2iWfHN_Duu8yyIdXAq3ix7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX77O6TxYYdz+j
 JtHSrksUoqBqFy4/Y0icNpjuvGj/BtqY5+bLIXykQ2O7/fCl3JIPTcUPF8zWdwAIe0V8qgRr6pt
 xr2uS0V8uAIp5V205RTw1n6K6P2OAoGgh3yRcmxIe1X+NzSmqhWnd78ESUfYJFCMIV8Kxg21Kpd
 QwMNgBUkPUkZkArEqzijjV3bUb2ZHLhL5inuAXP9BHli+kBQRL1jvBmnPQnfQQfjXr/H6a5lH0B
 T1kB7QTJMIK02PtQHG6ibDvS5ZGEN93bzJrvV3z4ItlaC/lhrVDMWBKCkaqVGSlWvyG2VlShK/2
 s7eC1O1wIHr5/4W1BRDFhBNuaIHxD7VCqNRBPWOuOV+Qu2o1hR/+CPI02/H1KbsBy17pWcjvClR
 2Z+Ti91//yFcFL5HJ9wBc0s3MGds7BfrE9zCsFnV3510bXoG+eX+O9fvmg24U+13a7YjgXsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040051

Add a node for the PMU module of the WCN6855 present on the qcs615 ride
board. Assign its LDO power outputs to the existing WiFi/BT module.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 011f8ae077c256f079ce1b07720374a9bf721488..e21524a8ceffca0c68951d04fa6895cac5bb3d0e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2;
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -209,6 +210,85 @@ vreg_l17a: ldo17 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
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
 
 &gcc {
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

