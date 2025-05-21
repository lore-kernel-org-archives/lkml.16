Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293211624CE;
	Wed, 21 May 2025 21:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861668; cv=none; b=KJbROlLKX3lobn0VJitcGxTOyqlWeJLBWGWH73SiTW1xxvtaeIsFaUd5jHcji8WK2QyottVnxphZ8oapS3T73K0zIes6t0NF1w1VBqUhfswmxFPxHVZOkpCBWhyCA7hWGoqeiN5nkxACJphVinH4McKneYqxECqQD9bK6b4pASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861668; c=relaxed/simple;
	bh=N6pm5AJXfl3EP2ikOAv/3aedBwcqB97XpBhWv2VjutA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXzkvGat4M6Xe1XYyAAdIz6XQdtbadMN3EwqXTVlbt+ANcMbOUwGmI+EFHQ+YJjkKmH0sEiCUBfrgq7ufOu5tuKFxQ4OBlVZW0jMPKOts12WKuyJ35s4CEZF7PvjQLzTX9HGxe7NqDPNO0hXQCnAEnyKaAsMcBeWsTk2FGezCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVw9nk6R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVw9nk6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D821C4CEE4;
	Wed, 21 May 2025 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861667;
	bh=N6pm5AJXfl3EP2ikOAv/3aedBwcqB97XpBhWv2VjutA=;
	h=From:To:Cc:Subject:Date:From;
	b=mVw9nk6R+cKUqriGslMoMdssk0fygiQVYhZy6fFYWAs5PvObDYvSAyLDugnIWTVcy
	 nrxw3y6t08vW0nrLTya94EXOD0xY126AauQd/NFAEHE801aR3UX3Rh4cFLka26A5SP
	 RnYFwPitB8hGaBNaPv2DthNbfXOOV98yVFTXhPCwHYQzbyvs8qFZLXAi+QTU5xba9H
	 pa1KVttfjQCxOka6oNr1jNz0M0RaW7b/vCF1yUx/HljjZHs9KyeALOSMJWseQFKhup
	 xjJ8yqcx7GUnIQonCkPerNyaRdzjbOwvZ/Wct6w1ZNJLTbL3DUduMd0FnoCKjzn5Vx
	 qfkA4p6dHOuyA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anders Berg <anders.berg@lsi.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert lsi,axm5516-clks to DT schema
Date: Wed, 21 May 2025 16:07:40 -0500
Message-ID: <20250521210741.60467-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Intel/LSI AXM5516 clock binding to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/lsi,axm5516-clks.txt       | 29 -------------
 .../bindings/clock/lsi,axm5516-clks.yaml      | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/lsi,axm5516-clks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/lsi,axm5516-clks.yaml

diff --git a/Documentation/devicetree/bindings/clock/lsi,axm5516-clks.txt b/Documentation/devicetree/bindings/clock/lsi,axm5516-clks.txt
deleted file mode 100644
index 3ce97cfe999b..000000000000
--- a/Documentation/devicetree/bindings/clock/lsi,axm5516-clks.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-AXM5516 clock driver bindings
------------------------------
-
-Required properties :
-- compatible : shall contain "lsi,axm5516-clks"
-- reg : shall contain base register location and length
-- #clock-cells : shall contain 1
-
-The consumer specifies the desired clock by having the clock ID in its "clocks"
-phandle cell. See <dt-bindings/clock/lsi,axxia-clock.h> for the list of
-supported clock IDs.
-
-Example:
-
-	clks: clock-controller@2010020000 {
-		compatible = "lsi,axm5516-clks";
-		#clock-cells = <1>;
-		reg = <0x20 0x10020000 0 0x20000>;
-	};
-
-	serial0: uart@2010080000 {
-		compatible = "arm,pl011", "arm,primecell";
-		reg = <0x20 0x10080000 0 0x1000>;
-		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clks AXXIA_CLK_PER>;
-		clock-names = "apb_pclk";
-	};
-																																};
-
diff --git a/Documentation/devicetree/bindings/clock/lsi,axm5516-clks.yaml b/Documentation/devicetree/bindings/clock/lsi,axm5516-clks.yaml
new file mode 100644
index 000000000000..7a792dbeffb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/lsi,axm5516-clks.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 LSI
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/lsi,axm5516-clks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LSI AXM5516 Clock Controller
+
+maintainers:
+  - Anders Berg <anders.berg@lsi.com>
+
+description:
+  See <dt-bindings/clock/lsi,axxia-clock.h> for the list of supported clock IDs.
+
+properties:
+  compatible:
+    const: lsi,axm5516-clks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+        clock-controller@2010020000 {
+            compatible = "lsi,axm5516-clks";
+            #clock-cells = <1>;
+            reg = <0x20 0x10020000 0x20000>;
+        };
+    };
-- 
2.47.2

