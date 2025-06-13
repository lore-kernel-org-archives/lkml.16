Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0619B5B1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823471; cv=none; b=nCpFY+e6VFW30TWrY0ftAfZ+YvwOQegcWOHpAsJa8kXzv2VvBHdgYVgy2E0QDDU5/DD+wSF/v7QtHJtdL8wZkjKuicVNGINobMxa9C7mEQ/JTlu5561aXcTNTkEvH2p+Ib23deq0GQl6y56dKHEQeikMtZZf/jQEu9HU37JWgZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823471; c=relaxed/simple;
	bh=gdhfUspPyqBiEzOlF6EWkZ6U0ttrz2LFWzzIn0eDJFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F44D75yW9UlXmKfH9w1MgXAQQI6Z9FoYuYEVELuzFVpVCyUq27vXbxcnWkB1BKn0BITLIrPymCGJocgWwQI7nouJt8CmY4zOfDgVu9vuX6P0wN+hv3qV3W9+YrjBh7hUFwnjqcTwgalE7p2GrfQJ701mwM6g8ydsZ1Gp8E5grvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/pXrXiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/pXrXiH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D8Vw8k027192
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dRjk/GIaSQo
	1IqS/32SDSp43gzWPCoXG2x1Joi96rvA=; b=R/pXrXiHkOGAxiUHCmLBipGR2bq
	MikV93dz4G2AvH0QoJf0D49xrjuHxB1qzKpmPL1L1BIxvBuCvOSeGxjsjJkuWqC3
	I2MSPEOZ45y+44EjNGXMWM/gRJYkFtMBwrCQJBxp5N9owSYOSLgfAUSK/va5fHAv
	x4zxdiUpitdIh1PIBBEUv6rtc3oILju8pp/ZyDOV30e6romAFdYOD4HavOtAmtHw
	kCe+R0rfrmccQ7yr59LSImIwuqQAn3ElfuOAjS21ewi+2IMvI/MsOabDztZ820xB
	o8c7tTHeWHbT33iLnScgEpbDvrrQ4TJc1EhlwuA54AbtirnPjkTA6JZRw2Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvkmey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce66d7cso30777775ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823468; x=1750428268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRjk/GIaSQo1IqS/32SDSp43gzWPCoXG2x1Joi96rvA=;
        b=a3lHwOI8PdV1JDzeglrDQhk/B/g+h9noJVfouV42Oi529u8p1nG8THVtPr8kKLz5M9
         Z+afYFVsqf+LMuJFI2MGjCJrg6vb6FlglDiJwIA3ZcCLLPladm8XvE/DM7TpPuMRoIG1
         tHObueBoxu+Xutsak0ecT9plXFFD0WHZaRTJUp2sbcCfT33HzEnRgSNJ7ZHC3dMWYjFi
         O6Iymp4J5dF9+szp3WQediywCMKEb6J2rpgmMXf/X32tB0OQAMmACzU1q3JyCvgxasLH
         Elu7calx3jSiHJlezwXT0rL2VZ3B2eijgdPEceczIyKylayjmdRDrwIJ+pLufEPCFQtA
         hqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIZ3Yth62Se2ljvRtb7pAkhWJgWbpECaYormIPHMuBsQUas3Gej9kngBn5h4eBGe4OKh2O9MgTH2EgQ+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+M2/xLEmrTKzIkI+p0eStIHJu26VvXcpl8GRYO0OQeTKsqYLf
	q0VueX7/U5i3+hYJj4hRYtR9rx1Oj5A927xrcgP1teCvIw6xqfB7IvUppQu2Y5Fo8bkqzbsq5xx
	2E3JEc60SHNKTsRUE18VyiuV/pOlFrfcnYGkC/XX3lX++OiYJ/1qTsDTbM6FQSjQ5PVQ=
X-Gm-Gg: ASbGncuv3KrrELxh1p15To2jwY163jjeBY4NtaycfUPdY5QoiV/0eSMvARfALADUN8v
	EQB7MhOBADd4XoETzh0/4a1qSl7RJ9xScXaL+x+Yi3MI9pT8RXusTiKPBl8pmfhHc68Gp6A5tnr
	XOoaKMO8lVLW8cYI6jYd35eevaXCc60DmNOLdJO+mhKNkKYtmZwEdUbfDLTn3O2XsKu4+9sAZFf
	eVyHJYpj1ENOctzLcYiCRyOm0IHKpJiDdxq4JjyCCQHeHxBwMQdJY9lHRYdj5sfnYeytPOIFIrR
	PhQq+DjQFfN4Xs06ldKCJsPA4ftOXPC+3KWtmkQ2oYbtlvZH55vQsCKc8bfWB+YcE4fbXZRFTlL
	a
X-Received: by 2002:a17:902:ea11:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2365db04ca2mr42307715ad.27.1749823467422;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8jsfnA0oH2YzM9LYN0RUmbEBZjUfR9KtG7h9Y5VC+XY+k59J/pusktrBSu7tajQ58/h8lw==
X-Received: by 2002:a17:902:ea11:b0:234:ed31:fca8 with SMTP id d9443c01a7336-2365db04ca2mr42306475ad.27.1749823465796;
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Fri, 13 Jun 2025 16:03:58 +0200
Message-Id: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _9jSZaRTgg6nTgmyqqhvX-XTz1XEQOPh
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684c2fec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1mX_ai67dwKzVtmm1w4A:9 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _9jSZaRTgg6nTgmyqqhvX-XTz1XEQOPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX/ZSkb/b4oNkY
 D04MCXZ31w5gMJvdYSOzS24FDngAiXti0DyamRPNB5SGbk/ILfWG5vq6omq3NK5JPdWtcFfw+Yn
 dgzeqMoHnrF4Du/yfRoMdNOFqO49kAMBCGUF2nyiGnVm2lf9kWj/beuqOF9xRKlQL+Ay40Fgbaq
 RFG5YbSPAWdS1OdbhtgVQ4v4naEqbH7mRHWsKSTjail3olOcfOU2zVNsF3cMfCEUq/UlXpYMUGo
 st+Knco/ttmTwap+BB8Ag73W9mjSzhbR3ZFUbz1UhuT09luUk0XxA/e1q9J5eqPg4xWzlje8El3
 79eLIn9QyD1yaqepsKBcRFMYF5SwW7LJA1UGJPrgZe33HUemQzoFwxB+HVZcQlT3iw8JQIspwmB
 woSeJ38ihTbhC1pGd6GvRlbXc8USo3yMMJjUf0Lqm+dKXAk+biprZW2fJ/MXe51jYN/3IHlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..ffa72f1e27f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    deprecated: true
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    deprecated: true
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xff000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus", "vcodec0", "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core", "iface", "bus", "throttle",
+                      "vcodec0_core", "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+                        <&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem", "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+
+        video-decoder {
+            compatible = "venus-decoder";
+        };
+
+        video-encoder {
+            compatible = "venus-encoder";
+        };
+    };
-- 
2.34.1

