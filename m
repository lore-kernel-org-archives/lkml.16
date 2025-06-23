Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044322FE17;
	Mon, 23 Jun 2025 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673089; cv=none; b=NG+x8cwrncJbbnTSwbBQwC2go4o9Yhl3bLE2PqkkurfjFSy1aZtF1KxbCxMv/lZCBZC73bOqnxYuFh8DbV5PMgCaHUsAXp5TreeeNJpjH1+t9JSQwdV8+jB4lrWH9Tcgm/8SuaAOEdznEXZzbKJJRwkdo6ee3htz5j+UJOcCMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673089; c=relaxed/simple;
	bh=NXEjDcq4AnGCDN/NnKqbEE5G4xjgu/VcsJZ9NfuevUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiyfYlRsfeWHjEL/zBzuyYNN0XaKHUpWljVcZCJxi3/z4/VPOLFNo+AGzLXm+xkyL9OHKL54oQpP4ekXA0j+5ZmwnNyVJ3/8i204JzZ2OwbW5H+OpZYj5w/1Qtx/48Sbb9pEBruyI8gjFDqzqgbaFrd4Oqb+5wHrS8MKwnRhHv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3ptWtJlloxg+rCA--.29805S4;
	Mon, 23 Jun 2025 18:04:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 23 Jun 2025 18:04:17 +0800
Subject: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
 Ze Huang <huangze@whut.edu.cn>, Alex Elder <elder@riscstar.com>, 
 spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:qwCowAD3ptWtJlloxg+rCA--.29805S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtF4rGF43XrWkXrWfJw48tFb_yoW3GF1Up3
	yxCFZ3CrWvqF1Yvwn0qFZrKrWkGFW8Ka93WwnFyw1fJF9agFWqvF4xJFyxtF1UX34DZw45
	tF95Arykta10qw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUbYFAUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

UART devices in Spacemit K1 use dma-bus DMA translations. Move these
nodes under dma-bus to reflect this fact.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 246 ++++++++++++++++++-----------------
 1 file changed, 128 insertions(+), 118 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 99c76997b367f733c9dda2c30dd85817294ef9b7..0d41694699851e672a833601b62c2b2ad3daae79 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -357,114 +357,6 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
-		uart0: serial@d4017000 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017000 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART0>,
-				 <&syscon_apbc CLK_UART0_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <42>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart2: serial@d4017100 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017100 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART2>,
-				 <&syscon_apbc CLK_UART2_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <44>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart3: serial@d4017200 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017200 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART3>,
-				 <&syscon_apbc CLK_UART3_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <45>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart4: serial@d4017300 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017300 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART4>,
-				 <&syscon_apbc CLK_UART4_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <46>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart5: serial@d4017400 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017400 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART5>,
-				 <&syscon_apbc CLK_UART5_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <47>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart6: serial@d4017500 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017500 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART6>,
-				 <&syscon_apbc CLK_UART6_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <48>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart7: serial@d4017600 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017600 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART7>,
-				 <&syscon_apbc CLK_UART7_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <49>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart8: serial@d4017700 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017700 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART8>,
-				 <&syscon_apbc CLK_UART8_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <50>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart9: serial@d4017800 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017800 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART9>,
-				 <&syscon_apbc CLK_UART9_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <51>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
 		gpio: gpio@d4019000 {
 			compatible = "spacemit,k1-gpio";
 			reg = <0x0 0xd4019000 0x0 0x100>;
@@ -562,16 +454,6 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
-		sec_uart1: serial@f0612000 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xf0612000 0x0 0x100>;
-			interrupts = <43>;
-			clock-frequency = <14857000>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "reserved"; /* for TEE usage */
-		};
-
 		camera-bus {
 			compatible = "simple-bus";
 			ranges;
@@ -588,6 +470,134 @@ dma-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
+
+			uart0: serial@d4017000 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017000 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART0>,
+					 <&syscon_apbc CLK_UART0_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <42>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart2: serial@d4017100 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017100 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART2>,
+					 <&syscon_apbc CLK_UART2_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <44>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart3: serial@d4017200 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017200 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART3>,
+					 <&syscon_apbc CLK_UART3_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <45>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart4: serial@d4017300 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017300 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART4>,
+					 <&syscon_apbc CLK_UART4_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <46>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart5: serial@d4017400 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017400 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART5>,
+					 <&syscon_apbc CLK_UART5_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <47>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart6: serial@d4017500 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017500 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART6>,
+					 <&syscon_apbc CLK_UART6_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <48>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart7: serial@d4017600 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017600 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART7>,
+					 <&syscon_apbc CLK_UART7_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <49>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart8: serial@d4017700 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017700 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART8>,
+					 <&syscon_apbc CLK_UART8_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <50>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart9: serial@d4017800 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017800 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART9>,
+					 <&syscon_apbc CLK_UART9_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <51>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			sec_uart1: serial@f0612000 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xf0612000 0x0 0x100>;
+				interrupts = <43>;
+				clock-frequency = <14857000>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "reserved"; /* for TEE usage */
+			};
 		};
 
 		multimedia-bus {

-- 
2.49.0

