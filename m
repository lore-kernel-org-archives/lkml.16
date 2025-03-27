Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263741DE3C2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743113797; cv=none; b=vA7gD/oAIgybytS2Bn5eSZ4N2hADUtqnuTgeEJigd0ZkKor43j0UJFmO8/hKGQyy6bvORrziSbyfZ/fccgQKl2aiQObKylPB3/3QunOmB4vEEYHWBeZXGOt7fhO6Ry0Fswvj/Rg6j8IiNLMv09Y8+rzFFsvhYgEok1vjWMQ7n+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743113797; c=relaxed/simple;
	bh=c3pZ7RooU49GV/zbRYr6GKjwFAEK7W9UC8fTibTT5V8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AmLLRC1DhJReGrm1NemuFQtKWJnsoAwXcs2MoFx2CQAKRo6T0GDZk9uDqIvy2E+IcH/xGkk3lOo5lyjH3Dk7c5LKsA4fzXkmhKruzK0+5D+yDkbEhG1CZbHHBrojp4gEldv6r1W1Uwuv5LMAQ/x8Lw+6KW8UA/3fpjrRiwxnBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ElRHVLsS; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ElRHVLsS"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3feaedb39e9so407324b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743113795; x=1743718595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWnjsfzqeuRQjE5CuEy27r/cM16vobPuEqBqdK86nRY=;
        b=ElRHVLsSiITSonlYxI8xsck5Gn304Ps/jkNHY8LpW5QkbXMYqCqo/+wO1sOJw5IE/7
         wUOOKaxmZ6ELpXBK5jVg3nRHifPIOvIX5aRwtWp2vz22OysRwV1eIkSP41D3Q6ujl1xc
         tBY8HO9xHZ88EAITcrE02suapZmCy3SWhK3ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113795; x=1743718595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWnjsfzqeuRQjE5CuEy27r/cM16vobPuEqBqdK86nRY=;
        b=Mr4Ob5LhBCRZKMAP4cMg48IhC1LMVKOtoFBB60FgyUNRlHVjdWL9aV5zfNWG0n5DzY
         rN7Rhz8eFNdWHWR6DPEoH7NDzGJxs4JF4l9cLY3tkJM1ngQ9QqOa3AbND2QxwaK2njBN
         jLoAiP37/gsV0SF+syCOVMbAhiRsg+/rukSnBJgEsjQhVf6qx11wFzBZfgTTyapt5E+H
         4iqoN3gc/Li6gksM87Z3qmGPFern0F5oMYxclby78be9/+Re3/04YT7HAQdxfckYHBID
         djun33fRU1FlV5hjVKu6dzkkGTxKUGSvrW92ZD4XZUVJkXq0pFeyc3vjDXZLKJmApGaF
         psCw==
X-Forwarded-Encrypted: i=1; AJvYcCWXQqOv2RSG/Ty5+VIPv41hRSQU740+ezgafoFvzn+SpDK4XwOvjShHNbXWztzESFtocw+m4nMvfCVMwOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybz6yy446Zwj00W6+tKyftIrcHGKb183KY1LoPflP4URz7ZxLM
	CXjye6s9EVqLXNqL+OohDHXZl+ltFqQKLGbR68/qe98bjJR9gsaNd3gerV8bbl8fu4CCdJf1e+Q
	=
X-Gm-Gg: ASbGncv6qEqsx/EwCApfif8l9i6230D6d9cWHt2U54lDog3oRl/JeXtXzljqbZ0kYMD
	wGGGkY3HzfHvgQeXcM9bBQwPkI7m+tUAyGCcyknlwc3ElBlE31a+OBlhkH3oHkrXk0g/RfbSWqQ
	lIP/FGU7H7P1JBr21fNs8cBw2ExALnEWudQnQTG3rGGrMy+oQvKNU+gqFtn8lRZWtHZX1KeGOap
	wOOaVlFLZAVqynDgPjTt6Fxwu6z1eSE6vE4+KF75aYaXGIkTm/i61kyiC4sx2AZqiVZ+citCcO7
	bS3Hfk3sy6scAJJXt+0xmyHS1gHg1sP05Z7GT1W0l8pQp7NuOV8IBLt/jDMrsdCZX4hfZTOyE7e
	eIKDeJvFSAGMSOmBt1xVBFA==
X-Google-Smtp-Source: AGHT+IHJe1kJJUaMvRyIpRfNMnixffqNiUdPbooQgfaLtzes3Umk6/URZ+Q1RCthW4bU3XakDncbfA==
X-Received: by 2002:a05:6808:201d:b0:3f9:d5a2:89a6 with SMTP id 5614622812f47-3fefa62d72cmr2809117b6e.35.1743113795004;
        Thu, 27 Mar 2025 15:16:35 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051680a8sm105031b6e.1.2025.03.27.15.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:16:34 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: mailbox: Add devicetree binding for bcm74110 mbox
Date: Thu, 27 Mar 2025 15:16:28 -0700
Message-Id: <20250327221628.651042-3-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327221628.651042-1-justin.chen@broadcom.com>
References: <20250327221628.651042-1-justin.chen@broadcom.com>
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
 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
new file mode 100644
index 000000000000..139728a35303
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/brcm,bcm74110-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM74110 Mailbox Driver
+
+maintainers:
+  - Justin Chen <justin.chen@broadcom.com>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: Broadcom mailbox driver first introduced with 74110
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
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is channel type and second cell is shared memory slot
+
+  brcm,mbox_tx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Mailbox transmit doorbell
+
+  brcm,mbox_rx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Mailbox receive doorbell
+
+  brcm,mbox_shmem:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    description: Mailbox shared memory region and size
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - brcm,mbox_tx
+  - brcm,mbox_rx
+  - brcm,mbox_shmem
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+        brcm_pmc_mailbox: brcm_pmc_mailbox@a552000 {
+                #mbox-cells = <2>;
+                compatible = "brcm,bcm74110-mbox";
+                reg = <0xa552000 0x1100>;
+                brcm,mbox_tx = <0x6>;
+                brcm,mbox_rx = <0x7>;
+                brcm,mbox_shmem = <0x3000 0x400>;
+                interrupts = <0x0 0x67 0x4>;
+                interrupt-parent = <&intc>;
+        };
-- 
2.34.1

