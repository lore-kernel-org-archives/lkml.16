Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24523817C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600681; cv=none; b=SfOhyYnu9cIS7QHs/V1D7Hqueeqzs4YrAORCv25sfBAKo6wlubrJBRuWS8jTlglbl8ec7BhmfAsjJdaJNZ/AYxby89jsH9t31DaHDVjMgFeZpCEZIuMQkwwsLV2KwK4KPdfEqMfjddKu1fdyZPm62a5K49o43ha/Crlxt069kNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600681; c=relaxed/simple;
	bh=tWpzu7ba133Zdaj4dIf8mfTY5P/FzEw3AwQGlLkB6nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkNBxxxJ3evrSJEgI6ooJjk6yt4g5DwDhR2AsErT5G7Qvg7k1+HqVMApJK/pnEblg0SRlD2bjcf2jufAJ/LrHbdXbvVpEGoKi+AxdbyvHP65ToYYxEoFxUf8W08slKqWdLQoOQw2SCBuZY3GQhgpr89O2TR0D3f8sqvWGIgmyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XiTaeGGQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XiTaeGGQ"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E74956A2;
	Wed,  2 Apr 2025 15:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743600563;
	bh=tWpzu7ba133Zdaj4dIf8mfTY5P/FzEw3AwQGlLkB6nY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XiTaeGGQDZcc5mC4YZUP28aG6WrYTqwJQctuaS29IqWasCY46ayi9aMnTvOV2+0Dp
	 7fgHvJty0omJ9Bh/B/U+pTGpHyUu2ldvTRDegglbK6fsqJU1lBXWLEu53CmakAo8Ez
	 F+BKSFgd1LhMBrUybOl3GlRzHbnQveR5lUTMs9zE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:43 +0300
Subject: [PATCH v2 01/18] drm/tidss: Fix missing includes and struct decls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-1-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tWpzu7ba133Zdaj4dIf8mfTY5P/FzEw3AwQGlLkB6nY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twb1rv8WsaK7ZyMNRHo2SCza155wW0BQGFDR
 NuG01wNSSSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08GwAKCRD6PaqMvJYe
 9ZZSD/49WAxaJgfcNgLcwg7nvNWgDMBwl6GFx8D71IkdeY1FtzSCQzO0LoB9ZeM9+Y+aPy9f9T9
 DqhcnPQ7o/u4tq67PcIq4OIVOklnk5O0Z2SDVMNryax3kQboN4gvnlUFAaMPSHSFzE3vY9pw2m3
 bwVFI+eLtAntLqXcsXBm1uFy5LlptAFXbaknwYA6Uvkw6/GBkOgJF4E9WqIMPvtXmOJDse1lYgh
 oIOBPDA1ZyVbQ+i3mSH3PDAi9PXz/Emza4558knGsHsMizm4dfqD/oTuWIqDAikqEdyQ2ZQYEdk
 IjDah/sv1spVbVDqJiLbcgE+0SMW263mwf4AFwyLvmRkLP6AhpUcgs9WUA2iZxpBxTbbHKB1VIR
 l0O9mMR1nSWTo9yMRjp7HkgyrINyVN/FYbnCUBwMRKmR9O18a63yjhaMyG9StPtVPRrtouYxf7A
 F0dd/L06h6dfIrsecf9CV2zgezxbcmGXWjFDUOpANUM+Rmsffmr/JmKCw9oVjdtpuLWEsdZuIoi
 IGYR5UCtUABr//fBgpalui7Bg9vmxND+t6TgKl5e/vis7yEOk3X4LPpTiVt8BCvzS3zUWPN5GgM
 8UsMXNWazahMmRyhzBBBtMut6+QhJqZchWn+kGEVwfExjBemikxlF7Re4nAiJqW9kKrELflJVi7
 H70T3CRi185GwZw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix missing includes and struct declarations. Even if these don't cause
any compile issues at the moment, it's good to have them correct.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.h       | 3 +++
 drivers/gpu/drm/tidss/tidss_drv.h         | 2 ++
 drivers/gpu/drm/tidss/tidss_plane.h       | 2 ++
 drivers/gpu/drm/tidss/tidss_scale_coefs.h | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 086327d51a90..c31b477a18b0 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -7,11 +7,14 @@
 #ifndef __TIDSS_DISPC_H__
 #define __TIDSS_DISPC_H__
 
+#include <drm/drm_color_mgmt.h>
+
 #include "tidss_drv.h"
 
 struct dispc_device;
 
 struct drm_crtc_state;
+struct drm_plane_state;
 
 enum tidss_gamma_type { TIDSS_GAMMA_8BIT, TIDSS_GAMMA_10BIT };
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 7f4f4282bc04..56a2020e20d0 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -9,6 +9,8 @@
 
 #include <linux/spinlock.h>
 
+#include <drm/drm_device.h>
+
 #define TIDSS_MAX_PORTS 4
 #define TIDSS_MAX_PLANES 4
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.h b/drivers/gpu/drm/tidss/tidss_plane.h
index aecaf2728406..92c560c3a621 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.h
+++ b/drivers/gpu/drm/tidss/tidss_plane.h
@@ -7,6 +7,8 @@
 #ifndef __TIDSS_PLANE_H__
 #define __TIDSS_PLANE_H__
 
+#include <drm/drm_plane.h>
+
 #define to_tidss_plane(p) container_of((p), struct tidss_plane, plane)
 
 struct tidss_device;
diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.h b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
index 9c560d0fdac0..9824d02d9d1f 100644
--- a/drivers/gpu/drm/tidss/tidss_scale_coefs.h
+++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
@@ -9,6 +9,8 @@
 
 #include <linux/types.h>
 
+struct device;
+
 struct tidss_scale_coefs {
 	s16 c2[16];
 	s16 c1[16];

-- 
2.43.0

