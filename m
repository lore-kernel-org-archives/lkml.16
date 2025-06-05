Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8419F11B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138086; cv=none; b=bduT5u7OKL5aEnvJSoVAEaHT67nqZqpe73l9To4n3e1k6Xki+X7FjgNabtcKoFWUiqqR0gd5+6b0XFrMzRfqBAqTMUR+2uNwo8nLx9Df01TannRZLRX+1HoEHvKGx6choVB8PtkVOVIjH7doSs9gA+tOS4rSPZFcxz3RpMjAa1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138086; c=relaxed/simple;
	bh=P719VLxHFxERjXUpHSjJfqPi7IZOb95FqVlS6IdDChg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhOi4tvlByHDf/ZjOqk5TEbRf45Vi03egklMp9jYqdYRtN3MtvM8K7zby0tshMWFqbSQUxXcCLcsdek/Hoh3VhFf8KjJRqVUJWVW2AD/cRY1GcTaOjYVL6N69asxn1wNZ83gRxIlXcVc6Sx3e+FCACYpehcDAO7DbI2Vms6IL5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCpZp2PGNzrRp;
	Thu,  5 Jun 2025 17:41:22 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCpZn4Vc1zdCl;
	Thu,  5 Jun 2025 17:41:21 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 05 Jun 2025 17:41:09 +0200
Subject: [PATCH v2 4/4] arm64: dts: rockchip: force PMIC reset behavior to
 restart PMU on RK3588 Tiger
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk8xx-rst-fun-v2-4-143d190596dd@cherry.de>
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
In-Reply-To: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
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
index c4933a08dd1e3c92f3e0747135faf97c5eeca906..4c05603abed2e458e406ed45f1bc7cdb57b42478 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/mfd/rockchip,rk8xx.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include "rk3588.dtsi"
 
@@ -440,6 +441,7 @@ pmic@0 {
 		vcc13-supply = <&vcc_1v1_nldo_s3>;
 		vcc14-supply = <&vcc_1v1_nldo_s3>;
 		vcca-supply = <&vcc5v0_sys>;
+		rockchip,reset-mode = <RK806_RESTART>;
 
 		rk806_dvs1_null: dvs1-null-pins {
 			pins = "gpio_pwrctrl1";

-- 
2.49.0

