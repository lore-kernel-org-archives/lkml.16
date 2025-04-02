Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D023C8AE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600689; cv=none; b=t466JSNyd7s3CsfCnYF2gRKMRSk1oa+TlzYcRMrU5vjpng6uXue6dck64tH3d3t9n+umxwb2Q5w2uGM9abe5hBH4O5xhK/onkabAUOkL7gJDDF29eiVVd1Yxvf3PFWu9X5a3hWEE4Hu7pnvO/XfphpXooR5Vfq4Hyeo9rPhceos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600689; c=relaxed/simple;
	bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4UDfipUv9/n3LHvrxH/c6Jxsm1UZExpmdA2SwK3jKZyfD1Wx8X/2sN2SA59v17fWBSWEFgTN7nptmk1j57WKfFsg+wjMZx4LvbXFmg/426xqP7Js/agpPZ8UIereJMdg7fuVZ3ZmFYOQkybNJCTLTdFXCe5jwsJMCotvVt9a8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NQHUAfPc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NQHUAfPc"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7C9119C9;
	Wed,  2 Apr 2025 15:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600569;
	bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NQHUAfPcH1rwhxyByEIFVaRgsdUCfq2XYKbi/yXKQkeOS0Pi1n1l7ioh7sUYpGwPK
	 SswKu8gTOL3mgBzpherhLplNBdr5rAzyX1mPg/NXxrOlkOZien3VL/HPfVbop9jAUv
	 imPdp1wS9kvmpXgSEJjj7ZsckJp9ahlz2heCcQ7E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:48 +0300
Subject: [PATCH v2 06/18] drm/bridge: cdns-dsi: Adjust mode to negative
 syncs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-6-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twdw/WedZDgLhiIic9z7RcO+p8ir4C1KqJPF
 U0d60QXZ7yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HQAKCRD6PaqMvJYe
 9aaoEACIPT3NJO+z+ih6nFSRkIVA5j6s8OwEPZYFfv3GG651PEeRrOCmHTCuXOwCMc8ZuZFVRzH
 9j1KMTGQ9ZkccMBOo33ZjUz0TWeT18peERi4/4/O1kTJZPLtYRTZ7FUionkIgNCqrCbRqJCMABn
 UH4BDCRaVEg1FdHDVnDfaQmY/ORhppJE5ICsTni6q4FEc9ZCDMRuzM+NWJkW846ptRw1FTOjtne
 09NjoKB3JrllIxRhdlLzrdft/Fh8HN1wZNm5Mehs01dk0Z9aKtFfBNS0sMM9IMvv9H+5GKc2+YU
 6KvkIMFa8njKqmqHzssSsArx5qPTn/AENQjJ3mIAbStlSIicaWlo6AQy44YP0dbQWkHHfRdXS+G
 Cg41EhJVTLpq6d+vFfaUnpY0JuYETBVwfBIZwC+8Po6ceD05ww7LVvquJ3cWP0kP8GVnmRoCPVN
 MZNkeU0n83KTC4t1ksALYouwmfMGIr4GxUvVLvr5M8kGIvDeJSzceXrpfJIPED2+wZARPjbsDJB
 BiEuDgxa1CO2fpS60IDu5q5tA2MOyBvxs9F46Mz+df2EnRUZDaxmZd4eydcMiEUzbkNBEiL8U3N
 tHDYnKvb4zhmi02j024+tj5DW+KVEwtV0pzmbCuEMKR/cLwgYoJQvIRiOXhc7IajPjgsFoNMPeT
 3CFUlpTJi/8jUAA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The Cadence DSI requires negative syncs from the incoming video signal,
but at the moment that requirement is not expressed in any way. If the
crtc decides to use positive syncs, things break down.

Use the adjusted_mode in atomic_check to set the sync flags to negative
ones.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 8a320bd4d34d..53322407c1b0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -992,6 +992,11 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
+	struct drm_display_mode *adjusted_crtc_mode = &crtc_state->adjusted_mode;
+
+	/* cdns-dsi requires negative syncs */
+	adjusted_crtc_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_crtc_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
 	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
 }

-- 
2.43.0

