Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA4286D7A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238492; cv=none; b=GQPH0c2koXxUv7Zn9b+cFETGGiEUyyxOnK4UG9MgrnAikv6OEGidNqvyzrKlvpTfU5iFm9AgM1icGNItmkOCH7XOmrHn4lGYV49EET+o+bIfGuQfEoomq8/6XcBqOn7qLmBvMwhITlBGhksakMy06iuFb0QKSzNEuug/yjkci7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238492; c=relaxed/simple;
	bh=GdgEkaZVjswiBEs+3bYeidL9yhjp1EX2Mem4kOua3EU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxXTEYbQU8W9BXbMKKwhwF3WQKL8Nb/SOcen5hj0vhgqvt8VeoyPsfssv9jUziz+9s50tjDhsXSc+lDa0uCbtoVlfeKXKYONvT7OUtNlouISygmf5XfL3QwDdPk7SWcWg1ZBGhr4IVgdleBgYZYFXFZtZ1G2dHxDxgqyVyxnRbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyr-0003B9-6s; Wed, 18 Jun 2025 11:21:17 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-004758-2R;
	Wed, 18 Jun 2025 11:21:16 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-005QWt-28;
	Wed, 18 Jun 2025 11:21:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 18 Jun 2025 11:21:14 +0200
Subject: [PATCH v5 3/4] dt-bindings: clock: cdce6214: add binding for pin
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-clk-cdce6214-v5-3-9938b8ed0b94@pengutronix.de>
References: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
In-Reply-To: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750238476; l=3666;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=GdgEkaZVjswiBEs+3bYeidL9yhjp1EX2Mem4kOua3EU=;
 b=NT/xHvpP3fRHyz0yhWxr/UdWPL5YXAnLpHBMhJCUv4/rXAU1+PpYiXCkSx6gUAPXLzxrqxwmS
 ePNO3mwqMBUDL4hdYF+ggupweTWaD1uBNK8Ph45ERYWx8LQQ2CAMh9f
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Add pin configuration binding for the TI CDCE6214. The CDCE6214 has
an internal EEPROM to to fully configure the chip, but this EEPROM
might be empty, so add support for configuring the chip through
the device tree.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
index 0a952b634079ec74bbf1114d1beb9fd5ee8682ec..615aac29761e7e3d5c5c0147f5246c9bdd228210 100644
--- a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -33,9 +33,78 @@ properties:
       - enum: [ priref, secref ]
       - const: secref
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
+patternProperties:
+  '^clk@[0-1]$':
+    type: object
+    description:
+      optional child node that can be used to specify input pin parameters. The reg
+      properties match the CDCE6214_CLK_* defines.
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        description:
+          clock input identifier.
+        minimum: 0
+        maximum: 1
+
+      ti,clkin-fmt:
+        enum: [ lvcmos, xtal, differential ]
+        description:
+          Clock input format.
+
+      ti,xo-cload-femtofarads:
+        description:
+          Selects load cap for XO in femto Farad (fF). Up to 9000fF
+        minimum: 3000
+        maximum: 9000
+
+      ti,xo-bias-current-microamp:
+        description:
+          Bias current setting of the XO.
+        minimum: 0
+        maximum: 1758
+
+  '^clk@[2-9]$':
+    type: object
+    description:
+      optional child node that can be used to specify output pin parameters.  The reg
+      properties match the CDCE6214_CLK_* defines.
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        description:
+          clock output identifier.
+        minimum: 2
+        maximum: 9
+
+      ti,clkout-fmt:
+        enum: [ cmos, lvds, lp-hcsl ]
+        description:
+          Clock output format.
+
+      ti,cmosn-mode:
+        enum: [ disabled, high, low ]
+        description:
+          CMOSN output mode.
+
+      ti,cmosp-mode:
+        enum: [ disabled, high, low ]
+        description:
+          CMOSP output mode.
+
 required:
   - compatible
   - reg
@@ -53,8 +122,34 @@ examples:
         clock-generator@67 {
             compatible = "ti,cdce6214";
             reg = <0x67>;
+            #address-cells = <1>;
+            #size-cells = <0>;
             #clock-cells = <1>;
             clocks = <&clock_ref25m>;
             clock-names = "secref";
+
+            clk@1 {
+                reg = <1>; // CDCE6214_CLK_SECREF
+                ti,clkin-fmt = "xtal";
+                ti,xo-cload-femtofarads = <4400>;
+                ti,xo-bias-current-microamp = <295>;
+            };
+
+            clk@3 {
+                reg = <3>; // CDCE6214_CLK_OUT1
+                ti,clkout-fmt = "cmos";
+                ti,cmosp-mode = "high";
+                ti,cmosn-mode = "low";
+            };
+
+            clk@4 {
+                reg = <4>; // CDCE6214_CLK_OUT2
+                ti,clkout-fmt = "lvds";
+            };
+
+            clk@6 {
+                reg = <6>; // CDCE6214_CLK_OUT4
+                ti,clkout-fmt = "lp-hcsl";
+            };
         };
     };

-- 
2.39.5

