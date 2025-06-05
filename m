Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA713D8A4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138086; cv=none; b=m1u2xN2RptfscK7oeuKrYFHHeJHYwt8yuXOfmDcIY/aoKXPSnwH2i51ZIw8K9xotRuTyHv6lZlrqAY0oPyXyNcyAmQm/OMUL3D9bXGhMo+yMkiKlyJm8WEz1neA1aC5684EvSaNjPkC7DYxfxlE8ogL4QjxL211TAB4OgjBt9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138086; c=relaxed/simple;
	bh=48Bc+nXf9XM8e7P6/iwUEIqVjxJ1/oJ48Vgd5O3Ja7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2UG9Ugkxuk0f/t0Dy9HwCvUZc7YnB9mksw50EdBPWVGWjq7741auqhoPvy9nhGHt/YJamY/wOF3ocyFxiJ5lRQTTWPipqKB8VTiDNke4oSBozg4ZkpKKJe2kAZgmw3RDJAvhJMgAylYs2YEQXfXb4FqmyBBUqarm2E0Xlm30KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCpZn4ccZz3fw;
	Thu,  5 Jun 2025 17:41:21 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCpZm4zsJznlL;
	Thu,  5 Jun 2025 17:41:20 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 05 Jun 2025 17:41:08 +0200
Subject: [PATCH v2 3/4] arm64: dts: rockchip: force PMIC reset behavior to
 restart PMU on RK3588 Jaguar
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk8xx-rst-fun-v2-3-143d190596dd@cherry.de>
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

The bootloader for RK3588 Jaguar currently forces the PMIC reset
behavior (stored in RST_FUN bitfield in register SYS_CFG3 of the PMIC)
to 0b1X which is incorrect for our devices.

It is required to restart the PMU as otherwise the companion
microcontroller cannot detect the PMIC (and by extension the full
product and main SoC) being rebooted which is an issue as that is used
to reset a few things like the PWM beeper and watchdogs.

Let's add the new rockchip,reset-mode property to make sure the PMIC
reset behavior is the expected one.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index ebe77cdd24e803b00fb848dc81258909472290f1..def6af77efaccabe0dd08aaa7959602bfb143607 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/mfd/rockchip,rk8xx.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
@@ -693,6 +694,7 @@ pmic@0 {
 		vcc13-supply = <&vcc_1v1_nldo_s3>;
 		vcc14-supply = <&vcc_1v1_nldo_s3>;
 		vcca-supply = <&vcc5v0_sys>;
+		rockchip,reset-mode = <RK806_RESTART>;
 
 		rk806_dvs1_null: dvs1-null-pins {
 			pins = "gpio_pwrctrl1";

-- 
2.49.0

