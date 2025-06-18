Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FF28640D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240779; cv=none; b=fljukHghH/sCOA++Q/dKyFuiIz4z3cv1SAYSd+j6icv8M+uwjEKPKL2Pnbc/oc4cDLpx5pUSest2FdaacEtKC1dqnQvTFn0NlNEhx+tBGUpNFQTXi4rHg5Az1lxy8RJsvXAk+jScDWa5T51COGdsV/PWEHEhL7fAqgtDrSrN7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240779; c=relaxed/simple;
	bh=2epr8ao5TAgZA57K71+fCAJlw3g10O4XWpdyeMJVQgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQOz0rGZgRZPxs6DhXboMkGFTg0Ak0QQ+UUFxBp1ma09E8DXISdVuXS2Vcw5LM9A0Nu6TIH101i2Zq+FMlj/NUpxJEoAk9SbuzmGjEFspe7qK2wCxLTIZZt0wd8gWM8awDKy2H27gdYWe2DWrpgwHOheoNvi8Vtrd7Ka0GI/5Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NMZY4BLO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NMZY4BLO"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FCC8111D;
	Wed, 18 Jun 2025 11:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240760;
	bh=2epr8ao5TAgZA57K71+fCAJlw3g10O4XWpdyeMJVQgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NMZY4BLOr6GDkKjrrVYFz1V4+/4HLXQy+SSfJ4E1Dggty75JUPmC9Zp8DxRDQGjpC
	 n2nLzWRA/iQzn1c0BElwzK8O3RaN2xt631nGRoSiHydf/bR9RGKDqPL0l5KYo8eDlq
	 sApgXdwuB+jsPrUpprahNIsYpAbq2leB52VW5FXM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:04 +0300
Subject: [PATCH v4 01/17] drm/bridge: cdns-dsi: Fix the _atomic_check()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-1-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SXe0VxRuPHAxO1Ko/oDsuelobFJsNH8ZVsNaLWN6Eow=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo38amO3S0OMdIxHt3vE1hoJ0QkvgnTqfHdwk
 mbxJ98ktTaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/AAKCRD6PaqMvJYe
 9YSxD/95pwOCPNQnxndxfh7yb0dGnav6xqwiy1eFN9I8tGO9J6IgitbhzE/obVA8Byr+3ZSlW91
 Rfs159+V0ToKFAkd4fU9dPDbfxoRg0ILCeV/VM0SERw3K8uTdyiyALhUnmhAlcJFlmPRGVsGZ3+
 Bz7DFfBk9R4sG8nxfphqd0qklsxjkbAMDzOUNwfscD+5kwUYzxYAWZr8mzd1gaj8BQvyxtFv4pb
 x03MYldbisGIKuK+EvGNqSILppqGwz7BCBELPAdKgwB+t3+ClqVzOAkiauvZPQ2Y1Wx/xqE7Y54
 OUM/wELqb1/g/DQA1DZltEHdu6EeExXJgMyiYLi3qL3XHPG8ITbVwNmLOw9RIsQS+e54988mG3q
 uOX408tXUa4NbbN0SyRzoKX7wmFaGCYUfIlf48D7zID5LGy4+TuqDjHeRAZqpZVO3UgCa0ommfo
 CQUfjYn1nKcg0VjF6PmOpEBI8QCUfsikU/jtTPq0IHFjcZ70S+MIUG2vw7061zz7A+D5Y5Lh7Ze
 GGSZ7tv/qpsSpK6uttDSRiByV6sgbE5TT5y5d4NQIyhPOTaH2VvbJV2d/vURUNGCg1rPq/ULKTE
 SlmqrccIQiLX5UVm3XZar+xn13TbAGjwRf+PBseJgihbwHmL3cbF2NkBdBVpx+06yuMqdLJleIp
 knbwmeevZzWbrEA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Use the "adjusted_mode" for the dsi configuration check, as that is the
more appropriate display_mode for validation, and later bridge enable.

Also, fix the mode_valid_check parameter from false to true, as the dsi
configuration check is taking place during the check-phase, and the
crtc_* mode values are not expected to be populated yet.

Fixes: a53d987756ea ("drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()")
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index a57ca8c3bdae..695b6246b280 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -997,10 +997,10 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
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

-- 
2.43.0

