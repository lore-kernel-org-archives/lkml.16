Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629C228002E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537030; cv=none; b=nznnbD60EFNicgkuqNTVnyoty96osNWYwTg7RQ1TlGb+eVQfUGiZH7RytNjoChWQhX/Txa+bCpLdLK3J33s8Td7n4zY1fB5Z1C5gx7mvw2hNi40u/8+wIq0lQvPALOZBnY9KfGHZsEIBnQIs4GqGDaUK4JTYLsqzKbOauRTCZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537030; c=relaxed/simple;
	bh=oTcDnSI1bNVQqjBsPCRTQxoefbYwyIGZKDofCNxpi+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hz69YBVUJB4fdnFpJI8JCC25obuj0blsw4gnXJ5aSjW6Snb/FGfEiImAiLJKtt5cB0tJDNYkLq5bPUY6RFUttHSknGdobS9ZIQHWAX0HUC+YlwGA/z3SdGS3I0dyUkRBK/+0BHxBrhnpzs6MOLwMEloJfTyCmFefGWq9suMnJ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4WKFFdK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4WKFFdK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441ab63a415so56549265e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746537025; x=1747141825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Iv8onXZwEMREo5qlPvqBSmY6LEmZfGy2ZM9zSxD9OA=;
        b=a4WKFFdKS8MVw21zsMcTol8MZQl49WtmzRvMReUEFRkt5/um+olhpbKiolV6TpcvJU
         nLIf9qEEMgAi2n0f3eln+MDaG3oEacH0XJotjT+P6BH7QXa+xes4/5wgwcctL9zYqInA
         CbccGZlAp1XZl1CaNqgs/xDcr1ZDU4w3423W4czWtcItiFRmEyVeQPAIvPIVNTnPb5Gi
         oUBv5K0awT4KrM8oGzSjwvHnJMISOg8miPL75Kn59S2UVRrHPzL4fglayhBlDnHaCJL6
         ejBr7wILHBDQ+W/IuOzxgxxjpEWLAY7ITVDlDauZ2wstguuReERnp1g1hd6mLRAJ/Wd9
         AY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537025; x=1747141825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Iv8onXZwEMREo5qlPvqBSmY6LEmZfGy2ZM9zSxD9OA=;
        b=Wm7B5piQRdFBGh5sc5grSyiVB3P3/Z7VXhWAmmff5iytdUSGHImwtEURiul3ZBTJKT
         6i+1zzrft/seEY/pOdEiuRvL0zw/SC0sbfPCDFvaPeqVGE+N6ciuAfZgmFuiKRXImXG7
         FISUemm0sqxoEKOlwKhGRc1E+QyvzQjR4BB2Id220e8KSBAG/GIuHJj8TkbgVPONeA4S
         nTLuJ9c8MDN5xS/5TNqK7aMjl9TWc7vrg27YeApLsnj4Invx9kdd5vvicMZXJRvMZkk+
         tlh8C/ikGWuggO6V/xsg2e6JT4D6rx2IOiQgPL3MVSt0qGF46zvn5U0Ozi4Lth552dJu
         EQMg==
X-Forwarded-Encrypted: i=1; AJvYcCVEdqi2rg16QtP7OiWVSZW+L8/wO0LjcE89Rj2cX9E9Dd92ZtyUrcvZ117oXn/p4miMh/ysPquLbG/22qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTThuUTdncneR6sq8dhd4nOnexjyJFvJf0bQ4Tk3C+IhKQaEAi
	Va9mo9w0tfEgoqFctS1FYp/sb6i6YJKVvWq/sL5ak0vXqYlzI51ffIsMbj/8B+4=
X-Gm-Gg: ASbGncvKwDkunSMbuoz2Va6Tx8QDD0p1jinjvayNJ/DtCTECXgu2roLQwdu1DwkJ3RT
	H7veRW5UaBo73EfI1zrSu6tEmXjWi0fRYfYcbo0/dK+6Q5XPnLLUauk0SBQLdoYgcFGS14alacT
	O93vIEq+uKoRCm3Awa2g5/omwRl6JIHwS+aRit9a8vq7T/QH4OLGuKokFZ9TCVstXoT28wkwyRQ
	jVj5lLXrVR7E9AF8SBbM4wwtGvJVvvzhJgIcwdd/AZLhvc3GWznOZJ3lB6z1EbEm7CmkHG3eN0O
	xlegfavNC0Ln6sdB9KpAREqpUDm7Fjxa63sWJWexgTa9lSE8uIap4xc=
X-Google-Smtp-Source: AGHT+IEHzp+5y+s2Mm6GFfK8W7K4y8+KiivNWsSPRroJGQvmgcFnvlH4/ZTzSgWez3LsluqXUbVrRQ==
X-Received: by 2002:a05:600c:3b17:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-441d0fd348dmr21279125e9.19.1746537024283;
        Tue, 06 May 2025 06:10:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3f93:4614:996d:f5f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0af3255afsm1771268f8f.66.2025.05.06.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:10:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 06 May 2025 15:10:08 +0200
Subject: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node for
 clock-controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
In-Reply-To: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2

APCS "global" is sort of a "miscellaneous" hardware block that combines
multiple registers inside the application processor subsystem. Two distinct
use cases are currently stuffed together in a single device tree node:

 - Mailbox: to communicate with other remoteprocs in the system.
 - Clock: for controlling the CPU frequency.

These two use cases have unavoidable circular dependencies: the mailbox is
needed as early as possible during boot to start controlling shared
resources like clocks and power domains, while the clock controller needs
one of these shared clocks as its parent. Currently, there is no way to
distinguish these two use cases for generic mechanisms like fw_devlink.

This is currently blocking conversion of the deprecated custom "qcom,ipc"
properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
  1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
  2. The clock controller inside &apcs1_mbox needs
     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
  3. &rpmcc is a child of remoteproc &rpm

The mailbox itself does not need any clocks and should probe early to
unblock the rest of the boot process. The "clocks" are only needed for the
separate clock controller. In Linux, these are already two separate drivers
that can probe independently.

Break up the circular dependency chain in the device tree by separating the
clock controller into a separate child node. Deprecate the old approach of
specifying the clock properties as part of the root node, but keep them for
backwards compatibility.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 169 ++++++++++++++-------
 1 file changed, 118 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index a58a018f3f7b9f8edd70d7c1bd137844ff2549df..3a0a304bb65a68b2d4a1df79b3243ddac6bf88b2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,6 +72,7 @@ properties:
     description: phandles to the parent clocks of the clock driver
     minItems: 2
     maxItems: 3
+    deprecated: true
 
   '#mbox-cells':
     const: 1
@@ -82,6 +83,23 @@ properties:
   clock-names:
     minItems: 2
     maxItems: 3
+    deprecated: true
+
+  clock-controller:
+    type: object
+    additionalProperties: false
+    properties:
+      clocks:
+        description: phandles to the parent clocks of the clock driver
+        minItems: 2
+        maxItems: 3
+
+      '#clock-cells':
+        enum: [0, 1]
+
+      clock-names:
+        minItems: 2
+        maxItems: 3
 
 required:
   - compatible
@@ -90,6 +108,76 @@ required:
 
 additionalProperties: false
 
+# Clocks should be specified either on the parent node or on the child node
+oneOf:
+  - required:
+      - clock-controller
+    properties:
+      clocks: false
+      clock-names: false
+      '#clock-cells': false
+  - properties:
+      clock-controller: false
+
+$defs:
+  msm8916-apcs-clock-controller:
+    properties:
+      clocks:
+        items:
+          - description: primary pll parent of the clock driver
+          - description: auxiliary parent
+      clock-names:
+        items:
+          - const: pll
+          - const: aux
+      '#clock-cells':
+        const: 0
+
+  msm8939-apcs-clock-controller:
+    properties:
+      clocks:
+        items:
+          - description: primary pll parent of the clock driver
+          - description: auxiliary parent
+          - description: reference clock
+      clock-names:
+        items:
+          - const: pll
+          - const: aux
+          - const: ref
+      '#clock-cells':
+        const: 0
+
+  sdx55-apcs-clock-controller:
+    properties:
+      clocks:
+        items:
+          - description: reference clock
+          - description: primary pll parent of the clock driver
+          - description: auxiliary parent
+      clock-names:
+        items:
+          - const: ref
+          - const: pll
+          - const: aux
+      '#clock-cells':
+        const: 0
+
+  ipq6018-apcs-clock-controller:
+    properties:
+      clocks:
+        items:
+          - description: primary pll parent of the clock driver
+          - description: XO clock
+          - description: GCC GPLL0 clock source
+      clock-names:
+        items:
+          - const: pll
+          - const: xo
+          - const: gpll0
+      '#clock-cells':
+        const: 1
+
 allOf:
   - if:
       properties:
@@ -98,15 +186,10 @@ allOf:
             enum:
               - qcom,msm8916-apcs-kpss-global
     then:
+      $ref: "#/$defs/msm8916-apcs-clock-controller"
       properties:
-        clocks:
-          items:
-            - description: primary pll parent of the clock driver
-            - description: auxiliary parent
-        clock-names:
-          items:
-            - const: pll
-            - const: aux
+        clock-controller:
+          $ref: "#/$defs/msm8916-apcs-clock-controller"
 
   - if:
       properties:
@@ -115,17 +198,10 @@ allOf:
             enum:
               - qcom,msm8939-apcs-kpss-global
     then:
+      $ref: "#/$defs/msm8939-apcs-clock-controller"
       properties:
-        clocks:
-          items:
-            - description: primary pll parent of the clock driver
-            - description: auxiliary parent
-            - description: reference clock
-        clock-names:
-          items:
-            - const: pll
-            - const: aux
-            - const: ref
+        clock-controller:
+          $ref: "#/$defs/msm8939-apcs-clock-controller"
 
   - if:
       properties:
@@ -134,17 +210,10 @@ allOf:
             enum:
               - qcom,sdx55-apcs-gcc
     then:
+      $ref: "#/$defs/sdx55-apcs-clock-controller"
       properties:
-        clocks:
-          items:
-            - description: reference clock
-            - description: primary pll parent of the clock driver
-            - description: auxiliary parent
-        clock-names:
-          items:
-            - const: ref
-            - const: pll
-            - const: aux
+        clock-controller:
+          $ref: "#/$defs/sdx55-apcs-clock-controller"
 
   - if:
       properties:
@@ -153,17 +222,10 @@ allOf:
             enum:
               - qcom,ipq6018-apcs-apps-global
     then:
+      $ref: "#/$defs/ipq6018-apcs-clock-controller"
       properties:
-        clocks:
-          items:
-            - description: primary pll parent of the clock driver
-            - description: XO clock
-            - description: GCC GPLL0 clock source
-        clock-names:
-          items:
-            - const: pll
-            - const: xo
-            - const: gpll0
+        clock-controller:
+          $ref: "#/$defs/ipq6018-apcs-clock-controller"
 
   - if:
       properties:
@@ -179,19 +241,7 @@ allOf:
       properties:
         clocks: false
         clock-names: false
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq6018-apcs-apps-global
-    then:
-      properties:
-        '#clock-cells':
-          const: 1
-    else:
-      properties:
+        clock-controller: false
         '#clock-cells':
           const: 0
 
@@ -216,6 +266,23 @@ examples:
     };
 
   # Example apcs with qcs404
+  - |
+    #define GCC_APSS_AHB_CLK_SRC  1
+    #define GCC_GPLL0_AO_OUT_MAIN 123
+    mailbox@b011000 {
+        compatible = "qcom,qcs404-apcs-apps-global",
+                     "qcom,msm8916-apcs-kpss-global", "syscon";
+        reg = <0x0b011000 0x1000>;
+        #mbox-cells = <1>;
+
+        apcs_clk: clock-controller {
+          clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
+          clock-names = "pll", "aux";
+          #clock-cells = <0>;
+        };
+    };
+
+  # Example apcs with qcs404 (deprecated: use clock-controller subnode)
   - |
     #define GCC_APSS_AHB_CLK_SRC  1
     #define GCC_GPLL0_AO_OUT_MAIN 123

-- 
2.47.2

