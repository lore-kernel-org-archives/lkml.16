Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039821CC43
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842744; cv=none; b=Yfj4TKSukmv4492bgYw5epGQBC3Cq9fzjtHSW8nDI/6dB9HBdKLVdQ8OWWwWMVxX3Ed46hzR4Ozq/TSJ1BHEsLjS0ib39SaCNS4Rl+jCr3nM8yaZWqR5i5Bb9mkU1pMG1QWTH48l/B9Qq4Ct+YBkvF0kLwVK09iltiYrBxb1Mzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842744; c=relaxed/simple;
	bh=dp68C3As9mThWafmzcWuGnSV7SIGcJFqpADaRRNeLqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGRqr8CrOgR+UUvGY4s5ru2taUGo7kw4XV2MEcVG86mruhuttrgadINBV/dmLS4si5bNvdT9z9piLjSXVeQe5PSO1ESKlx1auMuwiSsVS8+rZt/cLWY9b5YWM2Hm5bkBjcpuh5nGO4BqeN/SD9nYmjfzTW/Iurz9C2WurdihexE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b2bML5dJLz130Z;
	Wed, 21 May 2025 17:44:30 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4b2bML0zc0zPNr;
	Wed, 21 May 2025 17:44:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 21 May 2025 17:44:19 +0200
Subject: [PATCH 1/2] arm64: dts: rockchip: add ethernet1 alias to RK3588
 Jaguar
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-jaguar-mezz-eth-switch-v1-1-9b5c48ebb867@cherry.de>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
In-Reply-To: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK3588 Jaguar exposes pins that can be muxed for GMAC1 functions to
the Mezzanine proprietary connector, so let's add the alias to prepare
for adapters using those signals in that function.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 9fceea6c1398e92114dcb735cf2babb7d05d67a5..70a2569478f6165f067befb6cdfb4f58f00dd17d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -33,6 +33,7 @@ button-bios-disable {
 
 	aliases {
 		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;

-- 
2.49.0

