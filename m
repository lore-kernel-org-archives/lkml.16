Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD02309A5D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646726; cv=none; b=YQlr4/tdSA8RkzXP7fgoqKXry3Xhn9Mkg6KXbjp/gdg1jWoDnbbaQH5DxzMtGNpuO1FpyB4uXNkXrT0Ua6fdIPyfRCjgEIdx086u1GpnouH1wT115AUodurCwILo1JROzcUqwqsJ54XyW1NTrJsgRbEWyQyMiPFb+KjoqPHn7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646726; c=relaxed/simple;
	bh=y32hNG5/FVpKU6/FJLy1ngxvMQuD/zA3kWUtRu3uMq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUe10f7oOqwMebAzSJ9YP9MR0x8K10s3jmZVQpRidtQfAimcTjXhTL8B+jLYiD6/b+1sWMzy2SWeTzqKU1smi9wybys1/cLgBNg+a3ZEUTzu6FTetWT4lGmk+x5X6OOg29WXmpqtZaMCXRuIuaY8YyeSQ6ImPbt4xWo/4WWy19w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8EQvJhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8EQvJhK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564EXQmi032116
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCNktFoNUnnmQKTMw9H4fEdcq72ueWODZAz3C17Oax0=; b=L8EQvJhKDAfT+2sX
	hz9EVG1Vgf3kfpKa/ZU8IKDHlf85rLiakPWVd0EdZjI5JqPjvFhGSJ2Dqda64Naq
	7z/bePi81zfReJB0OIK0zvNdTQIN477hKGyJcwz4YWhk3l2XO+caNnCJ6lase/lV
	XcImaAJ87BG0aj1yKyuf80S/JJHm7gpxYOllxx8tdQ23dwX3Mm9x3kUBd2uvSB9i
	Nq3AnydtEmgm/isGJvEWMpK3/eYNJaf7OOKPsXbWqTH5Kjb9xuEvrHzCF2MX14fI
	/vlpBxqD9TDNsZSaC675BCwQz4IDBeN5c0Izc0rrFvXB6l6D/7LcTq6OHWkPfLy2
	gPC4mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kmu8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:32:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafc9f3e1bso16502906d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646721; x=1752251521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCNktFoNUnnmQKTMw9H4fEdcq72ueWODZAz3C17Oax0=;
        b=LRaXxF/DulGLoKiI9tbE5ZHtoFDaahTtvBeLf52STmm/BxChS1IAbhTfrsTUV2pvSY
         RH0xCGM9qrdhVy0ewWHWMJCvaY/UBOhzC8JAe+ueXJv0x6RQl+Cl7+FkyYgtupufPVKY
         H71Bx/DqHoPxTUkWTi20M9NudeQWYEayVCoCOYQn8u8KD6ESDWbQHFQ1EGmXSt4Lb2ZY
         dBh9+x1p7SMfBlsIKoG+BaV2583gSu0U0tQw0XrSL5BkxILwboZr0LNBZlnQpdnc00gV
         X12VBJTubMTVjMSG88X5zNZTKDLHSESyA5OXIPV3hEoa6tBy+E3vwdNTuzUPXLSQliVI
         UCwg==
X-Forwarded-Encrypted: i=1; AJvYcCU77JG9Z5t/m0ZjiGC1c8GHfpX3MpipHfIMce0psB+iYeiAJbKg5x4NqdNlJdWulAW0yQvJ1Sapow5DJtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzulsMpVwgAzoyZydiZBwtjEF08+BwuLzLg0N625IMrcc5R+CHL
	mx/j5cAzmGXHOIOhod56IvuHYNMjooGDFCzJco8e/aX2MPsh0tDBD9zj+fVoq83jZfzIgGxF6O3
	L6Bmun7WtxCN48ep12CyDTyEXF0OZ2IvpJEq9iajKfavIG36cZ2TmsS6wk1m2cNOigaU=
X-Gm-Gg: ASbGncs6s5gGjSjmX80bkNecTZEqvy1KH1cGHaLJWuQQmTngYdzrGcCoC9Rfq86ZHC7
	6uNoWgB6HMRD64DVp60rsFSOLj8qJxc+ZYjLp5VHKw0gfdmIhx/510qcphUEB6doi/eSKUIL8Sf
	ywaIB0KXBx8fkB/laNxJrkoONfNefy//64+F77SLvdEiDXaAoXuWGQQRnuXhhCubKNxxFez9+wK
	l3+tRiEG338nayV24ogEvdrXPS6VLZYeBgfGdjj6Ooz2OXHK6ceWM4Tt+R/Ac8YezNiQrjTChPt
	D6mQQrZih2hfxh0/wnBslkx6KDD8f2wiiEh39rZP5eiO+i6u9HAjbsmbDxRytkFIsbU/OAORtqp
	jhelHAF5OsDPAspbrfQ3VNJTPi4d4b3kgMVI=
X-Received: by 2002:a05:6214:3d11:b0:702:bf75:f0bc with SMTP id 6a1803df08f44-702c6db70d7mr49433316d6.37.1751646721445;
        Fri, 04 Jul 2025 09:32:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7leXLXrdut6G8GF3uKq3bZvUXfZP3iBDInTYxHHU38tIA1gL8XskUaqXMnDdAmOHUhEhZGg==
X-Received: by 2002:a05:6214:3d11:b0:702:bf75:f0bc with SMTP id 6a1803df08f44-702c6db70d7mr49432786d6.37.1751646720835;
        Fri, 04 Jul 2025 09:32:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:31:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:55 +0300
Subject: [PATCH 3/4] dt-bindings: display/msm: describe MDSS on SC8180X
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-3-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11951;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y32hNG5/FVpKU6/FJLy1ngxvMQuD/zA3kWUtRu3uMq4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YG46+jD+xDH4uXcb3zeRiTYK2U+N9S9uZTE+Plwj/CL
 y/R17XuZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEOsvY/+kaXRDdc+nKSx6v
 mpwD9bHsgnm7C4VOdOuVJJ4NPqSr6vuX8Vr1uv58/StWj64eOyHyquhL9mrGxbu/KyyTO/aV02D
 Bkuf8+X73/KUOONSu7lmpsFzvkHv37/i30+3vBz/LXtU55cL71/9j5GpuzV5S1HeD1yr7e0VI6n
 e9zxMkzmf5/4pLUne6G9hX90SBpe+YSG1p63UbocSpt5JOvmxmfrf8XCKfb7eC6RrGoyyqy/tzp
 B6EMebpZak/LL3bJqXm1yQ2y/TZ45sWXn+qSmJtfpayd72yf2dT/NryeHz+ZpnCXZb9YXJ//m15
 U/dBwezU5Id1PK8TlqyJOn0mhcviQZaKc9dmc3dJSWYGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68680203 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=A_dIghEbB8yRmxXuPYQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX+85eBfs0swGu
 x63yNlSIrl/MB0pSJdhOgcTcW+ovfpyXsWLIxDf1FlAPn0YttCL9S/9SwO5vWUxbbwGwnY5ssB+
 5QOp9PNvwyn18Ut9UEgY2n0nztUegUmUkRZOCoOL3e12r48C7fLPbfnNa+aqunLCTk89pUg1iR+
 fg8JDyeDK8x+mse+EwLV0HBDwN2KJOSOLQkEi60k3g3x1f/+eg20pfoH4xj739xFfhF13PkYMx5
 vgQGtJ1GTAYTYLkzgH8izXz3Hseg1ma1LLBWHmZP2EhJUjAIrrxKpuiGJfuHavUV/ZdbgyCkZ+D
 kKdRvIrpkSEAYO53KJ+KP1ErQGUdKPGdwizc1xxtijMneu4YMdxYyQHJQk2bW8QUa0vF+aW9yIF
 2WeQ1ncx0DZRNwg+yGIri6jaqUVf85hI12c1lKKFR/CrqobhNpYNO8Y/7spqB9w1QhrO3Bls
X-Proofpoint-ORIG-GUID: RH0nlMl7VXxh3V37JdOiHzA5ZjAYvMNE
X-Proofpoint-GUID: RH0nlMl7VXxh3V37JdOiHzA5ZjAYvMNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040125

Describe the Mobile Display SubSystem (MDSS) unit as present on the
SC8180X platform.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
 1 file changed, 359 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..00e82bdbbcc7e7836918ad6a0414286b6b576150
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
@@ -0,0 +1,359 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8180X Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SC8180X target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sc8180x-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: nrt_bus
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    maxItems: 3
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,sc8180x-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - qcom,sc8180x-dp
+          - qcom,sc8180x-edp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8180x-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,dsi-phy-7nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc8180x.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sc8180x-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
+                        <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>,
+                        <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_DISPLAY_CFG>;
+        interconnect-names = "mdp0-mem",
+                             "mdp1-mem",
+                             "cpu-cfg";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x800 0x420>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sc8180x-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>;
+            clock-names = "iface",
+                          "bus",
+                          "core",
+                          "vsync",
+                          "rot",
+                          "lut";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd SC8180X_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-171428571 {
+                    opp-hz = /bits/ 64 <171428571>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-345000000 {
+                    opp-hz = /bits/ 64 <345000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-460000000 {
+                    opp-hz = /bits/ 64 <460000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sc8180x-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SC8180X_MMCX>;
+
+            phys = <&dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        dsi0_phy: phy@ae94400 {
+            compatible = "qcom,dsi-phy-7nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94900 0x260>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sc8180x-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd SC8180X_MMCX>;
+
+            phys = <&dsi1_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi1_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        dsi1_phy: phy@ae96400 {
+            compatible = "qcom,dsi-phy-7nm";
+            reg = <0x0ae96400 0x200>,
+                  <0x0ae96600 0x280>,
+                  <0x0ae96900 0x260>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+    };
+...

-- 
2.39.5

