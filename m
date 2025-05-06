Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42757288CA3;
	Tue,  6 May 2025 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498144; cv=none; b=iMWowXj5mqindvHv6HEQSojhe27X5H0TScNSxOkfnySoQT5TAChEfikqSNukw6s8xrW4cEo67DaqzzAki0DL/gGhMLD0nQpMrmpfbA3wq7gz6yBWXpj00Y5hgKkfKi7L9WfQvn4W+veUWM2aBGr/k7luyFKYSwOJ+Sr4ww3lVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498144; c=relaxed/simple;
	bh=7ef2pJBKAZeVrG/4t6fNBbsvtcjSVP4jrJFlRb13DSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ULHknOqc4pLZJdlu0q086J0oSd1QHlrtjfWOGP7DRbku71kpk1UiMzUDPUx78ING1oIfDqPrmcG4YgzcYacsBoAFovOSYIOaxDT5eKxEAsLHrwU/xy4saXUhShk0jaRVQwvtRoRUKSdQm1CzIU3kKZdubBF3F1Ilie+2ReeWDpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu4CTjRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu4CTjRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90661C4CEE4;
	Tue,  6 May 2025 02:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498142;
	bh=7ef2pJBKAZeVrG/4t6fNBbsvtcjSVP4jrJFlRb13DSE=;
	h=From:To:Cc:Subject:Date:From;
	b=Vu4CTjRabuy/Nkbz67AX9G2bX29g7y+31s67ITUOhZ0dXv9fVy2RHYbi7Xmhm2XkV
	 bcu1Mn/yFjh7TuV295Fo+oDpwtdl0W5oe21lmvHALSeiNk/+yKIWRUON9F7wN3L/OX
	 H3jd5RUQtwah+1cL4PtZUFTSg2E2cr2aVTwqdiOtZ4+lbG0ekjJ0EHg5DwdNjt4e4a
	 jvCQd6X4KRLegepoW6DOPJ5Lkt1CJqjq5wYwQcLSzHJsclv9oHIrsA6ouqE6f/aWhy
	 tkTim2h77DlmWz2zg/NYsvRzif+ePzRNrMOUE4xzPP3FlaR6FXIHHNQwiS5CnE5xJp
	 LwJJI7Nm9ORUQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert cirrus,clps711x-timer to DT schema
Date: Mon,  5 May 2025 21:22:14 -0500
Message-ID: <20250506022215.2586595-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cirrus CLPS711x timer binding to DT schema format. It's a
straight-forward conversion.

Drop the aliases node and second example which aren't relevant.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/cirrus,clps711x-timer.txt  | 29 ------------
 .../bindings/timer/cirrus,clps711x-timer.yaml | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt b/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt
deleted file mode 100644
index d4c62e7b1714..000000000000
--- a/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Cirrus Logic CLPS711X Timer Counter
-
-Required properties:
-- compatible: Shall contain "cirrus,ep7209-timer".
-- reg       : Address and length of the register set.
-- interrupts: The interrupt number of the timer.
-- clocks    : phandle of timer reference clock.
-
-Note: Each timer should have an alias correctly numbered in "aliases" node.
-
-Example:
-	aliases {
-		timer0 = &timer1;
-		timer1 = &timer2;
-	};
-
-	timer1: timer@80000300 {
-		compatible = "cirrus,ep7312-timer", "cirrus,ep7209-timer";
-		reg = <0x80000300 0x4>;
-		interrupts = <8>;
-		clocks = <&clks 5>;
-	};
-
-	timer2: timer@80000340 {
-		compatible = "cirrus,ep7312-timer", "cirrus,ep7209-timer";
-		reg = <0x80000340 0x4>;
-		interrupts = <9>;
-		clocks = <&clks 6>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml b/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml
new file mode 100644
index 000000000000..507b777e16bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/cirrus,clps711x-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CLPS711X Timer Counter
+
+maintainers:
+  - Alexander Shiyan <shc_work@mail.ru>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - cirrus,ep7312-timer
+          - const: cirrus,ep7209-timer
+      - const: cirrus,ep7209-timer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@80000300 {
+        compatible = "cirrus,ep7312-timer", "cirrus,ep7209-timer";
+        reg = <0x80000300 0x4>;
+        interrupts = <8>;
+        clocks = <&clks 5>;
+    };
-- 
2.47.2

