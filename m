Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33432BE7C5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629150; cv=none; b=FynTF4xcoIwIwEgBHpf/h+FmPTJ70oK+dM3pu8IDhWq0asGS3I6KcBZHfL7K+b0XlxuofrW5HC4XkYSZluAnBAnJ72jqj/j0JcowE0MqYN5Jv0AZNnsRiAS4N3gBU8w2Pnehma4XsfR1FyhPKQGVsiFikW9NU1IwaoyvJOyuiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629150; c=relaxed/simple;
	bh=Pnx7suxbYin9pheGwTqEDVuMtWI0UCAstJMoqNVTugc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S196obMrFZONU5npPl2OXNC/Dn/g/DMvGLc4+Nh/vsesWmcZZ7pMPNPc4b+L41ZzUMb7WfWUD9n71QeUIJQelvyg900/0Gg3ozevGUhOIq2ddpYVtDxFs0+x6kRQ4EakQO1TSfKEIQ8hwU6dcByLeh8/YLcMsqlJ/VzOQqHxUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Segwhtz3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Segwhtz3"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F7612194;
	Mon, 14 Apr 2025 13:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629013;
	bh=Pnx7suxbYin9pheGwTqEDVuMtWI0UCAstJMoqNVTugc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Segwhtz3WFAJRU0HHZBjoFCnzkKTnrPVNIHS8q1K4et1PM2V7o+nA1lYINd9HyLXN
	 hL6rPrNqisQryCHGLUwcSNsiY8YuGQeFZF0lEBdC68rFRx3S+fIfXuL40WBhitmuzs
	 8+bhVGueylckxd2HZUtF97+k2wXLovTq379Oaoa4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:18 +0300
Subject: [PATCH v3 09/17] drm/bridge: cdns-dsi: Drop checks that shouldn't
 be in .mode_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-9-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Pnx7suxbYin9pheGwTqEDVuMtWI0UCAstJMoqNVTugc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O1/NI5zR4Bh4wsNG8XTmFGv8lXZJ18oVWybO
 ju5ZATbU0iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfwAKCRD6PaqMvJYe
 9Yz7D/9cvEI3imLmKbEfVAl1FKGhg9b2PNfDmVqTtFlN2G22vnApzejVU80DyNm2px1zm/ZJBF4
 00D0yfkku6uAS75wOGAfgcYPoomKH6dPf/WN+jcXW3UkiBNTw/FA+doY01ZqqmQtiwaUuU7pV1R
 klqpzs4vTyjLv+m5/Af1SfiHfU12E91tWE9KA9/HxcYqMpdRETYCXYuqjEQkTyCjcKEQwfgtlFY
 J0bZ6OIR54Yw/5LFphV0yUvZG+EJ8Rd5z68OqnZn/QzjdWrYl4ZWTVflBoVy8xNkMmmc8BovYst
 uvxAf5m76p7krLxI4IHkKMDUeyk1gGDG7Kf/UAJFDXKW8HZzTQ6ADo3eeOfV2PFR3fB/Zwodc8q
 2PEXvJMh0QBGxbb7XWBNLjPa13Kz+0Duta1nd9Zk2MhU3Kwp5MHmV8dSRbBmCXAzmsmM3CUWPXi
 NVu+dw0mpt1nSYFfmni4awaFabz2da6N3yIO7IwZoYvFsewjyUjtwMLmvxvkwJht1yBbsgOqm03
 kFhJ+8ehNlLB/DuZE4jzwoGUomB7vEo0aPZaluh/jxetF4J1f3GfzFLJUbulmlQrNMVherf8eL5
 wdenyFRBir1aqHDycX8l1fgM20RT9OIJoAyJVRDea+GHH7pCsOkfuVP9B6A7VOQoS9CPSRupoaq
 4Db4sDFY0HqL5kg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The docs say about mode_valid():

"it is not allowed to look at anything else but the passed-in mode, and
validate it against configuration-invariant hardware constraints"

We're doing a lot more than just looking at the mode. The main issue
here is that we're doing checks based on the pixel clock, before we know
what the pixel clock from the crtc actually is.

So, drop the cdns_dsi_check_conf() call from .mode_valid().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index bb8ac7161abf..4759fd6f79b0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -602,8 +602,7 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
-	struct cdns_dsi_cfg dsi_cfg;
-	int bpp, ret;
+	int bpp;
 
 	/*
 	 * VFP_DSI should be less than VFP_DPI and VFP_DSI should be at
@@ -621,10 +620,6 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if ((mode->hdisplay * bpp) % 32)
 		return MODE_H_ILLEGAL;
 
-	ret = cdns_dsi_check_conf(dsi, mode, &dsi_cfg);
-	if (ret)
-		return MODE_BAD;
-
 	return MODE_OK;
 }
 

-- 
2.43.0

