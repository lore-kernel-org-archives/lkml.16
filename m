Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D8928ECDE;
	Fri,  9 May 2025 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785676; cv=none; b=pwKT8OEDhXW5kpwdyj1LA1FWL9fqYD1S5YM9oGACokvTJvOX7WzWLMdNv5yjfRLAJptjwAbksXRFcFENuh4cFqBQFKN7MDH8UDqomPTHG6FIJlEX9svHQWHoJ74PdzIKMMinXaVbPH85u4KEEDBk3ZINM5CuCS44gOlaS0Vs8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785676; c=relaxed/simple;
	bh=Z103pqyZa+ObB2sEh74x9kI0xsPOy1gkKZLi9Ft1+ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NjCk7m/XVtjwGm6ImF7pMGafUq3/70CmTvHsouTjU5E3Zktpq6ZveSPQrWLT58uMnVawOs4oCFJM2Iy1+Gp+nU3us3b1KNo0fBU7Dr/AVgTXohBg+6ua1ihpYtz+TGHRIElpsGKjE63QdMklZ7uq5qzzMlAmuqSTt22K5FGqIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=bOSj6Efb; arc=none smtp.client-ip=115.124.28.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="bOSj6Efb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746785664; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=BkbH0I5TM3m2dnDRQ+R1QhZQPDRr8vRGDjkpeZ4OOKs=;
	b=bOSj6EfbwxTo4o2OG9upsrCXokYJUZ5t4QLeQ+HAhnIgySfydP+CIuSeN4jFoX6mgUX4QWmAOPh9YRMFmB0SrBYlQjjWf8nqQ9mV4f+uSpY/P+L5B6Pg05UYAkg4RoJVSBxHttH1HohzRTh+X0ckLSg4tzQKmaVdkxqZKN1PegI=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjsv3YR_1746785662 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 18:14:24 +0800
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
	Hao Zhang <hao.zhang@coolkit.cn>
Subject: [PATCH v2 1/2] ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
Date: Fri,  9 May 2025 18:14:18 +0800
Message-Id: <20250509101419.460473-2-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509101419.460473-1-hao.zhang@coolkit.cn>
References: <20250509101419.460473-1-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce max-frequency from 50MHz to 25MHz to improve WiFi module stability
on some Sonoff iHost units. Remove unsupported or redundant properties,
and keep only minimal, validated configuration.

Signed-off-by: Hao Zhang <hao.zhang@coolkit.cn>
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

