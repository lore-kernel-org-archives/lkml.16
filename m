Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0F1CA81
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320475; cv=none; b=eIE9M3dXsSevnP56tWW1SDRwqaQy/a3o3sKCjnE0IjHtT5lcqsAw5sYJKJVhW+yniar4kD6ptDuo2WfIJND74YXTuzgbFRm5uf9UVs8LE5FSvGNHhUa21N7YZP80zyw+WlpV7XU7JKz8j47hDy62PNwfQ9XubD8XEAPIAPWZGdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320475; c=relaxed/simple;
	bh=DH0LDh5X5wTuKhWea7Mq96Cx9c3B7/rrQf3HiJ0yC0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXuCgVHC/bKLfHqDGTHgI7RQmbGdmlUaU5U6AZYGarGUw5VfieVfwrUKeeqoVSCGk+1T0wG6nU0M/sHS7VbRGBYhEkR8nwnc/WBtjDNY+I57G94BjaizV2v6HR9OZgjPyncGPpyazxP8VjCG6Vx6ab3mcrOSESstM1RGLotTn1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YksqL38fXzWFd;
	Fri, 31 Jan 2025 11:40:30 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YksqK51TTz6gw;
	Fri, 31 Jan 2025 11:40:29 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 31 Jan 2025 11:40:16 +0100
Subject: [PATCH v4 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-pre-ict-jaguar-v4-2-c971e2852e8d@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
In-Reply-To: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: Jonas Karlman <jonas@kwiboo.se>, Dragan Simic <dsimic@manjaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The Edgeble NCM6A can have WiFi modules connected and this is handled
via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
NCM6A WiFi6 Overlay")).

In order to make sure the overlay is still valid in the future, let's
add a validation test by applying the overlay on top of the main base
at build time.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index bba9b2f1c761040545bea561878e9b63f8c29488..267966ea69b194887d59e38a4220239a90a91306 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -136,7 +136,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-itx-3588j.dtb
@@ -183,3 +182,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
+rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
+	rk3588-edgeble-neu6a-wifi.dtbo

-- 
2.48.1

