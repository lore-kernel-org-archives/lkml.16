Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E9C1F4617;
	Mon,  5 May 2025 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461993; cv=none; b=av3h6g+yhtWyFh5NE34OscQaLjphYGYHY5zBsp9FniucbLC0kCYw1vi/LhtFrN0TOFgVOYZYpYz5Iqmw2cuXYCOZ58Gzr0ktDMt74EHvdwSWQLW9GEqgw2grVfsxSsyQYv7g8NccVsJyZIwgTWSJa3pJ7+EI4N339ODKTNZMIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461993; c=relaxed/simple;
	bh=UkvPRWuod71Fp70g9R5zV823OEYH+sv+hMR/PR2UOOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nli/27X/ukrF35jJ1oNvp8yeXyBiYhAg1QDgTyI89eb8tL2lYtOCWYyWhk2bDKbGgmJG5v1BR1FXULnlYB5CsTwyKcZ8xt5V1ukN4sQsHnl2XX774esul4m5v74lLwKmBAoEOnxtGxKlS3iIvM30vs+VzwF5CzcrYQlvwIcWGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2Lr8hTJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2Lr8hTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA5DC4CEE4;
	Mon,  5 May 2025 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746461992;
	bh=UkvPRWuod71Fp70g9R5zV823OEYH+sv+hMR/PR2UOOM=;
	h=From:To:Cc:Subject:Date:From;
	b=p2Lr8hTJi0oIU3vOkxpWphPOg4q6XrKLb2cwqWcaZYM8MNsyZUwujsaPErwely1UZ
	 T9saHQVBrwfM65SNqCgpej0CKHjDxjNTPBQuSXsF290dJK8DEwKp0TrdDZV6OgEJvb
	 g3DLHRpKgfUGgp2XMfBHqxsFqptgMAJEaa2XK0bKllt+cUe2YULjpFmgmf6apcP7pt
	 ChhW11LQJu3PLhUhZbI9ZUYupl+0DiqmjV9HKgwdPST5lE+kgrujmZps+niMmh2BBY
	 g4+h/gjiSVC5pK1AeKNZVuiez6qglBNDOhS0fOINqmOIDEhImLpheY4EM/fRVV7azn
	 Iazs+BYC6D06w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Drop maxim,max77686.txt
Date: Mon,  5 May 2025 11:19:42 -0500
Message-ID: <20250505161943.1433081-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock binding for Maxim MAX77686/MAX77802/MAX77620 is already
covered by mfd/maxim,max77686.yaml.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/maxim,max77686.txt         | 114 ------------------
 MAINTAINERS                                   |   1 -
 2 files changed, 115 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.txt

diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.txt b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
deleted file mode 100644
index c10849efb444..000000000000
--- a/Documentation/devicetree/bindings/clock/maxim,max77686.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-Binding for Maxim MAX77686/MAX77802/MAX77620 32k clock generator block
-
-This is a part of device tree bindings of MAX77686/MAX77802/MAX77620
-multi-function device. More information can be found in MFD DT binding
-doc as follows:
-	bindings/mfd/max77686.txt for MAX77686 and
-	bindings/mfd/max77802.txt for MAX77802 and
-	bindings/mfd/max77620.txt for MAX77620.
-
-The MAX77686 contains three 32.768khz clock outputs that can be controlled
-(gated/ungated) over I2C. Clocks are defined as preprocessor macros in
-dt-bindings/clock/maxim,max77686.h.
-
-
-The MAX77802 contains two 32.768khz clock outputs that can be controlled
-(gated/ungated) over I2C. Clocks are defined as preprocessor macros in
-dt-bindings/clock/maxim,max77802.h.
-
-The MAX77686 contains one 32.768khz clock outputs that can be controlled
-(gated/ungated) over I2C. Clocks are defined as preprocessor macros in
-dt-bindings/clock/maxim,max77620.h.
-
-Following properties should be presend in main device node of the MFD chip.
-
-Required properties:
-
-- #clock-cells: from common clock binding; shall be set to 1.
-
-Optional properties:
-- clock-output-names: From common clock binding.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. Following indices are allowed:
-    - 0: 32khz_ap clock (max77686, max77802), 32khz_out0 (max77620)
-    - 1: 32khz_cp clock (max77686, max77802),
-    - 2: 32khz_pmic clock (max77686).
-
-Clocks are defined as preprocessor macros in above dt-binding header for
-respective chips.
-
-Example:
-
-1. With MAX77686:
-
-#include <dt-bindings/clock/maxim,max77686.h>
-/* ... */
-
-	Node of the MFD chip
-		max77686: max77686@9 {
-			compatible = "maxim,max77686";
-			interrupt-parent = <&wakeup_eint>;
-			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
-			reg = <0x09>;
-			#clock-cells = <1>;
-
-			/* ... */
-		};
-
-	Clock consumer node
-
-		foo@0 {
-			compatible = "bar,foo";
-			/* ... */
-			clock-names = "my-clock";
-			clocks = <&max77686 MAX77686_CLK_PMIC>;
-		};
-
-2. With MAX77802:
-
-#include <dt-bindings/clock/maxim,max77802.h>
-/* ... */
-
-	Node of the MFD chip
-		max77802: max77802@9 {
-			compatible = "maxim,max77802";
-			interrupt-parent = <&wakeup_eint>;
-			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
-			reg = <0x09>;
-			#clock-cells = <1>;
-
-			/* ... */
-		};
-
-	Clock consumer node
-
-		foo@0 {
-			compatible = "bar,foo";
-			/* ... */
-			clock-names = "my-clock";
-			clocks = <&max77802 MAX77802_CLK_32K_AP>;
-		};
-
-
-3. With MAX77620:
-
-#include <dt-bindings/clock/maxim,max77620.h>
-/* ... */
-
-	Node of the MFD chip
-		max77620: max77620@3c {
-			compatible = "maxim,max77620";
-			reg = <0x3c>;
-			#clock-cells = <1>;
-			/* ... */
-		};
-
-	Clock consumer node
-
-		foo@0 {
-			compatible = "bar,foo";
-			/* ... */
-			clock-names = "my-clock";
-			clocks = <&max77620 MAX77620_CLK_32K_OUT0>;
-		};
diff --git a/MAINTAINERS b/MAINTAINERS
index cf5d0b25e94b..d25ddbf312c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14610,7 +14610,6 @@ F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77705*.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77843.yaml
-F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
 F:	drivers/leds/leds-max77705.c
 F:	drivers/*/*max77843.c
 F:	drivers/*/max14577*.c
-- 
2.47.2

