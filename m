Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF910248F7B;
	Thu, 19 Jun 2025 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315208; cv=none; b=pM1CgWyF38dOeVL6OtB4/Sp9Vzzi8Z13duB9AbRr5KJpNIWnyXP+IymsfQMgi28IcwMdkmXjenNbd/vuz/Vp9n6KoZskpfcoj+k33A/1N2bLQBKKWQ9tpiaRQGDz8FYUUK+3ipLHnAw3VCQPaGBiVR2gZKDm9mR4BjWKqMjesT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315208; c=relaxed/simple;
	bh=prhs1fwZMMGiQNm65qqtpDtyHAygwhDTa8hqJRJbJc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z545MwjKi9eb+a0KdserEnVf2mb1XRaQUCTmHJW6+TdzJcxHEO753CGDUJSjLa/nQrpUrmls4CgiNO5x3jnOir1MNgmWDwo+7gtwGV4JSSxtqbcGr1KAedaFUA7b2t5mmenS8mc0NJMS7lAZXqMygC/HPnpJWjmO9hZ9b9dSEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UcmY+dGz; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UcmY+dGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=F5
	Mn/v7RZ7UFx8WGpT30YpU6PJiEWQ1DE0lZ8cE+J4c=; b=UcmY+dGzb5iSBaPC5h
	061MXFPks/x1BibP70watoVK2Jjs/YdbeW/HfJwOGXRm2z6NI1SBdwbZXbOpTHgG
	eMHe3lCuidSXqKNJsUEGUq3WQIERWNW0MHR4rSlokd2znpLv8XvO+NkaJcFc6zWu
	v+YkNcLme2WQmsEEN3viy8BiY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S9;
	Thu, 19 Jun 2025 14:39:16 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 7/9] arm64: dts: rockchip: Add DP1 for rk3588
Date: Thu, 19 Jun 2025 14:38:53 +0800
Message-ID: <20250619063900.700491-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD312OGsFNoUtqyAQ--.3973S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWDCry7tFWfJw17JFWDJwb_yoW8Xw4fpw
	nrurZ3GrW8uF1aqwnxt34kXrZ8A3Z5CFZrKr1xK3W8Kr1Sqr92k34akrZ3C34UXr17XwsF
	kFs3tryUKF4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwvtZUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAdxXmhTsFgHqwAAsH

From: Andy Yan <andy.yan@rock-chips.com>

The DP1 is compliant with the DisplayPort Specification
Version 1.4, and share the USBDP combo PHY1 with USB 3.1
HOST1 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 90414486e466f..691fe941d53a1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -210,6 +210,36 @@ i2s10_8ch: i2s@fde00000 {
 		status = "disabled";
 	};
 
+	dp1: dp@fde60000 {
+		compatible = "rockchip,rk3588-dp";
+		reg = <0x0 0xfde60000 0x0 0x4000>;
+		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DP1>, <&cru CLK_AUX16M_1>,
+			 <&cru CLK_DP1>, <&cru MCLK_I2S8_8CH_TX>,
+			 <&cru MCLK_SPDIF5_DP1>;
+		clock-names = "apb", "aux", "hdcp", "i2s", "spdif";
+		assigned-clocks = <&cru CLK_AUX16M_1>;
+		assigned-clock-rates = <16000000>;
+		resets = <&cru SRST_DP1>;
+		phys = <&usbdp_phy1 PHY_TYPE_DP>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp1_in: port@0 {
+				reg = <0>;
+			};
+
+			dp1_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi1: hdmi@fdea0000 {
 		compatible = "rockchip,rk3588-dw-hdmi-qp";
 		reg = <0x0 0xfdea0000 0x0 0x20000>;
-- 
2.43.0

