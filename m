Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CDDB672;
	Thu,  3 Apr 2025 03:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743651519; cv=none; b=fenGMQjZlik16Q85m742DQtoRWQ1dWIER3PUKng66wGeovH2rBza2QDxUDLNOSAGEypJMMQtWutJDaooXscaP8CXplh4OWvEEvXCvwUDWliLTwNFw5NK+JtANTE5y0q2LeUYE5D8RapdYi9CuZ2RHHHtTgFbFUp0SysM+UVPreQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743651519; c=relaxed/simple;
	bh=kIzkGfYC0bglpWn0cTg9dXmZ0cvz3cHGIeSWjT+njP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wjs6FbRS4n2swU3JOSX30q89HltPwTu5Wl1DSPvDL8aM23hWXM8sfJbbej/Wkv1CRbVLQjIzszSGoJNNGFNbSAMI0F4TPlg4VsnsRnHbYxt+JIFQ73AAXDKk2+AP+z1/knu4IoCDOcFJ0OdDWyJA8DjiWgNrL+zTI6sMpFRW6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bDYX5ZVu; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bDYX5ZVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Zqp8p
	Uq3welazwcYBnxcx4s008On3yBPOloZdC4CDRs=; b=bDYX5ZVuNVkup9RL3VmFB
	tk0VsRRZ+588rjs0jNQHcRkQb9QXYJbeI0BAJSUhaMkXMoWB6kjzSpv7LxYT+vlo
	GuXrlthM6ptSGUtD1zFy2IUz6oNjeZJX/aOC/KNVxo/qLxSaXWWxrW94dKfFM8Hr
	FrUkiphayEct6gswNjhPKQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHWgmNAu5n7FfDDg--.28713S9;
	Thu, 03 Apr 2025 11:38:03 +0800 (CST)
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
Subject: [PATCH v3 7/9] arm64: dts: rockchip: Add DP1 for rk3588
Date: Thu,  3 Apr 2025 11:37:35 +0800
Message-ID: <20250403033748.245007-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHWgmNAu5n7FfDDg--.28713S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWDCry7tFWfJw17JFWxCrg_yoW8Xw4fpw
	nrurZ3Wry8uFyIqwnxtw1kXrZ8A3ZYya9rKr1xK348Kr1Sqryqk34akrZ3C34UXr17Xw42
	kFs3try8KF4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jY9aPUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBskXmft-c-LaQAAsT

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
index 83113a1098104..c498bf2da4fe8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -140,6 +140,36 @@ i2s10_8ch: i2s@fde00000 {
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

