Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB67238C3D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573202; cv=none; b=BJV5HAtHw7iMVuaxjnGbe4BLTJdXyjqvcOTuGYZEr8v5Lj0Y7NF+UJ/V2HyIgvpy+4+iY/U+cD9OhrnzVx4B0+bNYYDx2neVI3dfy6/9g7xmhC+TMC9raM4U8GNcRnCYKPxjNbWiV4H01EZcACgpqtQSqulspvA7YSjJZXpIvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573202; c=relaxed/simple;
	bh=+c7+i5TLsDNfV5qaGCB+uKaCshTHPcCbuIR/iOf2QRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHFJsRjzFkMYgI3hoFxYdaSS3ZmdCCV9GYnopuHoxi81J1ly3cms1CvyMr31GsAB2valc/2Lt0l7WCuas4i1y1n7fXH4fiqMmwYYU7VRjvULqPtZuiXCCEi/Ajy/HBWPwh1BT1mcaUM1PHbESQnvLgVt11z7kCNSC4u3vt4+nHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=XkbbbFs7; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="XkbbbFs7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ahh+yK53sLvW3MEUdC7MxK8tfSXmwwVwKVWlt8YQ5zc=;
	b=XkbbbFs7uTmSV9FAemeiLpf9+0tATe4g7bK4bWySVhkNoXV9RvWhjk9Ja8/2ClWJGP3hdB
	YJJnO2D7/llOFrPIepAqYe1XNsuM0Pcr0QuBaZiNRsIHKDpTOW90BBm5tPdmHEUgRjwC5x
	RTAlRExplX457PkviW5AvORooTo9tAwNS87X98MITNvxbt+unT5ApsLHs3h9m6xs0cysM8
	rx2fMewJ1jw2vSVsFdfG9f+XmDtNhALmdWeAxtPLIaKjgOLxKCatMK1kDpzh+fXEJysYO4
	uZCUAkwKbjcaSy6ezlDZcrV7DQmK+9+DLTLhyZ+QO9NAQ6kddQDgLilI6ayruQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Dang Huynh <danct12@riseup.net>,
	Johan Jonker <jbx6244@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 3/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-pinetab2
Date: Fri, 25 Apr 2025 10:44:43 +0200
Message-ID: <20250425092601.56549-4-didi.debian@cknow.org>
In-Reply-To: <20250425092601.56549-1-didi.debian@cknow.org>
References: <20250425092601.56549-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

As described on page 37 of PineTab2 Schematic-20230417, the SPI Flash's
VCC connector is connected to VCCIO_FLASH and according to page 6 of
that same schematic, that belongs to the VCC_1V8 power source.

This fixes the following warning:

  spi-nor spi4.0: supply vcc not found, using dummy regulator

Fixes: e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
index 26cf765a7297..3473b1eef5cd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
@@ -867,6 +867,7 @@ flash@0 {
 		spi-max-frequency = <100000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_1v8>;
 	};
 };
 
-- 
2.49.0

