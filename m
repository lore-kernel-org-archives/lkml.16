Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800A2151991
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422644; cv=none; b=epdRMtc2Bz8DKV89z2LHwHJvioU6Jt1MHnm2ArIhm4ngz1lhwFG6rinOxTX2XwPem4rZ9AeVEpQzg4xQjhAGODvJe6hkF4ixiFM9Tqk3gTzWSQ5LNMYQPGnrroUfabGzdVihL1AjPiPA4uXii4LQoBgokmdHpnMsJxJ6nokHiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422644; c=relaxed/simple;
	bh=9kMSFKbFRxEvKzh8AXsGO6wmCWHX5TFBYA9ElNAdiG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnufUztXhEUBmIVH3AwR0eM43Lb4zHoCOAcLTImTfd4O7In4WMeNuCi/ges2lxLL22LaIMATngIRiObj7KWbwNmfmU2atS7IL+bjeJwmwKpx5Yk2NA31uyWSbLC5/lMC6UPeP9payRGMH/iPjX0TRTF9eCiZ+z0U0PCCOYKQJK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHa3os91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHa3os91"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFiSrm019629
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZwWxumEFLCA8T+o8PihWBVEQCN4OnKd//gj5GDwfzU=; b=cHa3os91N8Rk5Wuw
	FAIIu89cCQHQyy5QyYNF9WafIsu2QD7uGar9tKGRSO/GVbkD7StBXzgrQRQkcv4P
	Fv93mtE/91wU3MZSn1xWZOYS1MIRD+urrFyDV1ccvwi3gZJMHuvkFyDJb3ecs+ef
	etGdk0MVXjefTzqrljjv34Z19Iy/35vfIT3esde9TOpjwKCmI7wczNwdynlbN3Ip
	i2eCnT23vEgndUvACNc1pyX4fAdUMIBR5vprKFwcrJK2O+CS+cZFBb+O3vmbjGqu
	X5Ud4dncL0wjbvRb/ToUNGHEEAkuO285iuYa4dahgp+5bTV+ESTDCCNt1lfkToTP
	Pgj0OA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrv6r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:50:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73917303082so1690181b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422624; x=1745027424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZwWxumEFLCA8T+o8PihWBVEQCN4OnKd//gj5GDwfzU=;
        b=I1nh5FxDkFzhG9bDbFTrsIcrloU13V1mtOMaTd9RXhmh5nRwJlBx0G5j3S5iMER38r
         w4FNkJlB/Vb7TK47sM8VghaydLtUdtJ+Zs7l9JBf8IoE4Ilsn8OEbxUu+ztpoWovEjss
         nWaLyOd+RAoq3J350sNOecb6iqZgw+liwYPdyGA+jRvSNNUmKOLW5eGya9C5VVKzPZ7h
         75I906nDYs6s3J2JrK+e8ccjkJNrrTlaGXiKm/cnWbdWMCf7uWxEh2mH8rNFtUynEK0G
         dzTopUVR0ShhFqtLnnNOgJY1fRHrZHKYKFHJ4LNct8oxBt8LjehUZCItsjkklqHt97Li
         Bcgg==
X-Forwarded-Encrypted: i=1; AJvYcCUTaweoS5htDTlzv9UFsBGQPJBVl3iUAOedO0IZ3A/0yeDfY4Hki7Z7EIQf+HVP64fPtbEd2N+d6YlnG7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7I6TcuA8vV7cve2zn2WbSTSrGJSnJG2HCLJxV3cXxp56L61j
	a7VC2haTvZfEH3NcgsnUxeJimMhTsVDsFPJVyvUxKsWbDNfqbLqhLuYB6OhffMysoUtMLcTE+mk
	zjCGc4HrBOhgm2TWCLHtpcitQ7ZDa1BPjbCCgiU0Je2h0y38RAcC8w8DkCyLen3M=
X-Gm-Gg: ASbGnctKAfVuNOvCGiWGWNGnS3/bzW101THP+dACJNubqnJBXR9jvQb299/a7zg3ieI
	pI1cCXW0v6PJrLNfm3ZuVEXHRZlkLKPrboy3Q+fHQ+xGZNoEVRG7N8ZErA7zMkrhPMEbHTxCqOT
	Vn/pwDKNInBOvd5VyU5Twj5EI70x8U1B0jpWVhBvNsVgB1ufRFDVXdHbHHgyj3SIFC7D1CWkdgk
	t0sADn1d2yevcq4MnlbN7rAkX9ixh5UujI9QjF4H4z+ErOmiWjlL6saKiSJz3Hw7EHeel+iHjTw
	nn9wRR37SUiGTiLKeTQ5jpVuj2QRyggU+SJOJuhHNegaaVU=
X-Received: by 2002:a05:6a21:6d84:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-20179990742mr6432417637.35.1744422623930;
        Fri, 11 Apr 2025 18:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbC2VhoclRBCtDQ7HvSO6L/6KoDbPdsK+5pM3/wC5jdchgIt64DeDRkHKvzO2LblDkt9JHAQ==
X-Received: by 2002:a05:6a21:6d84:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-20179990742mr6432379637.35.1744422623413;
        Fri, 11 Apr 2025 18:50:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:51 +0530
Subject: [PATCH v5 2/9] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe
 switch node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-2-5b6a06132fec@oss.qualcomm.com>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
In-Reply-To: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=4839;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9kMSFKbFRxEvKzh8AXsGO6wmCWHX5TFBYA9ElNAdiG8=;
 b=EhY058xtDHhgReJkZ31Cl9RQA0cKoywbyv51UnWzbSyJAgAP8lW18bK1W3fhyEpkBIJR4X49r
 bhvQGhLPOOsC+m+OnWVD4BKV/2sY7/fNpw86i5bTE8m7e6ueApu+fF+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Fc_wA6sHPm209pGXOscZFdpc1VPUWY4e
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f9c6f1 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=UN7QK-OhvXrGNVVRcS8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Fc_wA6sHPm209pGXOscZFdpc1VPUWY4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120012

Add a node for the TC9563 PCIe switch, which has three downstream ports.
Two embedded Ethernet devices are present on one of the downstream ports.
As all these ports are present in the node represent the downstream
ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, controlled by
two GPIOs, which are added as fixed regulators. Configure the TC9563
through I2C.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 129 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..17d29b922ee95b87e6e048e1db19d8023b657557 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -218,6 +218,31 @@ vph_pwr: vph-pwr-regulator {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
+
+	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_0P9";
+		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <899400>;
+		regulator-max-microvolt = <899400>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_0p9_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <4300>;
+	};
+
+	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_1P8";
+		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_1p8_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <10000>;
+	};
+
 };
 
 &apps_rsc {
@@ -735,6 +760,78 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c0 0x77>;
+
+		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_rsex_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
@@ -839,6 +936,38 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&pm8350c_gpios {
+	ntn_0p9_en: ntn-0p9-en-state {
+		pins = "gpio2";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	ntn_1p8_en: ntn-1p8-en-state {
+		pins = "gpio3";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	tc9563_rsex_n: tc9563-resx-state {
+		pins = "gpio1";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..4265fbf6c97e8a0be56d26ffe077cdafc80e18bb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2284,7 +2284,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

