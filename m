Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F320D4F8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751802379; cv=none; b=XPY/+6oqgXYIbFDRnp/ATgqQ1qy/2l2TP20cWSpYWNF+GPzRdYWtVMb3HexOSjv/crheU9biI9DvZlK7+YGV4Z1YJv0R9DYnWP6ZsaBj9glnuVvj/c5JjrDSthakj5pjMNUy+Rdw6JsNIs9kekQD6uFTeb79do7suNx9ZK28Vk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751802379; c=relaxed/simple;
	bh=OWGxcklWWo0vv0ZQ8Q6Q56zQqcy4rZKZZq9hhvEnZuk=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=chWe0rLDvDIMgWTDrQZCTbFYu2pzrtPG7ZYAnXn5Bny1k1qKoOp+iBufSQzg3EoMLd+TxyxLQWtUawNrBlKEKPOHEVen+gLrcwWtlE8bK05InbcYZmArnq7kQ1T72vigTYzqVyduy0W/SrnPP6cDbWktgMTWcSKLh/3grXaaqm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=knCIVz+V; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="knCIVz+V"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250706114612euoutp0156769fa47f08e5c9fc3d36d36d78924b~PpvniTl7i1664616646euoutp01g
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:46:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250706114612euoutp0156769fa47f08e5c9fc3d36d36d78924b~PpvniTl7i1664616646euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751802372;
	bh=nmhVn6OSCj5podj8kRrzheU5aifoU9hBWKaGqoQKYps=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=knCIVz+Vkd0lcUcwUqNMozdPWvIRNNpQ7QxHCKojTYhonZXM/FMNYuJYHzRHLNxHT
	 tnwTfo63AMbduwVgZW9MjgbzdffPn/5o309U8/p5H7J2cN7Nph2o59gBV2cjHzVARQ
	 josV3AuKcTacWnpCAxQi0sLOaj+ivr5pOunx1Pgo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250706114610eucas1p151c3d14e5626fca708983cb98f22d670~PpvmPj2R13025630256eucas1p1J;
	Sun,  6 Jul 2025 11:46:10 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250706114609eusmtip27c6af922dc3eed77251113acc7594ebc~PpvkxwxS_0538305383eusmtip2N;
	Sun,  6 Jul 2025 11:46:09 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sun, 06 Jul 2025 13:45:17 +0200
Subject: [PATCH v9 6/6] riscv: dts: thead: Add PWM fan and thermal control
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-rust-next-pwm-working-fan-for-sending-v9-6-42b5ac2101c7@samsung.com>
In-Reply-To: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>,
	Benno Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250706114610eucas1p151c3d14e5626fca708983cb98f22d670
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250706114610eucas1p151c3d14e5626fca708983cb98f22d670
X-EPHeader: CA
X-CMS-RootMailID: 20250706114610eucas1p151c3d14e5626fca708983cb98f22d670
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
	<CGME20250706114610eucas1p151c3d14e5626fca708983cb98f22d670@eucas1p1.samsung.com>

Add Device Tree nodes to enable a PWM controlled fan and it's associated
thermal management for the Lichee Pi 4A board.

This enables temperature-controlled active cooling for the Lichee Pi 4A
board based on SoC temperature.

Reviewed-by: Drew Fustini <fustini@kernel.org>
Tested-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 4020c727f09e8e2286fdc7fecd79dbd8eba69556..c58c2085ca92a3234f1350500cedae4157f0c35f 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -28,9 +28,76 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <1000>;
+			thermal-sensors = <&pvt 0>;
+
+			trips {
+				fan_config0: fan-trip0 {
+					temperature = <39000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				fan_config1: fan-trip1 {
+					temperature = <50000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				fan_config2: fan-trip2 {
+					temperature = <60000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 1 1>;
+					trip = <&fan_config0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 2 2>;
+					trip = <&fan_config1>;
+				};
+
+				map-active-2 {
+					cooling-device = <&fan 3 3>;
+					trip = <&fan_config2>;
+				};
+			};
+		};
+	};
+
+	fan: pwm-fan {
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan_pins>;
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		pwms = <&pwm 1 10000000 0>;
+		cooling-levels = <0 66 196 255>;
+	};
+
 };
 
 &padctrl0_apsys {
+	fan_pins: fan-0 {
+		pwm1-pins {
+			pins = "GPIO3_3"; /* PWM1 */
+			function = "pwm";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";

-- 
2.34.1

