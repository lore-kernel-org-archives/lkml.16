Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88A42222AC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744741713; cv=none; b=i/AzrYk7FMYk1I2sMND0v0Kbns/kXY+Dn0FcddfssJIu5CfqvlRZiZOWc9gkz7PP+bdFLOnWroR5g7hrk6b46IRRlE9nWQc2yRGBMe4IQDmtZg0xpOtHrFS4mTsPc1vlRk/AcD9eUX4G8coc9lF0P2Unbtv40nu9TY2cizciMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744741713; c=relaxed/simple;
	bh=NS7NUQTWMnCY0Kq8/cM3cF2ihs/926O0LO7HDLvkUUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jdCxZ9Jls4BdVeQN28GspLl9LIWCJhhckI8plvcsW0BQ/go6pVntmb5MqHFHVVpZ08ztCKqenu4jh0QZTofC+WfVBdo4kU/J4zHkEUuf41h3Le0np36jsabwHWbWmp+GoLY+uV14T2GOjfSTZgd/D9RlbGezMTZHNXK31a0hvg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aY/H7+so; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aY/H7+so"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3feb0db95e6so3762947b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744741711; x=1745346511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaFRLdnz7zCuUma9VAVck8Ma/53jvqZlJvs+qHg/LNU=;
        b=aY/H7+so2b0HWYpCAe5IcupsuOddXubLWAGvnz0MRVznAKC7ffaO0/Yhgjq5nCfAqH
         ZklLX9ofWckOCyiaUi4ccFWrfLCxSOpv6e3ClKYcdFKnOJg7ohIVU8pPtqwZy9tbLA7i
         xEWb6t7ZTcQsgfVwvc3dpIlk4FJy5eEwE0+s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744741711; x=1745346511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaFRLdnz7zCuUma9VAVck8Ma/53jvqZlJvs+qHg/LNU=;
        b=dWZdQDWeDKNhwToRhLo6gCux++wJd/yYRPOR5qEv5EQKy0vfhYEJa4sALJb944Kn7X
         S6Qqd63uhBq4MUXV1TmYuPyRbS8ljkwBu351eNDar/kqb40giEtciwMrIkOwllRcdLZH
         cKrplq23pPp5OYgSaL/nTjlMEOz+etDMb16HE74BY2iF67RASsysWIoq1T1lW4ulL0S5
         5ySa7s3CtjrmuWWYNzdA/c+ZHFktWweR7cXOzJkx12aEj4ULWFYQXYwZzWtFoOWdlKSY
         cVX3fUUtE0TBHAS34EHyWhcvWuPmUf1W8LMo5W12EtCVPZe7urY/FlBDPXtdwTTmV+MB
         ++5A==
X-Forwarded-Encrypted: i=1; AJvYcCUYzipY53P8QFgHcRblkWToLnqohVf2nm0c73HH0cmQBfOq22GGNnAl4O88IlR9fT8zAjIWoR+EIaRZ1aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7LHMIB/cThkePaWVh510ifF/m3H+CvwWimbSyvmeCdckrx17T
	wB6W5yfPkKHa8aituuw2z3rxnPEVHL5cSJfoXBUt1YC8/4IcYsxuyFoPxq+VIZiZdhpXTvc+Jnc
	=
X-Gm-Gg: ASbGncvhyldJXUKvcFZJhbLfQdpoHvhbd8xngPFiyPev07yi0CH81LuUrqyS76/3kn5
	5361Vje/A+RL+Y2nDgEjQRqpei5l/1yHFDLkpJyvSGHWlInkQoxeha7K8PjVY/vw6vXcAUy7tdz
	7AtI9AEcwQ23sDvre8wWZGSc5OTCV79e13NPkzbrW4mKlJ4ngPGh9/i1un4RvfNbf1K26cvRBnP
	2JjGVq9mITnpRiOLcRxSPogaLMfdFDEFVMRxuxNfV/K7JUGj2HYs9ZEE/+zyVnbBZHP9tv+CYcm
	EjyQA+xM6vT4nUZbyKdk6NyDpk1rwkdkFQmc5w4wXm21dchwLYnSEfzwzXfgSqAkZGVaGH0MXyy
	i5DmXBuMrSCz8HyRvjA==
X-Google-Smtp-Source: AGHT+IEq5v8Tp1zyjzJOs2uD/k82silnFhwbjeiDtXg0gdPGWg8kcS6uA7Vblx5cKJOU3S6RH6Gjbg==
X-Received: by 2002:a05:6808:1691:b0:3fe:aeaf:26a5 with SMTP id 5614622812f47-400acb367b7mr399141b6e.31.1744741710778;
        Tue, 15 Apr 2025 11:28:30 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400763baf5esm2434177b6e.47.2025.04.15.11.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:28:30 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: mailbox: Add support for bcm74110
Date: Tue, 15 Apr 2025 11:28:25 -0700
Message-Id: <20250415182826.3905917-2-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415182826.3905917-1-justin.chen@broadcom.com>
References: <20250415182826.3905917-1-justin.chen@broadcom.com>
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
v4
	Dropped minItems from interrupts

v3
	Added list for interrupts.
	Corrected dts example. Fixed ordering and naming.

v2
        Renamed brcm,brcm_{tx|rx} to brcm,{tx|rx}.
        Removed brcm,shmem node. Not necessary to keep in dt.
        Fixed example and added scmi node.

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
new file mode 100644
index 000000000000..750cc96edb46
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
@@ -0,0 +1,64 @@
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

