Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D428BA93;
	Tue, 15 Apr 2025 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727219; cv=pass; b=K/88thkJ4sAmzmTvSWkQCh1ISERb22lRi26PnTlK/nS5jDLbxwDza9g4FM5DRJxqzPWXvCgxGw2htIMDQ3VPsE7r6x/Z6Kg4877lCjLW+FQYwOEhEnMBBjIqSsy7Nk9Q+BUXiMb9HBZvwf/sT9ABHu87q/vMSWwApBzoaPXyclA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727219; c=relaxed/simple;
	bh=IudflqImdm+ZwbpvNjpoNoGi2CoQwHJjQFVz8r3/Sj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnbs0c8AEHGmOOWismvGN9KvizHa7jTEmxt+msof7c2imN2fF6jQMwFJQvo4jh0exeiJBc9glYGGLiZiz9J4zi4D4kRwxMkksS0p5bp8Gpf3Mc1aO0GpsZM0DC5D9ZRoI0lp4fx/GxdEmvlQzHQQYQeBnGH+MJcD4xdQ2/qo0iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=PZ36VKr/; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="PZ36VKr/"
ARC-Seal: i=1; a=rsa-sha256; t=1744727170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ML/45lXZs42EehsX2v4/xhy31k5chYIL1I61DDmvrR+eT8Q2vkiDTJMXAJ0kPlenepRfJSxuZwMLTZkQuw+boz0SsxuNBNKuFscALKjNTxV14089OhsthYU5Y5jxVIyKI/kRQVBEytcEBetWwPYMZoGf295swrrufGvs2dlsOkY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744727170; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EPlebBCWRgSBAYpdwC7xAZIbyevkA4TQGmd5kkCqttQ=; 
	b=c76ehCo4qHib/xIhLuKkuafsGf1H2nIX0Ac+K4+Q5NliVO6m7qlIDoow1Iq7UL6Ln3KE25vq+CNP+VrpxgN6CyR+tV1iyFWWxT3lL24dgqLRZEEPrIZRWE5XpF/iASeMw0bYDCV1dTrCsPC6IeYZRd0jklkSM8opsYfA+LcaZjM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744727170;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=EPlebBCWRgSBAYpdwC7xAZIbyevkA4TQGmd5kkCqttQ=;
	b=PZ36VKr/6FrfcWiuBhLOaWaypMMcjfveFeSws1iiaG3j0pNH+T7zepjQYtLuG0XP
	IunIi6IViWwsBSkjUw9n3mF+iqyELB9EDGPpM8Pne69ZVyI+7AAU6aWNAEsBUbA6lLO
	b0SS2akl2L4BHr6edyUENrYVgPO+L2utwTKUp4xc=
Received: by mx.zohomail.com with SMTPS id 1744727168155994.4408975901637;
	Tue, 15 Apr 2025 07:26:08 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Tue, 15 Apr 2025 22:25:13 +0800
Subject: [PATCH v6 3/3] riscv: dts: canaan: Add clock definition for K230
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-b4-k230-clk-v6-3-7fd89f427250@zohomail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
In-Reply-To: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112276280ef7c906a309989db09cc0000530d331676b406d85d4d23d5b0524e752c5822bf618f965ce5:zu0801122732c0758bb82e4d424ccfd56d0000b94ad08532ddcaf05e1de0ce69ee13526c34b2178a5076253f:rf0801122cbe35ff99dc05f2511c12cb8900003999233cd3c7ad6a05229b3d7aa9f65f1dfee119a7e933251ec33cf1406f:ZohoMail
X-ZohoMailClient: External

This patch describes the clock controller integrated in K230 SoC
and replace dummy clocks with the real ones for UARTs.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..e688633acbbf2cee36354220c557252111f56ff5 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -58,10 +59,10 @@ l2_cache: l2-cache {
 		};
 	};
 
-	apb_clk: apb-clk-clock {
+	osc24m: clock-24m {
 		compatible = "fixed-clock";
-		clock-frequency = <50000000>;
-		clock-output-names = "apb_clk";
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
 		#clock-cells = <0>;
 	};
 
@@ -89,10 +90,18 @@ clint: timer@f04000000 {
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
 
+		sysclk: clock-controller@91102000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x1000>,
+			      <0x0 0x91100000 0x0 0x1000>;
+			clocks = <&osc24m>;
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@91400000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91400000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART0>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -102,7 +111,7 @@ uart0: serial@91400000 {
 		uart1: serial@91401000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91401000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART1>;
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -112,7 +121,7 @@ uart1: serial@91401000 {
 		uart2: serial@91402000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91402000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART2>;
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -122,7 +131,7 @@ uart2: serial@91402000 {
 		uart3: serial@91403000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91403000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART3>;
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -132,7 +141,7 @@ uart3: serial@91403000 {
 		uart4: serial@91404000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91404000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART4>;
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;

-- 
2.34.1

