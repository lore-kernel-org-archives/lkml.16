Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003B2BD02A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564377; cv=none; b=VBDoS6YN8bEAgtG1q+DKJ/zVR/Y9a912e411px4WdDiBrAPZmOg6leVLNoSEpVGe43dCnamVKAA5rxaJpS0f2DpUKxILdJZnddG7v4m+Z45I7iec5Cbn4UdmyEiaK/f/bP6AqC3C56z6YlGpihbszBv0b+j/HCipklNUz3lP5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564377; c=relaxed/simple;
	bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2+30NklACp4uGbDcuBvd6sQKoIbK+wFhtlpeE+FSzC1s4AQmA9FBLBqbcsPgd+cDtvgu803uW1KE8oWo55zA89SPhBlsBZXkkMUm0oIbTg3N3gQUUIhrUv1a7J6t+xP7EqfjSFOs3WrdYJxFyDIgQZWrfOfC3J0hgjOGjQ+v6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZzPMsubV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZzPMsubV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso482441f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564374; x=1750169174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=ZzPMsubVZdY4cV6Ulz04GukjnEDnr4UeTyPf7LWUnk0AIJ7zLNc3N2VmXlmCuspcm0
         Q4pOVI0TuvkwFM4Et07rIxjrj6w+mupTlShaQv9ytkaV7ILvvJyMaKiHBXr81/JOkHM1
         OVbzP67Q3qlXB5uX3IjDCQ6HCEr/KJu7cLOOBuQ4RdMa2Szgvq+0xfmniaikAJc1qzFu
         LPWFZbSG2o0zc0Jot6rJl4jowkYof7ZQGmGEAb6fnLIFDnnqNl2vf9Ps31XbMQloeQre
         VEl01W3IjWebotqbMMeTBbXkcWjken86Xhid17kH/C/mTaR5YkN+nsudH5OLqfsgOm+j
         o9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564374; x=1750169174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=GlwbjawefsjL66cBMBg9z+QdhsvBfkjQ2ZBGdd9pJ8A9LE1NIFp06zYL+eoRw4dbZf
         cMSjzg2pLI6tI6bGWWrWRaXsYazP06WT2PgQd8p3WOZG7sgpz/fdi95KNnjX+CZtxgDt
         iWfpy9rf1vUDjNUACdtuGiLjFVD2LlK+E4eFiTIIp22ZF6PN0kfkmlnyDRi6+akCa1sC
         Q5t5N/nCdqh9N17xaacgCSuoMR6sFi4RjghAyxuGbA+hjgixBZcLzEfdWapKRduVEVrc
         loVlLuhh75w6tYXNMKPTXLSEHtig5kL6jG4F5zOOE7pw2+7bLRKrN2WQg/KNxT7VZzaF
         qgOg==
X-Forwarded-Encrypted: i=1; AJvYcCWOmTQISjFtoIpIiPPYcEyvNLQi/FvvO0tBUCzJ9G8SC+V3GdGJcvpWMG2TVBgumdnLC2sVFTrvMXmhUZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1KlQqWrPRAH88cmBy3KWTGI++WlGz6jbjE5sdVT3oTW2lk+c
	GVy8Z8KvCmalifYYOglKGpEaiWe4QsYp7YsRaq6RxiERegllvq8WfKGpwa8Xt/79rkE=
X-Gm-Gg: ASbGncv6bOiYl/JHmEi55u2zb+pRWy1osqtgGDFMTtFJZZC5dgT63lPGo0ddyW7ynEQ
	4phUx+47P3yRcIxjBdQIPsl66nVwcGFh3I0/ftaNN4bgP5VKgtuAdCljCGp8RqFwl9+1RCvHBTX
	K8iiHGcvRAWIAlmGRd9hvRtiOkM3PGEKgZQvk18r08SIDaxcx2uEpqKyI10qqlIGMDUZ+ApZwtR
	SlXF8ru4dVwoOXjhqI+lQFg5BSBbEjVkc3fvkyDul/n6y9QeG0b3K2GFRE6HmZXJ08WVbBosfQm
	fc9w0Q/HOa8n7jI+cYPXJqE052LkoC2sR6xR3ESzBJwDjCRiWkonf0dpYZ7/QYyacxUZ6LRGb2s
	9gMxUZA==
X-Google-Smtp-Source: AGHT+IE8m9vNXCXJib4lvAobDyKN92NL9hduxtJo+sH3CDc8emVv2Z83tmvOkDG0E5rFAG5xNiixzw==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a533143257mr4846738f8f.1.1749564373627;
        Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:40 +0200
Subject: [PATCH v6 02/17] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-2-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvAnTGYNiceDs1Si8NBAvdNZ2GTuc/x9HM/Y
 lE2QCBPEAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wAAKCRDBN2bmhouD
 147UD/9+eGofQl+6iI1dCqHNQL6e/FHxAyir4raIkr/ZKhgiqQ+7u3O0H2x7OT93P87jrkpqB2R
 UaVvdIKwpUWxgpfm6d2F11C3UglzRoRSdCyXnhww9DNf7eT6K3cbo+z0dn6IzNP4qbZZSI2t8Gu
 MWoDfbuZReYnQtIeCEQcgFleQgDseodzVg0GCDfhmZy/U2eodJl+4QlcZjEnGSRnOFa2Oo1CDZt
 TO8HPNl3xapxWyLr0bvm8vk6dD958R/zp7vAHHJbOnK1hwjCvDSPc2W14nfSN4NX7diFmtH8nTv
 /zVTfR0d5qk658B7xhVxbblBBsWGoVx/SvuCXtefAbF+Vig+hWWoXumGDVqU7K1CC4IR0klqH3s
 6Il4oDQNwi7MxtYR7fwVSUbinD5hpyYKFxOKemFT80hsqYL3Puvp6a7ob3t105q/O0QcLTaxEQl
 vcPUS6rGrs9vTg9Ba6LTXntsyGrJ5FHP8/5304ffFk8VUctdk601pzvj/ui9veGw8Hzd7awYem7
 7XTBcecsFtA4mOFJ0LcctlOeg+/wfLGWvY29oKYd9QrvWF4083FSeddw14msEaQPPCZlMENPSQx
 JaN1Nc0lvlYfnvucJuYFyBLsqra6/i3BfwVlQZ5EDASlk7QOiw+xi1PkH1QGZHK5HS3Oo05qtkI
 E9+5mL32MqGToSQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI controller for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

It does not allow the display clock controller clocks like "byte" and
"pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
configured (not prepared, rate not set).  Therefore
assigned-clock-parents are not working here and driver is responsible
for reparenting clocks with proper procedure.  These clocks are now
inputs to the DSI controller device.

Except that SM8750 DSI comes with several differences, new blocks and
changes in registers, making it incompatible with SM8650.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 82fe95a6d9599b5799549356451278564dc070de..d4bb65c660af8ce8a6bda129a8275c579a705871 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -70,11 +71,11 @@ properties:
        - mnoc:: MNOC clock
        - pixel:: Display pixel clock.
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   clock-names:
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   phys:
     maxItems: 1
@@ -109,7 +110,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -218,8 +220,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -244,6 +244,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -266,6 +269,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -288,6 +294,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -309,6 +318,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -346,6 +358,35 @@ allOf:
             - const: core
             - const: iface
             - const: bus
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 12
+          maxItems: 12
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+            - const: dsi_pll_pixel
+            - const: dsi_pll_byte
+            - const: esync
+            - const: osc
+            - const: byte_src
+            - const: pixel_src
 
   - if:
       properties:
@@ -369,6 +410,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.45.2

