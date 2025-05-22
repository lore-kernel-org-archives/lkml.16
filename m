Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FF81758B;
	Thu, 22 May 2025 02:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879592; cv=none; b=cAbRsq/K3S+oWRUBR3cW65lvtxN6HilMyeVHVHxV6YPw/70A1/ha5ajKjfCJEnBNVcdyGy3/0gVsVDmvXpCcUdC5kVb74Bo+2cA0Gt8fxw/OPKgteFK5x/rm6XiSWs1ov647UnHO7T9+4RWaPcMa445jnP9nO5jViXi/MJi0KYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879592; c=relaxed/simple;
	bh=sW0EE91KXJ+M6jYxg9ov0zpwuReHGOSZDNNn9idleYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2yA4/IPsaOdafVJ65ifA4qovsBURytrwo97t0qslqll1Tj+Hs+A80UqlxBhX0IsmICK7JPhAfQgiBBsEehThD34H5Sl2gT9UBUMUsYqhE43X5KFe8x43f7EysXqU1/My77e6AJ8JyIF2d6cDr0W8J8OBFS77yDWWRPCpexEqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZB/cFUMf; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZB/cFUMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ig
	D6iNSl2PbIyX8QHiw/SyrEi2EknX4FvWxMHnc6wpg=; b=ZB/cFUMf/jiZkibH7q
	9Dq4/Q+emcVRSC9b5bEFPfPhYVgJ6I06bkYrUoaWI41aLZRf6vrL/sBCMj1PW1vu
	oNDbS7OMwiwe0OSl2wNnT5+nkModI+Yu1fJy807oBZrBEzN/UwX27aP1c3xW4G+R
	TbDQqkgv2kUk81snQbDiIW7uE=
Received: from ProDesk.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3oo90hi5oAIjgAA--.31473S2;
	Thu, 22 May 2025 10:05:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: simic@manjaro.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	algea.cao@rock-chips.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
Date: Thu, 22 May 2025 10:05:24 +0800
Message-ID: <20250522020537.1884771-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgA3oo90hi5oAIjgAA--.31473S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFWDuF17uryDAw4rXF4xZwb_yoW7Zr4kpa
	s7urZI9rykGr1qgFZ5Arn5JF43t39rWwsF93s3J34xXw12qF12ga4xCrsagF98ur48JrWS
	9rs0qFy09r4YvFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jY_M3UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkApVXmgug2FhlAABsB

From: Andy Yan <andy.yan@rock-chips.com>

For the RK3588 HDMI controller, the falling edge of DDC SDA and SCL
almost coincide and cannot be adjusted by HDMI registrer, resulting
in poor compatibility of DDC communication.

An improvement of the compatibility of DDC can be done by increasing
the driver strength of SCL and decreasing the driver strength of SDA
to increase the slope of the falling edge.

It should be noted that the maximum driving strength of hdmim0_tx1_scl
is only 3, which is different from that of the other IOs.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Correct the max drive level of hdmim0_tx1_scl.

 .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 +++++------
 .../dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 +--
 .../boot/dts/rockchip/rockchip-pinconf.dtsi   | 35 +++++++++++++++++++
 3 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
index 7f874c77410c..6584d73660f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
@@ -578,14 +578,14 @@ hdmim0_tx0_hpd: hdmim0-tx0-hpd {
 		hdmim0_tx0_scl: hdmim0-tx0-scl {
 			rockchip,pins =
 				/* hdmim0_tx0_scl */
-				<4 RK_PB7 5 &pcfg_pull_none>;
+				<4 RK_PB7 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim0_tx0_sda: hdmim0-tx0-sda {
 			rockchip,pins =
 				/* hdmim0_tx0_sda */
-				<4 RK_PC0 5 &pcfg_pull_none>;
+				<4 RK_PC0 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
@@ -640,14 +640,14 @@ hdmim1_tx0_hpd: hdmim1-tx0-hpd {
 		hdmim1_tx0_scl: hdmim1-tx0-scl {
 			rockchip,pins =
 				/* hdmim1_tx0_scl */
-				<0 RK_PD5 11 &pcfg_pull_none>;
+				<0 RK_PD5 11 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim1_tx0_sda: hdmim1-tx0-sda {
 			rockchip,pins =
 				/* hdmim1_tx0_sda */
-				<0 RK_PD4 11 &pcfg_pull_none>;
+				<0 RK_PD4 11 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
@@ -668,14 +668,14 @@ hdmim1_tx1_hpd: hdmim1-tx1-hpd {
 		hdmim1_tx1_scl: hdmim1-tx1-scl {
 			rockchip,pins =
 				/* hdmim1_tx1_scl */
-				<3 RK_PC6 5 &pcfg_pull_none>;
+				<3 RK_PC6 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim1_tx1_sda: hdmim1-tx1-sda {
 			rockchip,pins =
 				/* hdmim1_tx1_sda */
-				<3 RK_PC5 5 &pcfg_pull_none>;
+				<3 RK_PC5 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 		/omit-if-no-ref/
 		hdmim2_rx_cec: hdmim2-rx-cec {
@@ -709,14 +709,14 @@ hdmim2_rx_sda: hdmim2-rx-sda {
 		hdmim2_tx0_scl: hdmim2-tx0-scl {
 			rockchip,pins =
 				/* hdmim2_tx0_scl */
-				<3 RK_PC7 5 &pcfg_pull_none>;
+				<3 RK_PC7 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim2_tx0_sda: hdmim2-tx0-sda {
 			rockchip,pins =
 				/* hdmim2_tx0_sda */
-				<3 RK_PD0 5 &pcfg_pull_none>;
+				<3 RK_PD0 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
@@ -730,14 +730,14 @@ hdmim2_tx1_cec: hdmim2-tx1-cec {
 		hdmim2_tx1_scl: hdmim2-tx1-scl {
 			rockchip,pins =
 				/* hdmim2_tx1_scl */
-				<1 RK_PA4 5 &pcfg_pull_none>;
+				<1 RK_PA4 5 &pcfg_pull_none_drv_level_5_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim2_tx1_sda: hdmim2-tx1-sda {
 			rockchip,pins =
 				/* hdmim2_tx1_sda */
-				<1 RK_PA3 5 &pcfg_pull_none>;
+				<1 RK_PA3 5 &pcfg_pull_none_drv_level_1_smt>;
 		};
 
 		/omit-if-no-ref/
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi
index 244c66faa161..fb48ddc04bcb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra-pinctrl.dtsi
@@ -160,14 +160,15 @@ hdmim0_tx1_cec: hdmim0-tx1-cec {
 		hdmim0_tx1_scl: hdmim0-tx1-scl {
 			rockchip,pins =
 				/* hdmim0_tx1_scl */
-				<2 RK_PB5 4 &pcfg_pull_none>;
+				<2 RK_PB5 4 &pcfg_pull_none_drv_level_3_smt>;
 		};
 
 		/omit-if-no-ref/
 		hdmim0_tx1_sda: hdmim0-tx1-sda {
 			rockchip,pins =
 				/* hdmim0_tx1_sda */
-				<2 RK_PB4 4 &pcfg_pull_none>;
+				<2 RK_PB4 4 &pcfg_pull_none_drv_level_1_smt>;
+
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
index 5c645437b507..b0475b7c655a 100644
--- a/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
@@ -332,6 +332,41 @@ pcfg_pull_none_drv_level_0_smt: pcfg-pull-none-drv-level-0-smt {
 		input-schmitt-enable;
 	};
 
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_1_smt: pcfg-pull-none-drv-level-1-smt {
+		bias-disable;
+		drive-strength = <1>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_2_smt: pcfg-pull-none-drv-level-2-smt {
+		bias-disable;
+		drive-strength = <2>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_3_smt: pcfg-pull-none-drv-level-3-smt {
+		bias-disable;
+		drive-strength = <3>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_4_smt: pcfg-pull-none-drv-level-4-smt {
+		bias-disable;
+		drive-strength = <4>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_5_smt: pcfg-pull-none-drv-level-5-smt {
+		bias-disable;
+		drive-strength = <5>;
+		input-schmitt-enable;
+	};
+
 	/omit-if-no-ref/
 	pcfg_output_high: pcfg-output-high {
 		output-high;
-- 
2.43.0

base-commit: 897af18e5d75e7ebf137044d57fed6522c46ae74
branch: linux-rockchip-next

