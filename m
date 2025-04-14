Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE30293479
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629136; cv=none; b=WIBOtYsU+mdoFSeizEUNcDcWflMeEBmPEgKzF2/qFaDRee0OlxPfx/eP+9CMusrsse7MuY+PrfaPhOBFDVXBrEbiCtr2Z52OWNDJlZ9GaYS3bAOsJMyydd/mz/b6FG37IQJ7eKAnkZo6OtwcpvK3HpIY+Sk1q+nbErQ2cyJAOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629136; c=relaxed/simple;
	bh=Dupe7V99g6BivBbibfTkx5/konvjoim8qu4oyF93KbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nO4/R8BfB2vdgDUJC2PRa0fqtwk31O2SrjdQ2zHhTvrGDGvXj7YbyQ0rJaxOL1xU8rKv+Hd/CQvgcr207mOz/+WhEcVCBXfg7lHpz0ZNz/87Yu4S7v33a4yimm1e7kLZB3KIqvH09rmF0lLYEHmsCKBwYHEzkN8LTflfWVCX0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dbodVe5N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dbodVe5N"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E830C6A6;
	Mon, 14 Apr 2025 13:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744629004;
	bh=Dupe7V99g6BivBbibfTkx5/konvjoim8qu4oyF93KbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dbodVe5NJhlYDqlhjc27cW2N7L+FspD/tCA8qp3/Zh/4i7F9Xm7lj7h6RbaLDtMSa
	 sa90D2VQ7rphDnzPtWNEGGMl7iqBdSCSgzm5BydyW4e+f/whsD7hHso+gc7Fgh8vvx
	 LexkvvpX4dC3I4JjSHwUJeF1SLk2v1LC8Z/ec53I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:10 +0300
Subject: [PATCH v3 01/17] drm/tidss: Fix missing includes and struct decls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-1-4e52551d4f07@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Dupe7V99g6BivBbibfTkx5/konvjoim8qu4oyF93KbI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O18CpvPg0gWEY/bDJl3Aw5TruSylz56Geq4b
 9U/cuklb/yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfAAKCRD6PaqMvJYe
 9a7QD/wMc3YRRq9NmO1AZ6YotLhhbS4D6NvPuv+tJa+8GhbUbe8xuEWkOtiwr0ag9V3i17EB0xt
 j3KtRMQ3i1NLq/PmLYXSrOxy4Xl8dnpJGBUNnTDm/8280QpRjM+m3nAXrxk5HKjlDN9AY0KXXwP
 VfwBC67KrL46xPBamPs27cO0ss2WZRmoXXsjYdycEE1PfK7WiJWPP+hQ7RezLfPHq4euLIHISKY
 MQXCew/Og7bO2jfD9L9YPmY4S937D3A1NvBGIwEeV7utHbzOYmCO3XiDPWwTbXukFbIR2nYXZQO
 q6y1XrJ05cpoOfMx4WtRRFL8tXguEdcmEEQ6unjcKG6cTVUeu3soSZ800ZFVsxOVu4ZfQrfNZ6U
 bzEZuRg3Lds7jFi41DKqhQ7ilYUZlIq4zHL4Hj/i3pZJXSuJOYcBkuoVVVW0+todFNOYF4TW+iq
 4bgYtHrJxJ8+PpJ9l0sfZVs1gXoWjATENSM6u2OgRnMc/jY7uRjhQi+1ea3N8R7NbQ+zpS/4G3k
 UvVYLayRFleiVhAFaBD3NdejC39U9Nm16H2qm4Pi6bhIa2kaNY+LcEduKLqZMpjEZ6XB/LoLdIl
 EntXriHdlIlvFQQoC2DSnosq9a9xwWK5xUWZyN+2MDluCnHNUDjzvUqXvlFVDkZ+6lrWrWgbAeD
 Mt8PuWG9vrC8P5g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix missing includes and struct declarations. Even if these don't cause
any compile issues at the moment, it's good to have them correct.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
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

