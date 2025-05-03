Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB912797BA
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746286201; cv=none; b=lheGRmB6wPsHge1LhhTAbc4xZUhRlqsbhvjrI2hDiMnyVw/1Ho0QWo2n6YxzOBzTMD7GNbcNXzyiUKh3QicmUhkbc5e3zJqTFruYlyDOw8EnJy88ltre4XSwD4e4lXEajjKRtwzfsY3aDhtRTyRDpKpi7xhCSSmHGg7POrzVDKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746286201; c=relaxed/simple;
	bh=SYM1ZHMlMGhGZIhQe3dMr/f2FJitxadd7kVZW6crBM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTu9or31+YSRP4/7GBtPsL5WM6L6ct6ps3hwNAbIWDMfrEiv4jIean6U0k1b6Z+IxKNQ7uVTuKHPf6I0ZOPx5xzfhgaiuf0Q7KPkZNjqXOlszKObAB9fkRcq8VCIVmk9DRLIIBD9vav9D8++LVuNj8QAux2F2fED9GIOS/VGslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=YMBUxxQ9; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="YMBUxxQ9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746286197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeQFPClstvwoZtBpTw1enwh36lgdeWvNmapxU6wc1lw=;
	b=YMBUxxQ95w+z72G58zuI1TiGCa9i+RhhlCB2BXyk36bSKa8KTeTajosafbGi9LUkIT5oRN
	e0+M0sSsznrIemJAje6+9L9tW70L8ByuNmv7hdSp2Jt48RofuhM+CSv83AyIw0jnUfBEOP
	pXO4/34WbdOePbpAQpzWIyWKeo6cCoBiIBh/fgYGNbCjQti73Xiy8Qi4LeJ8D5DvSf+mpO
	Zk7O5wuf+xVJHZkDscGRZsW/P6f5CGaxzlKvtN2Xrs1YW+zNtikKT4Y9qkwY06oO6iIieK
	pY05Y9TXWIb3TB32Cgrc6auw9JpcdCxNoPlBqp+p5IA8+26vdyrq2mUuhkBidw==
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
Subject: [PATCH 2/2] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b
Date: Sat,  3 May 2025 17:22:19 +0200
Message-ID: <20250503152917.138648-3-didi.debian@cknow.org>
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

The Quartz64 Model B has a Winbound 25Q64DWZPIG SPI flash chip,
identified as 'U13' on the component placement schematic.
In the Quartz 64 Model-B Schematic from 20220124 on page 17, we can see
that the VCC connector is connected to VCCIO_FLASH and page 4 shows that
that in turn is connected to the VCCIO2 domain.
That domain uses vcc_1v8 as its power source.

This fixes the following warning:

  spi-nor spi4.0: supply vcc not found, using dummy regulator

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
index 5707321a1144..f8cf03380636 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
@@ -648,6 +648,7 @@ flash@0 {
 		spi-max-frequency = <24000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_1v8>;
 	};
 };
 
-- 
2.49.0

