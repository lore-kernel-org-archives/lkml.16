Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC2326A1AF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962616; cv=none; b=lkzMLZuH1hd7iIt42dwo1YrcTKL2My5kBSU57qcd2iGWrTVgTRF+mWinTaJtkZX+AZgDmwdJwD5+FjEh7FHNNRQX4CjOZ23oAtVYHrNCZpSw32z6sZI+wAI/u7vUbMiPEiCka8XMybHdEHZHmZr+GT7WdIu2Nx0xbLE3AFl0xzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962616; c=relaxed/simple;
	bh=VfB9gJwKSkL78mMZ16Sd0RgaTvRJ7KCT53uxqzo9TzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZW+zH8x3m5Bxd6luFvWTaeTqBnZxNLd7abEDUrCpmZyTNw6dhZSXgpnudTdbLCpNY3dSbTejWnIoNidXUf0u/Qd1BE0/UILVuEZt67xpZQ6TavAALvwMIDnINfSBc4KFe8Rb//OeRFl4W/ja3MCFC5Dytt4VhxZtPwcxCzq+1cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeO2gFzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeO2gFzX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I0aV8F014269
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1sUbM2SvyfVJOsSLSsKL5IhU1OYw0ytKP1s5wBNpq2E=; b=MeO2gFzXRM/1qgc2
	088GA21FyY0pcR1WgNxIP6UMPwfRcHw8aP8v1ofylvYOCea67wl+WQh8oAT3j2Nm
	h6hrpivXV1wL/npZy2ZHIgSyMtNh7barq1Da7VYa6QGMtOUSjMroJeEzCEVEOxOX
	4gdSeFvV0J3JuUUFDJPT/zfWEg9Bg1FpRJPwjAf0E5Q4qqmovJeCFUzEi+O91DBU
	1CCRPBIL2LoU6stEqAmEV6h5cwPr97Eom9emQzXaGRfVnz5onHxpZjHN/4PjCihN
	2k07iCi/JaOfFHCnqIKUb6gcw0OEW0WENm7dFfh1ASiPIOLymizlS8XNNXIMj9Tb
	/s/KrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1h7x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:50:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so232348085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962612; x=1745567412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sUbM2SvyfVJOsSLSsKL5IhU1OYw0ytKP1s5wBNpq2E=;
        b=SyLnxLEFWas4LaSaFghKHS31KAABIt2JhAWySHKBjAW6SXzw0UGPNUGzzmYLQotABs
         jTqZRP4Y3FMValwwMNSypmJqjlI4h1gVe5VyaRCst9p8Zy2lM8WpzyPj5D0ceHk6io02
         r4iOiy4G2CVL3NgMObyoe2SsIWvqFIUZ5peFKu0VH0a/cVCbzEEzyj/ix/oGBmPFUCRc
         3tilp/ChWAY2v2gEOZ57LLMzKUqgHX9QE9+TttgJp7fZapsRSkvDmYdjs4SD4VI5+0Gd
         2WGcgwBstyZHMuUN7C6l6xETW989TOa1gGvyjVD4jmtL7ZwkEm/mL0rGnzbhqTpydYeV
         9blg==
X-Forwarded-Encrypted: i=1; AJvYcCX7omYlH1GkPWRupzhI1uDQbVzQJ3OpaY7WGGRQXcgllVx/Z7EH9OMHO1D3NgDlnaFPu2cUUoO72pct9Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3KiilQyFxTrTeT7+jsnbVaU6OfdPA8WpNM14UrJ1J4RfhVYfF
	1m6YPL3u6Kb/co/htlCOv3GZ5jyFzDWrDNQp7l2annJoqWtHpQ8uVAOVBGTf8eL3rb7XX1leujA
	8aI9rK7dk6zyQIjUMzS159PnanlUOqj2fbRb3tf022wwqHgRPvqHtRykRH2M/gDw=
X-Gm-Gg: ASbGncu3yfzYhAesPW2rs2L1qd6ds1s+2v3iQ3C1mGxJecal0fkFUbRAipGPgsQwDb7
	NFZempQAY2SZd338uDkgaDhvll7TmLkWa1Ko+uuKbOzWLqLQFo0RCl1lC1D/GooHYbQB05wuIjc
	whocupVXYx/gFWFNHBCBg2ilVwlpnMBWHaG4nN3c9Xp55tQRE7BcQ/ef5OM8fYgo+qLFUX3lNfs
	WbbNI0AyfxKoB9jsL3RP6O8vUSHaps8mwCtDz8VzyNVSoZIUrCkMWTKAt32sflh3Gtzy+SYfO34
	z3m3SkW0lGdQbNwOWofutd8u6NTBj4mUfXqX60vJUH6A1LNRYJnNDHNo8bpgTrCIYOmrvIG1jSm
	9upA2LtJWB6U9dGffSBdZ4AWN
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr307513985a.18.1744962611805;
        Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzFp3CaJje8pO1ewnerxkzmE/eRJ8vARd+xc36dvLHKRXi/r8FV5/kEcMiJ5lRnKAFvzDHUw==
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr307510985a.18.1744962611335;
        Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:50:00 +0300
Subject: [PATCH v5 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-5-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14907;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhVUBuasCeOBkqrxG/5PgGqIfKxDHldHx8QOIkjyyg4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQp/M3vkQHUqGvfN+Qa/6jPWoCqf40m5u/qe
 mcdAHV2b+uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1WxtB/47YFTtzbbLeJCuvd+Nr+HhEO5Tn+uh6C3h4bBZuDRcV/AR78kDL10XexpNCPW4z6DArC3
 dwQo5xXlF0TmqCHGvz6DifuEAtpo/nhk+ANw5gtzBUdVKbcfuUspffEGWmyhF8BJFFm9k7FqSyy
 32Cu7qyvEWs8pkl4vNh4x53CpyqA9ley7orGDcGn82TW3AQzR7QiDpppofUf7DUOw4fT/e7hzV/
 hURdvfeTB6fMgDiL9e5xTBuFYVB633emOMxbCDzPeVvwOujLFvuQATA1Rn3mmeKj0qIXtltWIbO
 I1LqcFybSU9nDCuP8zx0zzPSwv6lUt5aqIxnQGyptq+E/fe2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=68020434 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-YBHemuPtO_JcOlGpNkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6Bj4cuW2yh1NOi8pytOfyOVh-ddlWQWD
X-Proofpoint-ORIG-GUID: 6Bj4cuW2yh1NOi8pytOfyOVh-ddlWQWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe the Mobile Display SubSystem (MDSS) device present on the
Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
system level. SAR2130P features two DSI hosts and single DisplayPort
controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 1 file changed, 439 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..870144b53cec9d3e0892276e14b49b745d021879
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -0,0 +1,439 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sar2130p-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SAR2130P Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <lumag@kernel.org>
+
+description:
+  SAR2310P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sar2130p-mdss
+
+  clocks:
+    items:
+      - description: Display MDSS AHB
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sar2130p-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sar2130p-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sar2130p-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sar2130p-dsi-phy-5nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sar2130p-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc_master_mdp &mc_virt_slave_ebi1>,
+                        <&gem_noc_master_appss_proc &config_noc_slave_display_cfg>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        resets = <&dispcc_disp_cc_mdss_core_bcr>;
+
+        power-domains = <&dispcc_mdss_gdsc>;
+
+        clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                 <&gcc_gcc_disp_ahb_clk>,
+                 <&gcc_gcc_disp_hf_axi_clk>,
+                 <&dispcc_disp_cc_mdss_mdp_clk>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sar2130p-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc_gcc_disp_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&dispcc_disp_cc_mdss_mdp_lut_clk>,
+                     <&dispcc_disp_cc_mdss_mdp_clk>,
+                     <&dispcc_disp_cc_mdss_vsync_clk>;
+            clock-names = "bus",
+                          "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
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
+
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-325000000 {
+                    opp-hz = /bits/ 64 <325000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-514000000 {
+                    opp-hz = /bits/ 64 <514000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        displayport-controller@ae90000 {
+            compatible = "qcom,sar2130p-dp",
+                         "qcom,sm8350-dp";
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0xc00>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_aux_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_link_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_link_intf_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
+                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
+            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp0_out: endpoint {
+                        remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                    };
+                };
+        };
+
+        dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sar2130p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc_disp_cc_mdss_byte0_clk>,
+                     <&dispcc_disp_cc_mdss_byte0_intf_clk>,
+                     <&dispcc_disp_cc_mdss_pclk0_clk>,
+                     <&dispcc_disp_cc_mdss_esc0_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_byte0_clk_src>,
+                              <&dispcc_disp_cc_mdss_pclk0_clk_src>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
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
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
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
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sar2130p-dsi-phy-5nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x280>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc_rpmh_cxo_clk>;
+            clock-names = "iface", "ref";
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sar2130p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispcc_disp_cc_mdss_byte1_clk>,
+                     <&dispcc_disp_cc_mdss_byte1_intf_clk>,
+                     <&dispcc_disp_cc_mdss_pclk1_clk>,
+                     <&dispcc_disp_cc_mdss_esc1_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_byte1_clk_src>,
+                              <&dispcc_disp_cc_mdss_pclk1_clk_src>;
+            assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi1_phy>;
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
+
+                    mdss_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi1_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        mdss_dsi1_phy: phy@ae97000 {
+            compatible = "qcom,sar2130p-dsi-phy-5nm";
+            reg = <0x0ae97000 0x200>,
+                  <0x0ae97200 0x280>,
+                  <0x0ae97500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc_rpmh_cxo_clk>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.39.5

