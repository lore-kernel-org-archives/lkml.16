Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28257229B39;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835139; cv=none; b=XFWNuf/I3ps82HBez3T4zlZy+QzfxiWHfKgETw2uOLARQRVuBMq4kMg2Btzp/90yJ1tLpEkQq1Jbd3C0UOtyg+3xqEIPVySwK3SAUflpKFxteji5lx99eH1XLlzT8gwLJUHZ+xNWYz09ZQUp5TdEh255Te7yZu3BVnK/IOIeJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835139; c=relaxed/simple;
	bh=duY6QIeNjBuMUXbdB1iaXZTuJmf20C5DBK0PtDwryIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2hz20TKPFWsxtCMe+rpjRoSuce1WgnL+UWCuC+OGm4V765ssEu0YBbTUaPkATEdyLJ+itz1JH9sYNg7fDaiQHffPJJFJN9GgkK8ClqnsVF0E0CBArBdqose2CFjSR2YwPVIulisRjwh5djRDmPGvMlcYMCO3LoR+5bZaCVRdUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPaPcjBZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPaPcjBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2C35C4CEE4;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744835138;
	bh=duY6QIeNjBuMUXbdB1iaXZTuJmf20C5DBK0PtDwryIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QPaPcjBZVPFjXlUrAhh1KJr6/OGwkIOVrHxtIxxpY3SFX951oiw1BZAMKaTF+aPPD
	 M0FrwaIuZUbbJg8VT3WLKFZ1rLKrcvGTvcmE+oT7gswYqr3Zbj9MONu5YVCXZdw4h2
	 69x5KV2s3RHR3FcMf0jlg80M0BD2FWEd1qlkb+zhgRf1Wo9yI32W20WDdD6hOgqA/o
	 aDbjI29UtEDsM9Lup41LMrj35lEAvT4MRtolJMC2BLyayqlQHblMxP0no9vYNogkBQ
	 HwzoBhGBDoPTdyRK/309IKguKOSyEOwGhTP2akVi1dDzNL5zyCuDwMpXGHabz+ZcJP
	 95sLDPO+ja9lA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FE5C369CB;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 16 Apr 2025 22:25:28 +0200
Subject: [PATCH 2/4] drm: adp: Handle drm_crtc_vblank_get() errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-drm_adp_fixes-v1-2-772699f13293@jannau.net>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
In-Reply-To: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=FieR/Ygwnrv33tES3w12wE8FOb8z2zK1vC7NpumJSic=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgwGIXv/1H+rDsy9ky11edmiUEv759d//hO7HV+5Uuj7c
 +YfJyOPdZSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZhIBi/Dfzep51r3Du85eGqd
 6ZmSLFH2iE+lDVY/tKe27M49al6hEMPI8Ga31IL7PUmMaZk/Jnw6e3NlaDtfcfz0bz0RSfbv00Q
 uMQIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

drm_crtc_vblank_get() may fail when it's called before
drm_crtc_vblank_on() on a resetted CRTC. This occurs in
drm_crtc_helper_funcs' atomic_flush() calls after
drm_atomic_helper_crtc_reset() for example directly after probe.
Send the vblank event directly in such cases.
Avoids following warning in the subsequent drm_crtc_vblank_put() call
from the vblank irq handler as below:

adp 228200000.display-pipe: [drm] drm_WARN_ON(atomic_read(&vblank->refcount) == 0)
WARNING: CPU: 5 PID: 1206 at drivers/gpu/drm/drm_vblank.c:1247 drm_vblank_put+0x158/0x170
Modules linked in: uinput nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat videodev drm_dma_helper mc apple_soc_cpufreq drm_display_helper leds_pwm phram
CPU: 5 UID: 0 PID: 1206 Comm: systemctl Not tainted 6.14.2-asahi+ #asahi-dev
Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
pstate: 614000c5 (nZCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : drm_vblank_put+0x158/0x170
lr : drm_vblank_put+0x158/0x170
sp : ffffc00082aa7e70
x29: ffffc00082aa7e70 x28: ffff80003419e000 x27: ffff80003419e000
x26: 0000000000000001 x25: 0000000000012400 x24: 0000000000000066
x23: ffff800033fc8800 x22: 0000000000000000 x21: ffff800029688e70
x20: ffff800029688000 x19: ffff800029688000 x18: 0000000000000000
x17: ffffc0015c868000 x16: 0000000000000020 x15: 0000000000000004
x14: 0000000000000000 x13: 0000000000000001 x12: ffffc000825b3a90
x11: ffffc00082960e88 x10: ffffc00081b0ec88 x9 : ffffc0008017d0ec
x8 : 000000000002ffe8 x7 : fefefefefefefefe x6 : ffffc00081bbec88
x5 : ffff8001de237548 x4 : 0000000000000000 x3 : ffffc0015c868000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff80003419e000
Call trace:
 drm_vblank_put+0x158/0x170 (P)
 drm_crtc_vblank_put+0x24/0x38
 adp_fe_irq+0xd8/0xe8 [adpdrm]
 __handle_irq_event_percpu+0x94/0x318
 handle_irq_event+0x54/0xd0
 handle_fasteoi_irq+0xa8/0x240
 handle_irq_desc+0x3c/0x68
 generic_handle_domain_irq+0x24/0x40

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/adp/adp_drv.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 157298a8ff42b95275411dd4a7a0c70780fd86fd..27119acac92238858d58a690eb4196dbb2ae0c1a 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -331,13 +331,17 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 	writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
 	//FIXME: use adbe flush interrupt
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
 	if (crtc->state->event) {
-		drm_crtc_vblank_get(crtc);
-		adp->event = crtc->state->event;
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+
+		if (drm_crtc_vblank_get(crtc) != 0)
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		else
+			adp->event = crtc->state->event;
+
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 	}
 	crtc->state->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 }
 
 static const struct drm_crtc_funcs adp_crtc_funcs = {

-- 
2.49.0


