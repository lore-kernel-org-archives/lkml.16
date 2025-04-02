Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4787237700
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600686; cv=none; b=lo57bNnkeL+3P83YbBl5HKF9HpRpFRQ5RiUY+kSsP8bcusBJdaxo5tIMC8KZc1liMFpt2dOAmvceKMmVlLY1+WK2iH0QH7cSuDLayXWjptz7Ubdz+aja7KM/XGeZtYbNeEjzYBtA8iv7o3HhPM13hZXh4IE8pJl/hY2onwYlfJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600686; c=relaxed/simple;
	bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzYyKQDrswsbPPuNUD/EHd46AiFcrB21bgbCAwh5H0NQ/xNh5n+b2wMBtl8iS16Y10j59w/0+3/tiLXgoA4pyUObZ7ofd+EuCCvCs1/bxdBJMv5xt09l0RhwVlC6cYDs7wjkbVgeJSgeOVsszbgna30QOdvlDVqoo+RbKkJ1DX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iHMAvUFZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iHMAvUFZ"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62FF71986;
	Wed,  2 Apr 2025 15:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600567;
	bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iHMAvUFZ0oSZaOR2bJctKAa9uKxqxZ1uwIFG+fgt5ReEow5ommMK0fE7hXUtlMVHP
	 LYg4CJOs+qmplVfNkcrrvIm5kSC4X9Ctgy/7LmY7shiVHpIRsYSRzKm1vHRg2p7+WX
	 1Hf+o9yBxVAqV7dcQwiZpakjC1ZGJsqvH4fXSda0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:46 +0300
Subject: [PATCH v2 04/18] phy: cdns-dphy: Store hs_clk_rate and return it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-4-4a093eaa5e27@ideasonboard.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
In-Reply-To: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0rz+qtGwR8012ibx7Ol/9THyUm6cLrG8rh2vtI7MsMc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7TwcaZeTlUBNgRJH+o0UqxKZ47XGEk5nI4+fx
 rlZ/xHDxHSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HAAKCRD6PaqMvJYe
 9fwTD/4xUL4hkpewbyumBl2OhN2ZsCukOxQqMp6sDpBhQla+6MmBo5TwSfiDKA5PxrVTVCoRRHl
 Tz13fTTolMEQB8iy4zjXiMJ7YoVFe0yzM73tnnh4Ay5RfGd4JvM96cx8prHIdyRuzQG/ANWjaS7
 XVq12EuPuOpuzzWHdwSh10BVmxzShAOJINdAHPCvl0e7OXkUE9tesiZEmqgIfQwWqGdV7ZiGtHx
 8goeYf3sVYdKDcEQSfAZZDXXmRjEFFHZ6mlbjxoUpR/HoKEumNUAIYU/mL1nqmWOFOrC89g3/eG
 hJq8F2FIdZQEaWxRYqO5KlzYXLq1qPWiKfK0stc7BYHPl83I9oqk8uzWaVqYiZmNidVr21Q/wXz
 ec3sOipiMf5xS4j16tOu47LJ6W1WupZ9FGqd/C6ocDn9KE00TdJOWesU326VPcUn7lRAsv+yDGY
 WSxKkXX3n2FKpiQB70ejX1wcD3/OqmVeJOK9J7wSdPNZPXX7dGyyiM6GcsfYkCd4J35IPa83G3z
 +whWZc3fkm6jHWRYIMvW4FSRXRHpdRdFXoiKqk1UAKdCqdRvfpZJWkruEqfjTqjMknMErxQ8rfC
 PCANjw3lqM0A5neDAwc0TdSUqxnGRQXn7tfmKPVNcOFjDjekJfeSMhRTsMk/h2yUUoPpArXnMBJ
 0LZmxjAyRkrlGKg==
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

