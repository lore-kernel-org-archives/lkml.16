Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034D25D20D;
	Tue, 20 May 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727159; cv=pass; b=M7SyPoBI8j8RmevtWKKb1i7Vr3bfvHDPaHWmXmRVs6Hi1QB398tZStxGaVoTfeqcq8rzV0kKw/sP3wIIEvM3+byILCcYvm1lzFLB7ASnM0uNAeayAP8GaKyPXJQ6xo5ubZ6eQU5QmuvandqcjM7xVnlb6NypPnBqhXuSXvkWflE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727159; c=relaxed/simple;
	bh=pLwzsBe2tnNURu/fP8i0rjxlWvAGKHu4p607gZJ96rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvIPezJXXFRKE8CoeqZoOYvK27HHzwH2a2UO2Q4gGLV+oTbMxqCBjjcGkfb3JMChoKjT0No22Iichk9JXk8CcFSXl9G8jNf5vnEF7xCXD+Q/tXMz2SdNj4Kqg7Y3+YpkLbi8azs2ldnTQqP48mN8lEDtyP5/V0OW8+3KoLbmPDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=jBFKI/hz; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="jBFKI/hz"
ARC-Seal: i=1; a=rsa-sha256; t=1747727128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WSeNHzHPd1NxwlZxDBSkbW96NEvPWwFkzeLgZkdr9CY6yfkUuf71S5RAS+kqmZyBZYKINY1bxOFinOSyiDjHv2XwkAuQmdqZjmTHUzontlnVuJhsDx2xN790HDfM513tZ/QNzZONFM39zqZqXhATolz0E5xcGZleSzRf4m6Avj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747727128; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Db7Skhg/xwreCbQKCCU7E+b0hX+qOQBSw8fvrdik/cI=; 
	b=IfOkEb8BQn96xyjRWtX6UcflIwQWkSSubGnGaJu1OcaIuz8UKZggxDjaiOUayei7Lr3V3yYJj4TT7FdVQqnSxIXlVP20FsA6l2L6C6GdQ1S+mS71dNMwJbT4mvGsdIkVBS+cxNJWq4hUtyrFS0A0PzHb+Crp25SQhqHUrrS6UJU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747727128;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Db7Skhg/xwreCbQKCCU7E+b0hX+qOQBSw8fvrdik/cI=;
	b=jBFKI/hzx+1T4I5Qi5MSyMbBZpu4AiUM5omvItr3TwAmSz4io/hMiIpbjJIXacBV
	XqtMq0m2oGtxMBL+evuldY8U2c4pEytu4lwGqHb4sRA6wrRQvJGJ6fSp12cmBJN8+Zy
	qc7QtDTM2JMBEaJylxTqIzy+UKUO0uGHUlQTM+B8=
Received: by mx.zohomail.com with SMTPS id 1747727127268345.8844111115384;
	Tue, 20 May 2025 00:45:27 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 20 May 2025 15:44:23 +0800
Subject: [PATCH v4 1/2] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-cv18xx-mbox-v4-1-fd4f1c676d6e@pigmoral.tech>
References: <20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech>
In-Reply-To: <20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yuntao Dai <d1581209858@live.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747727085; l=2318;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=2oupmZshQu2kbQRqv0KR1mJRGrvbQPR0Vh3LnRnuXuk=;
 b=a4ZmprI0ntF3PvXBAZh57SBb+S6t43gdFDIF2OOlz0SgEvm9sNsrnfgwXn3EjSKmymWvXO8+h
 Fkdgm1piFv8AL6kimHknkgJv6vXL6JQ/NUZZKf8LcFC7A1T3S8U2shy
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

From: Yuntao Dai <d1581209858@live.com>

Introduce the mailbox module for CV18XX series SoC, which is responsible
for interchanging messages between asymmetric processors.

Signed-off-by: Yuntao Dai <d1581209858@live.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..24e126bd3a2025ba0cd28912fe01239b6d758232
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800/SG2000 mailbox controller
+
+maintainers:
+  - Yuntao Dai <d1581209858@live.com>
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+description:
+  Mailboxes integrated in Sophgo CV1800/SG2000 SoCs have 8 channels, each
+  shipping an 8-byte FIFO. Any processor can write to an arbitrary channel
+  and raise interrupts to receivers. Sending messages to itself is also
+  supported.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-mailbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 2
+    description: |
+      <&phandle channel target>
+      phandle : Label name of mailbox controller
+      channel : 0-7, Channel index
+      target  : 0-3, Target processor ID
+
+      Sophgo CV1800/SG2000 SoCs include the following processors, numbered as:
+      <0> Cortex-A53 (Only available on CV181X/SG200X)
+      <1> C906B
+      <2> C906L
+      <3> 8051
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox@1900000 {
+        compatible = "sophgo,cv1800b-mailbox";
+        reg = <0x01900000 0x1000>;
+        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <2>;
+    };

-- 
2.49.0

