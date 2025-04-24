Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5104319CCEA;
	Thu, 24 Apr 2025 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480936; cv=none; b=pLq86sgxxI8dWDaXbw25ewr1temRgfpR7vzEGR85bALasOVidsUxxjPT1pZeh3afriOPpxJ1n2uKVyyHSndb0g+TYJ4EBDU6phxymRB4S+Omw1Xik8Vb6tY+SNdqb2sHfJWMNGVSee1ulmbQsjHTUQ5n1f3qWXhY/5Mljn+KkpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480936; c=relaxed/simple;
	bh=PSBL89fZtJaG8KAAaHC8dhsJ5ZC/9UnwuHL7NKRrOGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGhfbfu7u7F6uFgG0UKYLqquK7oBu54xQN2+6M6w4AgpkSC+ctqTXVZ3IgjKEwvK6+IoLPIOCW/oVxImeQHCS31MzawyoPsLlmb3e0MmfkVqmmWYpNYJEaINUXzn4lyLCdTZ2nYX0wt/lFb5eAgjD8S8tqho6HdX8feo9TaNAUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 99EBF342F8C;
	Thu, 24 Apr 2025 07:48:49 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 15:48:09 +0800
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Acquire clocks for UART
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-05-dts-clock-v2-2-17d83a705c4c@gentoo.org>
References: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
In-Reply-To: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4601; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=PSBL89fZtJaG8KAAaHC8dhsJ5ZC/9UnwuHL7NKRrOGc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCezSX9kHDfqtvgPgbGFXPIJ1D/Dd6MYrv6tUm
 8lqUdp4LQOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAns0l8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Y0pEACZPoqbaVSl/henUi
 G5cEshGVXKcH2bViUKZbg/rKrVRSRpMCUn9/C5x04sfCCi3SnIQJm/sGv4dA9ZJc61/vG1YTNsx
 Fsfgj4JK50/j28AAvt3qYVVscbctzjoqrvfhKv1MTz3zhxt6Rch9bC8X4jOg8oPlClQutwRC5qt
 L+2OrylGmoT6azAdIisZ6hZ2mOQvFifFO8iw5lDXccYK5ftC5pjUosc5x9uEwM5TM8Ova7nSUjd
 ry7d+X3aRq6SvDmzWeJpys6p9M0xmIRh+B3vrLRBkRmvAyGEwSLplcoTNc6zjchWTWj3ycrS2dB
 chyVfSJMl92a7pRZix1WIEH+XStT1+yeklCcNbW4OlgxPV7vrfseZWKtHgn0qZo4KazDTH9iOex
 4eJl5/uDgpB7gVqFhbc1LDhu5MheP+uFxEEPWnOVGTrarPw6tzBdt9onB8BkHvDPa9mLNS4KS+v
 P/gpNSxXzQKTekhrhnU3nYLtSsTYjLgAoL1WKg/oMh/+dzYn4DtDjYC524tGVPbkQpgM+UHpGjh
 y2WY0BzQJyu3uI+bynyfR6+daVkb36v+Be6+J8AH+OkNd5sc12lZVye6uJCSKEJwLguJqjhulUE
 MF5oYkyL2de401Slz2DpEvDf/Pq+NgtSEfxp5Wi5qEwOJxqsW0ijI+6Is1y04eUAA0Sw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The K1 SoC features two clocks for UART controller, Acquire them
explicitly in the driver. Also it is required to remove the
clock-frequency properties from the uart node, otherwise the new
clock properties are ignored by of_platform_serial_setup() in "8250_of.c".

Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 153fd1160182b42fe1a2f7f042c9c1da90f63b0c..7793fd37841ab432c66629b95b94c195b379ecd9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -360,8 +360,10 @@ syscon_apbc: system-control@d4015000 {
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART0>,
+				 <&syscon_apbc CLK_UART0_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <42>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -370,8 +372,10 @@ uart0: serial@d4017000 {
 		uart2: serial@d4017100 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017100 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART2>,
+				 <&syscon_apbc CLK_UART2_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <44>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -380,8 +384,10 @@ uart2: serial@d4017100 {
 		uart3: serial@d4017200 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017200 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART3>,
+				 <&syscon_apbc CLK_UART3_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <45>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -390,8 +396,10 @@ uart3: serial@d4017200 {
 		uart4: serial@d4017300 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017300 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART4>,
+				 <&syscon_apbc CLK_UART4_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <46>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -400,8 +408,10 @@ uart4: serial@d4017300 {
 		uart5: serial@d4017400 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017400 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART5>,
+				 <&syscon_apbc CLK_UART5_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <47>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -410,8 +420,10 @@ uart5: serial@d4017400 {
 		uart6: serial@d4017500 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017500 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART6>,
+				 <&syscon_apbc CLK_UART6_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <48>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -420,8 +432,10 @@ uart6: serial@d4017500 {
 		uart7: serial@d4017600 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017600 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART7>,
+				 <&syscon_apbc CLK_UART7_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <49>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -430,8 +444,10 @@ uart7: serial@d4017600 {
 		uart8: serial@d4017700 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017700 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART8>,
+				 <&syscon_apbc CLK_UART8_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <50>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -440,8 +456,10 @@ uart8: serial@d4017700 {
 		uart9: serial@d4017800 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017800 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_UART9>,
+				 <&syscon_apbc CLK_UART9_BUS>;
+			clock-names = "core", "bus";
 			interrupts = <51>;
-			clock-frequency = <14857000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";

-- 
2.49.0

