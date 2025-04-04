Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BD31B0F30
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743805265; cv=none; b=JrI6/EvANGdFa2lTrTElqSTRqfBGhgkw0A3M/o2zHOYvQo3dxDMPjfuK2uYvDyWGDbPRDcpKHloFRMVXEuWfBxVovLnwU6DB03cnLdbNStA7u0sE5NMnF1bGSO4OdzLw8DrpSs8+2H8ahmffPCuuqDdkXfetozQhraY4BHlDlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743805265; c=relaxed/simple;
	bh=3uH4tvjBPnx4gaa48u4FI/xGYUeMBE3CMNtQzPHoCho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sQhF4WdDtluocO6qwvErTwK5uZJyDx9OcRbKfvgxyzx0z9m/3wNu8Sdb6HJq1o3QW/8hEqRXuplFZnrLViIX8iAFWWmyywvreF32m8E96PrmES9T0fro+cxB9PRY7QDGGH9UDPgsvfEtxw6X/YFGQHwutKU18/lgntyQpnXms7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IfMKQsbO; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IfMKQsbO"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-603f3d42ae8so1013850eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743805263; x=1744410063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xamkw/RUwYxipIOX+uMdTaYq5cvNETr/5FWqKWKdeVg=;
        b=IfMKQsbOaeDFl/3uBjBDMLqRXZQOjkvSC98W/m6tCV/pdU7r9F7CI0goKu5crMy9sY
         30El0uimCGU3440eza5GfSXdWRwKzUQ9U/xy/OCXt99QaQBPLJPZU4m7G/iVDaz+91Qt
         /tqdRFpn85divMq1KDEqE40gx1weqFZFhtGus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743805263; x=1744410063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xamkw/RUwYxipIOX+uMdTaYq5cvNETr/5FWqKWKdeVg=;
        b=hQlQj24x6L5/cnCQWe6qkJ2qwzAphB9qFPdHA3Cs2PKL+Lmk6oRDCxwgPwxtRaZNFz
         9jlRvrUMqnPuqohOpj1fG/WBlhQ7E73rAideoEGgehoGpPn+6ZZGC/Vv/Ei1kUsyjg4w
         DehViwLf2Jfc4EpsiRhCCMJchZ6xXacsSlWNe/45w75qdkHi9AhKXiQQMMwpV0DT4t31
         Atr4KKJwQvCCfE5RTX9KXObsuQ5uHNVD+f18GSGjL0eZdBQ9oY809+wLiLadGZoAhJTG
         RcInBByLlNTuoTnQGjjDyOduQbPnWUJ9RP7WSCR/6srIcQu8P535xqp7TxdZr4vHdUN8
         WYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVststLh/XoD7t+XFHGdT1Fx5Jyo5sib97sdFjC08EDAV3EmcZWAoPIY6hcSyLQ23zJ+hOUPGSTd3jJpUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHQ20DssBmqpUgM/mk1dA9XFA7xJEfl8OoYE/JUVqumwQOBlc
	nOOz4Yad25j+Zt9WeSWhErsEHUQUIaL7G9MFWYT7B3jG2qD+OWzYZp1UTmgEwQ==
X-Gm-Gg: ASbGncvNPPit/++r85gO5AJaU+EsM8/BsOX4SSVjnI+ud6sfZtxjSghvXXLt1tBcdob
	1N+j9eDF/fbv+NgvEyrzWGeZjEcD1xgzUTpk6v6W2xSNJ3VY551l5iH5tiuhwl7rZcJNQb75ocI
	y5b//1v5utqfgo19pADUvlqugzHWcwNhZjkXRoTaio2HEXxXCGpst9YLlufaSQuVWfijd/ARK+P
	R7Cu+iW1TbOMkE+EzIg+zC5wYz45EL51ipmnm0Oeh/m2fltJ4PCY94zly0RBip/gGS98TkzQndL
	FZUH1CqgJK8HeTBp+cNwKqvntBWju6LEq0+fSwVx4Oj3ZyBuZzGt01LvMF9N00pKNm9Qwg/TH74
	31WL3xOQk+ndhGyYdZ/VtfwduFc+w+R2A
X-Google-Smtp-Source: AGHT+IESTRjSnWyC9WDOv1hPrH3U08GYxtzRt8s/ZObcxIFkr+VWmQta8Ev9xBUxRfYgV1fRGYUFTw==
X-Received: by 2002:a05:6871:a017:b0:29e:2594:81e with SMTP id 586e51a60fabf-2cca191ff13mr2585503fac.13.1743805262998;
        Fri, 04 Apr 2025 15:21:02 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2cc84b30cd0sm925451fac.38.2025.04.04.15.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 15:21:02 -0700 (PDT)
From: justin.chen@broadcom.com
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jassisinghbrar@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v3 1/2] dt-bindings: mailbox: Add support for bcm74110
Date: Fri,  4 Apr 2025 15:20:57 -0700
Message-Id: <20250404222058.396134-2-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404222058.396134-1-justin.chen@broadcom.com>
References: <20250404222058.396134-1-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Justin Chen <justin.chen@broadcom.com>

Add devicetree YAML binding for brcmstb bcm74110 mailbox used
for communicating with a co-processor.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
v3
	Added list for interrupts.
	Corrected dts example. Fixed ordering and naming.

v2
        Renamed brcm,brcm_{tx|rx} to brcm,{tx|rx}.
        Removed brcm,shmem node. Not necessary to keep in dt.
        Fixed example and added scmi node.

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
new file mode 100644
index 000000000000..d6084ed23126
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/brcm,bcm74110-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM74110 Mailbox
+
+maintainers:
+  - Justin Chen <justin.chen@broadcom.com>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: Broadcom mailbox hardware first introduced with 74110
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm74110-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: RX doorbell and watermark interrupts
+      - description: TX doorbell and watermark interrupts
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is channel type and second cell is shared memory slot
+
+  brcm,rx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RX Mailbox number
+
+  brcm,tx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TX Mailbox number
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - brcm,rx
+  - brcm,tx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@a552000 {
+        compatible = "brcm,bcm74110-mbox";
+        reg = <0xa552000 0x1104>;
+        interrupts = <GIC_SPI 0x67 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 0x66 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <0x2>;
+        brcm,rx = <0x7>;
+        brcm,tx = <0x6>;
+    };
-- 
2.34.1

