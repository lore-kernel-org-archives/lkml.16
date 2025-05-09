Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281368615A;
	Fri,  9 May 2025 00:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751414; cv=none; b=ck8yfgu5OF6TBBZd3tvbV99K0hTQaf+lCsuv/aXAAeKFeZ2SnkK3ivIkJHqQcTslIp/vzN/Z6kHFU00vrOV87nF6dzM7D9Ibhdu8V+WG2iY7SGeC66F87rLFgkmKhNbwL2zVDQAipLxHguACQNX/aKD9PpWJ67XeVmkpE68mWw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751414; c=relaxed/simple;
	bh=ZdvTKQqzNuK1cYYcOlkZ38hXG7R64U6pk2NbaOyRi1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFQ9xYx2O+FyTSbDMdRGG4P3eQwhaSsAyEusUJuhDdNQvfC9S1OBTHF2nfuS/Vl7Fo6OEF/lk/IvmHaBtQMfvZgc8ezXbvCnKwUS5M3bOWEggL04CH4Hsa0jioGTscTvcb8K80x2ZmZJZlp7s1YcGHhIG6JJDvW7mXYTL6FC+3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=W4gUqrBm; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="W4gUqrBm"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9609B261B5;
	Fri,  9 May 2025 02:43:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ISWAi9Dedp8; Fri,  9 May 2025 02:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746751410; bh=ZdvTKQqzNuK1cYYcOlkZ38hXG7R64U6pk2NbaOyRi1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W4gUqrBmfI0lli6DheZm/slrz2Zbd4Fsso6G4p7zP1evhN1TLPivdRowCRNW/C3bi
	 26aES85vqUpqho/s/bTUtdgXcWLptBulyG2dGqLS3rJmMcYc4LVmM+W8Fw/irzxE+a
	 8QN48Cv5HfdgYRFXWAWHzw5yWRdI3J1Bcx2fo2PbK045FL83RHDQ7b3MF0HfCJV1zW
	 VvQDjXDdV40s3habn13S78I/F4ss35NaL1VWfR6E/M0yUc+oIEz8Z3fwWunQPFlB5o
	 6lH9yec4A0xQhVMUVmBaYBVsZ8Tk9WXPMTqWQtFCrMfDCP9hom85SNjL6BJYc7zzge
	 SsQh3u1KncYdA==
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
Subject: [PATCH v2 5/5] arm64: dts: rockchip: Add naneng-combphy for RK3528
Date: Fri,  9 May 2025 00:41:22 +0000
Message-ID: <20250509004121.36058-7-ziyao@disroot.org>
In-Reply-To: <20250509004121.36058-2-ziyao@disroot.org>
References: <20250509004121.36058-2-ziyao@disroot.org>
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
index 193b84b5e912..672350400774 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -334,6 +334,11 @@ vpu_grf: syscon@ff340000 {
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
@@ -778,6 +783,23 @@ dmac: dma-controller@ffd60000 {
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

