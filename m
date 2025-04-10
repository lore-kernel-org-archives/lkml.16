Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95F2857C6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292822; cv=none; b=nYsCzpQUOjF4EaXkqs0xbvgdZzUihTBoOPzrSfCqkMLYYPRwMPXbhf4xdkXk5JFv+lBDfUm7dd4l1HD1ZvtJ7Iv6Y0lWgna/7zlaz+ufc5ygGRG/k6aEBNLt1FC6ticH7mR4an+0eNCblZmocwtQdlzd7UHX8k91G8hvwsRJnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292822; c=relaxed/simple;
	bh=VXM3Bp81TeEOJMxbuPZArd6QtcZLtq2N2qBUJQd7HSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YgZvzmMAqVu9oR5ORTf5PpO6ICSnUL0ai0XzYkBD/FNcbPXifeU+Zz043GDG6MPcvH26If3VqK2NUJmA9c4IBHArvwAGEArh4I9AK7rxiC30Ova+4xSShq5j47TDIA7PAlw8beJo6xz+BhRdfpv1GIUdMR+NyET4sfsoOMcVUds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MuJzTWES; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MuJzTWES"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744292815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9sV6wlfSmOh5YEp7VbnkVuFrtxB09pKQGnH8Qxs4uvg=;
	b=MuJzTWESEnuSB8kpGsHa4VdOoCykSX/G14hg93u1BC7GeUoEmikdDwGzNK+fpyK6hbkDqO
	A3H4IWStD9oQixIuuVNCuIZFZtQLfIw3H5c2bGk0Wc+prb/PiLdXr/qw9ZtAgspLJQOAFW
	o+/C84aliusmeiRC78ZHFAjxkqVhhaU=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH] drm/bridge: cdns-dsi: Fix the _atomic_check()
Date: Thu, 10 Apr 2025 19:16:46 +0530
Message-Id: <20250410134646.96811-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use the "adjusted_mode" for the dsi configuration check, as that is the
more appropriate display_mode for validation, and later bridge enable.

Also, fix the mode_valid_check parameter from false to true, as the dsi
configuration check is taking place during the check-phase, and the
crtc_* mode values are not expected to be populated yet.

Fixes: a53d987756ea ("drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()")
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index b022dd6e6b6e..1c3fefce5fd2 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -989,10 +989,10 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
-	const struct drm_display_mode *mode = &crtc_state->mode;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
 
-	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
+	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg, true);
 }
 
 static struct drm_bridge_state *

base-commit: 0ac7ad5e352dcf18a4d42a4671f7cda69847712b
-- 
2.34.1

