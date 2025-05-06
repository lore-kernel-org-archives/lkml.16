Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFE335204;
	Tue,  6 May 2025 02:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498155; cv=none; b=i4JrjJCg/kSw0cuEFZ6Ux0ugx2hPE6ewGtcX21ddINddaB65v5N1pLEcQgpgjo2/prlZGqbjs/L3pOGZQS/HgeVChVX0pxO1v/QawBd3f7/2PuLV7p1vgTEuyIA9eK7cBhFYA27G5yChKOjSgHTiC9THjRUQQXVfR3j1PRP4GLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498155; c=relaxed/simple;
	bh=EMvHJm6AlZw7vnabYT6ymwxOGXfXeVxYv1w37tTq9J0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yhv5ztl3ipNMK9y8c+T8ON7PVk96PMrjZvfNHueFWmp2iq1bKFBccirUnFPiUJahU3aD2zLsWRXRDev9ycelJ4NhLJi9akWVlLkLvzSayBqdcz8VS3RERYMyk1tIXni00cfLiglfcoQT8P7zWt4Xn2IYEwEBvCwhJT3wYmJ9CNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUcpS5c6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUcpS5c6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DB0C4CEE9;
	Tue,  6 May 2025 02:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498155;
	bh=EMvHJm6AlZw7vnabYT6ymwxOGXfXeVxYv1w37tTq9J0=;
	h=From:To:Cc:Subject:Date:From;
	b=EUcpS5c6eg3gU0f+X9VzsnwVt0utXOzG5yD7Cap00EXM+Bl7sgzcXdaAxiPdtjiDJ
	 WVUfEAntQSmaylLM/ydMklMceDgX2n/kYSHdsNoNYJrkAGrlSeqpm/A5Pqgm3x2xY6
	 WA+lGR15Psucq5Ucf6MnGDUkE98Gd9rmEWqXUU+ozJ5TlKA//rPVbCYo3T0T2jVeB4
	 T1ztMsvZY5NSPWaSiRHV2lbxodLevHHZbD/G4wcSkBuK54ColdVVxVJKA+rAuaBn2G
	 LU7rlIleXIY+ru3cGZJd6cLlarT18QNina/fReoRucIXHEch0o07LSYscC4kWmE9IK
	 JrhgrsJdV2AoA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Convert cnxt,cx92755-timer to DT schema
Date: Mon,  5 May 2025 21:22:31 -0500
Message-ID: <20250506022232.2587186-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Conexant Digicolor SoCs Timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/cnxt,cx92755-timer.yaml    | 49 +++++++++++++++++++
 .../bindings/timer/digicolor-timer.txt        | 18 -------
 2 files changed, 49 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
new file mode 100644
index 000000000000..8f1a5af32a36
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cnxt,cx92755-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor SoCs Timer Controller
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+properties:
+  compatible:
+    const: cnxt,cx92755-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Contains 8 interrupts, one for each timer
+    items:
+      - description: interrupt for timer 0
+      - description: interrupt for timer 1
+      - description: interrupt for timer 2
+      - description: interrupt for timer 3
+      - description: interrupt for timer 4
+      - description: interrupt for timer 5
+      - description: interrupt for timer 6
+      - description: interrupt for timer 7
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@f0000fc0 {
+      compatible = "cnxt,cx92755-timer";
+      reg = <0xf0000fc0 0x40>;
+      interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
+      clocks = <&main_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/digicolor-timer.txt b/Documentation/devicetree/bindings/timer/digicolor-timer.txt
deleted file mode 100644
index d1b659bbc29f..000000000000
--- a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Conexant Digicolor SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "cnxt,cx92755-timer"
-- reg : Specifies base physical address and size of the "Agent Communication"
-  timer registers
-- interrupts : Contains 8 interrupts, one for each timer
-- clocks: phandle to the main clock
-
-Example:
-
-	timer@f0000fc0 {
-		compatible = "cnxt,cx92755-timer";
-		reg = <0xf0000fc0 0x40>;
-		interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
-		clocks = <&main_clk>;
-	};
-- 
2.47.2

