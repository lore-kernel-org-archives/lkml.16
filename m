Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B3270579;
	Fri,  9 May 2025 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781969; cv=none; b=AmFWV1zkG6qeyA5YW4WLgsnabQ8n7CY+sRMTzQDLetDt/iV482jQ0tu9GeavXUfVFzN5x3KbE4HzGWsPcC2glaJVpC0+/ePu61wiQlK13zly64DasAe3oHC7xUjILf3zRI4/o1wJLV7f02R1GqbuIMRPMYwcFWt+EsOt34v47Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781969; c=relaxed/simple;
	bh=7COBxy7a+Hsq1ru8BBCuFdsudwT7UH8NdBwk9+qR+2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NypWw/wotB9u657c0Fh9WVEkHgaVIlecpdK6xL2CDr9gyClKFe77rSc+Vld8NWHbd8kGoPxeDb4sSN9coeNwTYCM0+wafpQEmjjv/jO1QpZp7Nx9Kq1RaZmItu1ac9FeBmOY7PBlnkvA+lzciEBXspefy0BBwk9R4HFbja7AHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=TzJfddtL; arc=none smtp.client-ip=115.124.28.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="TzJfddtL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746781962; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ciWbwyTmOlnq2cLpie/tgwrHFKelOt2C5BCRX15iCf4=;
	b=TzJfddtLOniFwc1o1mGz88vhmiPXWB2x8Bti52JMzGVsVEE7PFk8OiaLAY0tuaLZAnatXcyXsvO93m0WviqCqauR0JlDY4vpahQitwK6g2y5kIfHLgkKVTM0GJ4O4TgJcbLnqjGYNN4lW4vpd7SrFm79zrNDqSfXE3JeFTuiKY4=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjnlki._1746781023 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 16:57:05 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"hao.zhang" <hao.zhang@coolkit.cn>
Subject: [PATCH 1/2] ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
Date: Fri,  9 May 2025 16:56:56 +0800
Message-Id: <20250509085657.309934-2-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509085657.309934-1-hao.zhang@coolkit.cn>
References: <20250509085657.309934-1-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hao.zhang" <hao.zhang@coolkit.cn>

Reduce max-frequency from 50MHz to 25MHz to improve WiFi module stability
on some Sonoff iHost units. Remove unsupported or redundant properties,
and keep only minimal, validated configuration.

Signed-off-by: hao.zhang <hao.zhang@coolkit.cn>
---
 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
index 9a87dc0d5f66..088a069bb1a8 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
@@ -342,16 +342,14 @@ &saradc {
 
 &sdio {
 	bus-width = <4>;
-	cap-sd-highspeed;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-	max-frequency = <50000000>;
+	max-frequency = <25000000>;
 	mmc-pwrseq = <&sdio_pwrseq>;
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
 	rockchip,default-sample-phase = <90>;
-	sd-uhs-sdr50;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vcc_1v8>;
 	status = "okay";
-- 
2.34.1

