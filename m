Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D02BD5A4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842767; cv=none; b=fJq/mvH3lCi7vBT3DiiWgl4+RNJNXmO+Ldzh5cGCxg5I0HBUUUNcp7luVe1zHEj8lhzznWVdCGTpbboyEeAdGEHW8NmDU3RsenS870qlc8pCbphXv3nV709s+ouQlPMxVRCVGursIKbPEL2ULUFNepjuHpu+/l70Gtw5T1M5Ayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842767; c=relaxed/simple;
	bh=Y9F/e6dicZGN3H4g41Qmi3nJ59/DcdHmY62nX1l3Gag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDmy1AP+zJU5ZENttG4wF0XBdQjE/XQ5cX7ynoe9XVBYNXehW9Y2rxSljBMz3+ad7BTo4IwuG2IzeBYLaIg4890s550GUSf7JI9n9uW6qBV7+LOyMwaxRN+PXt6W3AN1jJqFXFUcKouzaMuVvcybyPRYno2GQKQVQh8ot+o/c+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KytQEz6J; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KytQEz6J"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so274235a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842758; x=1751447558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEUC1GsQ9aW/PL1OvYcG63di2Amn9awZJQPmv6C0j0U=;
        b=KytQEz6J5f6O6ENZ4fkF12zmHzQ/fCzJftM1bu+wvCe7ylPWqfoQMCeJtoxYw0RRM7
         flSyc9q1Vq2EFYAu0wDeio4Ckv0FiErFCt6P3yBEYAPaaId1gopgSFlkGXidINTjc7Cp
         qkv1Lt+eaLZfeZVQpsWP8jQJoMAs3KNqDEGwbX97VvKYmfS/UnbUurDg415WVgHqoqKx
         elbQzGjZwngCZHsrr/q3yik1ukohJz6O27WENtU1j++s3YPE285ijCFDe1bpkVUjcjaB
         y9y/07loBBcwf5j9co2WcQAsy3xjtnlDjVhShPf5dx+ti8aY29jWGNLeaYC0a41iOQg9
         1BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842758; x=1751447558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEUC1GsQ9aW/PL1OvYcG63di2Amn9awZJQPmv6C0j0U=;
        b=cW9K1fSULAVEpX+008jZP8JiGS2dUCK/RUWcyNRIyvYh/n2huIGA7mX4+MZj5g3Vjb
         UYV0PffHwFOJzVxn7HZdL0L9B0a5Mn/AxbM0zPQv8CVKDNZV15sBBM1Kkn/dqUiE6/bR
         QAGHyUd1WB+9XHh8D/WKmQJdpZXM/p4ZLmELgFrqhiivX3ts9iLs4iKCjDdkanmWqxNm
         kWkRrutOjYs7rxn2F5zKDsc8rgXHar5dEq7YcO+/eYE39aSogxrqIpdRjnG+Dlg2bE/j
         Ize4rZN8gYtTJUJSmaHmpd7dXPXXF+ADOMu/D0TSQseOvEkRlS2BqGPfA7P0b2e3o0BM
         OeDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSreTj8vQHJHYAjxKd2yuREQC0015UyOlI+PG9gIDeJqBywM6QMPaaKaUhaNU8iG2jQChE+wKYAEwES9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PEieTSFAyMu5xwV4+te9zCgDyBiKBTn01HGhAVXW8wKN1f9d
	5KBV1lpSGwEN8GvXD2a1FhAB6J2q34uPjAp6edpHNITo3FTb+uHnzpQ4UfRAuXS8bkQ=
X-Gm-Gg: ASbGnctJ6GFa1VbBEl4C8y4NMGhuKomvK5U2mkAi0M3WTDk3GMnHgbbwLYSK1aGXLZD
	H6T5170BpWPYW4dMthANT8yf1H1kXOyo87S0ayX8bFRLiHY1WNt3JMfqXY3nrZRLS9I56wme9BN
	Y0kfxQ/whn2gSrug2Ob0HaD62ZijH7B6beSyrjzzY1qG/PqKZaZciCl71figQVYSJDlO5smlc6F
	6J+sKyvMFYjjZPmIeQdWjoMYjt71px8saBPkc3wCjdgDHLHzXYGYBCJn+kc+Gp/Jb1g8opJxE2X
	VUIz6CG1IDPNXQc3kd06O+KyUxfR94KzYNDNElf3Eo3cM5kqed5u6gg6dZFxDolZtrZJRn6P+oV
	4Q29yS54TczIu+ovj9Nwlinz4gcIHEz28
X-Google-Smtp-Source: AGHT+IHWx2Byt1D7Ev143Q/5KsBqXnkbdTskG5+royIm6iVQCN0VuWJNzssimeKkNapJed1YIyKgag==
X-Received: by 2002:a17:907:9688:b0:ad5:34cf:d23f with SMTP id a640c23a62f3a-ae0bf019daemr222194066b.21.1750842757797;
        Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:27 +0200
Subject: [PATCH 09/10] dt-bindings: clock: qcom: document the SM7635 Video
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-9-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=3535;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Y9F/e6dicZGN3H4g41Qmi3nJ59/DcdHmY62nX1l3Gag=;
 b=AMHHXFNnJ6Ll+3mffP0MiXjndN5s6haTHL7MeIv69HRFSzP/4lEvoQUN4OZvjidrFyajoGU90
 l/QBKmOSX+cA7K9MvCsHndDtFPDUWu3Ol4jSXQ1NbtaxhwH83+Lwp8P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Video Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm7635-videocc.yaml        | 53 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7635-videocc.h    | 36 +++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e893c37ddd0ee4fcc9cdf9faeaca75eb6a29c0b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7635-videocc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7635-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on SM7635.
+
+  See also: include/dt-bindings/clock/qcom,sm7635-videocc.h
+
+properties:
+  compatible:
+    const: qcom,sm7635-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,sm7635-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm7635-videocc.h b/include/dt-bindings/clock/qcom,sm7635-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..5461250792c30e216dc812db722562fba7e40dd2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-videocc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM7635_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_PLL0						0
+#define VIDEO_CC_AHB_CLK					1
+#define VIDEO_CC_AHB_CLK_SRC					2
+#define VIDEO_CC_MVS0_CLK					3
+#define VIDEO_CC_MVS0_CLK_SRC					4
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+#endif

-- 
2.50.0

