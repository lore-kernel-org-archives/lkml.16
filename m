Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68064BA33;
	Thu,  6 Feb 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856748; cv=none; b=mFN0wbIQgUB603CjHx/amMXmsscCciBHkbliCOhTwmP6+egFUF2wR/pEpvgRpbVKo8HFtZoSu+Od6aHch0v0M8TdQR1jhruMoipkZnKOa6W/O/O2X6lWdYlBbfIWK3kmlg1vdZ9W+rxlcKkhCFiv1SRdvCcyAlHUfSEctBn0lwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856748; c=relaxed/simple;
	bh=gRP4MG9risPvnbuNQJsv8sRMJhilt04gH9bgMGNXRPU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=clcL2EZi2aLbQbINruybXGnSBCt2AAoRi+mE+SLgrsdOqZ4VndrVt3GLgJgX2qBUsH8HFuQBpntRHMwyGBk0oGLF+/dP9m3aps81LabbltCuB0f4X6u/7ef9r9WXwN8lUZ/jMWeUFnj6tPUnJraG4PhfIHYcrhJFizpjiXXm4AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=sNo7iFwF; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="sNo7iFwF"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B4F9B1FA0A;
	Thu,  6 Feb 2025 16:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738856359;
	bh=kH0+JGJ28AOCheBpS02kDekVXIgobDL51e4ShaB0Zjs=; h=From:To:Subject;
	b=sNo7iFwFXaS/G6IrumBfAqnjDFIN5KPso8Am/Ghd0RMqQpT+D6DzlP7h4fmvEtmJU
	 vbUQlhZC6EXau5evJUgdZs0/eRdOD7Et7STwiVL3lOSk5/10vpmdbsjDcoXZj4Qi+J
	 sUQo5JgqQ9AIOiPuNFUrOgdCh6AA5DoXBskUWlvp5mW2/LbdwEcyYDKzhK1AXpwk0v
	 TecKe1fU+gGo0bSDIUXeyP1HhkIsaEiEj7fa6GNu348aWtlsZhps4LHuMoes3gvXgE
	 xz+yo9NAJ5IFyoWxxSGw5FuCs609qX9vJPq5AmTxnM8xoOT6Iha7ONVHRawR21EsJV
	 eV03cTtxB9Ugw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p: Enable AUDIO_REFCLKx
Date: Thu,  6 Feb 2025 16:39:11 +0100
Message-Id: <20250206153911.414702-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

On AM62P-based SoCs the AUDIO_REFCLKx clocks can be used as an input to
external peripherals when configured through CTRL_MMR, so add the
clock nodes.

Link: http://downloads.ti.com/tisci/esd/latest/5_soc_doc/am62px/clocks.html
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 420c77c8e9e5..4b47b0774330 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -42,6 +42,26 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <5 69 35>;
 };
 
+&main_conf {
+	audio_refclk0: clock-controller@82e0 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x82e0 0x4>;
+		clocks = <&k3_clks 157 0>;
+		assigned-clocks = <&k3_clks 157 0>;
+		assigned-clock-parents = <&k3_clks 157 16>;
+		#clock-cells = <0>;
+	};
+
+	audio_refclk1: clock-controller@82e4 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x82e4 0x4>;
+		clocks = <&k3_clks 157 18>;
+		assigned-clocks = <&k3_clks 157 18>;
+		assigned-clock-parents = <&k3_clks 157 34>;
+		#clock-cells = <0>;
+	};
+};
+
 &main_pmx0 {
 	pinctrl-single,gpio-range =
 		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
-- 
2.39.5

