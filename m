Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BAD296142;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151248; cv=none; b=gvZkelp+OgRL/T3mA/oDculXnv/s0zq2nih6I2RnAoPB04sHcUojLa0KyBgl+PpPfKGpjId0r1oa385fXyH9G7h/NSDkbdTEo+htgvUssQHQgO665Ek7IcMyKTJq+WmbmfFiIpS7RDZ9IjoXvVc+PUap/pmUuoUamzMr3qpS7ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151248; c=relaxed/simple;
	bh=SseOVKGpd8b5VDsqaBskNVXohkDASV2r56JlAC/rmKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yt8h+xZT+YHW07oUHU9kboAQFPMyhygmvOxnAK6ZtzassWjsEk1QomU1q+7qBtyGBWAwwLpZVgZ0A2ZzND/+PkoCx2F71t6AkhcXxWd9UqeP975RTrmr5vYL44mzeLOlgr9zwAmAME1qdeJ6ydRJQh9E/kMuNJrY2ySgU3PB/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUSla1Oi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUSla1Oi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EA76C16AAE;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=SseOVKGpd8b5VDsqaBskNVXohkDASV2r56JlAC/rmKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nUSla1OinD9g1WMOSlNR3qY5wrV3mRJx1Vq1Pgy60sDgy0TEa4XNyI1dR0xwM1jH/
	 DhMzme7LX+4g4CbuzFHXx9qJ84MEiDvI1asszYfAXvY9dv67q98d8KeZq1AH2Xe/kh
	 3QbuduN/PxW1WJvBGV4W709RsC9YPzTAXwg3ah0YYTndGSMtodKV6w75/3t4XDRkax
	 olWNHSpKbkLYPNTzJQL+3aBLNDOI80zjWts5RNQC5uo0F4QrloxNmSIPZe4iOR1jFd
	 I/a1oDX53yFlHabVbTQTutCR4xiaTWxZ9ZgJrYnTfRNcajyR//YvoahZditFvxSnLa
	 ++J4ctkkr8xRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400DC71136;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:46 +0200
Subject: [PATCH 5/5] arm64: dts: rockchip: add mipi csi-2 dphy nodes to
 rk3588
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-5-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=1867;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=qrX7R9Yf+higl2wbSf3x1h05wV3AtHIap5SggDm1ypA=;
 b=c84nks+JEIFvKM2PQXYe5Sigfe8rKm+GsUo6dxEijt2RPl2ZO4XAEDjgHV/Lapw/2TX710uRl
 gb9OUZeBuxgCbK95HJRW0PI8pg2A3oRvDAL8d5h81ksM11iGvCrd4Gi
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba55..6a4ee0247fcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -621,6 +621,16 @@ php_grf: syscon@fd5b0000 {
 		reg = <0x0 0xfd5b0000 0x0 0x1000>;
 	};
 
+	csidphy0_grf: syscon@fd5b4000 {
+		compatible = "rockchip,rk3588-csidphy-grf", "syscon";
+		reg = <0x0 0xfd5b4000 0x0 0x1000>;
+	};
+
+	csidphy1_grf: syscon@fd5b5000 {
+		compatible = "rockchip,rk3588-csidphy-grf", "syscon";
+		reg = <0x0 0xfd5b5000 0x0 0x1000>;
+	};
+
 	pipe_phy0_grf: syscon@fd5bc000 {
 		compatible = "rockchip,rk3588-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfd5bc000 0x0 0x100>;
@@ -3052,6 +3062,27 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
 		#phy-cells = <1>;
+	};
+
+	csi_dphy0: phy@fedc0000 {
+		compatible = "rockchip,rk3588-csi-dphy";
+		reg = <0x0 0xfedc0000 0x0 0x8000>;
+		clocks = <&cru PCLK_CSIPHY0>;
+		clock-names = "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
+		rockchip,grf = <&csidphy0_grf>;
+		status = "disabled";
+	};
+
+	csi_dphy1: phy@fedc8000 {
+		compatible = "rockchip,rk3588-csi-dphy";
+		reg = <0x0 0xfedc8000 0x0 0x8000>;
+		clocks = <&cru PCLK_CSIPHY1>;
+		clock-names = "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_CSIPHY1>, <&cru SRST_P_CSIPHY1>;
+		rockchip,grf = <&csidphy1_grf>;
 		status = "disabled";
 	};
 

-- 
2.39.5


