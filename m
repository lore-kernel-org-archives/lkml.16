Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5B21D7985
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746760610; cv=none; b=csZH/QG5gdeNj42C/yZ4upi50+Fbfv6GJm3CiA6puzq9HXRr243JuyILB3PfzA8n2ysJRlHaGN4SSzIr97jrj3UQq5n574bwnIndkU8wjor+JzKCia5gqLdLGXeaAiER8bojJExJ/glWRqAeRKB8wqs7CQSeT6MNrzydpmxM9Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746760610; c=relaxed/simple;
	bh=d/IsvdO2UHi4Lve88nd3NjTiZKxwcVU54M/ExtK0rp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYtZK7WaGLkYC7vJ8x+lpv4nPt4w6U3Z3tHSWhW7KEvTFLiIv/GaRVuzYXYAhMJowzVq6I3th4jqEyU12wQ0mLWdDoQrvPjCCfJF45WoBY1az0mUW4nDR1Vptr4ANuiPQT0pHQvrqzm5NfnLxJQkQsU0gOOff0KQ9xYdVxGCbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fdgTY9ZS; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fdgTY9ZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sM
	l4uDULJ4d2VplsLBXiseBBzW7TX6oyV9iz007EHaY=; b=fdgTY9ZS0keqXsXBT8
	XV8j88E6S93/AzsYGphFUeOMZZRmpPiRIUe5LOvcxDy7YBiB1zuJ8Tufm3RCdLDj
	Qif0RBptSLAxFJ+obO4D5QpPO+5+1yE82rmGGxfS6S8bZ6JTMBs/jebUPpGHoO/T
	L6JamKk6eBoJhfaBp0KQ3l/4c=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v26Bcx1ombx0AA--.1362S2;
	Fri, 09 May 2025 11:16:21 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: andrzej.p@collabora.com,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
Date: Fri,  9 May 2025 11:15:59 +0800
Message-ID: <20250509031607.2542187-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v26Bcx1ombx0AA--.1362S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr4DZr47WrWkJrWkZw1xGrg_yoW8Gw1rpa
	9xtFWjvrWxGw40grnFkFs5ZFyrK3ZFgayxKr4xGa1fZr12kFyqgw1fCF95ZrW3Jr17ZryY
	vrZ3J348AFZruFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5AwxUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h1IXmgdbavmLAAAsg

From: Andy Yan <andy.yan@rock-chips.com>

In the function drm_gem_fb_init_with_funcs, the framebuffer (fb)
and its corresponding object ID have already been registered.

So we need to cleanup the drm framebuffer if the subsequent
execution of drm_gem_fb_afbc_init fails.

Directly call drm_framebuffer_put to ensure that all fb related
resources are cleanup.

Fixes: 7707f7227f09 ("drm/rockchip: Add support for afbc")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index dcc1f07632c3a..5829ee061c61b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -52,16 +52,9 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}
 
 	if (drm_is_afbc(mode_cmd->modifier[0])) {
-		int ret, i;
-
 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);
 		if (ret) {
-			struct drm_gem_object **obj = afbc_fb->base.obj;
-
-			for (i = 0; i < info->num_planes; ++i)
-				drm_gem_object_put(obj[i]);
-
-			kfree(afbc_fb);
+			drm_framebuffer_put(&afbc_fb->base);
 			return ERR_PTR(ret);
 		}
 	}
-- 
2.43.0

base-commit: 98f498ca33ac03f4d9514e66cdfec9ee58808f82
branch: rk3036_hdmi_bridge_v5

