Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D126738B;
	Mon,  5 May 2025 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466055; cv=pass; b=e4GFUL81MiMrRAuDBz+R73CC3sie6k4hROm5tSwMjMlU7QvwXdKn+1M6WIqjFAbQEg+8+znh7yGxwKF0gKFM4B1GmNi/amC1A/p6qSvYjDkY5rTwFyeBHPoSr4hHbLmV44rMTFAde7QXV1eP6KNKkGMNldFm6winG/dbDhTFqR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466055; c=relaxed/simple;
	bh=0WG5gBv1ouv+Qppldc/xgflGBc5hmN+2I748LvBpyz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpzn/Ljp2zyfPGCG+GKxoj4iAWf+peVeu3Ruwd/Letsx1tURnbBU3pdJ7WplIg+zMMzlPqx1l3g+LKD6QcBBQyGB1Jy3krl1XNSleLWVkOfeeltVxoh+r4qMz9CW4uC3h2q+HkWuA+MoNt/7ffcaMK8hMat2cj4z/xxX6FYQBE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=I8LC2Pmu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="I8LC2Pmu"
ARC-Seal: i=1; a=rsa-sha256; t=1746466030; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WvaUuOHozLTxBreRVoRUZHIAEzPFGeRQMg4uBRsLda4UXmjGVA5cd0lSmJZVK1mmoHrEgX5EVsPj7yUqQ2VI+yFQJ1tlKUNSPbfuxsRYNx5hAN8LdngVVVcI2RbqUR5Avbw2x1279vvM49DbDT2Bx27InOsLU40h+muwSJDFVqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466030; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UXMkSRINNwBaxu50t98o2g6F0hiutN+78b6vZXXpk4k=; 
	b=i8/fed4EofhbKDyh8FRlPRZPRnvt/opLboTCojBOcJwnxBVvA6tVK2VzfmB34vzFJE+ILd8FSCRqfnGfnjW1jrSwhGEZT5XdMYHu+la1oK8Z8grseOlTVTEB9Y+x+P6k8rIyf7scxe3E/9orTlsgMiD3lhHfQkHpl4BKFaillzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466030;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UXMkSRINNwBaxu50t98o2g6F0hiutN+78b6vZXXpk4k=;
	b=I8LC2PmuD2lmjAGTQ7BwExEaZ4rARrEE+97Y4X5x4ugO4oq9Hok6tyxmSEJWTbJC
	otXtmma8ij4MUFJLrYWgzLT+5yHmOygsvCBUsBLO43pt7iUADP0hycYAmqDBL16uvam
	ae9+iAgMsYJp9QGcOv2zU1HIk2FiV8YAhvFzDm/g=
Received: by mx.zohomail.com with SMTPS id 1746466028949626.5537082120404;
	Mon, 5 May 2025 10:27:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 05 May 2025 19:26:39 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: reference u2phy1 as clock on
 RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-rk3576-sige5-usb-v2-4-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The rockchip,dwc3 binding states that the utmi clock may be referenced
by the controller. Until now, the u2phy1's clock output had no
references to it in the SoC device tree. It's not known if this caused
any real-world issues, but it may have allowed the USB controller to
potentially do operations that depend on the utmi clock while it is not
enabled, leading to hard-to-reproduce race conditions during bootup.

Reference the u2phy1 output clock in its corresponding USB controller as
an utmi clock. This effectively increases the enable count of the
usb480m_phy1 clock in Linux on my system from a deviceless 1 to a 2 with
the USB controller as a named user.

Fixes: 23ec57a32da4 ("arm64: dts: rockchip: add usb related nodes for rk3576")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index ddc92ccc530d6757660971f0a609b5127784bb04..fa4ff44ec48b4b8759b7d4d1c752afd3333fd43d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -480,8 +480,9 @@ usb_drd1_dwc3: usb@23400000 {
 			reg = <0x0 0x23400000 0x0 0x400000>;
 			clocks = <&cru CLK_REF_USB3OTG1>,
 				 <&cru CLK_SUSPEND_USB3OTG1>,
-				 <&cru ACLK_USB3OTG1>;
-			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+				 <&cru ACLK_USB3OTG1>,
+				 <&u2phy1>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk", "utmi";
 			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&power RK3576_PD_PHP>;
 			resets = <&cru SRST_A_USB3OTG1>;

-- 
2.49.0

