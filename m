Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0928F1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355075; cv=none; b=MB6cLZd9yXi5A9uBoMzT9sQFzZKYI25F1SQDZAHMQ3pBWjAomH0Jgt3Ap7/CVa3AyXSN7ZnCtJEUV0eOCh9llVwzIoJUZJjQJbu7PAYgEl7y5PxPEzDuKgmXr7hIoCEJRd7+ESa0LYtv3Q8be+Dn67racgwI2WVlW+petRmmhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355075; c=relaxed/simple;
	bh=UEJCp0kLrVN60JijFimfY4cx5ReWcbWGz2tn84YNl9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HrDNTrQCznKseQm6/o7xPKw34o0lwGUlP/f9243RwmBRx2icjztTBRK8xA1ELDn2FfKqXK5XQEUrsoDBA6eSZfFG01lOzZX2Tbjo6Ns3MdLE3CVh4nQxQ2cFF3wf5fUC/ivP6nqR9xD4F9G6EXJW3zJ7/UtFztyI7lYQQjesyWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VJiOoAxv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VJiOoAxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751355065;
	bh=UEJCp0kLrVN60JijFimfY4cx5ReWcbWGz2tn84YNl9o=;
	h=From:Date:Subject:To:Cc:From;
	b=VJiOoAxvI4d6W5/5+ZhHQ/ernRfdMMl2DaI1jos8owUcBcjPsZwg9kLwsbJzujNbg
	 OgchCqqWdUBrQALiSqnC2iode9QtODK8isPC9f5cf9nwOd+VsjTFjvQWXyak9os19N
	 JwktkrHuxFrADF21STGu0v+kNwoqVEYzmyp65HXKcnPSnqXymBIU7lunzYhoBq5D4I
	 Cjb13lDcn1o+Hs53HbnoFiFLxusMEL+5Lv9+J0o1+7V2Js/433DSYarEhgDaqDIBLR
	 hEyrinptgSfMLmS3yti1R8jWLWDiQyhVofs7vxC9ZmiZlhAiWjvL8G5/0JoaJgEhkh
	 /FvG2KYC5KynQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82E7717E0342;
	Tue,  1 Jul 2025 09:31:04 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 01 Jul 2025 09:30:40 +0200
Subject: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJ+OY2gC/zWNQQqDMBBFrxJm3YGo0YVXKS7GZGyHNtEmsQji3
 RsqLt/n894OiaNwgl7tEPkrSeZQoLopsE8KD0ZxhaHWdau7RqNnJ5T5hS56nGRDlwQXCvxGCZK
 xIjO2jbFGUwfFskQur3/hPpwc+bOWUD5HGCkx2tl7yb0KvGW8YjAcxw/h6vdiogAAAA==
X-Change-ID: 20250630-mediatek-drm-fix-dsi-panel-init-1a4b534c40a6
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751355064; l=2696;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=UEJCp0kLrVN60JijFimfY4cx5ReWcbWGz2tn84YNl9o=;
 b=OeqpFOdg0cEKjdsvCTKe8qTt2Imn73FY6gR8H8q+YymCd96FwzBIHhaQFOKIpSqxKMq4JJF0o
 o1MhvzJiSwvDRRZOMy96lZNGYutb40j6mRzmLUdoIpxYeK82akXmJy9
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
pre-enable and post-disable"), the bridge pre_enable callbacks are now
called before crtc enable, and the bridge post_disable callbacks after
the crtc disable.
In the mediatek-drm driver, this change leads to transfer errors on
mtk_dsi_host_transfer callback processing during the panel bridge
pre-enable sequence because the DSI host bridge pre_enable and CRTC
enable sequences, that are enabling the required clocks and PHY using
mtk_dsi_poweron function, are called after.

So, in order to fix this call order issue, request the DSI host bridge
be pre-enabled before panel bridge by setting pre_enable_prev_first
flag on DSI device bridge in the mtk_dsi_host_attach function.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
This patch fixes an issue that can be observed on boards such as
MediatekGenio 1200-EVK or 350-EVK with a kernel based on linux-next
(tag: next-20250635) since commit c9b1150a68d9 ("drm/atomic-helper:
Re-order bridge chain pre-enable and post-disable"). 
In boot logs, there are multiples errors such as IRQ timeouts and
panel init errors, leading the DSI panel not being enabled: 

Example on Genio 1200-EVK:
```
[drm] Wait DSI IRQ(0x00000002) Timeout
panel-himax-hx8279 1c008000.dsi.0: sending generic data b0 05 failed:
  -62
[drm] Wait DSI IRQ(0x00000008) Timeout
[drm:mtk_dsi_host_transfer [mediatek_drm]] *ERROR* failed to switch cmd
 mode
panel-himax-hx8279 1c008000.dsi.0: sending DCS SET_DISPLAY_ON failed:
  -62
```
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c4762698b41060b3d4d8d27940238..0e2bcd5f67b767d92f2697a5b8183f67ee178a38 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1002,6 +1002,12 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 			return PTR_ERR(dsi->next_bridge);
 	}
 
+	/*
+	 * set flag to request the DSI host bridge be pre-enabled before device bridge
+	 * in the chain, so the DSI host is ready when the device bridge is pre-enabled
+	 */
+	dsi->next_bridge->pre_enable_prev_first = true;
+
 	drm_bridge_add(&dsi->bridge);
 
 	ret = component_add(host->dev, &mtk_dsi_component_ops);

---
base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
change-id: 20250630-mediatek-drm-fix-dsi-panel-init-1a4b534c40a6

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

