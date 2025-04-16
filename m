Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460722A7ED;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835139; cv=none; b=VoGVsyct1oZNxLV8wyIKkDosGLo63AUQNT+z4G7UdVQy9C69OWGVd0V6qLYd9mElg5p5LzWkCg8cwqbecbUQ7uuIvsS9VK69XJXtCpzQNrbf9u7fpl4l6DvbTNhbkWG0sLOvdF80AgoK7Eb3R1/jPqcDlAdhtaCpXKo63xcPUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835139; c=relaxed/simple;
	bh=6hRj2O+0KN1c3Idg2C0lRIf9H5gKHWdz2x9po1m89Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksf+Y5BfM87gKEsDbOgJaz/T2LL+gTgPMOW6ThmkoWsEf4rIuBAosVy0pCbAT2j2tcxf/0mfBscQ3R3DWzMgACLzDA5ZTn3Ka47t7ZaJLa9MXAff4fFofbkb2wsRwHDMulKiBQMjiPUg/hFVkZ8sgMY9uRUOQYsHGbSWz7SK/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Csu9b+5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Csu9b+5R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C95ACC4CEF1;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744835138;
	bh=6hRj2O+0KN1c3Idg2C0lRIf9H5gKHWdz2x9po1m89Hg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Csu9b+5RRq+1OyRk3ULWQODF84fLIC77yRjs4yqVRgxgplU6eUS6VEYpl7XzVyCKB
	 9lgpNF55+ZWK9QeYZzO71vzTLc779z3lKkVOc1uZDvb/NRH1NLcrrmX9dG1tfQguQO
	 G3pZHHyRwybIWyxJIqTcsLJJHXWuZ97kCto/BJjna58nRXEuogEa49ZrP1JzxX7djQ
	 r0Rk5A2NVd2MULV71baWpLtaxeeNf9+kNMBebcEQXrGPjdDk9I/oxevHVW4g1unAK9
	 omzuM6bybPtyqzE7haLNQkYeiIVdyURnXPR6qyoWRBfau0D9qjLAZ5LS0fgD2GdAdp
	 SN9LTrIjNz1Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0259C369C7;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 16 Apr 2025 22:25:29 +0200
Subject: [PATCH 3/4] drm: adp: Enable vblank interrupts in crtc's
 .atomic_enable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-drm_adp_fixes-v1-3-772699f13293@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=pW28pOEDPYpc8Y+PSX2aP8mbBxQy8NYmJwRvSV8Dq58=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgwGIftu+aeqeeauZoUb3a+pCbA2Lfl0f0XGE7/Djz95P
 dpR0VnXUcLCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCInpjAyHAzZnv/x926zz2Ka
 9XtzduW6HWtZ3uKydH6BeMjUu4/en2b4KqJuJve3vOqTSc9dmWPPxXkbJ7OlyMySTPhlLvmz2I8
 DAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Calling drm_crtc_vblank_on() drm_crtc_helper_funcs' atomic_enable is
expected to enable vblank interrupts. It may have been avoided here to
due to drm_crtc_vblank_get()'s error behavior after
drm_crtc_vblank_reset(). With that fixed in the preceding change the
driver can call drm_crtc_vblank_on() from adp_crtc_atomic_enable().

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/adp/adp_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 27119acac92238858d58a690eb4196dbb2ae0c1a..c6238fb059342eebafddd53650a499fea0079dea 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -288,6 +288,7 @@ static void adp_crtc_atomic_enable(struct drm_crtc *crtc,
 	writel(BIT(0), adp->be + ADBE_BLEND_EN3);
 	writel(BIT(0), adp->be + ADBE_BLEND_BYPASS);
 	writel(BIT(0), adp->be + ADBE_BLEND_EN4);
+	drm_crtc_vblank_on(crtc);
 }
 
 static void adp_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -517,8 +518,7 @@ static int adp_drm_bind(struct device *dev)
 	struct adp_drv_private *adp = to_adp(drm);
 	int err;
 
-	adp_disable_vblank(adp);
-	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
+	writel(ADP_CTRL_FIFO_ON, adp->fe + ADP_CTRL);
 
 	adp->next_bridge = drmm_of_get_bridge(&adp->drm, dev->of_node, 0, 0);
 	if (IS_ERR(adp->next_bridge)) {

-- 
2.49.0


