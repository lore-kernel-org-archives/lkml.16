Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74923253F3F;
	Mon, 10 Feb 2025 22:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226772; cv=none; b=nmWB6emHdvpXwF/psP0sT3YWGAGpABWViC85cKVVf7NobERKaJUr5aKS7qg+Z/P3H4QmjrVKOeJeYi1AdM9i3LyoLd9ZRyDQEnX20TwHdsH13M2ibx3P1JZ80+w25lKA0ex4vCMfGCK4o0W5yaQp8bvKd1b5Azta9yBDrcNj0z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226772; c=relaxed/simple;
	bh=k4dB33v3QMtKm0f6RGQw/aUKZyYzQB1ti6mbkxFTIMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2BUlwZZsFe8WxHyA3LnyIo09CBPruZ0MBTPDnPtoITg6jKzgx43ZZvZsByjWS8Pc+MlM9krr4BSUQ3x/fBG4MW4KqdQmNVcybqbjlnz4M+PDFD+YtztVcF2NiVEKXVJVTYdPFiaDjP6FLsWXpxnZwt18biAZl3NZpuyznZqvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=FfQH5HG0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="FfQH5HG0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KitIcVEYndUt0qKINu8fYIcAiotv9Fme79WSrud1zmI=; b=FfQH5HG0W/FNE83p+GlJwKNfWb
	U69oCoSQUa455ECaUJlui8ap6hv4z1svFIb1F18T7HHqEfEp4JRUTBv9h7nEaC4d+gJ5iFBgAwGr1
	7qqDFyxYJ/tbq0JpPsuRjdAdTA9yoUvRhmdexoStq3xcahKm9xSbgCTTXI67xaAT9WtuB2oVQrnQU
	4xsIbbm/5h60tEU4Ni2ilI+uWhETqG8x6qhlktsYJwL7WEMWwSBXqrakWKe8DZolko8dF79DUoI8p
	to+KIFi72+sG7IG2qxaWuRvSo7Fug3MhG4RsClB0FLmZ1aZ9wZgsUOWDy6yWkij/ItIQzMQb+yGYe
	O1HgBBqg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKb-0008Cw-To; Mon, 10 Feb 2025 23:32:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH v2 1/6] clk: rockchip: rk3576: define clk_otp_phy_g
Date: Mon, 10 Feb 2025 23:32:14 +0100
Message-ID: <20250210223219.1193346-9-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The phy clock of the OTP block is also present, but was not defined
so far. Though its clk-id already existed, so just define its location.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 595e010341f7..be703f250197 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -541,6 +541,8 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(5), 14, GFLAGS),
 	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
 			RK3576_CLKGATE_CON(5), 15, GFLAGS),
+	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
+			RK3576_CLKGATE_CON(6), 0, GFLAGS),
 	COMPOSITE(CLK_MIPI_CAMERAOUT_M0, "clk_mipi_cameraout_m0", mux_24m_spll_gpll_cpll_p, 0,
 			RK3576_CLKSEL_CON(38), 8, 2, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(6), 3, GFLAGS),
-- 
2.47.2

