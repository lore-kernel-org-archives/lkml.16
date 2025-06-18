Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F42E9EB4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240807; cv=none; b=VBcnU2qK035aFAEaTM4qfCAw/236NaMfzhVD74NrXSImEkJIa+nQJcD0SMmVjc7GQcGm7PB8MlH1Dwge6PxLKCruWiWnFAjavwVy868E7WJxjIj+Cnbhgo5uQdSC1XA0qGyvXfelphG6ZYEJbx/CQaqnlQ/fdbqxc7Bbyy0enOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240807; c=relaxed/simple;
	bh=B3dq0sEpe5AT9qctfQAR4vjZEu+9Or2HA//TK9hQ9OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGDo1Tr4CPk/g4NMYChIVqMK9UlO7m+n2s/+el2JtBZkq24ko2QYRoPA1m5+hPDM5ULl33WonE7ASTFWmDJ2Uv3TPx8FDjKIloa9tcIT+o3HbmSr4EHID/se02PPKi0L6+EV2t45+f9dJpcbXAp0olQ4K89FzzsrFb2A6n1cL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mSWalhnh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mSWalhnh"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF955288;
	Wed, 18 Jun 2025 11:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240781;
	bh=B3dq0sEpe5AT9qctfQAR4vjZEu+9Or2HA//TK9hQ9OY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mSWalhnhoqpNSAlK1Vq7C9//mECRuAb86zLq4yBYFkLdZXvhpxf2qhqSY7sbF535e
	 rbkDDyp3KgCAhUQdyc410v62EUpsy6gX2bIJO48w4361yvdIdQ9U1FgDiRLru7UFSX
	 xdSv/qsNfXypLd2d1RCUJ/BJtZWDXgickQuaeZ9g=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:20 +0300
Subject: [PATCH v4 17/17] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-17-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=B3dq0sEpe5AT9qctfQAR4vjZEu+9Or2HA//TK9hQ9OY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo4Cm9WSHu5ul0FLGjPBlHGU7cspWgy2eAURb
 KxUES9AIJGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKOAgAKCRD6PaqMvJYe
 9ewUD/9FAokWtzhtDn9Z+8u+/+5MlZcIEC2OOKxjX5GL2PbefUPOjrk+HNISEOopeVSR73XaN1W
 Fme0uL0cQEuJHwK6nmfXOkYMwuwgaYHUNHB9ar4382ofLFHGdA/o9kSQb3dSYbuVrTYIQKUIPGV
 DN//ujwi0V+Ef5eD/sBoXZySIiGSr5kOrVDr6/72SLfTcJ2hS+7eYTY0QsmS+QVQqaWUbNrghju
 XBLNM5OD8Dw/qpAVJ4tdjHQezx02TXw3shJfujRhJ1cz2oOHCg5A1u7rKCSvX6r4Lq25MMXifCp
 d+iC3/mXxHByOcmCxgxCvkOeZlUnHsvN3mQTICXdZHJuuAOPHZwL/7jFC9RalZ7PJOocA+9A7ty
 Err+ffK5hUcX2qMoMtl7XXJCMkIYHpPSE9OYwJ0ay5b7yoQ8fvX6Tfm5mMpYCeexJuF390o18QM
 Vx+U6odM5pEND4s9n03L6Qppsf6gc+sqU8HJk4PX31jHgfbpFku+rKMlEyyYDxiqSAO1DNi/ecH
 p2iZVT0lyB17P3JKwV3upODe7k2Gp6b42bPSduX1hoL+5N9CPjTiLBKImJkjzGax9atv8T0AAh3
 RLJZIdEaPr5yTDDTu5G4pEG/5ORbeCe+NLK0M39YfmUznAuPwSgt5ensRmI8UkacIPh+FTOy41u
 LqWSuGztD8G3+Zw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

While the cdns-dsi does not support DSI burst mode, the burst mode is
essentially DSI event mode with more versatile clocking and timings.
Thus cdns-dsi doesn't need to fail if the DSI peripheral driver requests
MIPI_DSI_MODE_VIDEO_BURST.

In my particular use case, this allows the use of ti-sn65dsi83 driver.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 114d883c65dc..09b289f0fcbf 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1052,10 +1052,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	if (output->dev)
 		return -EBUSY;
 
-	/* We do not support burst mode yet. */
-	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		return -ENOTSUPP;
-
 	/*
 	 * The host <-> device link might be described using an OF-graph
 	 * representation, in this case we extract the device of_node from

-- 
2.43.0

