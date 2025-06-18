Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF92E7167
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240800; cv=none; b=BUO3tkrETTznBbDGW9zzWGMzGsc4iXJYx75fLquRyIaSooOsscnfANLV8T9wojf3wRFO3abyLbKB6wXh1HOFzQvc258tI08/lpBlufLn2RnEPJQupnolmPJlx+wvCqNCYinK49NAlgJywFLmVycNs+2kzE3BN1H0PJZ/MwuugaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240800; c=relaxed/simple;
	bh=D4vM1OMrS8uj57MoLnQeoqPxyPPl1IzpjBbsE3qvLPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDW06eR6RBq5WohD0eDQdiuvsfa5WOAC3m2/0UJIK0HyAPiSxIuv/H6QrveCtcoAJEiZ3g4Jk1MeYv1L8y4Jd0lIVKhoxXEbbIQMfHx4d/AnqviAZ8B/D6l/MZkrIjNJ3ljVj9EmPICNqEGFCz4hkTl2U7Mrq4lyIOQvf4YyFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GUkJiqao; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GUkJiqao"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B209287A;
	Wed, 18 Jun 2025 11:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240776;
	bh=D4vM1OMrS8uj57MoLnQeoqPxyPPl1IzpjBbsE3qvLPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GUkJiqaoM4SqZtI0/SxILskdUda+DpphvEe4h60xpEhkw02MT249dTiQFFfNMh2dX
	 tXpx2ElxKV/siW6bNtyR0seApjL2nC2y+sB4HkqSx7TU79UatBJ3j8d4qU0r5EskMV
	 HIvNFCkO54s5mB8cS/muP8Yhzsx3fGMVLfqRRB6k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:16 +0300
Subject: [PATCH v4 13/17] drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-13-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=D4vM1OMrS8uj57MoLnQeoqPxyPPl1IzpjBbsE3qvLPY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo4Amxl12GShQLcu87uGxxbidqe6BNSsEvzlb
 HQMQwNHJXKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKOAAAKCRD6PaqMvJYe
 9f2vD/499q9kgi+Q5x4QmdQ0TLhbGtWJ/kBQy2Cfr9sOzttZQ6V7K6bLe0fzLT6kYUj0m/m9w5W
 7Rvq+CMpDOV7c/xOut4REupKm/minFMXS6hZF9Z9AiZZQyldAL9YfCEiqjB8bk5MSw1lfBiU3g2
 EONtgwYTRylfRbbZT/GZbLGR9x/vWmJEWWvRr7Nj2gc1Jt8HArEF4N0ozZ+7AGmbJtn2xRvjlRz
 I6OGVpbu7XCCJw4BKry9BMrC7Z9oG0PHwxVTOgJssq4h71Ti3Tszc+e7ac4+9+86ZuPBHPKe/an
 BIxHVu/kJayZR5GfGzZkg2GsAvFvuRdim5OkSpy1aC7uM4ZP6RpbedZp1ULzDgZriq1By4yaxur
 2RMqw4piSa7UN+APT3qHXHLE2BQit7/8S5NDrVI/65VjIb6MJPnwBZ/yR1EP0BgVQgq8YGyI3e2
 YL61cmKmvIRS00nJPPcvrSt0YwyeaMDKDO49rK6sakFmQSZwCv/hGSh4pixylnwAhdcGc8icecc
 69mYurakzecbnlGAHLTgRWg69F20kp9o3Pbjla1uiSgAuuKxeTAwQ5EvrIXs3IE2KKgg9R6fZMm
 uRYs/dSuzAM/1LjXIb0fGjkL+ht5j/2ojzwj7LkktgLOlzvybyKrIQdz9vsilyqtwe44HvYIdVB
 P7SVZ9UOjg8pE5w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver tries to calculate the value for REG_WAKEUP_TIME. However,
the calculation itself is not correct, and to add on it, the resulting
value is almost always larger than the field's size, so the actual
result is more or less random.

According to the docs, figuring out the value for REG_WAKEUP_TIME
requires HW characterization and there's no way to have a generic
algorithm to come up with the value. That doesn't help at all...

However, we know that the value must be smaller than the line time, and,
at least in my understanding, the proper value for it is quite small.
Testing shows that setting it to 1/10 of the line time seems to work
well. All video modes from my HDMI monitor work with this algorithm.

Hopefully we'll get more information on how to calculate the value, and
we can then update this.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index d49b4789a074..6bc0a0d00d69 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -793,7 +793,13 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
 					    phy_cfg->hs_clk_rate);
-	reg_wakeup = (phy_cfg->hs_prepare + phy_cfg->hs_zero) / tx_byte_period;
+
+	/*
+	 * Estimated time [in clock cycles] to perform LP->HS on D-PHY.
+	 * It is not clear how to calculate this, so for now,
+	 * set it to 1/10 of the total number of clocks in a line.
+	 */
+	reg_wakeup = dsi_cfg.htotal / nlanes / 10;
 	writel(REG_WAKEUP_TIME(reg_wakeup) | REG_LINE_DURATION(tmp),
 	       dsi->regs + VID_DPHY_TIME);
 

-- 
2.43.0

