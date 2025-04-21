Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D281EFFB9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272834; cv=none; b=g0yQLuDZxPHKBR8gZQl8IigNRN6zMRx1nnPkvtF0MKqlnGR2W1lUxW0Zx2MwEHizfCFWdqvKBlfGGVj7BKUSEQl3uvQLWoDEmmWlnU5xLU882QaB9YrkzS1RKlxMdIozh7gzyJn8bCv/gG7Hkttd7SQsarL9bx7HWa55/YYWs9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272834; c=relaxed/simple;
	bh=Fz5Xv5kyUKBPX7FBV3s+Hc184GjMe84b+FHiXhLBQqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJbyO5L4B0UBd+3HnNTS0vxPJc2eqjeUMyXjxdSRWdUbX5zncYuHvSHU/jloeMJo3GukY5VtHyW65eqsk8pJ9/C2/9f0FAnUL7zRti+u8AMRlo5zYeFw5fWEkkpWFuD8kYwdMl7AbbNZwrmQmY728C44PicOHN4f02dUjkqhCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HilkUqmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HilkUqmW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3njS009384
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=HilkUqmWXxAwE28F
	Viqe2dXhxLlb0IxwGEVep9mG4tuUu48kMS3H2cbv9BRJPX8nZiiH7i4do0jxXPID
	Zei4XhACINfxA1KXR+SvSDzLohP76oMTVabm8odlLYo+YcTwzWQa2Wq6UdeDp/TQ
	CGgRXX2gfiV0imKXzV+BX9x6efyem/16Pak6azTdXI2vS/XVzji6pwIR4xTNvIfl
	deGvcP6QZFdLwR6nMoegyymR1H0uGr2dDTh6Ighp3WAO0HzNKdjlHZ2pmGW4DJtP
	XQ8So+lYXg6lFwg7Wr0fdaojG7AWzBwbET4rWz3ZUtAFon9C6B/sXG3WdVAQ6uGG
	BbcheA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1dc95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b5f9279cso3664048b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272830; x=1745877630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=Ptk2DXWFWoi0WsuBKW/eqnNDxQipIz1mdqSrrahTVAwjkR6twZAnQqSjoRFXB9Rk4R
         KI1DCLryrsECeScB29ECbGmEHu6GGslA9rHOlk4yigkDUWynPnLsM41KcDBxmjenMhgN
         yoxizVe8xp2zzPoNJIwaOibKwfbeaqi2tdurWmEwQZTDbE7Uu/yWT7PMzXe5/td3iX6H
         dnnytCR4gGwS4SiM/EsTN6duQ6P5lmB9b+6oMuhmH0lLt6Em9EYkW7RB/icnriB5DQJx
         xVWsdeytx/BVKhrwQEb9KNPoFaQillzVK6Diimb9aMwxZUtczihKp84LUIEpT086flKv
         j77A==
X-Forwarded-Encrypted: i=1; AJvYcCWWE0Kz87KCLtMlfJWmXF7KdUz9Yj5OhfXhH/EYuijawl+hNackoJPIw9N/biNSlzzLIDvYKCa72qPIo+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye1YFDkrjYijN6+E3U+gUEDyaF132Syj1W9e1JJuhFqRtLvD/p
	q3M8b45SBgj2QP01gGYBj7TNfbVjdGtN/clijnaszzFWLop5NmJQq1d92UVnJthRFsvNDF8VI4f
	+bDAZ8DlVF6kSmBZPmHDEV03rq7Qyexdyo9ylkrkYoFWkY2s2q6rVC7P6uwVKSF8=
X-Gm-Gg: ASbGncu/xErP8PZi2sTn0OPa3uc69ew+nvOu40M2f05rnBB786cDtBTh3dvPskz5lOq
	oEwhXwaVQ4TXtPCxoIBlINNU239QNPK5ebbNEVlgt/T9yqIrnEy3gWi7uSodvbx6Yhq7EZQzlqe
	5HCjJsf3DMf8X3AmR5z+kE5x/D6N59wrh0UlcaIYaPqiHqw+OhJt6XXLN2YCx1guP28UBWKjaAA
	k5uUkWTQzQZ0rhW+pLInwi4N6tzDPErxgr4xkqG5vgfl+d/n1jFiFpgyUzK27F9p7LISwV3iOoo
	hxE9DtDl207ZY/gNbzy0V5SPEN7RF8PPYSGitG51YtWUhwt6KBba0uTuCoKCIOUw/hY=
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr20385413b3a.3.1745272830079;
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4J8IINuI6AyXzme/otRBuArMyNq7mt7WxH5Fyest1FG90iDOU07/f3k4YrNeQTPBFvXAHvg==
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr20385326b3a.3.1745272829473;
        Mon, 21 Apr 2025 15:00:29 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:29 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:09 -0700
Subject: [PATCH v5 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-2-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=wiSsNBP6n3SjbBERNylScCBtTJlneM21/7EzLO8v2iwkdZFE1SInRBkCTbCfb6uv759DgDsKR
 s5qHIbAdL55DeXzCxEHZ1VzgkSDumKF59mzN/WW2mOURwT77Xj3/T1U
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=6806bfff cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: We1kOwBpPPEufq5hYVj9RTSqnr0YSSrf
X-Proofpoint-ORIG-GUID: We1kOwBpPPEufq5hYVj9RTSqnr0YSSrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210172

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

