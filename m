Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600C28751C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243214; cv=none; b=Y8Dn2oIXJm8FCsnmLclcyUL5v/HAofv3c9LJrtLnSp/Yweh6lQR5O1U4QkrG8BUMit0GIuLVtP5Uz9PLCgAUxOrk0f6JY87eAECCcZ5IC+YrHJcIXVjRL+hjNN5JI7EK3A68Acb6wWw406Hog0t2fGEVm6iU9BQtdjRmSAKaW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243214; c=relaxed/simple;
	bh=H/y4o1H0hvpF32O5vhAFHDz0k11JHSTAITGXft+o/A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwoPaGy1qmYQuG9HSl1AxUcwlQOfgT1NYBgsohazb3R1D3eAtjN+5pPPcDg/3eWGqqtNBGXcfjxOLJSTqzenzcDo1FGH7LfjKfHZ8y27IHhLKkAAy1crb23wftOJ8XmgmVDzEMeflsYGcVccyVGTBnamdOy5VNohJHx4LZWFu5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMg6x3r9szVfM;
	Wed, 18 Jun 2025 12:32:57 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMg6w64MDzCyK;
	Wed, 18 Jun 2025 12:32:56 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 18 Jun 2025 12:32:44 +0200
Subject: [PATCH v3 5/5] arm64: dts: rockchip: force PMIC reset behavior to
 restart PMU on RK3588 Tiger
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-rk8xx-rst-fun-v3-5-081f02d3d348@cherry.de>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
In-Reply-To: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The bootloader for RK3588 Tiger currently forces the PMIC reset behavior
(stored in RST_FUN bitfield in register SYS_CFG3 of the PMIC) to 0b1X
which is incorrect for our devices.

It is required to restart the PMU as otherwise the companion
microcontroller cannot detect the PMIC (and by extension the full
product and main SoC) being rebooted which is an issue as that is used
to reset a few things like the PWM beeper and watchdogs.

Let's add the new rockchip,reset-mode property to make sure the PMIC
reset behavior is the expected one.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index c4933a08dd1e3c92f3e0747135faf97c5eeca906..b44e89e1bb1599ee70b921598c2eb6fd54614f55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include "rk8xx.h"
 #include "rk3588.dtsi"
 
 / {
@@ -440,6 +441,7 @@ pmic@0 {
 		vcc13-supply = <&vcc_1v1_nldo_s3>;
 		vcc14-supply = <&vcc_1v1_nldo_s3>;
 		vcca-supply = <&vcc5v0_sys>;
+		rockchip,reset-mode = <RK806_RESTART>;
 
 		rk806_dvs1_null: dvs1-null-pins {
 			pins = "gpio_pwrctrl1";

-- 
2.49.0

