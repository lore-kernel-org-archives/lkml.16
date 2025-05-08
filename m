Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC41990A7;
	Thu,  8 May 2025 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728896; cv=none; b=B04s6ZiXmCkspsRjmXkD3n8NmX8eRFiz0HDJzr4hfGdZJoXppDHNZzxglwGO639ukrDPuZIHDwYxd7QLKK39w0kQvstF2tlvrGssfq09a1aXw9UzD9EtesGzKRhy2Zgpe7mCFNTCpD6K/uwpMb4CmU5UAbG5Rb7Cx9ju6orx5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728896; c=relaxed/simple;
	bh=Rbbm4ITiWKNaolotmvxv7JTev0kRr/s6YWwpbyMav5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3w/UWu7ln8zzIMKnU9RI13Iy6rvx979hY5YBG32nwYvif/MDdpcSlLG0Okl41aKrrYJGRrgC7tbNi1LX0fAh7stx+QVb7Kiwb1YsaxD/H8uuKEitm4RA3UXJZPCIxJcBxQe52OgTZPfeEiZQw+SXWS1vTgoITJtlF+PO5etC0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QpcOgrgt; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QpcOgrgt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9URX2g2bLrhkgpjZmXJowFGtvU2zsLAihvZ4yWH4FH0=; b=QpcOgrgtM1z4rr7pYPCegX05KV
	hrm8GBC1By1IIeARcq4yyi8+2teu4lr6v6pk09sunHGnvqRZl+Rjk5E3x2Wp8MUEpmEGt2ocuRxdx
	v18q47cMkFhnwwtCKu52PTsVtvPQ4HhvvFIKVLDF6YcZ9KEYWKQNyuB9bNaHBF90+zg12gU6nlpUq
	zFwQObMmdPPJgc/Ah9grzicDMKr15RxX+erpvjUPEDe+HrzZQV6MGjtu5W8xNzzNJSiEoV7Xr7Yhp
	lf5BN5RjeS+uGMIsiHxqR8bTdgWreVdrptxrjQI1xhx4JcdTQUb8EvMnn4IFxbr3vgw5ezPWtIcNF
	TC3Y65Cw==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD5yb-0000tP-PT; Thu, 08 May 2025 20:28:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.frattaroli@collabora.com
Subject: [PATCH 2/2] clk: rockchip: rename gate-grf clk file
Date: Thu,  8 May 2025 20:27:52 +0200
Message-ID: <20250508182752.1925313-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508182752.1925313-1-heiko@sntech.de>
References: <20250508182752.1925313-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Rockchip clock types live in files starting with clk-foo, so rename
the newly added gate-grf-clock to follow that scheme.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/Makefile                       | 2 +-
 drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} (100%)

diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index f0e0b2c6e876..c281a9738d9f 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -8,13 +8,13 @@ obj-$(CONFIG_COMMON_CLK_ROCKCHIP) += clk-rockchip.o
 clk-rockchip-y += clk.o
 clk-rockchip-y += clk-pll.o
 clk-rockchip-y += clk-cpu.o
+clk-rockchip-y += clk-gate-grf.o
 clk-rockchip-y += clk-half-divider.o
 clk-rockchip-y += clk-inverter.o
 clk-rockchip-y += clk-mmc-phase.o
 clk-rockchip-y += clk-muxgrf.o
 clk-rockchip-y += clk-ddr.o
 clk-rockchip-y += gate-link.o
-clk-rockchip-y += gate-grf.o
 clk-rockchip-$(CONFIG_RESET_CONTROLLER) += softrst.o
 
 obj-$(CONFIG_CLK_PX30)          += clk-px30.o
diff --git a/drivers/clk/rockchip/gate-grf.c b/drivers/clk/rockchip/clk-gate-grf.c
similarity index 100%
rename from drivers/clk/rockchip/gate-grf.c
rename to drivers/clk/rockchip/clk-gate-grf.c
-- 
2.47.2

