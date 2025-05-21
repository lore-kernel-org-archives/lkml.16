Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1E50276;
	Wed, 21 May 2025 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861677; cv=none; b=PKyVkFu2ay8x0Xqyz2h+/DQw/u5vvzuADd9T2qyyIdqF+rideV5z6uu50D4Qnrog4+rTw8yv4GR39CanVujb2psZ9b+OgHOyczgYl5c+FnV4Rap+7CWeusqdXhALgrnBaq81ovTVN0tUKC+rpkWgWbrGJCOZpDjb/+uEHRippRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861677; c=relaxed/simple;
	bh=nGFyVKNPyoTaPlmw24+T44IdzETxFPg/pmUonSikyF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MHf894p2C97vdyls7FgTAymfJutvaP1GIXKmjTK56KoLwFnTjzERSaWk471rz1OESm3tw4XOumkE1HztIz7JSNdavr1mnhE3XeTaHTusw4ixCmUWBc+EC1vsRpq6WvYASyTn1KWlIPlPqyNbo2gO9+CPVqPB0WFt1ZuRsrBg3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNBcxmV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNBcxmV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C2FC4CEEA;
	Wed, 21 May 2025 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861676;
	bh=nGFyVKNPyoTaPlmw24+T44IdzETxFPg/pmUonSikyF0=;
	h=From:To:Cc:Subject:Date:From;
	b=dNBcxmV7fEWBXwTAa3Fsx8mdetuZ2YdCdNBAWeuISVfjShD/VVF6ByK0GTWfk2sor
	 2QgQOpXaiIpc5dF9xkT4yIf06iL0cu93ddue1kHZ/MOh3iaCQ0gqzCErVDpN7IFStQ
	 RreEjjbOl5LETsISjaeMIdugJuPoZQeaevytoOkB6Bdjtgixn7FWMQoYEiK6eKZStN
	 CADyykWzMEFtxWv37ZIrDxideudi+B/B8jhtcnLceG+XW9xJTTJ0cgvfxB6cxKM0n+
	 bhG73e1bPOG3rMbCIbjnxOyQa1aDTKuxd1pghFQzCGyVSg/9cI4utGzzItiXfJ7bDw
	 wr3cpeW1qK1Eg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Tang <dt.tangr@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert TI-NSPIRE clocks to DT schema
Date: Wed, 21 May 2025 16:07:49 -0500
Message-ID: <20250521210750.60759-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI-NSPIRE clock bindings to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/lsi,nspire-cx-clock.yaml   | 33 +++++++++++++++++++
 .../bindings/clock/nspire-clock.txt           | 24 --------------
 2 files changed, 33 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/lsi,nspire-cx-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nspire-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/lsi,nspire-cx-clock.yaml b/Documentation/devicetree/bindings/clock/lsi,nspire-cx-clock.yaml
new file mode 100644
index 000000000000..52c217d210d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/lsi,nspire-cx-clock.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/lsi,nspire-cx-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-NSPIRE Clocks
+
+maintainers:
+  - Daniel Tang <dt.tangr@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - lsi,nspire-cx-ahb-divider
+      - lsi,nspire-classic-ahb-divider
+      - lsi,nspire-cx-clock
+      - lsi,nspire-classic-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
diff --git a/Documentation/devicetree/bindings/clock/nspire-clock.txt b/Documentation/devicetree/bindings/clock/nspire-clock.txt
deleted file mode 100644
index 7c3bc8bb5b9f..000000000000
--- a/Documentation/devicetree/bindings/clock/nspire-clock.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-TI-NSPIRE Clocks
-
-Required properties:
-- compatible: Valid compatible properties include:
-	"lsi,nspire-cx-ahb-divider" for the AHB divider in the CX model
-	"lsi,nspire-classic-ahb-divider" for the AHB divider in the older model
-	"lsi,nspire-cx-clock" for the base clock in the CX model
-	"lsi,nspire-classic-clock" for the base clock in the older model
-
-- reg: Physical base address of the controller and length of memory mapped
-	region.
-
-Optional:
-- clocks: For the "nspire-*-ahb-divider" compatible clocks, this is the parent
-	clock where it divides the rate from.
-
-Example:
-
-ahb_clk {
-	#clock-cells = <0>;
-	compatible = "lsi,nspire-cx-clock";
-	reg = <0x900B0000 0x4>;
-	clocks = <&base_clk>;
-};
-- 
2.47.2

