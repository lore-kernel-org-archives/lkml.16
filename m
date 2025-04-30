Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0921C19D;
	Wed, 30 Apr 2025 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006124; cv=none; b=FwjBN4DLMnT8p+R15w0c3eHWjq2W+FeAeNnvOrqYfamRpD6jxcaKydc22ubWXC8+g0SXNb84MjOoI5jQrZhib6+SAQPTCKBXQLiMyu83CYaF1xXOMbLA2m/3Aab1zZKXpqLYBxJRdTD2iGe+70oP7jfoOs2GdS+tS88rNDJMxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006124; c=relaxed/simple;
	bh=iu/VMNMQmoQnwo/lSa87IsrAqt4Hvm3sc+mB7QVA7WY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AqmWpZP6q6/GVKXQCPB9BWOU00mZKfu7iqpbznIkI/wtTvhbOKmv2iSr5TzNsJRrNHnCKmYN+v7npOmQ+Jcyx/MMgJeaUc/enPAUXpTvDVIgK+aBrSEJe/ibVzfgrlnOjgZYZl+2J+lHh3MZagGWTuQjiuAf2H2+bpFjgjbyDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=pCpo3arA; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="pCpo3arA"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A2781FC12;
	Wed, 30 Apr 2025 11:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006119;
	bh=BDF8Z3RJZY5FcXZfk/EqiMQX/cKRyGAP1fzBEqQurz8=; h=From:To:Subject;
	b=pCpo3arAcXqLGP+7qpvoxOq5GWTB0NR5nTdNKIHbkx4GXYmPO64QZQU/Kj4pdWMWO
	 x2OZ6VreGd6g+f1OyID5sNPedzR+NfFqRJY9P6PwxHjBlreHMBgbh+NZNNB12z2Jh+
	 YA+lZNZucnqFBeJvwjBhsoEISeCcev6p2mRREPINXaFR35d3N6PugzbXyBe3mH092Y
	 0I/g+JIRaxv/EGXEG8RRLYtTu+juk1Z3OG8qQbtZjOY6PiRT/7V4OeUVh+z43vx2bZ
	 4HGVx0HyTC7/CFHx1x6A6HAgr4XlPGgwA/e6QOPmOh/b7nrRcmn1BnjSxa9+eX1dor
	 E8igKrGaBTMkA==
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
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
Date: Wed, 30 Apr 2025 11:41:48 +0200
Message-Id: <20250430094151.98079-3-francesco@dolcini.it>
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add the embedded controller node to the device tree, this is required
for reset and power-off functionalities.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0a8b9eee5ed9..c4ca01ce60d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -534,6 +534,11 @@ reg_sd_3v3_1v8: LDO5 {
 		};
 	};
 
+	embedded-controller@28 {
+		compatible = "toradex,smarc-imx8mp-ec", "toradex,smarc-ec";
+		reg = <0x28>;
+	};
+
 	rtc_i2c: rtc@32 {
 		compatible = "epson,rx8130";
 		reg = <0x32>;
-- 
2.39.5

