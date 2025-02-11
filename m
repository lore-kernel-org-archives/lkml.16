Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34F24C66D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282602; cv=none; b=ErAGWWw2lXXpV/QhLTXyvuy1xXEGMfcDVZQlCVsyTjfm8MTcEoPd07rQ8sTLKcew4xUzeiSdAwTVCF0vvkfWsRcQ78g0NGcrbdr6fyIIuLGH+nXGFvajJNRMbqUekpfCs9+hJ+1iLE5bsWdyeVquEDLq39SS/TbLSutd1zpa950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282602; c=relaxed/simple;
	bh=38SzZjtaSSJ8VTC/qk48nzlF2mAAeFz1rRcmoBtR5AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhB0ZKTgV1wbU/ldGuzst4xTCzaf6DtjhTMuVkOwmTlZpYI2XUiUfvijMOjktcL6bvFuIZjde2ax/bhoNmMXwbDyzv3fbslH+3C/7Xr7hQ+aawtsou/RoyLkK20AbtvUP8boq1Te4nHhYFSkSCUxUxC3zUHpPWB8cdzyg4j9Mng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YsjpG45V0zChv;
	Tue, 11 Feb 2025 15:03:18 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YsjpF3VQ1zTLG;
	Tue, 11 Feb 2025 15:03:17 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 11 Feb 2025 15:02:52 +0100
Subject: [PATCH v6 3/4] arm64: dts: rockchip: add overlay tests for Rock 5B
 PCIe overlays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-pre-ict-jaguar-v6-3-4484b0f88cfc@cherry.de>
References: <20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de>
In-Reply-To: <20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de>
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

According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
another Rock 5B, the latter needs to apply the
rk3588-rock-5b-pcie-srns.dtbo overlay.

In order to make sure the overlays are still valid in the future, let's
add a validation test by applying the overlays on top of the main base
at build time.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 1406d9df57f8ce589217730f836b4e222b1e0d26..2cec67c00114b16ca55c12fa8f757a015c4602ad 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -200,3 +200,11 @@ rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-wifi.dtb
 rk3588-edgeble-neu6b-wifi-dtbs := rk3588-edgeble-neu6b-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
+rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
+	rk3588-rock-5b-pcie-ep.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
+rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
+	rk3588-rock-5b-pcie-srns.dtbo

-- 
2.48.1

