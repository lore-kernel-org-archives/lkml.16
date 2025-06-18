Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB328CF7A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240787; cv=none; b=acaixAbl2RZE20dQZ4C2BQ/xM40UYLkoPl1AFulx5/npIb+65xKdMl4+sUupx2WKjFsa9q7oe+2HEWqEccm2NHbGP9Bu8vqgYiSaBI2ddVUXcIknqQ8yNySgogwPl+Hx7Z8UMNAZTjLUlnoL1mV4yboH6H2KM/LpVPms9sIEioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240787; c=relaxed/simple;
	bh=SdsFxcP7kgRnccaBenP8n2NR26UZV0KXLNKJ22UARi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZoPZudl4Sql2WcDqr2wwCZOOEh863odPr9Z0MM2CFjBvZ6ghNRF0Uc96oWuplhPcPTFMbdeSFLe5RWd8qnpSbK2GIqHtVshneTs3dsTCKcv+gGaLD3raRWx7pphwbghdXjXDZea6FoSokdSlhVGVwTszD15K807A7AI6EaCULA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YVsmBqoP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YVsmBqoP"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79BFA156F;
	Wed, 18 Jun 2025 11:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240764;
	bh=SdsFxcP7kgRnccaBenP8n2NR26UZV0KXLNKJ22UARi0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YVsmBqoPGA3QhrXuNpkcqjwiWH1rnIWZUoKC8Bq73lg8IGWPM0mFkcD++pPczLSWn
	 /b2gLDhLOu11yEnLLSDZOG9+IfLudpAxLjZZOJ5CK6ypaXwh8eAJOwF2X034s6J5rW
	 oEhqmdZSPa812uHI43L0P9xJ1AQWPzqu7+395cts=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:07 +0300
Subject: [PATCH v4 04/17] phy: cdns-dphy: Store hs_clk_rate and return it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SdsFxcP7kgRnccaBenP8n2NR26UZV0KXLNKJ22UARi0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo39r9sodyAJ2tcO/X69aOfndhCXQftZPghxE
 Hmwz/4yT/qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/QAKCRD6PaqMvJYe
 9XrCD/9a3slbZN2powiZp5L/w9sEKj/2HZcjA2+hVNNc0EKvkmPweq7VVf7hKsLSBbcRDcK08q5
 Dkqb6QRx93vi+9qkPSTFHveZmMWswfJkFN4lWSyNS+h1UeuNpFovZBQL2EozuDYEmFRsdTg/eqI
 dIM/Xegbc6M5kcENYqQSGQrEfzamkDdsOYp59hUqgHe6TXzi4jgMvtpWk9q8y1fMBDLm/jnKFXa
 H54kvMYKjH1zyBQF6oOJBrBsdBky3HgqXzzfSi7FW7FJNOItnDHZ368viXhNr4x/Vp5cI6BQY4z
 1m1wFcdkIAk/6uZRynKGX+ncUJ+2829f1yrZrgREcwm+j3gfOkInMwCi7qj9TwIJFMRCDmqJyh7
 KfRiEGSIMxg3QwAuw17/tFryeqH3htPTFQ9nDzuLVt9VznH0J6X4DvFqvLYU6QSTrOe0QWdMk3r
 PO7IbEP3KbO2k4D+zo/jeLjMD5tE/cWyhgrCyv049NQ/NKf+RT0uRY9s+o8FTta2aYOIg1LOhMi
 N2crEp63tVBSlSH9zpvzutnzelhKSWyKWem4d5v9RlwUBe88/CItMxDys823sJsD7GzaeX9njl9
 /MO/X30FJaPvbeFLBqnRTsXDpudHRjrdrvEGOhnJpn1y+F7oRXWzvLJLnRw1TYvsrrRSTefliyN
 a6aSda0/qL5KuJQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The DPHY driver does not return the actual hs_clk_rate, so the DSI
driver has no idea what clock was actually achieved. Set the realized
hs_clk_rate to the opts struct, so that the DSI driver gets it back.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
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

