Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C90222585
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200740; cv=none; b=AJE9kTtSVFY4DXhjLV8aD0kc/P8oBWS88V+LvD4K2h+9HRH0J1XIn+UIZxj1PC50FMWwSZa47BsVPaHuhmmMniBUipHuQTxhv0Oh7rtXPamlOXD9YdDio7qBNEHncvOgDgPES8tTiF7sa031bUWOaqEAuFa5qIrp9X/UTmjJNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200740; c=relaxed/simple;
	bh=KvdRiVzd9y8bYqaEqQtCdCidc7FyB9JJR7/moClKn2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etoys7g8wLbuET2px4mtCfqUsniXwBE9iZQNCbbJE0gVLllvr//r79klk9RMMjXpM3AHsi+fbNGcrxqhVVSan3Iv6XKs51V9Khv5W7gfSd+NtsAZhAipu2nBe3lTwejvwmEyEgN/YovRj7cv0zS3eIdrTj/yhlEGcJ0bz9tcc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=fHq35vTg; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="fHq35vTg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PaiBlNQO0f338PUKKeTaAyF8Owpl4mcYk0JrGqHmrxo=;
	b=fHq35vTggtoeKKeRw2CWZeLBeqneL59EcoMGgTSWAxC86hVt6b2zYwL53dhOO5ua3ID590
	8xVYUfrseX9hyTkC1wel6/XE8lhjP1N/SoDu2bynQTNfwRjOZUkL1ul67iw4GR2zZ32kOl
	bpXo1vq+UHGflHjsifIepj34PCe7klD6tvsnarxcFCDiURoDEAPWuSi+7bykLWzFhHxv5b
	EAsDO7Up7oArME5VMC4fIhJ/hIIxdVSG/KW19UIEEhE2xmNz2v4vfYsxOGWYKOzp7LWjls
	Qn2FO/YHgzyxmIhH8sFUqgxSu3TDAb0ma5XWXaUsWOIe9enIlYBA9iZ98V+TPw==
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
Subject: [PATCH v3 06/10] arm64: dts: rockchip: Simplify mipi_out endpoint on rk3399 RP64 dtso
Date: Sun, 29 Jun 2025 14:34:47 +0200
Message-ID: <20250629123840.34948-7-didi.debian@cknow.org>
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

The only thing actually added here is a single endpoint on mipi_out,
which is already defined in rk3399-base.dtsi, so it's simpler to just
reference that phandle, which allows the removal of several properties.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../dts/rockchip/rk3399-rockpro64-screen.dtso | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
index a26c8e05c13b..dabe535f2111 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
@@ -52,19 +52,6 @@ &mipi_dsi {
 	#size-cells = <0>;
 	status = "okay";
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		mipi_out: port@1 {
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
-
 	mipi_panel: panel@0 {
 		compatible = "feiyang,fy07024di26a30d";
 		reg = <0>;
@@ -80,6 +67,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pwm0 {
 	status = "okay";
 };
-- 
2.50.0

