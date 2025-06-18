Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FA2DE215
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240793; cv=none; b=MOSIYxDh3MBn37h4NG1x+rwf4flPXYNaDzx5PxFDZt25gogrg6QEH7kiAMaGSlvr6hTYIdUqmSQIMO8kg/IU888DsDDaOhhwi5cJorPQcvYfGCyWNU9xe5L3K3ujsGD9Hn4aQiptj1NDhWOVYlh4U08rr+/yQAiy8UdEa4ix8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240793; c=relaxed/simple;
	bh=k9MwYoc1zOwO3F/NDWi15b97VWDuRARPG5PckYENJ90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RpLyJTRRzhGOLhRFfd7YfhEyO5OO6FReRShdGT+Kc/GpUGXcAdp2ycIKxJC9uQxvjSyhfTfIRJ48u1qbJn2V3TgGxSSnYKs50FPgDjazgZ8TpOGQKxz1TTWeo9j60s7BYpr8P4TxalRWmXD/j4rlehJBNgsp53J4a7HiFo8tFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FdyO0djb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FdyO0djb"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCDDC5254;
	Wed, 18 Jun 2025 11:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240771;
	bh=k9MwYoc1zOwO3F/NDWi15b97VWDuRARPG5PckYENJ90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FdyO0djbuQFtdmZJ0G89bwh3E0Ym6ZCAuv3bVyuWA0SDCLeQp/zTrCMdq0yXoeNUv
	 ZYwNMMc3nl2hX5lwHWQzUMauTw0vu+JAnIymxAKqOzrpZLT0GB9ZV4FC9N+YaeGeAr
	 cWMaMAFl8USq7GuhOdfz52px7X6DZSssrLGJQBY8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:12 +0300
Subject: [PATCH v4 09/17] drm/bridge: cdns-dsi: Drop checks that shouldn't
 be in .mode_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-9-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=k9MwYoc1zOwO3F/NDWi15b97VWDuRARPG5PckYENJ90=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo3/RBQ6cJvoLv5Vc8R66K8shy6mBvMy4mrKQ
 rwEpxU6I9iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/wAKCRD6PaqMvJYe
 9Rg3D/sE98W4rwobQCN8OYphUfVKya9wQtI+BpJwNCJV+05doVEOPyxvb920HjO5wrj5O9iBWyi
 MIUqfk9eXZsg7e6edGJZCejFLOdfIQ1GqWKqhwAUcS0adfUaeHzFawyhQ5F5qv385XeiYmFUH4W
 qiOtVKAUldHhghNjyHSSl37DSGaO+F5kjZ66pWz7VoYq1Fv1uJRBZk2cK7OypRHiLE+MbEIezQW
 vTig7Z/we3q3FsZSu/vcCV6txe7KynWlS3c+jfUdLyHdMR3vFIRYgrnbZK5oFBGk5Ccu07HYNSR
 8ULDw78RUYtTnc2ViyUl5NInq9O7LKDHE8pBg5Mk440+2IwI+Qyzb5DSvVCo0YqYUfBgTUSoeFC
 3l3iqvRnBvkpDJZ73JM2B8iqu6iHHo6naKmyLYI5+YX40ecQ9/qZwdmTU+J485NOWpSXH3w3Ibb
 o59B3WVm7qa/Bdjk/ys5O2tegAUNEvJqrpZzp/b/p1dwO//hiIVEkaUWHFYvvHZYqQoaMX9SFli
 Gp56rlZZbvyY7adrzOKd1xutPBERpxW3uIaLew6ZKds+xnIt6QsD3aF0iVr6RyIvQ6r+Im4BMYz
 aI7KCV8CObrzqa9EFxKDRr7DMqG9WyGAaKXoUwDfVghmzaaXUwmNrJwGflT6QjWlvdPwcO2Uprc
 c8S9BCPfHX825Ew==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The docs say about mode_valid():

"it is not allowed to look at anything else but the passed-in mode, and
validate it against configuration-invariant hardware constraints"

We're doing a lot more than just looking at the mode. The main issue
here is that we're doing checks based on the pixel clock, before we know
what the pixel clock from the crtc actually is.

So, drop the cdns_dsi_check_conf() call from .mode_valid().

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 000c5a2367fe..b2b6529b1c70 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -603,8 +603,7 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
-	struct cdns_dsi_cfg dsi_cfg;
-	int bpp, ret;
+	int bpp;
 
 	/*
 	 * VFP_DSI should be less than VFP_DPI and VFP_DSI should be at
@@ -622,10 +621,6 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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

