Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959782441A7;
	Thu, 12 Jun 2025 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734919; cv=none; b=gEQjdlCpLXW2UgpH8l/yp6c0pwTUdnrvwqIWJKrbolz1qDVBYlGi4R9xhque1ZxQAW4amGWN+UvAWHB+h2Z6T/7Z5gsGBWyPZJvXlHJIb1DqP9Jp99IE6Ui0vqvJdiVVms7vGHsw+1t3ZKRD7qlB/P4MYTfCviDYgogzxAtPVi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734919; c=relaxed/simple;
	bh=RFCbFn5e77YVAf4a9A7CVRPUtquiepb4jkZ5TxMKZeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taC63jBL9DQogSfjvJYa5zssY6r1Qykx1Y8QdGSOTM5BwVgTXbzo8x9sGatHCK/VtKjEEDs6xpjlXiCOnRBu3Per5Tn0zCqxig2AzhJON/N35Ij08AhxZqQ88G+lC4cvFzammGwaukU+Og9hiuqo6IJ0vq3NK30tx3GfYcH1RsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K45QZpyt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K45QZpyt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a5123c1533so661611f8f.2;
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734916; x=1750339716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=K45QZpytm16VBQCGmA1wJqHJrL1VKf4mdDtjK4c9Uo4RNX/WeWisnvpV2FWU/UQDyg
         4x3TUMDs7x+y20rilPTpFfAKc/HOxMbfNlrLV5lHs52gi67FicNHTIhm0GwgY/RLyrVQ
         eMwUvFCBLdmBAFjkHDg0Gkp30jobGzVNOqzfUhyXK3+PCGVEiYnT82gt+fr8M0w90glf
         JcK1/tKhuwHX2MTcVifeRAwz0gmQUqy9kChB2hVGdNnddkPYRd2918r++aXYHJaJ0TFH
         PQJrAxCSt4kcOUJ5wH9OaCQY7wmf2krpcleO9z8J5cyDC5TH37B/RYMjvpZYXtSh750i
         GgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734916; x=1750339716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sCYZE5IfgD4vq8LpQHj7/SMtKJgfoiLAqLcowjxSDE=;
        b=RBaZ4/GR1mdiH9GJj0ab5feLlJSN/7MZ9BpTvVD1m/M4a/ZT/C3bdg3xuZ9+dCNsQT
         4sXXMPHTSp5ec9o+cBHKVwt18sd0Okiff2Vhxpj+kz+tkxV3YOAerV+Eqg0oV89AVKD4
         eAvax8mL0gJ86GxrET7KWsP7ynpZ1KdLU+WM/ke0wMCpq2i6+42ZRhu+eCbTnKuN0Ryy
         FLljnlB87jBtiaZN1dytPviwDf/8Ag4CuqPsD1cvOdJEVUh3UYkDjjAVxpAhirEKN4k5
         Hp1CQlGdWfEdx8R3zmV1e/9uEWgQ5uIkK7IMyqfls3uvLhJVIkQ57woO0OviG5WMqdPV
         rcBg==
X-Forwarded-Encrypted: i=1; AJvYcCV0PrpSL4NOXvBLDnEA0WYqWRh6q22qsEez6dEwZOeibKZVhIigMG41rntHG+rd53VqlUEhJknYxdNYSdC7@vger.kernel.org, AJvYcCXe0N/Ndc8XXN4oFMMmn5Md3VPRtriY7wOJpDyvqTDWBLMez4uG6x5lxZfFCUXJ6AvF0Zt0Kdqwq/Js@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Dy56t9KtHjuBL4mgM0maxxVhgmgW7blWxaqw9F4u1oXxKe+q
	bbdFkA+7qHM1pT946WPR8G5cBeng61IxI2z7iYJICq3aMJVMeYGsshmx
X-Gm-Gg: ASbGncv+2KzGSQLjF1PF4iMZYwR93t6YJeP2cDE8CZI8YyiOLiz75gCbH7S3GKzsiGA
	n4d4fcn4H4JwMG7QRkg1+u0oKzwExbkLD7VzLvDFA/XP+XV0cijjYy3Ono3BeKJYxyFYIbh6vRb
	iHrldST/msD2YeFqd4Aw7arYVpyumuD513HSdlMpvNNI0uDvV4Wx+4YnJ3rUG4uq6d9u7HT31mM
	xQVQ27YfhjOgsM//iooNHKZam5Y4YUnXoGSc/msQxkqJVagNI5re/vuyoUlJABWaX+twksVMKlk
	S501CkE2G81Dd6h5cZqw6JafYXaWLDmy3YXp6CKuR8h+XHPFX56Kugvzy0K/ln7PBJk4exEpEy8
	=
X-Google-Smtp-Source: AGHT+IF2Rk2EMA7CUDmu9RW+8xww+gs3Pr2zOlxJ5syLEar+9EgPxlxS8SPmYN1F0YFp/SKDPm47gA==
X-Received: by 2002:a05:6000:258a:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3a560760e2emr3033081f8f.54.1749734915582;
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:35 -0700 (PDT)
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
Subject: [PATCH v8 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Thu, 12 Jun 2025 15:28:10 +0200
Message-ID: <20250612132844.767216-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
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

