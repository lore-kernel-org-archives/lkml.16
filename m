Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2962265CDD;
	Tue, 10 Jun 2025 20:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586363; cv=none; b=HuOxqjgiCz1IeUs8af8WwILdzO6gP+KxEFwVPcrVVGJzid0UqSPYbrsHRS3zLOXswnlDssnQIihBV/ZJHtDVGs/kiIZQDQYVB4yOla9DSPhzZ6APNYp+R7+KmfwOFx3AyJQWaomFXlBb09PPiyFtf+kH1V6BA0Dde/EjEv9Mq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586363; c=relaxed/simple;
	bh=RFCbFn5e77YVAf4a9A7CVRPUtquiepb4jkZ5TxMKZeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiMM++zLFeMyCCeLwoWOBBmQS6vbh3uCyIouGnj7Q3WQ+/xKb3tlQt89unTbxOTF/WEgiCyRcrJQAxbcwCcHs802UE5oMD9ERxWkBUkZ8ubJXeLjqsGuDFPGTRSX/qhlxfsv5S5qeQf4KJHaA4k2O/lDKWrPyt8YzYyjdTvz6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZmSgmar; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZmSgmar"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d7b50815so51496765e9.2;
        Tue, 10 Jun 2025 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586360; x=1750191160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=RZmSgmaryIZl09GLl+5PqqTvNyS/lGF0jl86QmXlIsts9ZzR1kWfFQaxfLOMMQ5a7O
         ueN5TMqWh+L7eRRmB3OkfaflhFP5l0eGO7AmV7pU33xFs6wAdO5pkib+OUrygtI3Uifr
         Ed/hQYUntXP3txfgSVsMGaVYIiGKwMtYgjB8Y6yYUhHvT5kID1+ZYQgYyObXnrWWZcZ7
         D59lhRxAI/ms6nB4wuy750z7izysXQZ3WFlX+QKoB5Wrl0YYQaeFU2Ltudm9H2fXonlz
         RjdAItHnV7ASeHSbJf3tuG1wKCgjb92IJv9Ibj7WVd+k9Abhxg5Yz2cbJBj/58Lm4dHs
         Ehfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586360; x=1750191160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=JCUt5w7gdSxMKe6vaOSBB38R0rKuHu8ZjrPLVogMT/PHi92I5OSrXifgDfH5f5CiAE
         EI5JBMF9H6mexolUov2xMK6k9y9uOC2RGzNDF4Yn0hp89p4v9ARsEo8vTo7GxxAPHAZP
         SsUShGr0RbBK+SB4cZOQKaTSVrDbMTf+U8Far+oeMoIhRwiq4X/rKDimk0en26iXobI/
         K2ArihrWP/tnOSEK5IVzrWHabsFU+YabQFORreF7sIIqBiq1V6S4j0SLlRV6fIfdETAn
         EmCB3uJRM4JUYZLMz2DHl2eKtgsfEuJBhe5rR1hV9Ao0yh/8oTTqKlVr1RdWreKsL+uN
         djsw==
X-Forwarded-Encrypted: i=1; AJvYcCVHNdDp7SqIyCrSpy3kMOtfCOw7KP8Zdwm8ixl0hXRC55gBJZlpR1CmzIm+VRe2d+Qe2w7mCcORnWWAarH6@vger.kernel.org, AJvYcCW19VqSNJdhrnZjrUfblnifxlvZf1DnYpUEBIZ3oR+J7wTdtD6pqe7ZRSXtqyuYdhpKu7xo2oxujbdR@vger.kernel.org
X-Gm-Message-State: AOJu0YwhELm9cPvAX2bz69icyYCCAzU29TJI3h/qKf23AALeR7pxSIYQ
	Y5V3bA/bde0MvOah3DC+oWIT76Ex+3igVbzl1m8vHo3CqAPcTJDiM0Gv
X-Gm-Gg: ASbGncuC58nornKk103zuwOdIyeW67jELt9PV8x+CXe5VRm/3fZsh8nZfivnSUNcBtz
	ADA/qOFpmto+EdoJhr7dMsf1kKVECewjT7f+tmzC4OZdNnNwON+9zzBWTASOS+MrFaUlqT3xhLi
	J+Low/bmKowt88iKTBWj28BWUT5k7LdmG28Qf7GFo2+Dt89oyxNaohjPWl1+D0P28jBVaA1p6ME
	xHcThPJ5gflv1opKBvIDFyH2Wu8xfshJt2X24sMFc3z0yRkU5MMjHfYf6MD/yk5fKg4P+aQj+4m
	2zmrniNExGNA/+E+9agSKv+Ulk3vmAHJKuD4PRrGuHCjEpC/6sxjiVgfUuZL+G36DUeHUjDuv8A
	=
X-Google-Smtp-Source: AGHT+IHyEoGHD5tepEtrwPhkiYB04vT6fIVhYLL1fSUiVeF1jVVohZotdneB827s6FkCiDb96kHwFw==
X-Received: by 2002:a05:600c:4446:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-45324eded2amr990395e9.8.1749586359758;
        Tue, 10 Jun 2025 13:12:39 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:39 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Tue, 10 Jun 2025 22:12:15 +0200
Message-ID: <20250610201241.730983-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..51177dfe9ed2
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv180x.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+		cpu_on = <0xc4000003>;
+		cpu_off = <0x84000002>;
+	};
+
+	soc {
+		gic: interrupt-controller@1f01000 {
+			compatible = "arm,cortex-a15-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x01f01000 0x1000>,
+			      <0x01f02000 0x2000>;
+		};
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
-- 
2.49.0

