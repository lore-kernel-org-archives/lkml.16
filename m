Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417222D4F1;
	Tue,  8 Apr 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126976; cv=none; b=VMruTx73zDGf4JDyGgfHQSf5GvWWbx5EKGkIokOyLeGFoAfxr9N/psdTfuvlm2CpucTPwVXG6V32QaQFpNIlq95VSwOR8k02JBcZF1C1Zdy+iYvo8J67LCcUs/7dnYa4JAZ1bOnamelXdVKESrdYjU7t9u6LmgQeAmSlwICp7Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126976; c=relaxed/simple;
	bh=8SwzwiF3L1lLhZxn48ptrUsj4inEKH5uscaXsLfQ1bk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SUvwVeWmFFUFyAhTzzv+hrRbRd4jGzCQXGafvZFlsZAWONR4v0wJXeNly5IF2xpfZfwV4ijVY3Ni8E3Cp0tr/Tui3yHhtX8t7G3wy8PfpUtizRJGrqXRBAjU0y6Hpy8UnOzydtYA1i5LrAb1Jvpjw5tYKFx/rjPQ2zyqgG6EzL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJPTe422; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJPTe422"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so29865255e9.1;
        Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126973; x=1744731773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbtPn6g2ba6LqMlbQ/ymd85CrpL3SBE6bf/tvrNqLXQ=;
        b=LJPTe422nwEfn3JpyHcJUYLZoym8RAvtI9T1DciL6FTHI4+jpUCZElfIhKdw+bNl0q
         2Scc4DnD0Smhj1mZacOdH3lHct2BDknfmxxBl+oEN7wP5pZO9msEy43F4S1nLjULzOlk
         xrG+Tfyl1ZbT2QfTPddYaG98gXtwavEN5eV4t3E3ls7Inahx+aF0ZenZRDzLDTICpnA1
         gnGZ34sulG9k/DpJ8N/Cb+tM8F6dx9jUw8nqsDjtWnQBnF9ANW7vXypVPZYLR1u2APgU
         OezMe7X00/fdE1wHTjIuUh/RMV/rnkk19kIFzeQWUP8F1Bzy5oeqRy3mR/7n/5V6njyi
         3RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126973; x=1744731773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbtPn6g2ba6LqMlbQ/ymd85CrpL3SBE6bf/tvrNqLXQ=;
        b=V5Vk9QTpztjVyrm48nTdqrkFR+6WA36n5f/mHU1buUcsCHkbwQReGz+wDgaUsiZYns
         7+p86paaor0rIF7XpCmLZXNbw/pEQPEqmgPbJd0mWziQV8HnwXlj2iMCl34Z5L0N+GB9
         dynedGOHsx1U3UnqPBnMFDjW4ENbK9fWM9IE+5i7OA16oCC0kA90/H4/b2Baaoiv7XAc
         VdW223cepGLOfhmgk5vX/60kSvprds3E7pcVfufI9hhiuvlY3+c7AdfjWLhpiu06vdXn
         27uuPPmOuXQXyo96myshBHZim5YqtFHhmFPfaKWjPmFVqfcj7l6Ue7FKytGGjhS+DG6Q
         SD5A==
X-Forwarded-Encrypted: i=1; AJvYcCV092kYhxI/kLXJrRu0aPnB8AfT5jlTzF9kvVjd1qWW6B485eHJGAx4g3xPwG4+Eq0hk4uQLgJqurNf@vger.kernel.org, AJvYcCXa8iteguSKvi1fouW9jMhwD3PAJpAoVSF/FLPhGkRcdvxQfGodvozs+R5+69B8JdzTD5BTSzWN2gaRvexK@vger.kernel.org
X-Gm-Message-State: AOJu0YyKMTAKfQPEZB+gHRSO6Uu7sRqPtRFL/WCQ1qcwg4RdzZQFH1Po
	qutAyUcfKoR2zoxyB233RcqS+ItvM0JeylMRjPaXfw7MPwSDt1x4fzz9QFFf
X-Gm-Gg: ASbGncsOZRz2tvZ5DfrmWimeiIMZOUJT7+UBRjobxDgSwtni7tsJrB3y2UPFcGdUY+e
	TcKq0oYTgOFfDrIRPFPum91xdQSkJC9zaQ52ZJx8iaP9fy7ASRN2AkfXOyU7Ox5pXwgB08RRax7
	B4P28is0n96//U+YFvifjTjcGCLKSrwpLqnew/2vxEhuNDAiir8E2U6flyXIfJuf2cmNUn+H5Vy
	Te+K7+DydxeKuuXXiSP4vKOvx96eMK7/15rDGqawRkM8JDq7JjypIlEX3FirnC4HENsqoxoshCg
	r8dka804xCk8aoR9x7V7SQ1MMaZUd9fyG+0rx2y/J5MtQVdtPwf8wSsCNmeLnUaqumco2uB+t0b
	Ux2jkwFU=
X-Google-Smtp-Source: AGHT+IFk7cvDwgAw3nFZfm84dQ1FS2LuGuxYv+hFlv1TribSda71cj+K9r2JkQI9n5O3/VthOjyvmw==
X-Received: by 2002:a05:600c:6986:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43ecf822cf4mr136552845e9.6.1744126972777;
        Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:31 -0400
Message-Id: <20250408154236.49421-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..3e2ada7fcdf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
+  transactions to IP Slave peripherals. Additionally, this module offers access
+  control configurations meant to restrict which peripherals a master can
+  access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 3
+    description:
+      First cell - consumer type (master or peripheral)
+      Second cell - consumer ID
+      Third cell - configuration value
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30df0000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30df0000 0x10000>;
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
-- 
2.34.1

