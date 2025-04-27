Received: from out28-103.mail.aliyun.com (out28-103.mail.aliyun.com [115.124.28.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CA1FBEB1;
	Sun, 27 Apr 2025 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745736688; cv=none; b=O0rupggHrN+OokRtOcdeMTZJFQ27hAtH9jx0pbbu47N9kX3VauGytpBaZlqWXWW/z6coQPsFUgtPr+G4XTFyADxDi28xkbVx4Pc8pcDPUlQAP0FauKsj3evOZIo8S0YFuiVwse75lwNVgHyTQbLhGiRI1WrSrevlAA0s/6yKkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745736688; c=relaxed/simple;
	bh=nV10xEN1bqIZGv+lItmOBNbiZrYFsrxkH7IWf1RKO6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gv5pmWD4Ttxy4kuU4MsG5rLPlIFTrrXWiaS/ElrdOb/SEf1MS0oWordj2bkmc0REW/1d9k9ky7xmcwTVvcibPVLRxG7EaJcFll2UvPtkOkwDd1R31NiBUcnbRaKUHPmFVJ0OYpShldMw222gpxYZ3F/KXAHA5oVf3oRLbIcvLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=aEwctLrk; arc=none smtp.client-ip=115.124.28.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="aEwctLrk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1745736673; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=g+oNp7kZwyjwPU4Kaggu77LkvQ8spC/gbYZMK3mhNrw=;
	b=aEwctLrkYD4F3/krsU9oaWDyR1HpT+QaVmnkB0EH1bn1s+SEt+4SX+3mfQq8Wy7T9k5LCFwXToKcfTm9Pfn4fnXY0cKkn0DxVDycqYBW691q3TOw1wWU6D9XZJwhalgozAMtrJQrB34rwzpbIfzS0QXMRV4SIDD1QEuUPOEQbcU=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cY70L5V_1745736638 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 27 Apr 2025 14:51:13 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	"hao.zhang" <hao.zhang@coolkit.cn>
Subject: [PATCH 1/1] ARM: dts: rockchip: Wifi improvements for Sonoff iHost
Date: Sun, 27 Apr 2025 14:50:13 +0800
Message-Id: <20250427065013.99871-2-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427065013.99871-1-hao.zhang@coolkit.cn>
References: <20250427065013.99871-1-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hao.zhang" <hao.zhang@coolkit.cn>

After some Sonoff-iHosts have been running for a long time, 
the WiFi module will run abnormally.

Adjust the pmu_io_domains and sdio properties 
to solve the WiFi module operation abnormality.

Signed-off-by: "hao.zhang" <hao.zhang@coolkit.cn>
---

 .../dts/rockchip/rv1126-sonoff-ihost.dtsi     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
index 9a87dc0d5f66..3c0371103015 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
@@ -323,15 +323,15 @@ wifi_enable_h: wifi-enable-h {
 };
 
 &pmu_io_domains {
-	pmuio0-supply = <&vcc1v8_pmu>;
+	pmuio0-supply = <&vcc3v3_sys>;
 	pmuio1-supply = <&vcc3v3_sys>;
 	vccio1-supply = <&vcc_1v8>;
 	vccio2-supply = <&vccio_sd>;
-	vccio3-supply = <&vcc3v3_sd>;
-	vccio4-supply = <&vcc_dovdd>;
-	vccio5-supply = <&vcc_1v8>;
-	vccio6-supply = <&vcc_1v8>;
-	vccio7-supply = <&vcc_dovdd>;
+	vccio3-supply = <&vcc_3v3>;
+	vccio4-supply = <&vcc_3v3>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_3v3>;
+	vccio7-supply = <&vcc_1v8>;
 	status = "okay";
 };
 
@@ -342,18 +342,15 @@ &saradc {
 
 &sdio {
 	bus-width = <4>;
-	cap-sd-highspeed;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-	max-frequency = <50000000>;
+	max-frequency = <25000000>;
 	mmc-pwrseq = <&sdio_pwrseq>;
+	supports-sdio;
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
 	rockchip,default-sample-phase = <90>;
-	sd-uhs-sdr50;
-	vmmc-supply = <&vcc3v3_sd>;
-	vqmmc-supply = <&vcc_1v8>;
 	status = "okay";
 };
 
-- 
2.34.1

