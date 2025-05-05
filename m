Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4625DAE8;
	Mon,  5 May 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456413; cv=none; b=IbwDZjzZOE8F8+fJZHroZd525wsvFmu1tdKD88CfNiqWspasnQ2LFd2dubfjo+7fWVgwUZC66pN0I9Aw+3F0PApgEroafcyODH2bQrI9HhXJsBn0XXoY2NFs7l2j1/FeoGKR9eyFizKdn+xfCew6nZGOTGDbvo4LXmOfr7pIcUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456413; c=relaxed/simple;
	bh=gF5xhIvfAauvIL8M/Yf4HpV1d4YpqJKvrx/fD3GgfmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lb8N2OfF5ToFataLGJj0xGcDzgXhwzGXZs8F9dCPNrBpkfIcD3gC7HoXGgjVJ5V//BnlIAUA3OSZ2xX6M91VB9XONmOjEHzpEXvVwTIabwpMAOKfoIUUHqaiMwvS14msiyXaTbze3HJ2I4onjm4yxaPJWGV+AS6uQAGZfrF5OFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRBvSgCT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRBvSgCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924BEC4CEE4;
	Mon,  5 May 2025 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456412;
	bh=gF5xhIvfAauvIL8M/Yf4HpV1d4YpqJKvrx/fD3GgfmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=IRBvSgCTs48WmROcz75u+5VN+PXcjelOMXGVJWF6Ui2/x//Iamgom8LPUWne07R/x
	 jkdrDFFqugxvwsAQlq2jgjF2gceuwmM/4/5ArzHEOyJbOidLTQqra+kXJ2gZ9rrbcm
	 9/pqjMurMdB65j8xfGSUU+3vweFQnHGnXfnHFR5tTlpNMozd9+ExgukG8C5r0cfZch
	 JRHJRjynAUYWNsHFut2gS+4a4r9qlxwJKW0rStyYKAZuTIIioau7hkg+Q+eKpieHL/
	 0Pkp+Yu5e3h7V5+zMXHP9daSjMOFnj5nLW39Ix/cJee+ei8BmFLH7Fm0a8OHtcdOAf
	 x83wXJN0rsU8Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Noam Camus <noamc@ezchip.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert ezchip,nps400-ic to DT schema
Date: Mon,  5 May 2025 09:46:48 -0500
Message-ID: <20250505144649.1288786-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the EZchip NPS interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/ezchip,nps400-ic.txt | 17 ----------
 .../ezchip,nps400-ic.yaml                     | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
deleted file mode 100644
index 888b2b9f7064..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-EZchip NPS Interrupt Controller
-
-Required properties:
-
-- compatible : should be "ezchip,nps400-ic"
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-
-
-Example:
-
-intc: interrupt-controller {
-	compatible = "ezchip,nps400-ic";
-	interrupt-controller;
-	#interrupt-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.yaml
new file mode 100644
index 000000000000..589c6ebf6c1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ezchip,nps400-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EZchip NPS Interrupt Controller
+
+maintainers:
+  - Noam Camus <noamc@ezchip.com>
+
+properties:
+  compatible:
+    const: ezchip,nps400-ic
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "ezchip,nps400-ic";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2

