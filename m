Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910C22156F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273423; cv=none; b=mGEZVqyPRHyBgiQjpHwIXwgIgq/i8QsMvBbcQIVH+41Ra4RZaJjP63DR1JdjNhNCMOHevyVpQTH4j6hichGh1AWqf2n/oa/Dl1pF+3BfYasI4LpWWZHswHi1A6I1qd33UAo/+QmWJR+DVTM3xZX5AZpUMbKh4Fpd6hgpetkJJTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273423; c=relaxed/simple;
	bh=she2MK+667uF9NMpAB7wWzjENWSuCdor4U9yjFHG4lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M6p//HO3h0zqqGomI5N3knNF105n7eJUW51sy8Im9YlBeGblUXYC0ZP/g60FZDnAgvq+Qyr3Zu5hFOe9Eq5WmtdqcQoV05tYA+fSD9eNvf8yn7O1emW15MxTfNGkWb++cczYkdSYWYCmmE+LCCZkFaF3mvyUIVA0b55ec+p++uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Swx/8hBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Swx/8hBh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DPs3032426
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ipsHGKQbOyUt9fRzmyEDeA
	7XB+RnizMkd5yY/7i93fA=; b=Swx/8hBhdMwk9CZsqO6UFyUS7tpulcBIG3/HDz
	bD1nFXmU3p8/XPhQnnP5MR/pGaGfobr6hJAo7AgHeqGNEkdhuVTtwCXDbSIJUSzX
	1AG7JkRSAo/amcM5KgcksSekH/6XNG/5sioYW/D04MQdlbdxQbCVCa0YMGBbXfWR
	FQjw1aXmc9wVHadI3GBuRMjIGBOcDO0MecVleZ1apU3iEEQLYo1bQtKtxI0Xrj4A
	z72Xad3h6mfG6TFjzXQo/ctyzPMk3jTPfUouR5bLEiliR/5i3bno4zaENLK7e/CX
	7mJXGJzVC0/R0Lwb0G8oym7rwwk5IxRN93e+sZ0IsAgAGBPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k45pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:50:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so3735363a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273420; x=1751878220;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipsHGKQbOyUt9fRzmyEDeA7XB+RnizMkd5yY/7i93fA=;
        b=K7gvDeKtv+MpTMUePcnzGFOVN3bCEQ6bS5qt4AcHapfFLLKlH6Ecw1pTQiUAoc02D2
         dDUk4gCnRHCdV9UYcFMtp4XBAL8ATz+9xSPAKVNQDM/qHYOWoWuDRG7hbfrBlQLss0U/
         fy3Oo6cBmz4sSZTN7Wh8RMqMHXEgtgFDq5PpW9BK/LsCGDMW3sQR5GDI1OcsSRH1Iy42
         RfeNAHkxA8x/k50JX8VyZ/81Asa2HIOi6VyFHYZIkD6Cxh9UFS4oeeCn9vYcL8Iho17X
         fFvXWy6BVenmKx4Q06sLHYXxBx2Am3z6i/Zg6ptEjOMXB3Xu7uPNe6xVLKlJX0LFKR7B
         YHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwMWux+BF/hdTT57UUXZA/UG/T3qTsHoxplkvdi1ipeCSBVQaqjdGAzgUP0xG7CSD9JZVCsCwADyvW8h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1ChCAtBakVFPChBFjlJeHvzpzccoKFBrqkFXYD8bHSTlhjZG
	AtxjRGqqiCt/d7AQ1+Z+0QL9r2jSd9+K+C1lbbGOi23wxY6t+gSzWrJJyvMD6RN7hhM2GRR9PkO
	WfLLv3T8U68KCDS2mBZ70zPl/mdowKz73UvC3T2b413DNu6YUVwwWKMV+W3jjGEQysfQ=
X-Gm-Gg: ASbGncsaBNxk5YeUa3cG98MvhjCZNWGS5Wo+bPZWQepoziCz1Rl7IwrXiVhJ5KO3RKt
	gQSlGsQIuuDzHG58A4m1JefWemNrdVdgO/wAt5Rl0evEBD5525/vD0jTDcNvyTATZgNWbVbCTi1
	CTbhzizaMHVr83UczRZtQG5Y/ZufvJ3LXCJ2aal6/X/EngDLW4lZHOx8ipLNWOXm90Om/ctjIZ9
	CCsICQMHAC/alPMAm1mYu7i6dqzZruvyiwFa+m+1U0UeAuAFRSdkLfxtALEFQLYJWtpeqGyH6/7
	q7IXmhwGSgJPRtmDfcx4sSDfC733GPqsItZTov38Z5g6ONH5XjppDoUXpqXj1TsNmtHbLirWarP
	Jp1vSN3gE40IA6NpxPm8ba5jNl0FwUXTn+dVvpnyZkLPvHlSjbsib+uSl2A==
X-Received: by 2002:a17:90b:1dcf:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-318c8eed1a0mr23587611a91.12.1751273420088;
        Mon, 30 Jun 2025 01:50:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdzdMcjHZQPeKwPJjNYEgzx0mdVknK815yQrWd34FZlZkPXgmp9GQ5qt1OVPHvOzcO1J2muw==
X-Received: by 2002:a17:90b:1dcf:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-318c8eed1a0mr23587562a91.12.1751273419630;
        Mon, 30 Jun 2025 01:50:19 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426be4sm13402856a91.32.2025.06.30.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:50:19 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 14:20:15 +0530
Subject: [PATCH v3] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-ipq5424_hsuart-v3-1-fa0866b12cbc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMZPYmgC/13MQQrCMBCF4auUWZsSk0kWrryHiEzSiQ3Ypk3aI
 pTe3eBK3Dz4Fu/foXCOXODS7JB5iyWmsUKfGvA9jU8WsasGJZWRVksRp9mgwkdfVsqLkD4odIi
 anIN6mjKH+P4Gb/fqkNMglj4z/WQU/mc2Jc7CGms7coGR7DWV0s4rvXwahrYOHMcHgWjJYa0AA
 AA=
X-Change-ID: 20250630-ipq5424_hsuart-0cf24b443abb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751273416; l=2805;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=she2MK+667uF9NMpAB7wWzjENWSuCdor4U9yjFHG4lU=;
 b=hQhbLvr2857q6giO4da1L6gIforS6oRHZDVsJq47r/F55Zn5G9aPQO1XdjZmDMNoTgjnBdsbK
 UzbjKQSbg32B11Djgcj/h9X2yVfw1jwBQ/HyEF2jG9nDScEMkc//R6y
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68624fcd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Vg8ECOsEd2VHoE4ukXAA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA3MyBTYWx0ZWRfX8O9rENq5FxK2
 2SUT14qUPPFfNF7ya19chr6jiMp9IgThIq23xnnILKFGM37481lJyYkS7kMJwHq1+jPr89vOZ9H
 FmG45W6+RR9CyilSPcwxHu890OfYl8lMAJhsNi93ZleO7/1cqlYMhZqNCKxM+cAxsE9o6Oop8Az
 ox5/XzDkfJOdI8RVhLIPu7a+u0BznhRivPAkp273vlOjoFnWEX/giB8CWosIJ5MV1wIEnDsOc64
 BjV+DKL2oPgzP/H+S92WwgnSjirMIZMx2nUByO92c8OcFaAigtUWf92IfqMXldiT3n3mC7+q7/W
 c8ilodlOqcLQgJn9PVcX1Zm1I9emEFm71SqUgxJMdVqG5AHvG5Mdf/tL3LdGIxgmOTg+o64C4Wf
 t/uFYW4wyhXfEFPPeQ1FCz3tErrmXJrd2LOc60iL+KVE5kqkmo//OIVvIgjHWUND1tNbJI/D
X-Proofpoint-ORIG-GUID: hLYKOjYaZ43DfosVeikq5BBJp_WmMhbg
X-Proofpoint-GUID: hLYKOjYaZ43DfosVeikq5BBJp_WmMhbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=929 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300073

QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
first SE, which supports a 4-wire UART configuration suitable for
applications such as HS-UART.

Note that the required initialization for this SE is not handled by the
bootloader. Therefore, add the SE node in the device tree but keep it
disabled. Enable it once Linux gains support for configuring the SE,
allowing to use in relevant RDPs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Add the pinctrl configuration for the SE (Konrad)
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com/
Changes in v2:
- Correct the interrupt number
- Link to v1:
  https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 1f89530cb0353898e0ac83e67dfd32721ede88f8..8dee436464cb588fdde707b06bd93302b2499454 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -224,6 +224,13 @@ data-pins {
 		};
 	};
 
+	uart0_pins: uart0-default-state {
+		pins = "gpio10", "gpio11", "gpio12", "gpio13";
+		function = "uart0";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	pcie2_default_state: pcie2-default-state {
 		pins = "gpio31";
 		function = "gpio";
@@ -239,6 +246,11 @@ pcie3_default_state: pcie3-default-state {
 	};
 };
 
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+};
+
 &uart1 {
 	pinctrl-0 = <&uart1_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			uart0: serial@1a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x01a80000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x01a84000 0 0x4000>;

---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250630-ipq5424_hsuart-0cf24b443abb

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

