Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5006C246BA7
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122175; cv=none; b=hG8DFZIWirmij3WJ2v6PQtuRG3oUqFxmUwKhITellOjLEbV5repY/I0/7gtuDyEl6WAsHBbYvTLxKs7sQS6rDN1O0B/g2FQbPTuIEcvioLpaPWqmyZT+p/D1gQidpvSwKX/IguxcBkQoZyIcWgDSc8zHnJmVvRn0+QbZaDbRP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122175; c=relaxed/simple;
	bh=KdZ7lvWMzZq+6+Va2Bf1aIrACOXIG7kNfSwqrfkyUMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pais0kY81xUTZeJaBg+TPEZc+kl8L9F0IjlJUsmM/z1MHP2Te6ep2f6DmSOO5oX1KBbynnwPaQ6IZ9ZFJU76MB7kBrOOS6EcetID6FhysG5U78ArJUc+hAKun6r942ZDJxdwzeEU4brgPbWVsqkKoWUjub/Pp7MeGT4FYdCAeSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Tkp51LLF; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Tkp51LLF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=855oi/aHiPaIX6D7ew4EHyshWsVi9Qr95Z7nFCB1Mlw=;
	b=Tkp51LLFHe740iWEvjJdZFOjkfm1kWmsasXj+gApyDniDrHxHcglEBEoZnn9/KgL3G+JgT
	I/Xq1OUZgjDLbTdEJyqZvGgkGHFBZBU/rDPjdZhoEvnhm6YnQCqPOn0dAobJBLchkPfWKc
	NKKS3qByIkgV53nzu7ugRFuc/2UPoZYKGTRsVZ3n5riKoZilNb5hf1G+mEUuqGo+4tQnrR
	7ZMfb/HTpneU+ChcF8PbUm53ELHF39QUzPWf9NTAC5TUBbuMYTgWqynjOh1Kz9nHmg0Zcm
	yTVFe9PTfYX4jLS+wqgGjhAQDjlHS5vSQHUGBnBRqum8TFdBU1FRjvIx9iM0sA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 07/10] arm64: dts: rockchip: Move mipi_out node on rk3399 haikou demo dtso
Date: Sat, 28 Jun 2025 16:32:41 +0200
Message-ID: <20250628144915.839338-8-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

According to the DTS coding style [1] referenced nodes should be sorted
alpha-numerically so move mipi_out to be after mipi_in_panel.

[1] https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-nodes

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../dts/rockchip/rk3399-puma-haikou-video-demo.dtso  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 0377ec860d35..d28880b8dd44 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -124,12 +124,6 @@ pca9670: gpio@27 {
 	};
 };
 
-&mipi_out {
-	mipi_out_panel: endpoint {
-		remote-endpoint = <&mipi_in_panel>;
-	};
-};
-
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -151,6 +145,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pinctrl {
 	pca9670 {
 		pca9670_resetn: pca9670-resetn {
-- 
2.50.0

