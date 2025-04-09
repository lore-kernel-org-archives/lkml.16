Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E35F27701F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220913; cv=none; b=oHsw3qfKehyVnESqJXBypYzeWkrthU8t1M5sfw3NlGThG0K+4KfHmHpBC+0m6WX2quQqPTBhTNi97kcnUpLRhW8KDWjgtpAcXte+QtI2o0skwdH9VRJA7sHUxaJGau+3VZsqpKtEKxBvlsD3t3Pt9+rPmIpdzOE+gLPapLnX9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220913; c=relaxed/simple;
	bh=Fz5Xv5kyUKBPX7FBV3s+Hc184GjMe84b+FHiXhLBQqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqYAkiD2lnYNyl/6mmZHqHnIjqCOO4FjDoq+tzvr73hMiMBKY7ClvKdc77igLM+aSUwBJNPARn3plnBOBWn5f4Aq5FPXBAFJWm3bKfL+/fuLSFmO3jyWAZAFxK+7w1lvbhdeZdnFVTIjMxJcWT6lny2/uq6P/GED2aIfsDARJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIvmL2M/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIvmL2M/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HFUD4027509
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 17:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=PIvmL2M/dNP+Izc8
	SPtF7jPKvzmtovEKYhDSHKF3YwulHZV1xPA0Z7yVCsNeHvCws1Q5MyDyxI64vHAn
	CpQyn8Wxtkf+CxvcrrIABxItoBvqyPWkg2Hm9EHhEkRzp42w6QB+NjURdUpk+gIr
	opeLus+zUfhR0jvWGffQLFWgG9LoFu7V4hkaQauEQNy/8YRqJ/xHhtViuHlLey6f
	vVCMEETvGwuCvOMu+yLqOdSy8Acae4n/XLQaBrLOZNsvVipC1QFbgpKVT+K9pd2J
	eVNeHoixDIQoDYvize+AeaLPmuAxJ0E7PB1aKQdrVOJttcEjycpPiOyZAvqMQ4xr
	bnrGbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrmd00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 17:48:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240c997059so85881705ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220908; x=1744825708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=Jg8LoC7GeSi2cc+F9UY2aZ3OaW4PNBurDPu4fsGSN2y6rBzB+fETVGEukdc4rglvWL
         t5ACcNUVNqw6CTCdjFUCemXQ4lAZWHke8X4mc4nPEvnGcrsV8JFHCKZKOJxTfqwWqNE0
         7S9yMmOi9IykraEsSfpKkmIxKX6pZ2AHRhnoFHcIcx+TEfHzC1U6HyBQDsd2v6Gkz6MH
         EWL8K5IKjo641SaBR2pO+qqwO37qh4p2qHT4U59j2xiKUPB+rLoMUFUA2uVEcVCd4QAV
         pAvQ/FbPldLjTc1shdfpdSpG4fNz/DW21a1tMM/dNomK2fHxtt+AWoXP86KBCUTSNyNt
         jKcw==
X-Forwarded-Encrypted: i=1; AJvYcCUgCzncQCrlv9ZTZ8fC4JYPlKwKCaV0Tl7yJ+HOh5m63IPx35cJQMbmVIGeghBS9JHb+Hh2cjGTeu0pl6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0ThNfQnbEdLJRoA9HR7pZfvOeNOFHJ/HKoVZfsFnV02j0Xaa
	9oHYm/c/GY32AwKLNwK2stmQRD7woXlMpCxMxAMeGrQtHw01Zu2C824qrr2HvQiXBgDCV57Ejn3
	VbHSHISFfn1uftAQFUIhr56Cj+uGsbXgrlKlG4aRTlnCHOQqLy1hrXL+mfQb6Cvs=
X-Gm-Gg: ASbGncsOlg64BxPSB3AQ9ppZz6+T6dgci7nwYHznA0xYnYDJQAZuiKY4a3tt6AU1dFi
	cWtDj3uVjCe85gbr7mjJMH4VyM0Bd+OYLhK3dwaYAJjAawpFOYmcoRzew8nsuwq/MVpkWnVuzax
	IIanUXBv21HN807siNdLsCNaeYUszIBQE2QXXqhVuyVSIpvkg+cDjDKNJNVuG8IwAwE03/BJEb1
	AvcOc26mvtt68myqEMCS5EL/7Dhb7fa4cpf7jRHCT71AN3Z9jozYOnGkuPxA7ZHiPXi+aRnlqTO
	SO8s6IjPFsS7/0CetbAvFezjuGV0BXscOFAH6NXFPDuRTXF7bWms/frjUDzpr2+c0/o=
X-Received: by 2002:a17:903:984:b0:223:6180:1bea with SMTP id d9443c01a7336-22ac2a1de15mr59877125ad.37.1744220908511;
        Wed, 09 Apr 2025 10:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoY64Nb1reLud/xkdxjipEsuosAQTCcuRB4SYeUOoKWO1ItlQc2B5Vyzj7uQIhCCOyhDkH1g==
X-Received: by 2002:a17:903:984:b0:223:6180:1bea with SMTP id d9443c01a7336-22ac2a1de15mr59876855ad.37.1744220908113;
        Wed, 09 Apr 2025 10:48:28 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:27 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:13 -0700
Subject: [PATCH v4 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-2-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=v1B+o7WHLxEMTEOfPAhMrr55ozwTe5+GGQDr6x3JHHOW7mTjCYmzmwoZYNNYBILGRdl41NWGn
 9pKvj474EM0CzeyLEQY3Ka2pTbM5Ha9Eb+QjSEu0/aixSAKoc0wKgzN
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: IPAuKCRIE_BYYg7rGE8gdEVU_JTNHVRj
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f6b2ee cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IPAuKCRIE_BYYg7rGE8gdEVU_JTNHVRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
binding definition for the PHY driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c84c62d0e8cbd9fc1c0da6538f49149e5bc7e066
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,m31-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M31 eUSB2 phy
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  M31 based eUSB2 controller, which supports LS/FS/HS usb connectivity
+  on Qualcomm chipsets.  It is paired with a eUSB2 repeater.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8750-m31-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc_usb2_clkref_en>;
+        clock-names = "ref";
+
+        resets = <&gcc_qusb2phy_prim_bcr>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+    };

-- 
2.48.1

