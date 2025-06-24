Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2819C558;
	Tue, 24 Jun 2025 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736396; cv=none; b=RF+7R6VGrW11/FS0Bm7+IWUUN5s3pzyk7XmZiqCkD94W/DssEUSanO6sX+XaCmK/eN4dFzjlx8EkHsehgpCdfcRMpIF6FH96FXO1fJGdRMqiyQg6tkGlTf6kFO2u15rY1TSGTcQS6nsTxwjKPsxQbeS82xDUBpWQo5av2qq5UJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736396; c=relaxed/simple;
	bh=Cn577oWTiuD78zUlriRAp/KCdUeL45UyKPT3ZBfVSNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bdnic/T7q4nS0gILH0lOJDPQjLWW92N4k4n/7vKzII8SBMQ3utO4wHwweiH2XerwR6OXSR3oGN2q8F5Rg4rCkxHxbDFS6Flbf6yfxghi+NSNab6a93G7XuhVf+myxQ7DWzgmWVG4tgKo08RR3G8tfY+uj2hUpP2W+SP9uC9A6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MvpY/fp/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MvpY/fp/"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E0D6625A24;
	Tue, 24 Jun 2025 05:39:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTZH90UD7F9r; Tue, 24 Jun 2025 05:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736393; bh=Cn577oWTiuD78zUlriRAp/KCdUeL45UyKPT3ZBfVSNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MvpY/fp/GC/4at6lGtQowOZO/8toL+OLqjdCqhMbcnsa8/RujJ1XHBCvyx83zh3UQ
	 SPdXvB0xdxZ1NHDQaw0jB6H0bnGJfzavbFAQD/mndyAc9kISM1JNzxngKPd2Ex1rZF
	 IG9PPmDHiSpId/9jZGyudx10QjTUp5tBZrG2Oytvwv/3dyc7RQ8LoQGgDPMGg6UOtX
	 h0GgTcqm1z43zl3We7QRRkbR4V4shR1RrrJtfR6PlpUfAB8fh9aygUgsjuHA6mO20P
	 XcSuczhntnHFm65KZQbJsZsSwdl+U0cAxsj3sjgW1omWilsy7FUvS/bXVB26snkmQr
	 aD4PaKFyEKcOw==
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
Subject: [PATCH v4 6/6] arm64: dts: rockchip: Add naneng-combphy for RK3528
Date: Tue, 24 Jun 2025 03:37:33 +0000
Message-ID: <20250624033733.50197-7-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
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
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index a22db9d4b518..31b27096566a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -417,6 +417,11 @@ vpu_grf: syscon@ff340000 {
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
@@ -1085,6 +1090,25 @@ dmac: dma-controller@ffd60000 {
 			#dma-cells = <1>;
 			arm,pl330-periph-burst;
 		};
+
+		combphy: phy@ffdc0000 {
+			compatible = "rockchip,rk3528-naneng-combphy";
+			reg = <0x0 0xffdc0000 0x0 0x10000>;
+			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
+			assigned-clock-rates = <100000000>;
+			clocks = <&cru CLK_REF_PCIE_INNER_PHY>,
+				 <&cru PCLK_PCIE_PHY>,
+				 <&cru PCLK_PIPE_GRF>;
+			clock-names = "ref", "apb", "pipe";
+			power-domains = <&power RK3528_PD_VPU>;
+			resets = <&cru SRST_PCIE_PIPE_PHY>,
+				 <&cru SRST_P_PCIE_PHY>;
+			reset-names = "phy", "apb";
+			#phy-cells = <1>;
+			rockchip,pipe-grf = <&vpu_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.49.0

