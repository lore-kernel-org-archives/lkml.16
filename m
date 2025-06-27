Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A729B773;
	Fri, 27 Jun 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022041; cv=none; b=L8m+TzKiD8QProopxWPJzHBVhpBFejncrQC8Umnt/EVr/s3Rs86rlP8o1QZHN0kDLzb6N5aFua9UiHLBkmTha2ZjcMYZVrL8ceH6mtO4YJge6PQYd1Tl5pFeBn3wLcUayA0er8lYbMIxSmdQd7aaZ/7n+EEsk/3rkPFphRAA6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022041; c=relaxed/simple;
	bh=30Dnyv1dF4DnBpa2oEEXfw7yRvrgEeQITsAYxnpbgS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSEEhorgY65veJR5H7dgDriwtypl4DR+/XvTcCMwazGanhvUdhCP8OE0K2PYXceEGef6mN7+tx7z9qsZ1vPybw40So+6YBuylvV4qcXeWcnkxmEM2oHoBdUuqUY9JhrtJ5/G12CfSNs8KVUaFU9KdVB/o8bW++H24hZFw7Gv6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9P1q2ZzZJF;
	Fri, 27 Jun 2025 12:54:17 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9N13KQzw8D;
	Fri, 27 Jun 2025 12:54:16 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 27 Jun 2025 12:53:56 +0200
Subject: [PATCH v4 4/5] arm64: dts: rockchip: force PMIC reset behavior to
 restart PMU on RK3588 Jaguar
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rk8xx-rst-fun-v4-4-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
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
index ebe77cdd24e803b00fb848dc81258909472290f1..176925d0a1a809d1e2500f5e5efbbfa6a6d0bd42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
+#include "rk8xx.h"
 #include "rk3588.dtsi"
 
 / {
@@ -693,6 +694,7 @@ pmic@0 {
 		vcc13-supply = <&vcc_1v1_nldo_s3>;
 		vcc14-supply = <&vcc_1v1_nldo_s3>;
 		vcca-supply = <&vcc5v0_sys>;
+		rockchip,reset-mode = <RK806_RESTART>;
 
 		rk806_dvs1_null: dvs1-null-pins {
 			pins = "gpio_pwrctrl1";

-- 
2.50.0

