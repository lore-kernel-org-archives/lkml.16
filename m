Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5725CC72
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009197; cv=none; b=fOd+QMsD2985zD6xaxZFtF93b5o302D84goAe0wEP++51Wi0Gi+AuM/EaRBXqQtUVL4x86Pe8q4SI8Reg1/xnByHckqdy9XhWkaycT5pAmnzpstYtjAmpCHiVlrvWWuUjb8gbtVZrA6scX3nkXEzHwLeDr8hQE5rR9bEjZ7RaA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009197; c=relaxed/simple;
	bh=mq/lfbjEAahbi8v/Yxilo1z7mltq0L7V1rgg9IzAxl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZF/KRpZjsFT2TzhJ5I6St3NyuypWFXX/TYPmt7Onu84RMP4m7ku9hbgSoP9EdQkiBxxPfHXDe5SpGgk4k/1fUN9I4i2Xhj49afl7V7InLFwdzg52jBLN4dLdLNmG4j7Yo84nM8mKnwF/vIn90S4vKJ2gPA40HaU22W72RWATuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ck0Yu9BV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ck0Yu9BV"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so11833158a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009193; x=1746613993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXuUx7wovZ0PAW+LIKC1wW/SlMfBkmpMINNtgC9+O8I=;
        b=ck0Yu9BVnnMdw34p7HSlErxRD1LPCsKyDzBzNdttlnPFn8axfz4T1fGMiOeggXjm8z
         +MELIVUAXEFoEYgDSHGdsRXoaVmcoPauY5C0TTQD95J+EsndSv/khEKRO4j1bLwl+6IL
         QcATaKzHvfWeKSWIWbK3HHlnCFeXjI5AhRyMUTEjC93mhDzp2Xp0/zIHo9GSPkFwE95U
         g+XqsZl1QUx15vjuIxlh16u8hOa/XZehgiwuvkfoOEvbpEAzx4wvWaXhPrWdVR606PTa
         6apMufzFd8Ir05VBJFjwfLfLkvZphRkiOiBQzSyOn2SscSzamXvtGzrzzIYvjL+O2kP2
         kF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009193; x=1746613993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXuUx7wovZ0PAW+LIKC1wW/SlMfBkmpMINNtgC9+O8I=;
        b=qffDutXs/YmwYrf2m/sMF/ebGPbBGCuUd3gMVYh0xWGy3pvJ49DHMiN9vRV1XmjGHc
         8HDpjn0bXzS4bfcn4EL23XkM1KC+ZSAivpEPrjl6EwhZUWX51EgXVKRxCw3OA79/oud5
         w0v1frr25Icul9wO8ja1d97KOmrJeZr2El5edcKzpF5B5CKoIL9yBH6O41iHMzMg8SY0
         AcN7VFwKYRZQL03qo5mg1WlWzJduFLgW1t3sfFHG8NVSKGw4t3PFWsgzG1eVDmj/vcxg
         mEhqEysxN+AcQqd15QsRK/3x+hUgcdxnax8eGL/92PzPb/6v/dkeQxiNB/80vLnf05rW
         69SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwjXDqFAT4SlOhGwMw1Il9oEpP/oUfxdYTZs4K5C/6kiFE8p5adfpVog2Xo/dQ4thZQtm6pKxKXvkA9mE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzstAdRoEh6swwc6DZNxjQDP+rLCDvmxygEz5IwSQPbLC30skYK
	bDvtPPilCbnJDMMtjnu0bv+VelLaoiqfD8SsTknSuUvcar3RZBYKB7U45X3PjVI=
X-Gm-Gg: ASbGncsvGT/7yH0GFZ+5JxTwclYMNmv0cVMhW2gPx116vh9ypDOsDZotoEvoqpgE7J3
	q2kEHhJLWyT6n7IJIM8niqWeooctrDon2kOb38QIwGd97J3t+nTSTOVTlVfjGJjAZJbkhCqH6l/
	AWx6u8oTZ5vGXdsKxZvOrZ1Fs/sZKQkbsm+NKoRwspk7r0NC3TYMh6i2+8J9UuXrOHau4o7inTm
	PJt/sgdBEjDeJPLbBHnzUWl1xyl0Lyv7mZFE8XmuVF68Db4GN41ue4CashobVM9grAHfZ91Bz86
	g3wFL3j60aXzWt92+AfqdghAoyvF+7D32DcWkPCvhWoYliwkzW5od2C3Ml09CCk8RGstjIk=
X-Google-Smtp-Source: AGHT+IFBnCMqwv/bA5b/iHfecbvBB+Yr4Jy1p1ir0HdMA9k60f2mMrCz9DtJCVKYrl1BbCQtAeT7Qg==
X-Received: by 2002:a17:907:3ea6:b0:ac3:48e4:f8bc with SMTP id a640c23a62f3a-acee25c74a2mr231543466b.48.1746009193099;
        Wed, 30 Apr 2025 03:33:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/8] arm64: dts: renesas: r9a08g045s33: Add PCIe node
Date: Wed, 30 Apr 2025 13:32:34 +0300
Message-ID: <20250430103236.3511989-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S SoC has a variant (R9A08G045S33) which support PCIe. Add the
PCIe node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
index 3351f26c7a2a..d8e1dc80e56e 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
@@ -12,3 +12,73 @@
 / {
 	compatible = "renesas,r9a08g045s33", "renesas,r9a08g045";
 };
+
+&soc {
+	pcie: pcie@11e40000 {
+		compatible = "renesas,r9a08g045s33-pcie";
+		reg = <0 0x11e40000 0 0x10000>;
+		ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
+		dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
+		bus-range = <0x0 0xff>;
+		clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+			 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+		clock-names = "aclk", "clkl1pm";
+		resets = <&cpg R9A08G045_PCI_ARESETN>,
+			 <&cpg R9A08G045_PCI_RST_B>,
+			 <&cpg R9A08G045_PCI_RST_GP_B>,
+			 <&cpg R9A08G045_PCI_RST_PS_B>,
+			 <&cpg R9A08G045_PCI_RST_RSM_B>,
+			 <&cpg R9A08G045_PCI_RST_CFG_B>,
+			 <&cpg R9A08G045_PCI_RST_LOAD_B>;
+		reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
+			      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
+		interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
+				  "int_serr_fatal", "axi_err_int", "inta_rc",
+				  "intb_rc", "intc_rc", "intd_rc",
+				  "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
+				  "dma_int", "pcie_evt_int", "msg_int",
+				  "int_all";
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
+				<0 0 0 2 &pcie_intx 1>, /* INT B */
+				<0 0 0 3 &pcie_intx 2>, /* INT C */
+				<0 0 0 4 &pcie_intx 3>; /* INT D */
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		power-domains = <&cpg>;
+		renesas,sysc = <&sysc>;
+		vendor-id = <0x1912>;
+		device-id = <0x0033>;
+		status = "disabled";
+
+		pcie_intx: legacy-interrupt-controller {
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
-- 
2.43.0

