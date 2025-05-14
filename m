Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0F1C700B;
	Wed, 14 May 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235289; cv=none; b=BpEDOPMAGZ/d96SNWFeNJPtykA8B/YJjWlRxzM1fxyZEb6e+AEUVR5Y8ROncOZeAQWu1fJle1toWcizxe7/wXaOoMa9QV+o7is+mO6djl/fwUiGJMecJ1uRdZ6p7wjhLrGJ7ca+JNbOweRAE+jQviOB78zTALkB0wPDhJ1f9opM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235289; c=relaxed/simple;
	bh=v5YY0SZ0PYpJOc41X3mbWN+7Qhji612T5TVNWtMUFmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFXhzutP236QRzZdZEcgHGzWiewzL9xkhJkJviSXR5MoEs+n0tC0z4V8UwpKxZXY8IetpUeZzo0JTOvx/E4ZTRVR1824oqoboeE2yrB5bat8eKV3dd6KLWxPZPpF6c+Ggc3GM9GMPjQTvXLfEim7Wg5KFfVoJO0H9Sk8UumOVSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=U/5UTl7k; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="U/5UTl7k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RV3QvTlWfQTkDjPmndYOu91G7Myw8NKGakZkfON1fQE=; b=U/5UTl7kW20dUxg3as4vjPS5Hm
	MoFDma9yUdEFw3cV6sSdF+lfu6QWthYj+l6rwQ2DaExqVA0ecSq+EOuoHCtCEKCcbEVusodO6Iaie
	DWJaWssg0K9QRJG3jZQLZdwQYpbVFEjaEH+QXh79P/dKODWx8jHtN0o3gL7ve1FWtaHqk9pAALaYf
	/ZtEMjZiNtO1gtZjntKoS29tV4L1loKXlwsEXSjpnmvocwQvkc/dnhN1m91jrFr0M8XUI//Xgihnt
	R+VEQh+gnxibHZKXW6M+IUFb5LIiOfk8KyKltOZSanQiM5LkWL4D6JqiZ0Ggg6k8POdt5shFsz+Dc
	VMhHi8Sw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDi8-0006vE-5C; Wed, 14 May 2025 17:07:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v4 1/6] arm64: dts: rockchip: add basic mdio node to px30
Date: Wed, 14 May 2025 17:07:40 +0200
Message-ID: <20250514150745.2437804-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514150745.2437804-1-heiko@sntech.de>
References: <20250514150745.2437804-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Using snps,reset-* properties for handling the phy-reset is deprecated
and instead a real phy node should be defined that then contains the
reset-gpios handling.

To facilitate this, add the core mdio node under the px30's gmac, similar
to how the other Rockchip socs already do this.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..feabdadfa440 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -985,6 +985,12 @@ gmac: ethernet@ff360000 {
 		resets = <&cru SRST_GMAC_A>;
 		reset-names = "stmmaceth";
 		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	sdmmc: mmc@ff370000 {
-- 
2.47.2

