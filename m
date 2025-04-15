Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048921A952;
	Tue, 15 Apr 2025 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737665; cv=none; b=om8doGHzf2R3Dt3bSO+8OENilluGTmJClfdGjiaA6DuPMlH/M2+k2TZFT/ECH4kIFxVGar+MPU5sIQYHaVqDX2zKOh60/gXP6O3HUhJzQ/jHb5/c/diuj3NR0NZcKjhDBuLSOi0lDpsel72SriMrY7X3Az5fe5/n2EsqhXSG0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737665; c=relaxed/simple;
	bh=YogC5pr2hL+OWqcsJP5ip6Uo84tqBvA1fB7I5weMwGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cldFmBwwHu3f29PS+O1kxqfPjIWi+r/iN7Dg713EAJJeaH2YN7kYWKgK9ayOHKSgrH1bcbMJAw8osEMqgcejuEPWe899WESwk34FZD7T0wHmQa3YLrZRpKbs0Q7iWqxAtkOcmGGR6OVyr9uweUPQ7OPjPN+Me6iN7OH7WsjHgOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNGDzujQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNGDzujQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so50000755e9.3;
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737662; x=1745342462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=QNGDzujQ0VJL79D7PQXRUiSjxEnK79zSdnTpFl3RDJqeplhdd6rD2sZYeOYuDKZtzP
         0lxIh860pDRDuqn4Hc39ySK5quqtvWfEPmayunUm+NmTsdb2zWbiD4c84IQ+wxEl/GWn
         wdVD4Hl+haNhBZZm1zCEOoC01dXmwP2vLqjlFgv61LcDez0llet3iyYiEAxaGHLC+P/p
         NLGR84qgBYQU4ly8ZsjNjmIDO6v6pNIOmv3mjg72dP6xHH2ct8XgCfuVDSspDoZk+S9L
         a9uwMMLTRlvLfsR08+KCh4eJgj9jp8x+tb4CqM+WWlrY8lPXmw6d0zLdi0yRpDNvSYZn
         pD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737662; x=1745342462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=I8jeI7gSNNkxVfIPyosWWFG6hOMPnOf7Krhor+lOqj+CtYrYWOiJKLZgTj/ztTkrgm
         e9NhOZJ8UCp4HcxpIe6Q9dmnZ5PvXLk8fZ/vt4jpuPxYdpcHk0rBYvrQMhPwNKIT7OA2
         Yvn17CIfeUMutEuNH9Z3z1AeAPqiB2kavId5/qOBbuMx7ugUdvcvG2LOa+GRcN8Zba0G
         ylB604Y43JnkEq/g6FHHNVCypHmU6z+EW3eiP0KhaMbUD9wq9vIQqemti+Vbkv9ecyDg
         rNwOKht7Fa79reFiqDSeknrjr+Gyv0R2ikwxiBNu55/n9VEca2t37qBWfoy+jjctzRjM
         8VMA==
X-Forwarded-Encrypted: i=1; AJvYcCWRtKffAKcEDctpIMWL/ny7G+qQCnIApYFKaIbDQL6hxzp7yHIyo4JUwI1ObAz7f3FwDKyuDfi/MqxY@vger.kernel.org, AJvYcCWu8x0aHrG/uSEgz9uOmtffq8yE3O+F+VVVf3/gC4KyzioyDjgQM4DJMUGGDDzXDMXdIzRgEGx0WaL3xXWI@vger.kernel.org
X-Gm-Message-State: AOJu0YwJdHbPx8TdRR+NFOlu6aUnfa7NkkRXSoFz4TxwRQSXtj9Uw0rd
	YfFV9MurgBimi3nNiH79AgdKVojGEpBxAItyr0Mt6Z6RS5NC3Vj3
X-Gm-Gg: ASbGncuyax2NLrTMVPQKbuOIstzqK93bK+Cw6i1ehVg/LgeLES6m7ogxiVVb3LADSfG
	MSXXgZhDRUvEYSwtW95tLwDTf8wSsdG9Gfi93HnWgvRKjoUHhcKb2DveA+QdKZj2yXI8L5BJxu1
	72dcLO9Kmb/GFgQzEmSScfLXlbiA/p9FHFr2mi26A60tQZ8NNslF+XMAnyaj0O8o1ZheLvJMXbP
	PdtcK3n1GDUuKRrSZjka78rflVPwKGVzruuOq2KMnwB90cFotPMfEH/I4nfSMEDf3opMW5pD88y
	PunP8RKAl6WyaJA/ualxHYzLls3gLbNnaEF8lBEIKfonFR7n7wxKQqZ1aEqVd5SQtzhLXjO9aad
	rvd0=
X-Google-Smtp-Source: AGHT+IGexATWs9xYEDx7R0R1qXjf6CfWHffvaeNqe3O3HPpjBxVxTLS162TjpjaZJdg9rRYGMFbrsA==
X-Received: by 2002:a05:6000:18ac:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-39ee2769360mr251985f8f.55.1744737661880;
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
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
Subject: [PATCH v6 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:14 -0400
Message-Id: <20250415171919.5623-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..993293ebc4d3
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
+      First cell - consumer ID
+      Second cell - consumer type (master or peripheral)
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

