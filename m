Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425228934A;
	Mon, 19 May 2025 16:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671491; cv=none; b=XYPqHDFnHj4P/R4hNE5Rxg+vb5Z1V4XkzPzx1nBcYkzdAmHz7PeD20VGzJRD1YgrNsTabXGzsyXZQBaTGfUZw3ja6lbAzFiJqYC8GtAZGMRfLyXL8xiS3KcHb0PrbdUFj+NqnpjlC5fLF3EBswFkuC2/qhHyCDtCNKUCmm8OHSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671491; c=relaxed/simple;
	bh=EhhH2Voxlf14KFwiAk/dd5Jg0RabzoVgX6qYyH37IMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENqbUeiQzhLv9gGOMVcCjzXGPNf78DdJMFWjwWtDoIqjYJi7f8H9ZroAdtyr0tACpBfy6cUrW37KIc6IkRzKb7WLFLxUV3HPh3b2VVVzv4sZDDRyOScBWa0JjFp1t0pywhzubi9NllmxEVS29Ydx0KLaJT3N8pQVn0Fe0njAKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=b+655J56; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="b+655J56"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6604120F85;
	Mon, 19 May 2025 18:18:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmtN3vBAVKkw; Mon, 19 May 2025 18:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671487; bh=EhhH2Voxlf14KFwiAk/dd5Jg0RabzoVgX6qYyH37IMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b+655J56PtwvdNRUhoPoxE3jVWPvAQHMfMyPqaGLiWmIHtxvfQYK4WYhpHvruvsA8
	 tiPAsaZtRFzWJkk62IpOAxaETGR0LvPAVEu1yCnd2x9MCbys6NHzHgcH/y2QoZK4zP
	 lPFo8m+6H6j/HbXoPdZSUCQ/29vp0/J5TRUHyHdtVz7Y/6ivyYvShoQcN9vTPgYcfo
	 IctMOW/G74UZ7z7f/eBvkwnCBZa0jQgAuAa9qNp1ZEyavmtfGq93wq5CFNYCwquj3b
	 Z+x1Uv2SkPDviZrceL5ep50zNG4/DaWl+7+GI4ha7OeujWci7mXR1KnzOKutiAaDFV
	 12BtqxIWTRong==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Add naneng-combphy for RK3528
Date: Mon, 19 May 2025 16:16:11 +0000
Message-ID: <20250519161612.14261-6-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 ships a naneng-combphy that is shared by PCIe and USB
3.0 controllers. Describe it and the pipe-phy grf which it depends on.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b2724c969a76..314afb94e19b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -318,6 +318,11 @@ vpu_grf: syscon@ff340000 {
 			reg = <0x0 0xff340000 0x0 0x8000>;
 		};
 
+		pipe_phy_grf: syscon@ff348000 {
+			compatible = "rockchip,rk3528-pipe-phy-grf", "syscon";
+			reg = <0x0 0xff348000 0x0 0x8000>;
+		};
+
 		vo_grf: syscon@ff360000 {
 			compatible = "rockchip,rk3528-vo-grf", "syscon";
 			reg = <0x0 0xff360000 0x0 0x10000>;
@@ -867,6 +872,23 @@ dmac: dma-controller@ffd60000 {
 			arm,pl330-periph-burst;
 		};
 
+		combphy: phy@ffdc0000 {
+			compatible = "rockchip,rk3528-naneng-combphy";
+			reg = <0x0 0xffdc0000 0x0 0x10000>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_REF_PCIE_INNER_PHY>, <&cru PCLK_PCIE_PHY>,
+				 <&cru PCLK_PIPE_GRF>;
+			clock-names = "ref", "apb",
+				      "pipe";
+			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_PCIE_PIPE_PHY>, <&cru SRST_P_PCIE_PHY>;
+			reset-names = "phy", "apb";
+			rockchip,pipe-grf = <&vpu_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl {
 			compatible = "rockchip,rk3528-pinctrl";
 			rockchip,grf = <&ioc_grf>;
-- 
2.49.0

