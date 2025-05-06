Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE77B300296;
	Tue,  6 May 2025 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498148; cv=none; b=kcwAPEdIEToeiliHRJZ+V0z6W4Dgfan2ui0dXoFcX6BOUr99oc5vrVNQIgoYxUnwI8WjkTIsbr/fTwm2kEi2Brmm7sfH1wSPJbSOaW+2tAXv0XOXHwCW3fdKc+7mNLNUFKm3408Zsgiy5lCuFAp40mSzgRAULchteBPISOPXhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498148; c=relaxed/simple;
	bh=iw+EcWCNPov4bxyPeoD8LUh/hbyYCdRWN30dNiEaW4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7vVSOXcn5yvVcalgV1IV7Qcwu5Qze/OXOFeSE6G7qFZqYXeGlTDoZOgwjNwv0TVPWFHGu4qSrq4S2XcBqyJPZsTRYzi7E6LkMk1X/UAezR5cyf2QQHgzSOeZVYRXz3uCm8EGraeRBWtwYxiFbhyr8biXD1Jpb8s4DY2/92O61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRt1JKLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRt1JKLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FEAC4CEE4;
	Tue,  6 May 2025 02:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498146;
	bh=iw+EcWCNPov4bxyPeoD8LUh/hbyYCdRWN30dNiEaW4I=;
	h=From:To:Cc:Subject:Date:From;
	b=JRt1JKLY/FNMEunKzVOTOarJkaSa5zegAItguo2V1rLuwfJD5ocIuqWWtDCNra99E
	 MuWT4ugi5oa4XFZI2Qn7bagPuRhynfTAxPYD3BlrdEXzaQz1ldxPlmC4rgbDqsyAyj
	 ElyutpOYa6fYodib9LTYd917wQh9/uJ7qWhoaM8Xcq/cIaDLcsOKoUEJwYmh0oOz+t
	 PGqVJliuZhCsrK3wUhmcWLoOI3RNH4mfy4AWtGJxfOoENSvwiVPApac/W9VdXHCQxD
	 /2CmsGboUPYpbVCVA2yQUt+QJW03zFBIxUnKQNQTRumdLVu2q87qIT3cgWN04youSi
	 fwLg42F/tgqKg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: Convert csky,gx6605s-timer to DT schema
Date: Mon,  5 May 2025 21:22:23 -0500
Message-ID: <20250506022224.2586860-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the C-SKY gx6605s timer binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/csky,gx6605s-timer.txt     | 42 -------------------
 .../bindings/timer/csky,gx6605s-timer.yaml    | 40 ++++++++++++++++++
 2 files changed, 40 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
deleted file mode 100644
index 6b04344f4bea..000000000000
--- a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-=================
-gx6605s SOC Timer
-=================
-
-The timer is used in gx6605s soc as system timer and the driver
-contain clk event and clk source.
-
-==============================
-timer node bindings definition
-==============================
-
-	Description: Describes gx6605s SOC timer
-
-	PROPERTIES
-
-	- compatible
-		Usage: required
-		Value type: <string>
-		Definition: must be "csky,gx6605s-timer"
-	- reg
-		Usage: required
-		Value type: <u32 u32>
-		Definition: <phyaddr size> in soc from cpu view
-	- clocks
-		Usage: required
-		Value type: phandle + clock specifier cells
-		Definition: must be input clk node
-	- interrupt
-		Usage: required
-		Value type: <u32>
-		Definition: must be timer irq num defined by soc
-
-Examples:
----------
-
-	timer0: timer@20a000 {
-		compatible = "csky,gx6605s-timer";
-		reg = <0x0020a000 0x400>;
-		clocks = <&dummy_apb_clk>;
-		interrupts = <10>;
-		interrupt-parent = <&intc>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
new file mode 100644
index 000000000000..888fc8113996
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/csky,gx6605s-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: gx6605s SOC Timer
+
+maintainers:
+  - Guo Ren <guoren@kernel.org>
+
+properties:
+  compatible:
+    const: csky,gx6605s-timer
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
+    timer@20a000 {
+        compatible = "csky,gx6605s-timer";
+        reg = <0x0020a000 0x400>;
+        clocks = <&dummy_apb_clk>;
+        interrupts = <10>;
+    };
-- 
2.47.2

