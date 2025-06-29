Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7BD224AE8
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200741; cv=none; b=QztL6zjRlNlGW2DlfnFNMPJHzeqeMxG3liuvpo0Mds4crz6Xsf1QMWe0ziv2nwljdJaufGnBbkh1+6f0g2dUZHbKw8SAeUkLx7PLKRlWwNmSZPYj7gn92wUCaMnpqiuM1LEht6c5NvoaH9tItPi+SdvWvwJ64laxVX47+ml0ZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200741; c=relaxed/simple;
	bh=KdZ7lvWMzZq+6+Va2Bf1aIrACOXIG7kNfSwqrfkyUMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0HdpR7nfh5h+PsmvH++Y+xsY9QYu20PAZa4EyRg1ScsYw0p0ICMrNYNOwR8r8DOHYxDxSfkIo/4mh7UOyg65QlD9Z9QxuBPkUIT/UCh3ocqEOK07vb5Ufo16SftQ8LMTzlXsPqa69U68WfgzOxHa3it5tDEIOFPrU7kZk9272U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=UrCb7a5+; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="UrCb7a5+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=855oi/aHiPaIX6D7ew4EHyshWsVi9Qr95Z7nFCB1Mlw=;
	b=UrCb7a5+ttaYcZzIa9jeW5t6UPHWwSoz6EWmMmMpK9rYzOesiswOnpOcgYNQo67OAySCKU
	EtsBTsSTsG9PreeVXCMhedwPGKjCikOWt9oESBpgQNR7PQE0KzysE+TaUzzz+2Pmc+CwnU
	RL4FF5JcGaJLULsRmg7vxG1WyUbUEUD+W79WKytIZFGRfOMV0Qc84M3RLBDdzqoBG65oby
	xl28O6ZmgPZLYtmU4cXgUgwJv5ak1/dxrrh/vmWqH1P/FBoXX5h1X1yU/0cRrngoiH6oav
	y5+VDYzG7izz8N7Ag684wWmp0iqdhVs1GsIRU3sgUqshlIpPOo3IOjecwfptHw==
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
Subject: [PATCH v3 07/10] arm64: dts: rockchip: Move mipi_out node on rk3399 haikou demo dtso
Date: Sun, 29 Jun 2025 14:34:48 +0200
Message-ID: <20250629123840.34948-8-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
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

