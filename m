Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DD13EFF3;
	Sat, 19 Apr 2025 03:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033585; cv=none; b=WEqq8grOKDi3imB4zpU4Vwq3z7gEFOCNVl2njwn5JfMqYT4z16juEDiolJta6NnA7nRk+mLIM1OWeKDDSpzM6nSmssIa+yevx1JU0LI591iTOWTJ+BuBP+STOo24TQWWzZQDTWVgqjqIlCZtu12213jAjVpmB/DJSdRsQjs9Ugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033585; c=relaxed/simple;
	bh=qG33W8pZh9cohXq8CNvMyPhQr05ENy2yUo6n0wyKswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtKF/3Vlt1fvM53hg+cOjKQKPBaZ6U2ImQkwcnKyzHd7hUtn6lSOyTU4RmhCSfifOMZILC5dWiteek4X14hN1mbHxkgeeA72Sr9lN7En20UVfXow11p1UwCG+WuqeNy64LTwsrsxP+ZviRghZ2s1ENcluFm3+2r6KQ0eCZ9UozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 18798342FFE;
	Sat, 19 Apr 2025 03:32:56 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 19 Apr 2025 11:32:31 +0800
Subject: [PATCH 2/2] riscv: dts: spacemit: Acquire clocks for UART
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
In-Reply-To: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4275; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qG33W8pZh9cohXq8CNvMyPhQr05ENy2yUo6n0wyKswk=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoAxla/CuSzJaQd3efb8dgbHtSmb3zQpqQCiCBL
 CBemk1p3raJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAMZWl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Y8uD/0aDEL9y1ipWFny2s
 Q/8scp0VWSTj7mU1DwAhO65jJ3yS9eYJChvJasDXDZukcMrHXxCMXTo5NEL+x0dTAd67TehU9Cb
 KogxfclpbSgkCHrQe0MTxrByjFd9DUHXU5i4a67KmT4exYcl1D4BbJKXS/1KU1n/68GYgZ4YApr
 cZkMd6T0gkY/jdrUF2VWCilp0iabpPhFMLcHjTzALtsfjJMb/24ZVwdyDUO2c5nWx3qDeaxVbf7
 0J7uWfTCamGpWePfnjQfl163ZjzLIcpfzsyGCQ+ctoAOdEwnHiLNyQXhyMqdbZAOZ5WBgL6kpq3
 zo88xoGGNvjj1Th9ECoHAcBGs/Uz1Cqy3ngtarlaBL+d4jI/sJb71r8PdWp6EFzwmWLZ+leM1s6
 vNL+U/jH0kFkwkmq+xjj0Ve6vjRAO+LDIYGz0V5J4D2sDmiu3ykgaTO2U5n7+3Y04PFCGbPw0fE
 MCX686u7nxNoJUFr29tY5zRsTN5TmjhGCa+kQGw8SOavaF8JrIQYaHDvNu6bwFyDm06YZmVOrT1
 qVVhWDniWCAD1qZ1Hmof1kknBWbF1bGJ5qGsu5mrFtgbftllfTMGc0lFsUk6AAUgaTt1VTckHT8
 Mlog5Mqv6LGA71hkoOBziQvFKNxrXO/I4MbKZCvULP6+ECXSogvynude9N9/yISgzBhA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The K1 SoC features two clocks for UART controller,
Acquire them explicitly in the driver.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 153fd1160182b42fe1a2f7f042c9c1da90f63b0c..415e1c3e1c78db987cbb65759adc26e98aaa24d3 100644
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
@@ -431,7 +445,9 @@ uart8: serial@d4017700 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017700 0x0 0x100>;
 			interrupts = <50>;
-			clock-frequency = <14857000>;
+			clocks = <&syscon_apbc CLK_UART8>,
+				 <&syscon_apbc CLK_UART8_BUS>;
+			clock-names = "core", "bus";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -441,7 +457,9 @@ uart9: serial@d4017800 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017800 0x0 0x100>;
 			interrupts = <51>;
-			clock-frequency = <14857000>;
+			clocks = <&syscon_apbc CLK_UART9>,
+				 <&syscon_apbc CLK_UART9_BUS>;
+			clock-names = "core", "bus";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";

-- 
2.49.0

