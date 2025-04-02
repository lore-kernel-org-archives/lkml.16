Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5931F4181
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633392; cv=none; b=lMjNykdOkBNaH+rCb+TSc4h0aMIDA9plfVrpsc4vpJhyS/fSD4rSOoWN+bTDxarBEnyJE4R3dW1wKdPRbB3wJsid5/bVrZkCrrJCx8XhZJx8MKw4S3KAInEdbIglVhykWvPAK7Q1xaF9TeOpF1IOUKafgGsAjtvo+WfS/R0QNI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633392; c=relaxed/simple;
	bh=N5RZnagF70pCxqRVfGd6AUhnkhoggMU80LTo7XfpkfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cA8gAnI2s87Mx6E28k2JDCNdLCvNLBlasBQxy/CwoK3mUmsMDNim6sdX1qBSyTgmEbodyk5HDaRsBr96xyeg2zLO+M6RkSmpmBQDYH5uWjNy7rIXbgsQAF5ydfBzpIicBGaiFf43jxz6Jcc8OfMiAdvW3dwmTu/6miN1RGklbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FHBauCr8; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FHBauCr8"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2c873231e7bso130591fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743633389; x=1744238189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU5Wmgk0DtPcbafyuC8OfKKn9mU3Z/jtkoEvb2Qwpsc=;
        b=FHBauCr8hfGo4JbZk2ttf4oFdClDEztGhhDmEVNvAAdOW9vrA2HcSd3Qo+B+G7Z+t4
         dIydpECa6zBZnMTEd1btvM8IK5VA344+IY2dwN94L22XEs9PjuPdbeLY4jHlug+AtX1z
         nqliAPayM2onvNFhVWFhnFThEuRqujxAOqgMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633389; x=1744238189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU5Wmgk0DtPcbafyuC8OfKKn9mU3Z/jtkoEvb2Qwpsc=;
        b=e9Kvs2jVasBINDj5LQFGFvN5yQXzuFKmIY/4QoZYgFvgJ5evt4wuPddchLPUZdtgZb
         1b5V2ar074BuekJMBTRoygRiICcQWByE1ti4GnhC6XE/AEtFy/I6L360HZmzqt/ycTSM
         kwXFJtE/Yto72jeTNmvFW34O3qpuF6ARrpwClb6F/UrjKdiiuItugq+kBDx7A5ebQJmt
         kxONQiHLlff7u10yp59ZExgiKgMJFQTgM4CdPrxftMR9iJwPw4Vej2nVcyO0LFO4zbUi
         wIItYxYtLPXOZkvI6VuNP5SRf/Ply++MGuQjFMDxzVgbGfF7alSBy1xzEG/Vx3ydzfGc
         EvgA==
X-Forwarded-Encrypted: i=1; AJvYcCVQKO9fq/ItmmgfUppA0x9T9aFhuN4hsPx+vQRWMN+NTeHTsNfpMsV7bzjrhTQvco6CdcWRXu9kfK4CaoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqtNbhO/u3THAAVC4aNW5vSphkIG5V3KMNvEE6k+UjwsDVlMrn
	Pu4G0IJ1gQPpL2pxz1zbyhueyn6JUdnQWbTgsscABQWEZJwf4dEirjcbHNexUw==
X-Gm-Gg: ASbGncuf+AYNKGJn5vVw+f5LXcEUOH5cmJkNFDl96rI4Um4rqELS3BPYgGKx2XtHjWJ
	+go5xqBaLRyPboxLOjFqg0qOWDKs2THQdNp3M2CaCbGhUqeYU6/pfiWD0hRRvbqR61ojLLJnRXZ
	w3FoEETSPHt8onRmYlcXK3Y4vIIWzhSOIkyyXBGEHcl9aXqqUB37r5H0cQcMqiPEgBsH3s5qjz+
	vAiFDCG9gpKAwnw5R82tfjc08RkZZR2P9OXBFPqjQpWr4l8tfLjjRQL73RHVe26dCwAPBqeKHyu
	lizl8wGJ8sSefzWs8eKyLFziokcbO4AUSRly+2K7lAXSmeE7LBj7xPpKeAaGZBZnJwK+o1ssZnE
	YltJDxnokDhhoZ8kGaV8BnQkKLRn02bRE
X-Google-Smtp-Source: AGHT+IGQvGI4ExR8htfZkiB1ZkYNsAjoEKb/t6I2Nf1birXi0Ckii+tOxYi5evJ3/kEj3LTxABnKtA==
X-Received: by 2002:a05:6871:8114:b0:2c1:6663:f603 with SMTP id 586e51a60fabf-2cc7f6e9eaemr305995fac.19.1743633389601;
        Wed, 02 Apr 2025 15:36:29 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2cc84bcf5besm190fac.45.2025.04.02.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:36:29 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jassisinghbrar@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v2 1/2] dt-bindings: mailbox: Add devicetree binding for bcm74110 mbox
Date: Wed,  2 Apr 2025 15:36:18 -0700
Message-Id: <20250402223619.358818-2-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402223619.358818-1-justin.chen@broadcom.com>
References: <20250402223619.358818-1-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree YAML binding for brcmstb bcm74110 mailbox used
for communicating with a co-processor.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
v2
        Renamed brcm,brcm_{tx|rx} to brcm,{tx|rx}.
        Removed brcm,shmem node. Not necessary to keep in dt.
        Fixed example and added scmi node.

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
new file mode 100644
index 000000000000..8c3dfffa515f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
@@ -0,0 +1,70 @@
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
+    maxItems: 2
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is channel type and second cell is shared memory slot
+
+  brcm,tx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Mailbox transmit doorbell
+
+  brcm,rx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Mailbox receive doorbell
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - brcm,tx
+  - brcm,rx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    brcm_mailbox: brcm_mailbox@a552000 {
+        #mbox-cells = <0x2>;
+        brcm,rx = <0x7>;
+        brcm,tx = <0x6>;
+        compatible = "brcm,bcm74110-mbox";
+        reg = <0xa552000 0x1104>;
+        interrupts = <0x0 0x67 0x4>, /* DQM 7 */
+                     <0x0 0x66 0x4>; /* DQM 6 */
+    };
+
+    scmi {
+        compatible = "arm,scmi";
+        mboxes = <&brcm_mailbox 0x2 0x0>;
+        mbox-names = "tx";
+        shmem = <&PMCMBOX>;
+        #address-cells = <0x1>;
+        #size-cells = <0x0>;
+    };
-- 
2.34.1

