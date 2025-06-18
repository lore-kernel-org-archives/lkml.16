Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45011A2C06;
	Wed, 18 Jun 2025 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212018; cv=none; b=u+Qt54vWmpJvF5SB6nJZl9dhG37vw0+kSt2VjOrVpIEfrVQk1KQfGfUFd2MgbJUaoBs5LQVdOsRvNcjvEHy/rpvqcLTvRfke++ehZbKxHK0tQlx0H8rwbyY1jhOP0jbii49EApVpsnaTtTgwiH11UzR3wxsXyFRiiTxu2Pn5Cy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212018; c=relaxed/simple;
	bh=rFyq+k00g1iR4pymAZnHIBBhW32DLS17AQJkKExG+FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5mabxPRkkU0B1V6sBVaCPhXL7vHigKSaiwy+3MNEQT01zbD0sd5O4hUfipuPOLo9PW8FHuEzlNL0LWOHuptb5QvOTpy5XmvyAljA2hjt+W61j7JJxZB3KfIWeG+Ut3sOvuG80queDzqUoNeITtp9KAvjdJdGGLJIvQGUhprYCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB6h2MBz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB6h2MBz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so228320a91.0;
        Tue, 17 Jun 2025 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212016; x=1750816816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE1Gb1OrqiG3LYX4Be49eRK89ofo8s8025uwaNDm1VY=;
        b=WB6h2MBz7W+b1Ojmxe1VLqNgVdRmCVB6gREnq2bsGpweKeNjmkJV+kwd3p29wSkAdx
         7/8rzsy8svJYodLXIeEhsFIJ0t8sOkYv1FCMrqKBcsaYu5z8eCaU5/CR5j0Ss6VvR7ia
         d5iLf2AX7JjYfqxA8iT2b/crg/8e75H4zcbPt//3MY72fhkTSLqvafAQGUQUImGolh41
         PTBOsExTourx2zs9wAyl8anrKqP5ABtStjm1RS0wSv8CUm12pOsxNIr0mu6O7nEZ4I1I
         am/X4Lxk7Q2iFEoBBQLLJLzQIrs31Vc514eFtn7/Zi7dKIC0nKm3gCtKKgpd1vZXkRIj
         Tcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212016; x=1750816816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE1Gb1OrqiG3LYX4Be49eRK89ofo8s8025uwaNDm1VY=;
        b=io51zLQXtZL7JoAs2xaTC3TYtFv1wRFRTu4Wa25u64Q3FO4UwG3xhH1sd/ZHmcE+S3
         /wq+8qNymGF/b2RSzhLsdSL13Elp0TaNnF1Rl9LuT/g2UH4QO94xuug7cPiXRvrZWokM
         21Q59zDpPL2qZq9hegt7vxa9Ozvp7XEQF73UMQOqzNasDs9hzDTnJHbSEa2K5j6RKBHi
         G9+9nVXVzEvuJveb82CTbRRvucPsptn+erooYqg0T3XjA2j2cif/mROIR8AvOpr1q8u7
         Ogbln4fp86N/eGKAJNhcXsPnf97JVdUIET40xS2aOkpdLq5igWoKeeCbEIP5y4CGb5Zh
         kmZg==
X-Forwarded-Encrypted: i=1; AJvYcCWw9fXzoVkBH7OnNmbfQ6tgESBn8edyCjPp8ZB3VYH6qNOpvcYGTabdyeUacbfreutWCvu7Iq1w5LFzQw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrpBV2JLrKLUfGb+HsfMMVlAV9IddT6diK78cGUHtDW2du/fjg
	m77+hy20Nt9y0ZxjPaVpBp6k4itKf3xfLBOlfTQicGtCZkywUJ20xHef
X-Gm-Gg: ASbGncvHpEgLGvvIPax0YsznzcNy3d/2SYPk1QTNVUqw03zfHfWNbNWiQRNGM9zc6E4
	NiXqqFHmesdDuInJqcjp/CRN7qDsDnnYXvymyewwGjlWuV0H0Dw1lB7a3wCFcwBuPVcLOYCBC4K
	3um6/GFHNJfh6IU2xtNBv1ITfaQCvj734w1HsqngjeJ3wCjwkHT44wjaVT9PK27RNMpTk1cUCHu
	rNxSpNcwHLF+1NM+3gc8RO+CxSiBnSvEAQfpJk0nCLeOsHIy087t1lLNYq5o51wpEZ6Hy3huaOU
	bM2G6UxXsaHnuCXdDpqJa1PRC+rohs6pdkAOfPsCJ/mxxqNg2nPXA2yKxanfKYJzQZTuxZ4S
X-Google-Smtp-Source: AGHT+IFWxCdtQjg8rgmCsHjBzQbH7FXpOqcmxWb+qrwYJsBbZ1/KLDpnvQFLZBFfFo4AEIEP+41QoA==
X-Received: by 2002:a17:90b:5825:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-3157c6ef628mr1088722a91.1.1750212015879;
        Tue, 17 Jun 2025 19:00:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bcbb57sm11479969a91.7.2025.06.17.19.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
Date: Wed, 18 Jun 2025 09:58:49 +0800
Message-ID: <20250618015851.272188-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PCIe device node for SG2044 and configuration for Sophgo SRD3-10.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  30 +++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 175 ++++++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index c97bd62e5f06..1ca5fb707061 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -67,6 +67,36 @@ &msi {
 	status = "okay";
 };
 
+&pcie0 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <1>;
+	status = "okay";
+};
+
+&pcie1 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <0>;
+	status = "okay";
+};
+
+&pcie2 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <3>;
+	status = "okay";
+};
+
+&pcie3 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <2>;
+	status = "okay";
+};
+
+&pcie4 {
+	bus-range = <0x00 0xff>;
+	linux,pci-domain = <4>;
+	status = "okay";
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index aae4539dea98..6ec955744b0c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,181 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		pcie0: pcie@6c00000000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x00300000 0x0 0x00004000>,
+			      <0x48 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x000c0000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x48 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x10000000  0x0  0x10000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x14000000  0x0  0x14000000  0x0 0x04000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <65 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie1: pcie@6c00400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x00400000 0x0 0x00001000>,
+			      <0x6c 0x00700000 0x0 0x00004000>,
+			      <0x40 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x00780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x04000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie2: pcie@6c04000000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x04000000 0x0 0x00001000>,
+			      <0x6c 0x04300000 0x0 0x00004000>,
+			      <0x58 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x040c0000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
+					<0 0 0 2 &pcie_intc2 1>,
+					<0 0 0 3 &pcie_intc2 2>,
+					<0 0 0 4 &pcie_intc2 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x58 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x30000000  0x0  0x30000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x34000000  0x0  0x34000000  0x0 0x04000000>,
+				 <0x43000000 0x5a 0x00000000  0x5a 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x59 0x00000000  0x59 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc2: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie3: pcie@6c04400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x04400000 0x0 0x00001000>,
+			      <0x6c 0x04700000 0x0 0x00004000>,
+			      <0x50 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x04780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
+					<0 0 0 2 &pcie_intc3 1>,
+					<0 0 0 3 &pcie_intc3 2>,
+					<0 0 0 4 &pcie_intc3 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x50 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x20000000  0x0  0x20000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x24000000  0x0  0x24000000  0x0 0x04000000>,
+				 <0x43000000 0x52 0x00000000  0x52 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x51 0x00000000  0x51 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc3: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
+		pcie4: pcie@6c08400000 {
+			compatible = "sophgo,sg2044-pcie";
+			reg = <0x6c 0x08400000 0x0 0x00001000>,
+			      <0x6c 0x08700000 0x0 0x00004000>,
+			      <0x60 0x00000000 0x0 0x00001000>,
+			      <0x6c 0x08780000 0x0 0x00001000>;
+			reg-names = "dbi", "atu", "config", "app";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			clocks = <&clk CLK_GATE_PCIE_1G>;
+			clock-names = "core";
+			device_type = "pci";
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc4 0>,
+					<0 0 0 2 &pcie_intc4 1>,
+					<0 0 0 3 &pcie_intc4 2>,
+					<0 0 0 4 &pcie_intc4 3>;
+			msi-parent = <&msi>;
+			ranges = <0x01000000 0x0  0x00000000  0x60 0x10000000  0x0 0x00200000>,
+				 <0x42000000 0x0  0x40000000  0x0  0x40000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0x44000000  0x0  0x44000000  0x0 0x04000000>,
+				 <0x43000000 0x62 0x00000000  0x62 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x61 0x00000000  0x61 0x00000000  0x1 0x00000000>;
+			status = "disabled";
+
+			pcie_intc4: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&intc>;
+				interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+		};
+
 		msi: msi-controller@6d50000000 {
 			compatible = "sophgo,sg2044-msi";
 			reg = <0x6d 0x50000000 0x0 0x800>,
-- 
2.49.0

