Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C61F6664
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941623; cv=none; b=lABTFIZjsU2lGIdsrYEj2R/R2ra9A3EbIFZH4bcmhKX83b357yuTFAyi5/RTzzdBsalI9OZ0OyM7NOiinGYwSUBAKI8xhKeRBE2qmh5dBsIZhJwHXbwM9AcYxUOya+cPclroOvtJQclZDGJhG6Lms5bYY0o5k9c5xOPUaOPMmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941623; c=relaxed/simple;
	bh=zAZuKwTh7Hd1DNqMOrNdXVLZ548pZVmlGc86X8VWI9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPnQs5FpeFzkCbk9pXTmYbJrBfgYzT8rC4LYpEm062fyd2tpSu835r4gZFuW+RYrE+7Ah9NNwhSUuwxMyb9+4G1m3x0b61rXp1iv0Enc/dsv6POOm719SDsHQgxZGkYe+aR5ivSRJMdRQr8CNznbNMaM7+/yzWiVtpoOkbsa7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YqHhs2yJGzPtl;
	Fri,  7 Feb 2025 16:20:13 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YqHhr27xPznW7;
	Fri,  7 Feb 2025 16:20:12 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 07 Feb 2025 16:19:59 +0100
Subject: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
In-Reply-To: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
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
 arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
+rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
+	rk3588-edgeble-neu6a-wifi.dtbo

-- 
2.48.1

