Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FE193436;
	Sat, 12 Apr 2025 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744443928; cv=none; b=gB2zENkiWEOGJEeOOv0zPYG7BfV3ux+0G231zWU8vmvePf39h7nTfLRHN+CIIMkgIiXDBz8ohO5I5JCGN9fe26/GUQ9ffA/NBmrHbpkmJzG10B5Jgu9XoqD5XeBQXKN/GcyfVHfScGNHpNPT2dCNNB12imvYML6v6xSQHl+zbP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744443928; c=relaxed/simple;
	bh=UUekQ+hmbRafXezwQfvGqgkW4SxSALiwI+khIEoSHBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZuYvK5JfwakbrxrFwWafb3b4Rsky4V5Dipo6y89Zam840jLS6E8YvrWFssPwTIDl8XRb+46U5q6ZD8myaGbxEb/I/WGYL8BFRx3E479WWxXlXNpfxfncBBFIz69SExYOwV06nYEz5miFEPtJE1sjzACPENp/6IYB/fIL7fA1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=UBuBJv/Y; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=tLAMbZZs; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="UBuBJv/Y";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="tLAMbZZs"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id CC29D12FB435;
	Sat, 12 Apr 2025 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443926; bh=UUekQ+hmbRafXezwQfvGqgkW4SxSALiwI+khIEoSHBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBuBJv/Y7zQB6ME7Kyk3ApFqLiaN0e3fGwYFx1a26/4GrylSIs8xp6FFuIERB4wqR
	 316pXYNKT6tyZsCOm+FpGQUUWDz3ynIqbB53C5ls9wxO+qQEQZ24Yt+rCtaT7E+P05
	 3DJCn1lhzQpuXePwuBLK0w4lMsPH1rIaeu/J5fNcdC3s7vNajpyYqpu3EXit+7QUWZ
	 jVM5nFQpDpB3ux+lgCEviOCjs/kmFk9SER2aFVv1Bb1wsJQi3JAH0WTDLt2Bh6nvVZ
	 KNPDb8tDP5+BiU2AhXs1Zjhhr72OOBlyL8vispJnA3XRadkiL5X3XVa/1+XxSlmiAe
	 J7hghSNcN6+XA==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOov7k0QC9bK; Sat, 12 Apr 2025 00:45:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 1C1A512FB432;
	Sat, 12 Apr 2025 00:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443925; bh=UUekQ+hmbRafXezwQfvGqgkW4SxSALiwI+khIEoSHBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tLAMbZZsnAbIaxY+pqyiJCLhbjcy7xNmvv8mO1ykfbT6f4tT234X1uZ9sjAW3Gx9n
	 B09aP3Haljoj0+Xnd4nxHcBXGNtTnq8/HJJSd/hyr6Evk2vieFilkLRoT2s5N+BxOz
	 m8cAi1bc4tLgiNDlLlwaFIs2syPolyXYYdaCgJ9on85PsyzwFMFuEdxN3mU7mBjQOX
	 qjNAfJmr6CPuTeumfNoRfG9b7CkHJMYbYTqO1NC/67pn7zOY8Zo8VNMkYx2qGzpUOx
	 p2zo7DXFXkqpijYdu1H+sbRiID8EWsuBJ7rIhn+J/UtyvcrQZP5AupaAGeIWUw1SkU
	 9sTr1MtigVcbw==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v7 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT K1
Date: Sat, 12 Apr 2025 07:44:23 +0000
Message-ID: <20250412074423.38517-7-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412074423.38517-2-heylenay@4d2.org>
References: <20250412074423.38517-2-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the PLL and system controllers that're capable of generating
clock signals in the devicetree.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12..584f0dbc60f5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/spacemit,k1-syscon.h>
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
 		};
 	};
 
+	clocks {
+		vctcxo_1m: clock-1m {
+			compatible = "fixed-clock";
+			clock-frequency = <1000000>;
+			clock-output-names = "vctcxo_1m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "vctcxo_24m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_3m: clock-3m {
+			compatible = "fixed-clock";
+			clock-frequency = <3000000>;
+			clock-output-names = "vctcxo_3m";
+			#clock-cells = <0>;
+		};
+
+		osc_32k: clock-32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			clock-output-names = "osc_32k";
+			#clock-cells = <0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -314,6 +346,17 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_apbc: system-control@d4015000 {
+			compatible = "spacemit,k1-syscon-apbc";
+			reg = <0x0 0xd4015000 0x0 0x1000>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;
@@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
 			reg = <0x0 0xd401e000 0x0 0x400>;
 		};
 
+		syscon_mpmu: system-controller@d4050000 {
+			compatible = "spacemit,k1-syscon-mpmu";
+			reg = <0x0 0xd4050000 0x0 0x209c>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		pll: system-control@d4090000 {
+			compatible = "spacemit,k1-pll";
+			reg = <0x0 0xd4090000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			spacemit,mpmu = <&syscon_mpmu>;
+			#clock-cells = <1>;
+		};
+
+		syscon_apmu: system-control@d4282800 {
+			compatible = "spacemit,k1-syscon-apmu";
+			reg = <0x0 0xd4282800 0x0 0x400>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		plic: interrupt-controller@e0000000 {
 			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xe0000000 0x0 0x4000000>;
-- 
2.49.0

