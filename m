Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001B510F9;
	Sat, 26 Apr 2025 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745651821; cv=none; b=H5qDA+744BMph7HSHdhJ8Mpp4KxeIR/95o9nDKFW1ZqKPn1p2/4kOJNdamQEGG/steeA+SR64VfP85EVWIE6w1Mv3N5bIVoUjwvuOUKVQaX7Ihkp8tLbnd876n67fViyUMSSAYIbQSjLP8GFRbmbq/BgGrQbtz3d86ls6cm0+SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745651821; c=relaxed/simple;
	bh=T0m8btu4gHd44I1a2SEwAKIK9En/w9glqxQFEMr0TbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQ02cq+JAaEJG1JyS3zg5zztrJc4gnD3dmeAtlQVhc5bNZ9ACuBpOhR+7Q2/LD8fta45zagbcWpHyBaM4xT+vPbeQq9oTej/lDLl+luNHGeO0TlBCJsdS05K9mxMrvrOHmICQS0avc0lzYBtKYZGEPzBMVqG4YVSqlKUhL6kklY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HZHicKeh; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HZHicKeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=AAI5/
	pl9eCob0hfQckKDsXCAq3H8GXPTuykoKS8yFtE=; b=HZHicKehiD0hLKwrFRX3O
	K1bkC9oIiXkppeV50z/w4s2eyaPwVqcRYxMoDGs9HmOoy0d6i2Xaz77Qi2KpovN6
	q2zu5DTewrAItxT1cdaNSHswy4jgr4A59G7zgiEvUc7cQ68wGLL/OkkJOLXkmkg+
	Uj7FZXy3fHs0r8/ag7ydvw=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H1s0iAxo+8N6Cg--.20762S2;
	Sat, 26 Apr 2025 15:16:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add eDP1 dt node for rk3588
Date: Sat, 26 Apr 2025 15:15:40 +0800
Message-ID: <20250426071554.1305042-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H1s0iAxo+8N6Cg--.20762S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4Utr4DJFWrCr45CFWDCFg_yoW8Gr1Up3
	ZrCFZxWryxu3WIqwsxtw1kXrZ0yanYka98Aw1fGF1Utr4Sqry2kr9xWrs3G34Ygr47Xa12
	9FsrtryUKr12yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE_HUQUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hY7XmgMhFFxrwAAsO

Add eDP1 dt node for RK3588 SoC

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 099edb3fd0f6..9d81d3b9444e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -252,6 +252,34 @@ hdmi1_out: port@1 {
 		};
 	};
 
+	edp1: edp@fded0000 {
+		compatible = "rockchip,rk3588-edp";
+		reg = <0x0 0xfded0000 0x0 0x1000>;
+		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>, <&cru CLK_EDP1_200M>;
+		clock-names = "dp", "pclk", "spdif";
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
+		phys = <&hdptxphy1>;
+		phy-names = "dp";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_EDP1_24M>, <&cru SRST_P_EDP1>;
+		reset-names = "dp", "apb";
+		rockchip,grf = <&vo1_grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp1_in: port@0 {
+				reg = <0>;
+			};
+
+			edp1_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi_receiver: hdmi_receiver@fdee0000 {
 		compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
 		reg = <0x0 0xfdee0000 0x0 0x6000>;
-- 
2.43.0

