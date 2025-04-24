Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8AC23024D;
	Thu, 24 Apr 2025 09:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487702; cv=none; b=G9QE5PRgclsIBpfrRkahYrLbK6yIb9apGyKpThNkwzeqE7eroQ7+HqsHUMs9EuGYhXu+XmOQIY91XT+b0HlXnUAwdx22R2NvgK6pZBXXPpaS+T/wqpC0J6pNs/JqUwN44zgoKlnyBXL8xzppFkwN8goYVoig7r45wkkTNQyHbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487702; c=relaxed/simple;
	bh=iNaOoUEoymoBiBYdwwkQ25zsZpW8c2VndainDOUrHVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LT1tGCssDk1up1SHVhgpnEv8av3Tey6necPZLVutW+ygrV47edXsd8uly0sXnXokseg9+eB74b+IJh1YGrORtL5Re6CvEgzZltdSkABDy4oIN5ewY0kBws7LMpiE/kG3eYmxpJ0pH8tzbcoSaFpmnT/HyVKEqs336iBd2hnmYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 36248341C25;
	Thu, 24 Apr 2025 09:41:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 17:40:50 +0800
Subject: [PATCH v9 2/3] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-03-k1-gpio-v9-2-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=iNaOoUEoymoBiBYdwwkQ25zsZpW8c2VndainDOUrHVE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgc8f6B1lgW+pmYKJ6f8TDONFg/Knz7C48t87
 4C3VC1YsFWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHPF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277btkEACZ0kHXXxE62dVklV
 +deYMCDSMF+LM7Q/yLJzv2wcuzKsOjlJY2gVwjs4feeLdh7Ni3RmRzzSRpdGD7UqQ0asTLQRMuk
 P75RK7PexH/vFp/kBrLDp9qUyf3GvRG54luADGWjnWvb+FCM636Os0Z+oDaf9dBKxZ1+4qo1ojp
 Ft6NzujtxXrkSaYoW0zvHwJWxy/jyiXrwcFKt4fP3qV7tcjkaRwM+80e9RTPv5pt0ZlTF87MrMd
 PT8Z83jXXuwAAk9ExwYudHu8icKwzF91D5JXlf791+1L8/S5V55ae2Ps6/uSg6rwHm3C7BBMvvs
 +FXNh9mvBd3ha13AhLK/YhvkOCEeo0CaPuZC3MiyMFKMar6ICEkveHz33VVwylFMUggVG9Fw0DN
 To+RqlnH2Vdxb1F3kuZReiRUbcBY9AyNd4RTxMuryP8hW5/B1BysY2Wr9VH+zL2nebKHJW6VQi5
 v5jwzUcQhA9o+1I3keuxpdzAGcLYUP6TEXzwItgR4V1iexfNkL3e4PvHpw0aSnhCqBtGmYP65x0
 gWJXNo4gxvVdNzWjUeBhb1nkE4G6QUbuhyksak/wzESFwJItToebRsM8z12tt6asMVHSc5s9f83
 rDdZp7us/ISwtPHGkaxaPly55gIvNm2ciglx/r+RIr3KybTZYnbdTif1sVmLQOcB1fOg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one bank and map pins to pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index a8eac5517f8578d60cb45214589ccb45ac376b9a..283663647a86ff137917ced8bfe79a129c86342a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -7,6 +7,9 @@
 
 #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
 
+/* Map GPIO pin to each bank's <index, offset> */
+#define K1_GPIO(x)	(x / 32) (x % 32)
+
 &pinctrl {
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..fbc4f1965c52c4f1aa80eaa0cda97a4be438c4f2 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -447,6 +447,24 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_GPIO>,
+				 <&syscon_apbc CLK_GPIO_BUS>;
+			clock-names = "core", "bus";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupts = <58>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			gpio-ranges = <&pinctrl 0 0 0 32>,
+				      <&pinctrl 1 0 32 32>,
+				      <&pinctrl 2 0 64 32>,
+				      <&pinctrl 3 0 96 32>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.49.0

