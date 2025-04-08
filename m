Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF3253B44;
	Tue,  8 Apr 2025 20:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144193; cv=none; b=RzjgeKDlZWbq439RNLkICtgQ367hC26nCvGgPuX1gS+LppotEgA/sypSbw8H1GlmR6ORaXPchGh6OwhVidSFdBmoU0pJQk5IiDkscK37haS5Ok5D2FE1U+IdW1YQz+QsdOjL6YoLteMy+yHaS7WrvwgLIZsmrbXf2sM+O6dsRHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144193; c=relaxed/simple;
	bh=b+rNCdbPmnugdFvsNbyI7buVDELrFNjrHA4nS8YF+d4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EJqzuq++YNesbkeiWgjHP3HYMNajccV8Y0WIfpblFw/S1yv0qNxCfq4FWmxoI+rBTMYDVG55Xw4ILfG2V9hpaC1tZqZ/ZMDFLQ9f9JbgThrIQCHJH7NlVkAdh4tKlhhsrUfozeK9QjgkxybFTH7inCevD8RrVdbJdQderFkh5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=OvHslTzO; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="OvHslTzO"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F40941FB54;
	Tue,  8 Apr 2025 22:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144189;
	bh=qfgWLRBolkHkDVKstg0SDAzftES3+Ba6uH8UeszjsEA=; h=From:To:Subject;
	b=OvHslTzOP5/V/+c/cQ1/XP3c710Pc4o34JCi79Ofpf87b7SOAdw2g+Lzein9UGd+Z
	 bzrgVqmuswVEqav83nnMaKU7uDqagVNXyHCARkqXtk0w4SGz4xV+ttNUaVsuAht8Ud
	 3Zl5eUoahWvKw1JZgiRE6oUk3s/eYKQafni+1auAk/1tHVoAWgNTyC3bACVqmUl8Vl
	 qrQ9N5hjbaYRV1yx9n07o1T/YGp1oIl+0zV4i1MaasPvcmAdI36vFH+BC7+kXbjKc6
	 FKQnRVQYZCm5PWvrPm+CHw6pu4olvqs/OKTNq09rBugLl7gs0bHzKAW0nipouyRjmR
	 MZvXTcnNB1xXQ==
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
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:29:39 +0200
Message-Id: <20250408202939.6887-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408202939.6887-1-francesco@dolcini.it>
References: <20250408202939.6887-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

According to the AT24 EEPROM bindings the compatible string should
contain first the actual manufacturer, and second the corresponding
atmel model.

Add the atmel compatible fallback accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 7251ad3a0017..d3d3ebf035db 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -528,7 +528,7 @@ channel@7 {
 	};
 
 	eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 	};
@@ -633,7 +633,7 @@ hwmon_temp: sensor@4f {
 
 	/* EEPROM on display adapter (MIPI DSI Display Adapter) */
 	eeprom_display_adapter: eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 		status = "disabled";
@@ -641,7 +641,7 @@ eeprom_display_adapter: eeprom@50 {
 
 	/* EEPROM on carrier board */
 	eeprom_carrier_board: eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x57>;
 		status = "disabled";
-- 
2.39.5

