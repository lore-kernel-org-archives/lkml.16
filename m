Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638728C847;
	Thu, 15 May 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297640; cv=none; b=ts/8ekBb8kzy3N9rqs4Fn1wdJJ0GXapf7jCooWDAqV66b2ULeuKyJueX3FWtlmpkRAo/0AJNxi6AhGZdej37ldxPk6LDe7uvA/zLB6mTUyQuGJhjf0oDZjP5HCGCmw4FCJWUDKDsSTj+NwfrcvPloHerJOE3xsqIoFbSt4J3hwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297640; c=relaxed/simple;
	bh=pF1Il/IUpx74DrWIinad9ZPdMciJ7YZR9KyDM+5eUys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kz5g5+EiCbYO1B97LIn+Ms6FfFqeASgyfdSQMQE/jYneLt3H9vBA4C1isXZa9lAHBs/j/XhgvXaxglO3kzyFWSzTj33iezMNBsWadqV2e7luDTGwE0LFwNW0OZiAPDskd0xPFlCZebF/HwbC2Qy3Y9U1vvhTZxmcPWok2D2wpnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BbHW6MRQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BbHW6MRQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tjZMaGznYTpgVkzcAZJLB15P+8pIgeWsz7sQYwAvhuY=; b=BbHW6MRQgqivLoVwFPVTJrHMYQ
	8didFhmFojpowKxGBGsVehaGboufPYS6v4tflzKmoRcY0K7V8J5n7O4NaoS9wJ5OnJmZvNwa0Lf2/
	0nZC93Ud1vKcDY2hq8CASdDh0dbDlTvyPEN3I9x8pJf8Src0txz0I1oqvUI4Rtotf/PK8OVRqjsoQ
	udP6QfrZkIlHUQvMis9jjua9NWH/45uL1L/svgfoMTuIAttbKUkyFMWiZsEgrMIHc3ItlREwSWNbO
	UmPyrEvVymvO0Uocyp/J7UsoecGYFD9Z4/XTpPucDSh9Wp3+GUklG1JiVnRx8FXlPmf6zxfvOW286
	5mnWKQXw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFTvs-0008Fm-0C; Thu, 15 May 2025 10:27:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.frattaroli@collabora.com,
	ziyao@disroot.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: rockchip: rk3528: add slab.h header include
Date: Thu, 15 May 2025 10:26:52 +0200
Message-ID: <20250515082652.2503063-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250515082652.2503063-1-heiko@sntech.de>
References: <20250515082652.2503063-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The newly added GRF types introduced kzalloc usage into the rk3528.
At least for the similar rk3576 driver, the kernel-test-robot reported the
missing prototype, which warranted adding a slab.h include.

While it did not complain about the rk3528, so the header might be included
"accidentially" right now, add a real include to make sure we keep it
included in the future.

Fixes: 306d2f5ddaa7 ("clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3528.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3528.c b/drivers/clk/rockchip/clk-rk3528.c
index f5f10493abfb..a5ff64b93f8f 100644
--- a/drivers/clk/rockchip/clk-rk3528.c
+++ b/drivers/clk/rockchip/clk-rk3528.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 
-- 
2.47.2

