Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660741A072C;
	Mon, 23 Jun 2025 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647010; cv=none; b=NM/51IjaaTAdC1bxv4g6CcsVlar89zBHWczAsUQJI9QMXrlgapj8jOG2pLabZ6ig0oinRnhY4Q4vr4a0WVUA/ywJ81ACxdzeTYADYo/qDSm4eTxC7nWV3lBCFk2hbJIZMSwJ03VoUBKnbIUq9hR+htCekpj0TaJRzOGyZvHAwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647010; c=relaxed/simple;
	bh=ZjykjnqcY05e8n8+BhU5JkLT/Dkp/Lr2fXi3HtFn2Kk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EzII8L4DlSnI4/Zj8DI3O6HH3CLviyEagWTcqQ26dWHQZBpRgKIa2t/BmC4QCugghQa3lT1v65zu/1Mx6eRhIsXGodpr8kwc5pQXSIzJI23104vvulfEpELVOg+Aw//kSnNr2pHdkRBA0NnYzlbvI7IwSy5PjgxaNbrC+CLz7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 23 Jun
 2025 10:44:56 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 23 Jun 2025 10:44:56 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series SoC
Date: Mon, 23 Jun 2025 10:44:55 +0800
Message-ID: <20250623024456.2068370-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623024456.2068370-1-jammy_huang@aspeedtech.com>
References: <20250623024456.2068370-1-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introduce the mailbox module for AST27XX series SoC, which is responsible
for interchanging messages between asymmetric processors.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../mailbox/aspeed,ast2700-mailbox.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
new file mode 100644
index 000000000000..9c5d7028e116
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 mailbox controller
+
+maintainers:
+  - Jammy Huang <jammy_huang@aspeedtech.com>
+
+description:
+  ASPEED AST2700 has multiple processors that need to communicate with each
+  other. The mailbox controller provides a way for these processors to send
+  messages to each other. It is a hardware-based inter-processor communication
+  mechanism that allows processors to send and receive messages through
+  dedicated channels.
+  The mailbox's tx/rx are independent, meaning that one processor can send a
+  message while another processor is receiving a message simultaneously.
+  There are 4 channels available for both tx and rx operations. Each channel
+  has a FIFO buffer that can hold messages of a fixed size (32 bytes in this
+  case).
+  The mailbox controller also supports interrupt generation, allowing
+  processors to notify each other when a message is available or when an event
+  occurs.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-mailbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@12c1c200 {
+        compatible = "aspeed,ast2700-mailbox";
+        reg = <0x12c1c200 0x200>;
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
-- 
2.25.1

