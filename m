Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488CF261591
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018082; cv=none; b=fM6uymLt26JRVlDwtkeFnfdGXPk/jSl66gSooPRXXpICevUwrgqh4oWIycby9gqGECAn6wGsbFoFN91qVJepMZ+FteUdp7SvFuehrn9nLfNkMgN0+3mtY3a7iyfCB3jVmVsb2uY5BhobOFAeTyV4A3NUnUOjuKORPj3En4VHJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018082; c=relaxed/simple;
	bh=GkWQl4AHuV9DjDU+IEnl4HWYAg7OOc0kIv/ZNv4aHT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2f/MekLwrslNYuN8PLamwZNiYPx/MF+3urzqcoCF7GkVpMsXYQhoi7cGOiZiLlZ5a68l26NGOqlig17I/lfD8rS9DOWpWyW4LUhf4jhpIfmhPkSPbzK5TceIshVM0PMrYULC45b+wAVSgy8nJFeolp6J9d5n8jFG8CkNuJMVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LSxAHcC/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSxAHcC/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so4694285e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018078; x=1746622878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAIPDns1zRlLkDTDA2ufc+iwOegg3wkdBuYVEqu/EmA=;
        b=LSxAHcC/5EhlyhxA08gohmmu8YF7dEqZaK+KDDoq9sSlX4bhRgu7y7/7JO9OPybnpF
         Ojf9KbbUHqHh+huic/sjuoHZNfWOcCTxHML63vjniZLL/AbK+Lw6Bzb38VPesPiLqUMw
         vPAIbQMW9VOHm6M62pUYHQgNOIAE5R3uTbApnwxfGXVdiULM9GWaZH4GFtDND2mnAdMw
         ByrFw3F2QAHeX7LPXiY6kpaqoeC/nom+T22Avv9hp/lRiXOKPPeOKzdmh7ZYdDRaLvNi
         vi2msC5XZ2Nud/cNszQ3Bshdgztb9O7zWzfCOYzQXfePzq6ErUBMp6CsAt9f899vKiIG
         YsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018078; x=1746622878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAIPDns1zRlLkDTDA2ufc+iwOegg3wkdBuYVEqu/EmA=;
        b=pubctlNu0ythTpRZih4uu0itZIrwrB0Ti22VPN0PXNWOpBz8o71UZ5ivEIUAaVY8e6
         Pb2Sws9NvnRGBY/migG4z04pYCNqhum9vGZch0EIJh/OUn5bCHqgxko4/PyhYkOU2o7h
         07EtHLbli3YCzbITGCzZQ/Fgb6gJe5TquRAa5dju4jlc8mlAWEXlozFFwpTwDJC771zr
         wgNyOmfA00OPDRe3SHGr+s9WkAdfwest9nXv02lPzt6ApoaRuqA3fqVmvbwbyBrfwaxK
         5KQl6HKW2i2bGzvLf9HprTd6lxUeazgF3LbItgxOCZPcOcp92K4Eo4yWR7gPOSCudDOs
         RN0A==
X-Forwarded-Encrypted: i=1; AJvYcCXHsTaBwc2IKOaB2mJwjy1VCOwAm65gci/OEk1RnfIk0PKStaZPj5AwJhnYCuz23yqdDslqRd/SzRlbtI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSjSAmuNstDBTBALsk0PCv4b9PPXEQ1lCO4wqDSeype74qZvm
	5Qm7cWNZnGvt4d/wnEKJaP+p9nLsxNHeC11lEwuNOXiRiYf15E/nU6AmE2M47Kk=
X-Gm-Gg: ASbGncv/BHGFi4ATE7EedEAQlb7f6PA9N/dVWUTwLFaZ2ysudvb3fmCAN5blua9OyP7
	jXPKGihjC6/NfY9WdENM91XgrjvpBw/zqibHbKghxqYr0LTwG5IZ/94P0SpoZJhza7/bFYaXAKu
	y/QOKGRTfNDVY8aHWOZkKhA7BXJ+d05dT0KliKUB3DyTi8+dRpJ9FLkKOpcErWwMSj7QR1U5idy
	R8QMh3BAPUolnxfTDpNQ7nVhBBEwW8yL1REvboL5RHhR38DNfyKEeC2Od/zugDuRCduSnccN8tk
	+tkbWT6l0eTdXuo5evgz5q+5/SRljdCqW+lQcTbNeabsZ9AE1akwGE6Lvqo=
X-Google-Smtp-Source: AGHT+IHjCXUN3Br0ARpw4vZ3JG9K6Rd+QZ7Hsxu51mCBA34EhHbTUCatuIv99fu0qvoB2yHrIAgwGg==
X-Received: by 2002:a05:600c:8409:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-441b2dea5c0mr8686435e9.5.1746018077882;
        Wed, 30 Apr 2025 06:01:17 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:35 +0200
Subject: [PATCH v5 05/24] dt-bindings: display/msm: qcom,sm8750-mdss: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-5-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GkWQl4AHuV9DjDU+IEnl4HWYAg7OOc0kIv/ZNv4aHT0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh74Wind1mDXp3VGThiFxCUMfFFsxSHp0hpEm
 LWIdQ9DuFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+AAKCRDBN2bmhouD
 1yBbD/sEBe7ZcP2HnxAZ5Fkm44Uartx9FYdXnMNBDujzfog6qrJdWJo8TTJazciXjs5jQwq52BY
 hxdc1zR+cDcqVDT4cEQ4jZIDtGmXzL+P1JAInu5lFjwThkVQfUemmg+obQgr9s8lxWHl7+h3cr8
 3B99su+uD/ZDkByj1Yh0f8m4olzifm6aVA7/KW8tYcBWhPt/Gpfo2Ew8yvf9GYyikMu/v7SEJM7
 Fc+gI35VbRjytasF2pNC+ICK3hcjRWBKznOnieEACiVL719tid1HWtNdT1P2LxJ91jObJSN5AVS
 x96skVbLQePpJhiOvHE6jI6GVQIZ5I274YGXg9Q7sH1JK3xqm2DB8JI5aVlijzwcJW5vpkmjFw9
 z1CP1ag+Zv1b4Ns7Ysxz71esdmNfKHU0T2RkcWVsTsUaDBxBhSizArOZ92d6IRxNdqZBcTFieGz
 zgXJQVFrKF8djR769d5pB/aLlQsyY++v52daHNvRKOfB37S2bzVC1ufW1k091LtzY8/us0xO3R0
 kiCWHTvgwyX4GsdXCNNDAAJ5F4A/vxoimylXiItQo4bgvNpHfdj+RSxgav0hxH0uuO6R+uIIa4i
 nv9+MBTFnc32c4a3EwYCf9aCawECGD68sRu3uaB56VBBgrlrZUDPHNqxuosmpjUiY856n8OOpNL
 JPQI7GVpAe2pL/g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
with two revisions up of the IP block comparing to SM8650.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Properly described interconnects
2. Use only one compatible and contains for the sub-blocks (Rob)
---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++++
 1 file changed, 470 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..72c70edc1fb01c61f8aad24fdb58bfb4f62a6e34
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -0,0 +1,470 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 Display MDSS
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8750-mdss
+
+  clocks:
+    items:
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
+        const: qcom,sm8750-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8750-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8750-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm8750-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+            compatible = "qcom,sm8750-mdss";
+            reg = <0x0ae00000 0x1000>;
+            reg-names = "mdss";
+
+            interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_mdp_clk>;
+
+            interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "mdp0-mem",
+                                 "cpu-cfg";
+
+            resets = <&disp_cc_mdss_core_bcr>;
+
+            power-domains = <&mdss_gdsc>;
+
+            iommus = <&apps_smmu 0x800 0x2>;
+
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            display-controller@ae01000 {
+                compatible = "qcom,sm8750-dpu";
+                reg = <0x0ae01000 0x93000>,
+                      <0x0aeb0000 0x2008>;
+                reg-names = "mdp",
+                            "vbif";
+
+                interrupts-extended = <&mdss 0>;
+
+                clocks = <&gcc_disp_hf_axi_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&disp_cc_mdss_mdp_lut_clk>,
+                         <&disp_cc_mdss_mdp_clk>,
+                         <&disp_cc_mdss_vsync_clk>;
+                clock-names = "nrt_bus",
+                              "iface",
+                              "lut",
+                              "core",
+                              "vsync";
+
+                assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+                assigned-clock-rates = <19200000>;
+
+                operating-points-v2 = <&mdp_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        dpu_intf1_out: endpoint {
+                            remote-endpoint = <&mdss_dsi0_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        dpu_intf2_out: endpoint {
+                            remote-endpoint = <&mdss_dsi1_in>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        dpu_intf0_out: endpoint {
+                            remote-endpoint = <&mdss_dp0_in>;
+                        };
+                    };
+                };
+
+                mdp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-207000000 {
+                        opp-hz = /bits/ 64 <207000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-337000000 {
+                        opp-hz = /bits/ 64 <337000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-417000000 {
+                        opp-hz = /bits/ 64 <417000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-532000000 {
+                        opp-hz = /bits/ 64 <532000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+
+                    opp-575000000 {
+                        opp-hz = /bits/ 64 <575000000>;
+                        required-opps = <&rpmhpd_opp_nom_l1>;
+                    };
+                };
+            };
+
+            dsi@ae94000 {
+                compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+                reg = <0x0ae94000 0x400>;
+                reg-names = "dsi_ctrl";
+
+                interrupts-extended = <&mdss 4>;
+
+                clocks = <&disp_cc_mdss_byte0_clk>,
+                         <&disp_cc_mdss_byte0_intf_clk>,
+                         <&disp_cc_mdss_pclk0_clk>,
+                         <&disp_cc_mdss_esc0_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&gcc_disp_hf_axi_clk>,
+                         <&mdss_dsi0_phy 1>,
+                         <&mdss_dsi0_phy 0>,
+                         <&disp_cc_esync0_clk>,
+                         <&disp_cc_osc_clk>,
+                         <&disp_cc_mdss_byte0_clk_src>,
+                         <&disp_cc_mdss_pclk0_clk_src>;
+                clock-names = "byte",
+                              "byte_intf",
+                              "pixel",
+                              "core",
+                              "iface",
+                              "bus",
+                              "dsi_pll_pixel",
+                              "dsi_pll_byte",
+                              "esync",
+                              "osc",
+                              "byte_src",
+                              "pixel_src";
+
+                operating-points-v2 = <&mdss_dsi_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&mdss_dsi0_phy>;
+                phy-names = "dsi";
+
+                vdda-supply = <&vreg_l3g_1p2>;
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dsi0_in: endpoint {
+                            remote-endpoint = <&dpu_intf1_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dsi0_out: endpoint {
+                            remote-endpoint = <&panel0_in>;
+                            data-lanes = <0 1 2 3>;
+                        };
+                    };
+                };
+
+                mdss_dsi_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-187500000 {
+                        opp-hz = /bits/ 64 <187500000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-358000000 {
+                        opp-hz = /bits/ 64 <358000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+                };
+            };
+
+            mdss_dsi0_phy: phy@ae95000 {
+                compatible = "qcom,sm8750-dsi-phy-3nm";
+                reg = <0x0ae95000 0x200>,
+                      <0x0ae95200 0x280>,
+                      <0x0ae95500 0x400>;
+                reg-names = "dsi_phy",
+                            "dsi_phy_lane",
+                            "dsi_pll";
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&rpmhcc RPMH_CXO_CLK>;
+                clock-names = "iface",
+                              "ref";
+
+                vdds-supply = <&vreg_l3i_0p88>;
+
+                #clock-cells = <1>;
+                #phy-cells = <0>;
+            };
+
+            dsi@ae96000 {
+                compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+                reg = <0x0ae96000 0x400>;
+                reg-names = "dsi_ctrl";
+
+                interrupts-extended = <&mdss 5>;
+
+                clocks = <&disp_cc_mdss_byte1_clk>,
+                         <&disp_cc_mdss_byte1_intf_clk>,
+                         <&disp_cc_mdss_pclk1_clk>,
+                         <&disp_cc_mdss_esc1_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&gcc_disp_hf_axi_clk>,
+                         <&mdss_dsi1_phy 1>,
+                         <&mdss_dsi1_phy 0>,
+                         <&disp_cc_esync1_clk>,
+                         <&disp_cc_osc_clk>,
+                         <&disp_cc_mdss_byte1_clk_src>,
+                         <&disp_cc_mdss_pclk1_clk_src>;
+                clock-names = "byte",
+                              "byte_intf",
+                              "pixel",
+                              "core",
+                              "iface",
+                              "bus",
+                              "dsi_pll_pixel",
+                              "dsi_pll_byte",
+                              "esync",
+                              "osc",
+                              "byte_src",
+                              "pixel_src";
+
+                operating-points-v2 = <&mdss_dsi_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&mdss_dsi1_phy>;
+                phy-names = "dsi";
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dsi1_in: endpoint {
+                            remote-endpoint = <&dpu_intf2_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dsi1_out: endpoint {
+                        };
+                    };
+                };
+            };
+
+            mdss_dsi1_phy: phy@ae97000 {
+                compatible = "qcom,sm8750-dsi-phy-3nm";
+                reg = <0x0ae97000 0x200>,
+                      <0x0ae97200 0x280>,
+                      <0x0ae97500 0x400>;
+                reg-names = "dsi_phy",
+                            "dsi_phy_lane",
+                            "dsi_pll";
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&rpmhcc RPMH_CXO_CLK>;
+                clock-names = "iface",
+                              "ref";
+
+                #clock-cells = <1>;
+                #phy-cells = <0>;
+            };
+
+            displayport-controller@af54000 {
+                compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
+                reg = <0xaf54000 0x104>,
+                      <0xaf54200 0xc0>,
+                      <0xaf55000 0x770>,
+                      <0xaf56000 0x9c>,
+                      <0xaf57000 0x9c>;
+
+                interrupts-extended = <&mdss 12>;
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&disp_cc_mdss_dptx0_aux_clk>,
+                         <&disp_cc_mdss_dptx0_link_clk>,
+                         <&disp_cc_mdss_dptx0_link_intf_clk>,
+                         <&disp_cc_mdss_dptx0_pixel0_clk>;
+                clock-names = "core_iface",
+                              "core_aux",
+                              "ctrl_link",
+                              "ctrl_link_iface",
+                              "stream_pixel";
+
+                assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
+                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
+                assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+                operating-points-v2 = <&dp_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+                phy-names = "dp";
+
+                #sound-dai-cells = <0>;
+
+                dp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-192000000 {
+                        opp-hz = /bits/ 64 <192000000>;
+                        required-opps = <&rpmhpd_opp_low_svs_d1>;
+                    };
+
+                    opp-270000000 {
+                        opp-hz = /bits/ 64 <270000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-540000000 {
+                        opp-hz = /bits/ 64 <540000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-810000000 {
+                        opp-hz = /bits/ 64 <810000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dp0_in: endpoint {
+                            remote-endpoint = <&dpu_intf0_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dp0_out: endpoint {
+                            remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                        };
+                    };
+                };
+            };
+        };

-- 
2.45.2

