Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE52BAF9
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120947; cv=none; b=Ktu2mpixP2cWxDu/eB2lvg0T2ppQ/vYH71iP6ciN9/OjhLBFmhB/6H0gxwG5KWlA92Dbr05bax0SjtnKaaL5Q/JDS6aBYzOI2ssOA/Md6lpUUgSwl2n7i1EuRZp/B4QDVCOFp5KCdw2aPXyjJWM+BwocHEw+ECoRirgwK8oaVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120947; c=relaxed/simple;
	bh=00VxCftzXSRjQaFvEsfH+4e7dazyy10SqpmKlzgkrsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOTyWCRhsKWZxbKuXw9H3Ehq2Yosa1qHxRSdHZam1J1a4mK7AET33g8hkWeX4veOlMRqEZ/lsRECooMLzNmVko14LGmCa0NZHf38ZfWxOQVGhAKC8DBiXddxyAr0Z9+0e1LyxGsgdd7yy3xK2BMYXR0Shhz02rRmnsD32Yrg5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=drzaFM0Y; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="drzaFM0Y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751120932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cfDZ1inHOui4m5H5mXU1kp88kQ35TPyN/bSvxLYsfwA=;
	b=drzaFM0YVkZsqVrjLUvXn3A1tp93N4Rp0hgxvjIF/Zyf2+HaXHjSdNeQtnEQa12wR3Aczj
	w+NpD19PqXPEWQHqjKTEzqYvSrKC1JArSEwyrDHaq3Epbh1iSWasW8E/3fwg9wVjXtwexe
	UFHRziCozyLVNdHBbfbXzP2JPxZC6tlCxhnP6qWMKE2vlBp868vEGNQnTcWCYjeuOp8HFj
	Tg8Rli9QtB7q1SplwJgl+QZ08H+tJ4TXikfz841Bdjwl8TVmG6exLJTroOaDFwMfxJx5GW
	lTmKjQw63UB41KSc44tZhxGRTeEg2zyat8CejBpMrrp1vBPJhYPZtZ+KWLHKcA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a
Date: Sat, 28 Jun 2025 16:28:18 +0200
Message-ID: <20250628142843.839150-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The Quartz 64 Model-A Schematic from 20210427 on page 7 shows that the
fan's power supply is provided by VCC12V_DCIN.

This fixes the following warning:

  gpio-fan gpio_fan: supply fan not found, using dummy regulator

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 3c127c5c2607..a9021c524afb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -30,6 +30,7 @@ gmac1_clkin: external-gmac1-clock {
 
 	fan: gpio_fan {
 		compatible = "gpio-fan";
+		fan-supply = <&vcc12v_dcin>;
 		gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
 		gpio-fan,speed-map =
 				<   0 0>,
-- 
2.50.0

