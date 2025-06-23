Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96C255F5F;
	Mon, 23 Jun 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683428; cv=none; b=reDRa6e6vWjfHZJ3PGNB+SrZ1m9uuD0F7l2RaLQY2YB5l2eiqmLG3zqL0u+mfLRt4IidbLU4rGrNxtfzV3mQ9i/OUDOsDwbqNKGJAYIReLhzbwXgI4kDwfUmD74jZaCyQczJ9V1wi0AeaINI6yOP1RtFbQT8jJC2S8VIau3KgAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683428; c=relaxed/simple;
	bh=6Ucfb1L2qIWPZPYszOsiQY5ELklXZC8qWZBX6OzDPyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQ+k8eAX5YFLL33ab/H0V5cZnvaZ/+mYqTzvKXUTGy6jpQUGZJTa7Mg6+CJcqq9fURUIV2sKKpVft0XApHe5s67j45tveRdJVTgunQGUmdodpcrS8CaCwrxa52xBM2kOTQdzNltt/94UIyxU+/Q2GscNj/PCI/NVAVyXu+jSbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrmrexSb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrmrexSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063DBC4CEF0;
	Mon, 23 Jun 2025 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683428;
	bh=6Ucfb1L2qIWPZPYszOsiQY5ELklXZC8qWZBX6OzDPyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrmrexSb7s2B0rwEd3k6FjaQH9FDthqJ78OwE105n2ChC8RJ+fOH+6Fy1mDMBQmKX
	 TVbUWV2HEuzd1h4frHvAtTePvUUX+/qMRGNwG/v82+MzHlPRg7ZhfkE16EiFcqw046
	 0ogEwBwvtxJsBYJlwygufv6S2OY5kopxjCGxY6xKLV+HvZ2EJxVcxPkRAoRK0sFbqx
	 QDlRcESNbq4rrvaEbEn/HCET+1MWbgA07yS0VvL16THp7xZ5V89BxMHSremTIWQe+D
	 FjthczL/uZsLG9fAgCZavnwvxfb1cYGW1FxXuUrpKM3GRoIH7FTAIogtJthNa+DTAA
	 9QM4VUxJ2wQfg==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] dt-bindings: clk: microchip: mpfs: remove first reg region
Date: Mon, 23 Jun 2025 13:56:19 +0100
Message-ID: <20250623-hypnotist-research-c6e8af149d02@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UdUqQObnXpHYaHDeBwfkNqw526ibviGaaI8ii4cMcNg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfh/eO/tU9G0JrHy57NtajeBnCyofGSw9tfmIqNlup lffWI986yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE6t4zMuxq3H2r44Vbvb3A qvtThDtevXt52n8Rjxbfmjm2u8RruL8wMky7Llr1KGnV7Zc5mXdWbfHI6FQvq77xSmm/yAqORWz zTzICAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The first reg region in this binding is not exclusively for clocks, as
evidenced by the dual role of this device as a reset controller at
present. The first region is however better described by a simple-mfd
syscon, but this would have require a significant re-write of the
devicetree for the platform, so the easy way out was chosen when reset
support was first introduced. The region doesn't just contain clock and
reset registers, it also contains pinctrl and interrupt controller
functionality, so drop the region from the clock binding so that it can
be described instead by a simple-mfd syscon rather than propagate this
incorrect description of the hardware to the new pic64gx SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index e4e1c31267d2a..ee4f31596d978 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -22,16 +22,23 @@ properties:
     const: microchip,mpfs-clkcfg
 
   reg:
-    items:
-      - description: |
-          clock config registers:
-          These registers contain enable, reset & divider tables for the, cpu,
-          axi, ahb and rtc/mtimer reference clocks as well as enable and reset
-          for the peripheral clocks.
-      - description: |
-          mss pll dri registers:
-          Block of registers responsible for dynamic reconfiguration of the mss
-          pll
+    oneOf:
+      - items:
+          - description: |
+              clock config registers:
+              These registers contain enable, reset & divider tables for the, cpu,
+              axi, ahb and rtc/mtimer reference clocks as well as enable and reset
+              for the peripheral clocks.
+          - description: |
+              mss pll dri registers:
+              Block of registers responsible for dynamic reconfiguration of the mss
+              pll
+        deprecated: true
+      - items:
+          - description: |
+              mss pll dri registers:
+              Block of registers responsible for dynamic reconfiguration of the mss
+              pll
 
   clocks:
     maxItems: 1
@@ -69,11 +76,12 @@ examples:
   - |
     #include <dt-bindings/clock/microchip,mpfs-clock.h>
     soc {
-            #address-cells = <2>;
-            #size-cells = <2>;
-            clkcfg: clock-controller@20002000 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            clkcfg: clock-controller@3E001000 {
                 compatible = "microchip,mpfs-clkcfg";
-                reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
+                reg = <0x3E001000 0x1000>;
                 clocks = <&ref>;
                 #clock-cells = <1>;
         };
-- 
2.45.2

