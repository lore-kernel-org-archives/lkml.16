Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FDC7464;
	Tue, 10 Jun 2025 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536191; cv=none; b=qJbKH1QoX9Oo6cZRKMjyWqR30Ct29XXDBUBMTq1opf31dYHT4dw6RmabuvYHVQTHYkX1mGmEhq8T5GOnMNKQZK1YnzpPFW+vqwuNCtVOf/6Z4aAaMoC219X/fxgOj1h016XCjFDrLZPyyu+YLioXJn3ol/2WljA0/aiK8AuPY6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536191; c=relaxed/simple;
	bh=x0Xt63bNLSJDQD8ocdTTG0aGRtfg3vP02MPH/I2anUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H1D2Fr6zhC2RF2a8994nmOnIKJuifDvBt87a4nImQb5tfhLYavRzSAHqhWBffP9rG3g79VsjUD8gA1O3FlkMO9TlIwxAg4DwxxH4iSBmOsFap5ro1skvqlMtKecQE7Jm/E8dsaV8/djkjb/LfFHC21UeSxE2GHBpLWdPFE5js3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=DxP4gN/o; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="DxP4gN/o"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB8E81485BB5;
	Tue, 10 Jun 2025 08:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1749535683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=I4ti+/foQg3QbjYgEJL1AVz6uH68ooxEzV0rGfw+TYU=;
	b=DxP4gN/oqr6gN9kmsdPBSyeLw6tkZIOAmwNldabPG+7Hhp9EtGCtotcehqu0dNUnjHlOAT
	LUIMnguyEn0vT5FWSRzuscfaELFyJOCVX1wO0fZcHVSYt+HJDqUwaayGGPj3Hakr3cg0Gn
	bnaPOVZtSmsP/J+kZRd8jUoHnr+ratbdESmBrU1vRgAaK+m8fShfZXIYEUyJ+Wv6C3AC1m
	Nv1QLKDjAZcP5FBDWSbj7o0TrI97MxCRCFA8K8AuiGpw9v8KPJxU4DSPYyKKEG2J9K2UnP
	9U+cEqXuI8FsOxG9eSbLlMNp0TuSRFkP9Vgel0sLaD5fzh6IZdzJry7VcrjbEw==
From: Alexander Dahl <ada@thorsis.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Date: Tue, 10 Jun 2025 08:07:56 +0200
Message-Id: <20250610060756.8212-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
than the generic i.MX8 has.  One conflicting resource is usb, where the
imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
imx8dxl.dtsi this leads to a duplicate unit-address warning.

The usb3otg node was introduced after the initial imx8dxl support with
commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
and since then leads to warnings like this (when building with ptxdist):

    CPP generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
    DTC generic/platform-v8a/packages/linux-6.12/boot/imx8dxl-evk.dtb
    /home/adahl/Work/bsp/thorsis/generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
index 9b114bed084b..a66ba6d0a8c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
@@ -5,6 +5,8 @@
 
 /delete-node/ &enet1_lpcg;
 /delete-node/ &fec2;
+/delete-node/ &usbotg3;
+/delete-node/ &usb3_phy;
 
 / {
 	conn_enet0_root_clk: clock-conn-enet0-root {

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.39.5

