Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB72116F5;
	Wed,  9 Apr 2025 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231852; cv=none; b=Uo1RbYeDo4MnSNQ+iWHGyMPqTDDBG/v/xTsIHsaWrTQ281f+A86eE44YzgLHatH2b+oRYPVfeNL5o5axZX93zpcOA2y6bV2gcvPyoftTgWXBYjtnX5PtMlBdNibvdWyoYMqA62jtIpeqIzKOBfMzuNMkV3F1P/cl2/7tCgjxUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231852; c=relaxed/simple;
	bh=su9Uh7Pi40fxFZ7vHnTKRixkxjUDpywPMqGDrqPiOAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=puLo58iMkpHioa7AXSeexIFPX4UBK6Yi5vnspnra31UMHu9v06jJJUO7StUX+O7bRbBnTGBT/MXycDWUQ28YME2BibR1tNIPG/F1t2KTwQfKF8Fx/DreV6vulUxI7UmXmT4B3BNlFqmvxzlB9FleJ6c9BRX6x8xdDR3gFnkypTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jm406k92; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jm406k92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D81CC4CEE2;
	Wed,  9 Apr 2025 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231851;
	bh=su9Uh7Pi40fxFZ7vHnTKRixkxjUDpywPMqGDrqPiOAU=;
	h=From:To:Cc:Subject:Date:From;
	b=Jm406k92ZdDOT1gPRSkmNrzswkzv/1WU2CYxnhW1ns6PpUTt2flHEkckgd92ceiF4
	 I91AmhUC0gXAGcgI2eKqmnFX5epOd50vseeznsxiuac5Cn3RqEHjhsSyJIprPUQSTe
	 M+5VhG0jHdyuakEhzGdUyIeYwG0sdVEJvnyKOrSO5DyqyW+yhKNEWqUQYqgwIsadYK
	 DZy9aeDFUrD1SOljbjrkb7Zqmbc8DH8zxVp0qw+0BP1XA4/t/qPTCmzoiCdy2krU6w
	 kr060D8IaiFUvJKA6HPJy0apYv0M84QZ+8N5wNK0dW0Na/M/X4HI9AXPILS2bVXMyh
	 4zn1pgeUDO27g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: px30-engicam: Use "regulator-fixed" for vcc3v3-btreg
Date: Wed,  9 Apr 2025 15:50:46 -0500
Message-ID: <20250409205047.1522943-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vcc3v3-btreg regulator only has 1 state and no state gpios defined,
so "regulator-gpio" is not the correct binding to use. "regulator-fixed"
is the correct binding to use. It supports an enable GPIO which is
needed in this case.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi          | 3 +--
 arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi         | 2 +-
 .../boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi b/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
index 1edfd643b25a..a334ef0629d1 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
@@ -31,7 +31,7 @@ sdio_pwrseq: sdio-pwrseq {
 	};
 
 	vcc3v3_btreg: vcc3v3-btreg {
-		compatible = "regulator-gpio";
+		compatible = "regulator-fixed";
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&bt_enable_h>;
@@ -39,7 +39,6 @@ vcc3v3_btreg: vcc3v3-btreg {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-		states = <3300000 0x0>;
 	};
 
 	vcc3v3_rf_aux_mod: regulator-vcc3v3-rf-aux-mod {
diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi b/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
index 80db778c9684..b60e68faa83a 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2.dtsi
@@ -26,5 +26,5 @@ &sdio_pwrseq {
 };
 
 &vcc3v3_btreg {
-	enable-gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
index 165d09ccb942..5886b802c520 100644
--- a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dts
@@ -39,5 +39,5 @@ &sdio_pwrseq {
 };
 
 &vcc3v3_btreg {
-	enable-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
 };
-- 
2.47.2

