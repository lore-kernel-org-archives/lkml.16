Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57626A1D9;
	Mon, 28 Apr 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844066; cv=pass; b=TQddwd7RaA/zIm/dCE3C7L4Ba/X72jNBrKxhRFIXrZRBQ0y1zrvVf384fTCRyI9/30ZeNenYTYzsO30yu9g5W7EPRslhU/YfBGh18zES8opL0TppRn9qdEdMXbDGvkiVl6PhtyhAWhMjenYfHGps8phVvpJnos6lKiZZXDvw5ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844066; c=relaxed/simple;
	bh=eSH7pS3FqLeb/xI1kI+WUB9NAL3n9INVvbjzDwSBPiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiJQbODP3GwzFCHO+NdiQf3O+X1wUSf0vqn+XWUqGfDJBU4zj9ZliyBhgu2KPHsXKEa52SY3qXHpmuEcUCXvA9zCu1GmU0ZfKGo2z9iXFu/dFPJjtXfU0CGbPQrRyrDKGyRpK2ZHX6owfA+jUN7LbxtE8Cnp+N6wXKsAKhdnzfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=SnHOqb+/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="SnHOqb+/"
ARC-Seal: i=1; a=rsa-sha256; t=1745844037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZjM0TOUpNTykAB6wBsRGLN2vQF4yfdVWZFejune0aN3IL77cTaTBsJanG/i+laETEck45ko6AqSfn/6kzB+EgliXcZMJIlNLyWeCqoD7O1fgTOxQlo8aA9zSfDhMppa5WTev+Mlw682Da4VOC8XKvL+fxWegOGOvBneROABjP1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745844037; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vz+mwteOFVjUBYLK3kyTIENC2iJR9nyaEx8k9A7nLhQ=; 
	b=CUmaoaRwSYXmneuzXX5KcMWjNKjHVT9Ajce7zG8MA1fhysQTTeH+g1W0t88xaPKomtpv4tgJSwtSw3ljrlFt1tRrpqEBdgZOoOccpIWwP6at2tag/67pCDaXNEtWe3oJiCSVx8UcOGupcNgGJljjap/g77NNVlX+lliktckQw8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745844037;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Vz+mwteOFVjUBYLK3kyTIENC2iJR9nyaEx8k9A7nLhQ=;
	b=SnHOqb+/DAiMhJz32Q8ynPBqAgC8lEYIAhe1+3qobi0h+UHHF9s8jddSfLHW9S4Q
	DxVfb/vVBfwFY+Qrb3vPGyBuTM2kbPxzATaOTm1HH/bxM0k7z6/GHzR5XZZGBwRjv9d
	LBVihE7weVkug/C1NMHwKX+msHYah1VkNc/2wkBU=
Received: by mx.zohomail.com with SMTPS id 1745844036201935.8658413655802;
	Mon, 28 Apr 2025 05:40:36 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 28 Apr 2025 20:39:44 +0800
Subject: [PATCH v3 1/3] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-cv18xx-mbox-v3-1-ed18dfd836d1@pigmoral.tech>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
In-Reply-To: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745844011; l=2280;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=GsQbGKXKdavpmDUrRnVbgYgEwew9+AxTW4ckB/Jl3mU=;
 b=3n01u+mVvRti/CmYdllpkIIVaqbqsVAwzv9s/Od2O5EfPdjFXThao1F5VKh4qAZuxNiDwkNh2
 IphQg6T3f0oAc/qhqMoDYercpFB4jx4RlYRu32tu3etkwO5Gr4Vx9wI
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External

From: Yuntao Dai <d1581209858@live.com>

Introduce the mailbox module for CV18XX series SoC, which is responsible
for interchanging messages between asymmetric processors.

Signed-off-by: Yuntao Dai <d1581209858@live.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5815dc02189c973d681f5b4ff22a9fb7536802b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
@@ -0,0 +1,57 @@
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
+description: |
+  Mailboxes integrated in Sophgo CV1800/SG2000 SoCs have 8 channels, each
+  shipping an 8-byte FIFO. Any processor can write to an arbitrary channel
+  and raise interrupts to receivers. Sending messages to itself is also
+  supported.
+  Sophgo CV1800/SG2000 SoCs include the following processors, numbered as:
+  <0> Cortex-A53 (Only available on CV181X/SG200X)
+  <1> C906B
+  <2> C906L
+  <3> 8051
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
+    description:
+      The first cell indicates the channel index (0-7), the second cell
+      indicates the target processor ID (0-3) to which messages are sent.
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

