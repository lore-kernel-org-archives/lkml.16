Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C581DA634;
	Wed, 16 Apr 2025 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813696; cv=none; b=ir0VmBrb5F4bR1zmspLps4EKijZUWJ6B1ryn4BHJIpaPkZD+6K7pab995OhnScYVTdnrpxiFC0yol8j0ukvv7rSJZeCc7padwkPDHl0pK7KysV5++HqYZQP8muorhVguoF4+vH0w0P8WLFJd+TQtTMwY9aZNwVQ+q4xtfF8IUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813696; c=relaxed/simple;
	bh=la3Rmm9G09d9FtjBHydDxxb5tUNi7/hoVZW8CizR1E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBDjzKMxPojsMIkSrrEo5LJxfqdHHO5PYIdVa0uTkOfCHdr2x5rh8FUqY2OEgrhn4fgzq8DPrbIcOvUVXM7pnehMF+Vb98BYrhLFKZ4zzaxANzJ5aDeMn6d0YYky8w+YaCAma6p94PleiLusFHLWD7cCcM60dEb/iJv3k/UE3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=nVBXtlnK; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="nVBXtlnK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AD33BFC16;
	Wed, 16 Apr 2025 16:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813692; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=y3BV7atvuABYEEZWYNR8lZWvJ+WfpKTMmG/5nr5RLwI=;
	b=nVBXtlnKXK6xffDLyhBxenOKFk6R8+v7xzt1syqAOVzQisPCCrAGZpOczv8GlhEWJXz2G6
	Rf5lRlEBuZf3F6f2yQQoJBV/qUZ7YtmDzdOPifbQ6cctOkczxf8vpmQs8uNUUVx0UvOYH2
	8+LRw3Hy+oq1ELpiq/AXmpv1ha5vNM0cMDINSTBvRaU1dkYTUoZ+qXAdHOLTe8yyBTtZAs
	+mMcLGVZwbVvucLN02Btg5zOh3+ihjx6Z93f8fMPUXYsUIAe8rk2IKIn5vdHq0AtQu7L4c
	0eTUYMMVLEpz2NWyIPt/LuxsAz17rTZjNwmW/z8rYyibLBPIbCmpUmS0vz+KXw==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [RFC PATCH 5/5] arm64: dts: imx93-kontron: Add DMA memory region for ELE firmware
Date: Wed, 16 Apr 2025 16:26:24 +0200
Message-ID: <20250416142715.1042363-6-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The Edgelock Enclave firmware requires a small 1 MiB memory pool.
Reserving this pool makes the ELE firmware driver probe and allows
us to use the S400 API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 119a16207059..44d98cf812bf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -24,6 +24,18 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -116,6 +128,10 @@ &gpio4 {
 			  "GPIO_B_0", "CARRIER_PWR_EN";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &lpi2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c1>;
-- 
2.49.0

