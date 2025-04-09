Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D621A451;
	Wed,  9 Apr 2025 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235554; cv=none; b=OpdPy2MrhONVo/7rqQt/zEA41ceFntWPu0V/Id1s3gKA3kKxeXYdoZO4WqCVNiTgMt+RDr2kiuJqwywwTKLdsPlaR7IVzsMbVfP8fZSY5ooq+bf24pnA2iuEeAd25vJBZZ/tKBH3IXLho72ZkmE+J2yiKryUaNzPJjOTrShcPLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235554; c=relaxed/simple;
	bh=tDrAT+BbyeoPC1cnbHm+N0m2OZYVHsC6MBKxaijdOFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCc/QeaigD569UoOUXuUfuveVjtnqAifOjMgNhsE6Gm2I2FvrQK1TAtfC6+BJEf5gjXCXZB5CUbZK/iA6NUBBWCUZiB8T97P0bT4It/i1fEgNnM6TTAlo+VCzPD73zPGmWbbag6d15ZUpXdt1lxe+c3SDf7ifijxWiFo0Qlqf0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9jjtyv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9jjtyv2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1375C4CEED;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744235554;
	bh=tDrAT+BbyeoPC1cnbHm+N0m2OZYVHsC6MBKxaijdOFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K9jjtyv29hIh4quHKzqIOZFAsLHTicus/m/wRN6J5XGuzpWFVK58fQVW0UY2DPkPP
	 wAn5mm+8S264/+dcpUFBbEMb9rBfFwVe1twam4W8ZSKJMJLHFu5oP7rCGagzeJUfBK
	 N0xaum3ROG6A3bKWYnMlJuRUbHBXW/cfUL+tAg9rvuc+g+RUL6dgUGTwEew9L3MPuq
	 twbcgU8iuSVzn9MbRT+T3mzDnlvwHZ/ma7aNZRFcMACR71bVQQ229vyzHckKUc23nh
	 a1Xyt1BSwLWLVpOABV1p0QeVYDd9C2nuXzPwULEsyF9rMSzqtraYB99ghAZEejCMys
	 O8M5HarrwbJXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E571DC36002;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 23:52:14 +0200
Subject: [PATCH v4 3/3] arm64: dts: apple: Add SPMI controller nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-spmi-v4-3-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744235552; l=2708;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=GL5MDHX1ynp82oR1XOrB9Oz6SPOYuVIO8f/ENpih52M=;
 b=eQ4cnKeAdHlViCFW86uXUAWuk+qcZDOtzliKB2jTojwIJAhnsrdgxfBvAUS5m5KGemviidJ7+
 hVrUhk3rK6cDV8thV+2YlzTrYJLZlMpMvvPNKo8WS6i069iXeXTce9X
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for the SPMI controller

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 7 +++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index e9b3140ba1a996eeb91b3f60470833060b632bd2..4c224e686ffe5602329f7f394d3354559c4130ab 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,13 @@ pinctrl_smc: pinctrl@290820000 {
 				<AIC_IRQ 0 749 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	nub_spmi0: spmi@2920a1300 {
+		compatible = "apple,t6000-spmi", "apple,spmi";
+		reg = <0x2 0x920a1300 0x0 0x100>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+	};
+
 	wdt: watchdog@2922b0000 {
 		compatible = "apple,t6000-wdt", "apple,wdt";
 		reg = <0x2 0x922b0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 97b6a067394e311ed19392a34237c74936dbb7d7..bdb1cb9e406a441e458b1c735359b0148146e91b 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	compatible = "apple,t8103", "apple,arm-platform";
@@ -741,6 +742,13 @@ pcie_pins: pcie-pins {
 			};
 		};
 
+		nub_spmi: spmi@23d0d9300 {
+			compatible = "apple,t8103-spmi", "apple,spmi";
+			reg = <0x2 0x3d0d9300 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@23d1f0000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3d1f0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index d9b966d68e4fae2dfb21d6fb7a97ebba81643ae8..950d1f906ba3023c1d118179207a2099345aae94 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -782,6 +782,13 @@ wdt: watchdog@23d2b0000 {
 			interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		nub_spmi: spmi@23d714000 {
+			compatible = "apple,t8112-spmi", "apple,spmi";
+			reg = <0x2 0x3d714000 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.49.0


