Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D86238C3D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573208; cv=none; b=tqkfC6F6W8zSEcS2imAbiDNnPM1Zu4Lu7gqLYDhdRuxTSilBN8ikn/YHezCNFIrQw2ATSsdFpeLKpEtQOF/FZGBpk3y0sWQF/DwFjV+eL+TT92g6Xy3SguSIDADQsFqbbSXoHE4QAjLdPhrSdgFFaA+IgXRDzJrqh8ow9Vb5W6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573208; c=relaxed/simple;
	bh=vJN/7KIG+1nOIFCnwVIBp3bhkdUCJlec+LujjNCchJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHpGdTlskDfZHofyuuCdEJ7yMsNc139jXHDUIYYcPYMn0LSeU6ehqTZlVHgWt9UnxFWRHrRHBbdlJzBQo+o0bf2h+LvrnEL8jD6Vm6SADFZYtFR6R5jOneLz7eFE/RgjezBLN7Cow9wnpnSvHbyt7agN5s3vVsb90Dp2/U9v/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=lTZkGhlO; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="lTZkGhlO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gH5Q/9/Gya6g7S3LOJ0iW2pbkqKWlFOIE72t/4lmn3Y=;
	b=lTZkGhlOubLAFQnv5HDHfiOwIA2OpqXLEg6CO4Vya9kGFeFRlwExSb2RWSwYm5Eg8XhwMl
	40ebWHvf0C5xx1UO+mf9m3Rz2ts1yZ7xrtn7QJRxWPW/QA0QFQzbkEVctK+/hqI3NJL0Xb
	vfNJMdAbIhcLxg3hfoGB0NV4eQ8VC32TmsNs6lCXpqk+2LpSkraU+0HxeK3+0zJ35u7ZmS
	I9ImvqE94u8EmgSe35zoemOT7i5A4qztXMimy74DrlUCnyXfsnwGcFbHniIeIFLSMtvJqx
	SdboLYb34L/MNtJdNWHS8V3A81f31kgsjxhoUfkqLDRXPK5RIkYliB+kNtZNDA==
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
Subject: [PATCH 4/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b
Date: Fri, 25 Apr 2025 10:44:44 +0200
Message-ID: <20250425092601.56549-5-didi.debian@cknow.org>
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

The Radxa Rock 5B component placement document identifies the SPI Nor
Flash chip as 'U4300' which is described on page 25 of the Schematic
v1.45. There we can see that the VCC connector is connected to the
VCC_3V3_S3 power source.

This fixes the following warning:

  spi-nor spi5.0: supply vcc not found, using dummy regulator

Fixes: e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5d..17f4fd054cd3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -562,6 +562,7 @@ flash@0 {
 		spi-max-frequency = <104000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_3v3_s3>;
 	};
 };
 
-- 
2.49.0

