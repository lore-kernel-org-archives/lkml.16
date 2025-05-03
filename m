Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A1927EC73;
	Sat,  3 May 2025 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303961; cv=none; b=a84kMQDQwW8xoC4J7aF6l+kdpoYaEdxJ4dsjST+dBUkEL03G4rWNhbiOi09OiRjyGdeSOtapYXgcOeiy/ewZ5fhmtrSLwlixMWa6eBkePtd7LMmBfcSIB8qfiNA4OzyganK0MzWGp/xrbMdFh2tEusfDmCQ5tcX0ZMdECrxzqRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303961; c=relaxed/simple;
	bh=owz8DP30aBL4Cb+/NhxKmJiyIbN++4jRBJBchTV0SQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwWNPyRxCxPH2QyoYVs1CkyAirtvmTh4qlNbxl9aOM3Ev9kmi8du9W06AZVCuHzpjnRQfZIE+IwFTTUwvFQj5Izgc6eK4yoImjxmfNRUeaPqm/ACqwLI3+tLMKCul/WfqJUjIfdLAehmmT84CgU3E5tPCieSVQt3eFrAdrRlxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=N/Gvo6ce; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="N/Gvo6ce"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lga6kFdr3u+n9jlLKuJOINjzsumkmfm93NFpKPSgd9c=; b=N/Gvo6ceZw8btkaMJCTek7akSv
	plO7MojJVgzAQOYQo93lrI0fcdD4o8mC3pFuKk5pV/EDe0j8vTCF5Yimpobd+SoYvtBeY8PITABSz
	HH1d85LjWxue3EvwgVjKjmxrEESsY0xPGsG2MlpRMdcO0Pt/SnHM3Cn8t5PjXsj6bUOvPPgsoCnqT
	+8XaA5H3+XB3Y3X/74sOpL5CXljkD7DSJOiNN/LSB7MY7uU+Gz+XO/bmQPc19YxHGtXiKOJpFJNU0
	K8NjotymPLswtJb89acLB21atO1XZl/LMaWdG+Hfm2a4Dn/LrzsTP5N+zF8jmvURK1FcUY8b489MK
	iPQn5QWw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQp-0001s2-E7; Sat, 03 May 2025 22:25:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] clk: rockchip: rk3036: mark ddrphy as critical
Date: Sat,  3 May 2025 22:25:31 +0200
Message-ID: <20250503202532.992033-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ddrphy is supplied by the dpll, but due to the limited number of PLLs
on the rk3036, the dpll also is used for other periperhals, like the GPU.

So it happened, when the Lima driver turned off the gpu clock, this in
turn also disabled the dpll and thus the ram.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 41c71bb25171..df9330958c83 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -435,6 +435,7 @@ static const char *const rk3036_critical_clocks[] __initconst = {
 	"hclk_peri",
 	"pclk_peri",
 	"pclk_ddrupctl",
+	"ddrphy",
 };
 
 static void __init rk3036_clk_init(struct device_node *np)
-- 
2.47.2

