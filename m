Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320A204089;
	Thu, 10 Apr 2025 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267210; cv=none; b=cfJnBkEVGz5oyJyef0TNcUHPn6hQiDd6CNM4+EjcoPStDTyNlg4HNR0TJNGHJJcoFM+Dvb82jj+hqx+7AkXPIB/Xrz4bnyLPT6h8OrqkGy+Ks7sS1/nzMvbupkqR2pbvjFghvFbltgG9yrfYhWhI0IVk4etB8WVOGtYf0XaRFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267210; c=relaxed/simple;
	bh=GKHrMd1jJepD3z5AGDv0xOhd2Cbuh1ewLZPXd2q76oc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U0WKEABvI1ZqPBHoITX2hp4Q/6LIch65O8DGtJIKe6/mcDoMaSJC2d0qv6QtSdagTnJj1FkgzLm0Gej72FdCgk8md1Suyfaf+hk+F1Yc9aD9Hmcrz7o4AQ2J1CJ2e9X42l9wGcqlsoR8/25AIOGHV8S14JIJVDOLqpC1vfNfQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=TAvYlURA; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="TAvYlURA"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 964FC1F95D;
	Thu, 10 Apr 2025 08:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744267207;
	bh=UIiQvVFfo75L239foWkL3IuUSVJzHOqP8t32ghz+BLg=; h=From:To:Subject;
	b=TAvYlURAM8YXb3T2T5UYXvy38bcKn9vgNq3K47P2uPorF8Ch6B78TsJK/4LLm+S2i
	 R+4OvzsuNQWQ4aVSANaT3Z1F7ofPyKXFbiUN5v9LOvnbzwLodbt2hgEcVbui7qH9SE
	 m83horlV/TUevAfQV9i65s/wN22DLXlP7bx223lE109KRBd78WXWNq1GAnjo6u0D9X
	 EQC5HpENNgnTYKMVpmEoh3ljkBmnNa1UkgIqXYgblYeu3tuj21nkO6nwQz4JQYSnR4
	 RN2TjFLuVcrMeV7VyL9Sf1BHhv8QAM+Ai22yi+qIeWC7JR9CVa0rOSwStJdASbDA0R
	 THJgNtV5TkgQg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx6q-apalis: remove pcie-switch node
Date: Thu, 10 Apr 2025 08:40:00 +0200
Message-Id: <20250410064000.11369-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The compatible "plx,pex8605" does not exist, there is no DT binding for
it and there was never a driver matching this compatible, remove it.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
index e1077e2da5f4..1f2200f50059 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
@@ -36,15 +36,6 @@ &can2 {
 	status = "okay";
 };
 
-/* I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier board) */
-&i2c1 {
-	/* PCIe Switch */
-	pcie-switch@58 {
-		compatible = "plx,pex8605";
-		reg = <0x58>;
-	};
-};
-
 &pcie {
 	vpcie-supply = <&reg_pcie_switch>;
 	status = "okay";
-- 
2.39.5

