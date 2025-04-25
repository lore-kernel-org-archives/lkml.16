Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF48237713
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573198; cv=none; b=pL2OqnDWEmeCSewaGqxaFa1qclACy+F5jSpUAFkcNiCzsrg54pdF84aLnKBGAB8CsCA9pwcolCjpK8z8I92Vi6lsGAWfkEBwoOwaMFnqPqmc5wfofisQbQf7K+Xl6HY+1AT2B96A8YfBG4gYsXKYRgckM41TLi432HkXPEXrMUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573198; c=relaxed/simple;
	bh=XKumTukus7XBIwSIqv/n8AjPJx4f9l5t/P/WymvvbT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4uN2AzkEANJVWy9h0IjNS4mppRDMmZrWoTlLVNTY+UPjJss5VU7dm22vAn2YFQ/XOFwC5UnNV6Tek5kYSdJe/c6nact+bz6c9zU+HRnsxk/3cYKxA3OVK1wwhoL1zjrRFOt3QuWr7GKEBa/+HKDMIxOVUZwBsDLOCuZmuVNrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=0NcJ0k0M; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="0NcJ0k0M"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1745573194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bSXucn13BuTbBFI2rxgwmfC5tI9ba6wouD2E8Unato=;
	b=0NcJ0k0MuwVSuC80hcQxfFpuLYW+0jrN04RSTRyFnETMXVDyBMHLBGM2rqkt+OmKUhoy6N
	ucIj6hbyVQhBQ6H4mrEbYyNI4H5HmEhpH5sImlQSLm7NQKsx1yIafmIi7Y6JQIL8T1bFvA
	DQsmfue+gHlGgraoUWpkQPY5riPSvTmjcIE2NyWKfWo0oqZC908qpm+Qkr5QtcaQlgGR3t
	on91vONMg6Lls8pNbmCHZy4yrj/7tFPZsrJCNPnfM/R4HD0npO7CWU3qRt/ptFpT9FHYlB
	CBg/B+bf04egCEntz++wxanaVegNzjOoLl2p8iiy9KkCoJkjaRs5OjL/ulH78Q==
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
Subject: [PATCH 2/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpro64
Date: Fri, 25 Apr 2025 10:44:42 +0200
Message-ID: <20250425092601.56549-3-didi.debian@cknow.org>
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

As described on page 16 of the RockPro64 schematics for both v2.0 and
v2.1, the SPI Flash's VCC connector is connected to the VCC_3V0 power
source.

This fixes the following warning:

  spi-nor spi1.0: supply vcc not found, using dummy regulator

Fixes: e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 51c6aa26d828..a7e4adf87e7a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -850,6 +850,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <10000000>;
+		vcc-supply = <&vcc_3v0>;
 	};
 };
 
-- 
2.49.0

