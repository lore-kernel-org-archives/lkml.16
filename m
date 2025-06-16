Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C3C29ACEA;
	Mon, 16 Jun 2025 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073009; cv=none; b=DUPwXx15+TukFcrhHDPE8amruLu5PAH64PyRFrzS2YvSMcrPLqgx4Q+vdyg2AXJ9F4l0Su0BY8uRgs1IL5zAykl4QzPx8fCSarFJh3uiU0vw8vZ0tXDpyRYjXVHJpB2rUMsUBh9TKns6dLFuV/bmvCH5nEFn0CQsAzmRqqfKV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073009; c=relaxed/simple;
	bh=kzGngVQLKJmSvAj307fFJjLeD7Enh4XUOwI2qPpogm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbtGxeB0vzoPJITHZHNQdDe3YtSpRKNS0wxZrqZX4D0BKwVTyH9fIXq5kKca4ARK845eUsXViPlIcvUanaxCKujFy2jwNUxM0isKbnCfsjjahnW8kLzhB0lggcVo2mbyZ2rkHHAMNSW/om/myXYoE5U2OjmfZHcl9RSTvSU3hn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=FgRI8ApM; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="FgRI8ApM"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=11275;
  q=dns/txt; s=NAESA-Selector1; t=1750073007;
  x=1781609007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kzGngVQLKJmSvAj307fFJjLeD7Enh4XUOwI2qPpogm0=;
  b=FgRI8ApMgPw5OxTRfjpP85Ry/Ang9o91A1fVildB0FxqEsMWPYbZFMX4
   H9s4re7L+EAyoignP0yWEwn2Mqzv6HatDGAxoLmXwV/PyXp2R+AX2q1T0
   HwKU4xnoLiOA605CQPOHvr4Jse+QWzkVZ508tjIxS6oqhglUQx4HDMAAX
   KpgJJ716y5blCLVyZRfXeZS3uNPlAkX4B28LimAgJxrGmqzRwdukUuBoK
   1WA1E0CCEnqiulRMi45mQ9tbkwE+zPgilVinaH/hNj6zJMrX5+gErSn9X
   WawC5D+eF5zHNCUX1KdgvV9okXpRJT09iXj+lefjcgUbwYOXRuOZZoxDD
   w==;
X-CSE-ConnectionGUID: 3Kse2lV/Qtqmslc2Nb3/Cg==
X-CSE-MsgGUID: qzX1TI/kRFan0IS3wBrpEg==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117909"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:25 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] riscv: dts: add initial support for EIC7700 SoC
Date: Mon, 16 Jun 2025 16:53:15 +0530
Message-Id: <20250616112316.3833343-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0755 (UTC) FILETIME=[0E451E30:01DBDEB1]

From: Min Lin <linmin@eswincomputing.com>

Add initial support for EIC7700 SoC that uses a SiFive Quad-Core
P550 CPU cluster.

This file is expected to grow as more device drivers are added to the
kernel.

Signed-off-by: Min Lin <linmin@eswincomputing.com>
Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Co-developed-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 MAINTAINERS                            |   2 +
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 345 +++++++++++++++++++++++++
 2 files changed, 347 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fadb4bae91f..84ecf004a59c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8919,7 +8919,9 @@ M:	Min Lin <linmin@eswincomputing.com>
 M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
 M:	Pritesh Patel <pritesh.patel@einfochips.com>
 S:	Maintained
+T:	git https://github.com/eswincomputing/linux-next.git
 F:	Documentation/devicetree/bindings/riscv/eswin.yaml
+F:	arch/riscv/boot/dts/eswin/
 
 ET131X NETWORK DRIVER
 M:	Mark Einon <mark.einon@gmail.com>
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
new file mode 100644
index 000000000000..c3ed93008bca
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2024 Beijing ESWIN Computing Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <1000000>;
+
+		cpu0: cpu@0 {
+			compatible = "sifive,p550", "riscv";
+			device_type = "cpu";
+			d-cache-block-size = <64>;
+			d-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache_0>;
+			reg = <0x0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
+					       "zba", "zbb", "zicsr", "zifencei";
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "sifive,p550", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache_1>;
+			reg = <0x1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
+					       "zba", "zbb", "zicsr", "zifencei";
+			tlb-split;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "sifive,p550", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache_2>;
+			reg = <0x2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
+					       "zba", "zbb", "zicsr", "zifencei";
+			tlb-split;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "sifive,p550", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv48";
+			next-level-cache = <&l2_cache_3>;
+			reg = <0x3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
+					       "zba", "zbb", "zicsr", "zifencei";
+			tlb-split;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		l2_cache_0: l2-cache0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <262144>;
+			cache-unified;
+			next-level-cache = <&ccache>;
+		};
+
+		l2_cache_1: l2-cache1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <262144>;
+			cache-unified;
+			next-level-cache = <&ccache>;
+		};
+
+		l2_cache_2: l2-cache2 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <262144>;
+			cache-unified;
+			next-level-cache = <&ccache>;
+		};
+
+		l2_cache_3: l2-cache3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <262144>;
+			cache-unified;
+			next-level-cache = <&ccache>;
+		};
+	};
+
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmcounters =
+				<0x00001 0x00001 0x00000001>,
+				<0x00002 0x00002 0x00000004>,
+				<0x00004 0x00006 0x00000078>,
+				<0x10009 0x10009 0x00000078>,
+				<0x10019 0x10019 0x00000078>,
+				<0x10021 0x10021 0x00000078>;
+		riscv,event-to-mhpmevent =
+				<0x00004 0x00000000 0x00000202>,
+				<0x00005 0x00000000 0x00004000>,
+				<0x00006 0x00000000 0x00002001>,
+				<0x10009 0x00000000 0x00000102>,
+				<0x10019 0x00000000 0x00001002>,
+				<0x10021 0x00000000 0x00000802>;
+		riscv,raw-event-to-mhpmcounters =
+				<0x00000000 0x00000000 0xffffffff 0xfc0000ff 0x00000078>,
+				<0x00000000 0x00000001 0xffffffff 0xfffe07ff 0x00000078>,
+				<0x00000000 0x00000002 0xffffffff 0xfffe00ff 0x00000078>,
+				<0x00000000 0x00000003 0xfffffffc 0x000000ff 0x00000078>,
+				<0x00000000 0x00000004 0xffffffc0 0x000000ff 0x00000078>,
+				<0x00000000 0x00000005 0xffffffff 0xfffffdff 0x00000078>,
+				<0x00000000 0x00000006 0xfffffe00 0x110204ff 0x00000078>,
+				<0x00000000 0x00000007 0xffffffff 0xf00000ff 0x00000078>,
+				<0x00000000 0x00000008 0xfffffe04 0x000000ff 0x00000078>,
+				<0x00000000 0x00000009 0xffffffff 0xffffc0ff 0x00000078>,
+				<0x00000000 0x0000000a 0xffffffff 0xf00000ff 0x00000078>,
+				<0x00000000 0x0000000b 0xffffffff 0xfffffcff 0x00000078>,
+				<0x00000000 0x0000000c 0xfffffff0 0x000000ff 0x00000078>,
+				<0x00000000 0x0000000d 0xffffffff 0x800000ff 0x00000078>,
+				<0x00000000 0x0000000e 0xffffffff 0xf80000ff 0x00000078>,
+				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-noncoherent;
+
+		clint: timer@2000000 {
+			compatible = "eswin,eic7700-clint", "sifive,clint0";
+			reg = <0x0 0x02000000 0x0 0x10000>;
+			interrupts-extended =
+				<&cpu0_intc 3>, <&cpu0_intc 7>,
+				<&cpu1_intc 3>, <&cpu1_intc 7>,
+				<&cpu2_intc 3>, <&cpu2_intc 7>,
+				<&cpu3_intc 3>, <&cpu3_intc 7>;
+		};
+
+		ccache: cache-controller@2010000 {
+			compatible = "eswin,eic7700-l3-cache", "sifive,ccache0", "cache";
+			reg = <0x0 0x2010000 0x0 0x4000>;
+			interrupts = <1>, <3>, <4>, <2>;
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-sets = <4096>;
+			cache-size = <4194304>;
+			cache-unified;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "eswin,eic7700-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			interrupt-controller;
+			interrupts-extended =
+				<&cpu0_intc 11>, <&cpu0_intc 9>,
+				<&cpu1_intc 11>, <&cpu1_intc 9>,
+				<&cpu2_intc 11>, <&cpu2_intc 9>,
+				<&cpu3_intc 11>, <&cpu3_intc 9>;
+			riscv,ndev = <520>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		uart0: serial@50900000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x50900000 0x0 0x10000>;
+			interrupts = <100>;
+			clock-frequency = <200000000>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart1: serial@50910000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x50910000 0x0 0x10000>;
+			interrupts = <101>;
+			clock-frequency = <200000000>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart2: serial@50920000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x50920000 0x0 0x10000>;
+			interrupts = <102>;
+			clock-frequency = <200000000>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart3: serial@50930000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x50930000 0x0 0x10000>;
+			interrupts = <103>;
+			clock-frequency = <200000000>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart4: serial@50940000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x50940000 0x0 0x10000>;
+			interrupts = <104>;
+			clock-frequency = <200000000>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		gpio@51600000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x0 0x51600000 0x0 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpioA: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts =
+					<303>, <304>, <305>, <306>, <307>, <308>, <309>,
+					<310>, <311>, <312>, <313>, <314>, <315>, <316>,
+					<317>, <318>, <319>, <320>, <321>, <322>, <323>,
+					<324>, <325>, <326>, <327>, <328>, <329>, <330>,
+					<331>, <332>, <333>, <334>;
+				gpio-controller;
+				ngpios = <32>;
+				#gpio-cells = <2>;
+			};
+
+			gpioB: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				ngpios = <32>;
+				#gpio-cells = <2>;
+			};
+
+			gpioC: gpio-port@2 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <2>;
+				gpio-controller;
+				ngpios = <32>;
+				#gpio-cells = <2>;
+			};
+
+			gpioD: gpio-port@3 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <3>;
+				gpio-controller;
+				ngpios = <16>;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
-- 
2.25.1

