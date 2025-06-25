Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC928935D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842735; cv=none; b=lBdM6rkBz9LyHnwr2qG5/PP+Y1JSpBmjqAxNE81I6FjX9oIeFQUjiMXtupqDy8oC2aZUvaScgv9ONnBEHbBLnuLkFWws5DoI56duKSa1rah83Vd8bBnR6b+mzhDxx4DuN+jCQMCe2S/LfEG2x33vl5nj4H6ErRgwpPujRjP+y/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842735; c=relaxed/simple;
	bh=RaRzw6dXCJL2a9k5hvxU0+bR/+k0pdf+af8dr1rsdY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSycXsJ4eZ/f1CTiKhNFio5N7t55UpZMdKmISPnAoyT5p0FSrmqkAs6kpUWpZC6oQwaRfZs8RjayOrbOs3gOMnWNN49wkaot4MFRlvG5sVNjS2EzAyhIJg9OnYGzBTjBk7aWvX3FsH+FqBRyKGS12EeyxWXuP/TqGfCSMLIrwPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C0h0TO/N; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C0h0TO/N"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade4679fba7so239124266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842732; x=1751447532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhGXOCwUIIm3q7C4tiBl1iPL61L8WtrCPnBevMSMH/k=;
        b=C0h0TO/NSnGYHx6oVRFGx96zMRCTNAX8+rovFPOjimSGNFu6OH1gxBRRJp+rX4lzro
         9DgpY0aupnWSKi9/BihpzPa+JPqa48KLsF95Pc+muYF6CmygF/OLj2aHiCXAsbLBeoxY
         7TQwfHTXRoRLl9GG2v+ihgqzFrALYN5kozM5zd5FPgBoopabO6mdctDYS3WABNqvsYok
         b6AZt8juIMzfpqvO5pNpd5jv6vzFq3GupSry4Suz30iS803hpnhK+CBm8N1bj95j5j25
         XZcQ+3BX8RG5sSrA+TiVXxsLV+2JivWsAoPyzhsXQMxa1ECyA6C4pj4yOSCrJJivmM0F
         toqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842732; x=1751447532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhGXOCwUIIm3q7C4tiBl1iPL61L8WtrCPnBevMSMH/k=;
        b=ecFxbTjnfUtSomkdcZqcQpzovAbFDhUNcXsBNb0tdc3ikGHjLuWi3owOta6/nNPrPw
         Rz5+GQWbyc8RB5WfvxTFTCBZZb3zjruGIfA7YZ9n8wxLCWi9/xAqU8v/3OzTOC/vIAXE
         1LGzgdk1hrQ4LJAvQu5D4flUTh+ytUavUxs6h5yn/X5XxG1Pjw9HM6TTDdW+RBKCQM5/
         zi+PVyjC9SwbfcMD/i6uOmkfetKpbyypuXhRxnMtpoAhVVUnTUGqggohDdZP4DP2lAue
         bInuPap9ycyJYPbFhZks6u71RuSmbqzFqnSbC5MLZCJSIUMBWgsDn6OJ46i50aHAOcQZ
         3nnw==
X-Forwarded-Encrypted: i=1; AJvYcCUC9JSpkdgOcLaP56TFt+VgJ9JWNuKA5DPGm4TGDQa2ZkKYYFtnU7amzD9RZrrvvBBXnXOYEACMC9Q3nCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdx+ZzwRBUAqJ3Ql0MB8NpfzVhFN/hBo82+Df0h3813iwWQ7PT
	aG5VYfVmXLqgN3A4JXpxmed3SJ6Es3bvZOHgSEtY5ZNlUUvzhKmjG4Vyr4VC2Your/w=
X-Gm-Gg: ASbGncujlHki8LJ5HTF5xgGx7lufHCoAeVOcimfAZJuJPwPrWyWIdkTECCR+iBK4y83
	7cPt94qQmbcMH+IlcB06DD75otpIqG0JTYIJWAahqx/n6ZJdRPDy5B3+3XaLsEhrFi6cxqtR2Xl
	OOdHtdgfLgsSh+gJ8fXXwdT+0k9zfiEzmuICke8X+/1d91Be1zoc3tLOfb4f4Wm1osi5vt7Qyxv
	MAYKDDuh+CwrpRRpM6HoO0PSoA8RSAyGffMXUS30kU2AzuGar1WZLQ6EaiqlduBgksdyHUlkvEx
	5i0OpN55wAnmsLqvUkSvnyGslr9rtETDPlmr8Z3QrlxC68MjQ5myBNKjDjEWBeDK2BfQclK6hAj
	RSGzOLo0egpYTP67QaiMqR7+bTF6C8dAF
X-Google-Smtp-Source: AGHT+IE1oWXGY4HO8JEBpv+rAFTtTGib8QOzMGNtx07dFqJ84auma6a3uiljCpQCQ6UGKmu0qGojxA==
X-Received: by 2002:a17:906:13d6:b0:ad5:5302:4023 with SMTP id a640c23a62f3a-ae0bf1b4672mr183241266b.44.1750842731622;
        Wed, 25 Jun 2025 02:12:11 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm11076666b.135.2025.06.25.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:01 +0200
Subject: [PATCH 1/2] dt-bindings: pinctrl: document the SM7635 Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pinctrl-v1-1-ebfa9e886594@fairphone.com>
References: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
In-Reply-To: <20250625-sm7635-pinctrl-v1-0-ebfa9e886594@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842730; l=5132;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RaRzw6dXCJL2a9k5hvxU0+bR/+k0pdf+af8dr1rsdY0=;
 b=Hw4UUO+Dq6YorSBTgZPlUoorQaQ2mlwSLSDO9Ph86H3s4P6a7+aH/XwyLuYm33n1h9EJeLjX/
 33d+KDe+oPPCv4aX03HOvAG+DecuEwnEvzFgih8PKN1UrGiuLj/vOHX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Top Level Mode Multiplexer on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/pinctrl/qcom,sm7635-tlmm.yaml         | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3f49239efb6e866015b40e3477a8bd0edd21b1fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm7635-tlmm.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm7635-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SM7635 TLMM block
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM7635 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm7635-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 84
+
+  gpio-line-names:
+    maxItems: 167
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm7635-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm7635-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm7635-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-5][0-9]|16[0-7])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ext_mclk1, audio_ref_clk, cam_mclk, cci_async_in0,
+                cci_i2c_scl, cci_i2c_sda, cci_timer, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
+                ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws, ibi_i3c, jitter_bist, mdp_vsync,
+                mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, pcie0_clk_req_n,
+                pcie1_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
+                prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti,
+                qdss_gpio, qlink0_enable, qlink0_request, qlink0_wmss,
+                qlink1_enable, qlink1_request, qlink1_wmss, qspi0, qup0_se0,
+                qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5, qup0_se6,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6, resout_gpio_n, sd_write_protect, sdc1_clk, sdc1_cmd,
+                sdc1_data, sdc1_rclk, sdc2_clk, sdc2_cmd, sdc2_data,
+                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tmess_prng0, tmess_prng1, tmess_prng2,
+                tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
+                uim0_present, uim0_reset, uim1_clk_mira, uim1_clk_mirb,
+                uim1_data_mira, uim1_data_mirb, uim1_present_mira,
+                uim1_present_mirb, uim1_reset_mira, uim1_reset_mirb, usb0_hs,
+                usb0_phy_ps, vfr_0, vfr_1, vsense_trigger_mirnat, wcn_sw,
+                wcn_sw_ctrl ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,sm7635-tlmm";
+        reg = <0x0f100000 0x300000>;
+
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 168>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        qup-uart5-default-state {
+            pins = "gpio25", "gpio26";
+            function = "qup0_se5";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.50.0

