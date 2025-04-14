Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DBB29B215
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629143; cv=none; b=n3czT74bLxSOTgiQGj2/hVR/eliqDNbxQpGzhZODLJKmfUYa7LhiKyUcRRpMS5c8udcKQzKVq0QlOXCD6FvHBQAoxKGekkIDsMqAvB3ne5NGsT0+2rvRYMxHueTRZlTl5vmAfqmMdD+yy7sGf/c7ZjmMPhb9RrCZXPpTpNO2tAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629143; c=relaxed/simple;
	bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SS13CiqHr1t1iw+aN5EfaEtbFFdyWsgti+tOAH60lEx1FPLONwpuwRZnazOd5MAMwV7Esk6VAaqasvz83K3nHD3uIvc44esFB4yIeDCrFuwUGn1wKV+z3u67/Ys6p17zwRDEWHsUQdaxXECLS6p7GvopQ50mcLCmNDK57q8bA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F90HVGaE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F90HVGaE"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DAE714C6;
	Mon, 14 Apr 2025 13:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629007;
	bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F90HVGaEHXcVXQRlikSZOeq7nwTdxWgLR/O4ZCJ/sMd9RPYwtr+y16vk5hguc5RG6
	 ZabqFXdTYkxEUjoNsrIBzi1A42TECpA6ci1B7s0jFzikYPu0bFYpOhbLvyTEnJ0QdE
	 r1RTUt3/E2wro+VPNkM0nJRHSOykrs8npHfRZ0eY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:13 +0300
Subject: [PATCH v3 04/17] phy: cdns-dphy: Store hs_clk_rate and return it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-4-4e52551d4f07@ideasonboard.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
In-Reply-To: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O19WJKrDQFr1DAKHlKplUTsadmGLQhQQvcKW
 3x6+N/hII6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfQAKCRD6PaqMvJYe
 9c46D/9NFtvR0pSbvbEr3POjEwVF8VIo4YTvY9yeNi7QVERsbNO4LX8+wumnIOM6ZNS19JrLKgA
 HzJoND7mcdrBMuaQcPZbXTtd0y/jRhHZ2AFHD6Z6pRHA1+xyeOMj0KPJduROOWr296YFh++gXf8
 eVyfECyk1eH8gj5IIh6Kq9gRiZL+C/n6cDH8y8AGq1F0D103cSSb/tqXVR8SOFqfu3YxOFnEyly
 TPmd7awGgG6yL1bupzFQdgUA6v4fcJoUYXfm1/UtC6uts2BRVribCDI2xgGTVPqYm0twhp0TxPg
 8XJYYSyR7MPNsywfIBywl5dr5TzuulaNjwXMd3yFXS9ItSW0E5Nuaczmpnu4qOFUVfnvTZs3uZx
 xeA0OtsWnOnvFMU8l4jCUCfjQIwFow8HBH4CUkaEfe4bUPocc/JZr1oCVJylPgastaVIOUlLVgG
 ZVFbK1kqf+HiCTmpqN/MDqZQkipBZtO9C5r6SmphPwtnBlDWCtAvzDRI3zhyLpB504z6peiXW0D
 epkaULqBWDowlMJEiMFPA4Mspv/Zh3mX3Arse0ijIFhuzP8VKUt4FpRVNq9v5TUaYSbcAPKwl18
 lY0eU+a2KedupqNNjMoBubaBPVhN7lWVdYW69hzd3vpbhiWBSdiN5dmQBtMb0zGPLOdIb7G6UGo
 Mb0wlAvFKtMJ9pQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The DPHY driver does not return the actual hs_clk_rate, so the DSI
driver has no idea what clock was actually achieved. Set the realized
hs_clk_rate to the opts struct, so that the DSI driver gets it back.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/phy/cadence/cdns-dphy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index ed87a3970f83..f79ec4fab409 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -79,6 +79,7 @@ struct cdns_dphy_cfg {
 	u8 pll_ipdiv;
 	u8 pll_opdiv;
 	u16 pll_fbdiv;
+	u32 hs_clk_rate;
 	unsigned int nlanes;
 };
 
@@ -154,6 +155,9 @@ static int cdns_dsi_get_dphy_pll_cfg(struct cdns_dphy *dphy,
 					  cfg->pll_ipdiv,
 					  pll_ref_hz);
 
+	cfg->hs_clk_rate = div_u64((u64)pll_ref_hz * cfg->pll_fbdiv,
+				   2 * cfg->pll_opdiv * cfg->pll_ipdiv);
+
 	return 0;
 }
 
@@ -297,6 +301,7 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
 	if (ret)
 		return ret;
 
+	opts->hs_clk_rate = cfg->hs_clk_rate;
 	opts->wakeup = cdns_dphy_get_wakeup_time_ns(dphy) / 1000;
 
 	return 0;

-- 
2.43.0

