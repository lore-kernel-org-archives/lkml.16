Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCEE1C5489;
	Wed, 30 Apr 2025 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006124; cv=none; b=LVTYx+kMK7q6qWmuh8YuuEm25ACgiDsBVnkY6nMbzBfyL/nfVv6oY9ah9z1Bux/GPFgAcELGv7EplGoYRJI6apAslhr1HxfN2eA6k8rZBHCkWou9L7qF3u2J0cL5cWbp0mwheY/zj8v9DrGsUiubqSbwlMRyvmuS6M5T27JDyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006124; c=relaxed/simple;
	bh=gIvbXLGEwA78U8BzxWzcHss4Rbgz466/h4fDKeOfrhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HcrkB6jPQbQDKbvCV3OuNAT5ys/OqDtr6Uh9pBZNhQlHASlmkqMnZB1tbOtzA4gsizD3nFq2BCeUql4XWozZHZ7KTn1cILkhPMQJ/xfHfodcu6p7e/UZmsJaSfSXzRBMkSBZ6S5ePKj2Ns7NPOV+XUrOTCw+XSZLvZTmOSUP4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KXMc4Jon; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KXMc4Jon"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C45121FC78;
	Wed, 30 Apr 2025 11:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006121;
	bh=Lx02G64ppy0lrZvVfG9pprG+9x/MBOLftogqYbGMsNU=; h=From:To:Subject;
	b=KXMc4JonHkbvrSI3vKjMUrbKqsdlwC7PlEQMhbgpLObXrXcVA9HDk16ZIrg/F1B1P
	 7RgrpKefrn+HcSK1v9Z9ZyJImbNdicIEfA48nXWyGnMzj4fsq+d1BiNje3qywywo7D
	 4ANPDFus5TjRFex8OYWgqvKX6IdAPy76Wr3pR0gGLzEwmhSJgR4Uk8IwY7KGhnAD/v
	 aKJkJRlVEgyCeVDvYc2SXJ9r+NidlEoJ6P/qdpyAQ/laFAA+keACbh0TJaxUxQgOFu
	 oG+ozv1JyiW6AKdmgqIW3PyY+mzN1Mcs4AS9j9pFQ9XyAHbTDzHQE6DH9+UDQJSYw7
	 fe7NpgnSoQoZA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node name
Date: Wed, 30 Apr 2025 11:41:50 +0200
Message-Id: <20250430094151.98079-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Use generic node name for the SoM GPIO expander, following the
Devicetree Specification generic node names recommendation.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0cd04c3c96bb..22f6daabdb90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -434,7 +434,7 @@ &i2c1 {
 	single-master;
 	status = "okay";
 
-	som_gpio_expander: gpio-expander@21 {
+	som_gpio_expander: gpio@21 {
 		compatible = "nxp,pcal6408";
 		reg = <0x21>;
 		pinctrl-names = "default";
-- 
2.39.5

