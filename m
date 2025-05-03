Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D3727A136
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746286192; cv=none; b=anAjc9QHf1dN7qJrwDmlQ8nk0i8gBBl/Hdnz8vQr2M6M8yIW4Iw/H56vZqRy+ql2zp5qte20wchwm75NoMVoJ3NkI6OZg7qfeMKPdairsYufA/3Pj9zETQV4KzjGjKxVLvogsoCdEzaTtCwcll87qaXuyiKkruGtuJkb/JZtlf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746286192; c=relaxed/simple;
	bh=6QzEbVZxnZQjNoHOQmADOEz4ZVVlgR5OGvszQKVOAro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0dGsQqf9Ohxg1pBPwtZf5m/K5BiODdJ1S7a/Ef0hXoI31tbvATJeP8pXh7KgBNvgmiFwLF3FWFmyB5Dlwrg3a5eQSG3I9EPc9zqyCMBwGPfiuvzv+rxlAFueemq7jlOFY5tinjCn+ZDPV1a5vKS9257Ukczag3L3XBaXJiLsS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=ExritJkc; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="ExritJkc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746286188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mhu99ySLYaiKPPq+v39y472i2/ykn+7Aa2t0YVWjSFU=;
	b=ExritJkc/ZH/pgOIYSIXHlXiTjfAwntkACKCM23oZb8qrIVmoMuLu56qHDAycV4MfE//Uk
	N5Qk+hcK3ED9GfwZlqKuUHmIpOx5IyoQreumdTYO3ecJuPL7FTGzAFCLvX1HDwawUH/8G5
	+QWTo2NxN/fd9CEhq08FYKZ19oI5G1sB0VZ8cuGf6GhKhsTTV1dPqQ+XlwTMH/oc5KozKs
	NXrSdvwfjUILGruRYDzZYZN4+EpiOCtIxP8t30Y0Ps2n6kXONWJ5Tog0TEDR/HGnHLE2Wf
	Q7agf8WIjKfG5UeBIhZJLEqExD9AzyOpqy7PelziQRTLl0whjjMsaHLkxEeiFQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
Date: Sat,  3 May 2025 17:22:18 +0200
Message-ID: <20250503152917.138648-2-didi.debian@cknow.org>
In-Reply-To: <20250503152917.138648-1-didi.debian@cknow.org>
References: <20250503152917.138648-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

According to paragraph "7.16. Power" of the RTL8211F-CG datasheet, gmac0
needs to have a 3.3V power supply.
On page 22 of the NanoPi R5S version 2204, that is identified as
VCC_GEPHY_3V3 which is connected to the VCC_3V3 power source.

This fixes the following warning:

  rk_gmac-dwmac fe2a0000.ethernet: supply phy not found, using dummy regulator

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index e50f1585244a..805cb23493e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -61,6 +61,7 @@ &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy0>;
 	phy-mode = "rgmii";
+	phy-supply = <&vcc_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
 		     &gmac0_tx_bus2
-- 
2.49.0

