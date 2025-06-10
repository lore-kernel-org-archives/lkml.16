Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B0282FA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590919; cv=none; b=W0tkZsptdsplkt6cvVr5gIGMnTKsW/HLXRNBAGb/mNe3KOldYkia50Erz8tN/60BdX3QMZvZ/VlllIaEB+m/qOA2RbUO2qWJn09xlHXz/4LgJV5BJEHeeVx9W8uIPoAsXgrxqZt89vrx6eYj6omRBiElfX5gwBMEVeVZtNjjxIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590919; c=relaxed/simple;
	bh=C2zctQp0aYvJjRGYTmpWS778bIthItUYsYerUUajbSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3nuGhOX4QFUnFa8AWYM265xIeA5MHnF84vKv19dJdAKPCfujOwo5Dl16C71mz0dG5lorMCZ147Yb03XOzwyeNxA8cmLD8Ci0tT2D8HBOTebNEFEdN9ODmEMIEBnKd/SmXMm/IiR94h0EvNkCKRK9qJy8cZOsYCnGJR7HqETvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tkGM+2MY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tkGM+2MY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Awpi5GpyOLDB1Nt8+DeBTohsa+vKyjBC3GHy2DGNNYE=; b=tkGM+2MYM6zqsua3VbEBs0B9wM
	5yEPvrg8fK5rC8+Iu7nwoxeeeZXMCK6l1FbkO37Xkgb1ZUeBNjb4rnkFzmCz021lQpjvix1P/9pe+
	M7p4rE4S1XcPRjEXvFyOXNRULT44QYOKgNVJLjHWDJ6jNOJV4Ky99iKlbpf5QpZve0YpjbCVUOrAl
	d6Pm3FpKFvDTZtgEENTvVIMjNxi5EmnaPxaQGKDP6tcqmjvlInTAZYDy64TCYrEqS5B0sLxP/BLQG
	m8yjYN6YgibOTHMyxrlbaobIXinZSkMeyV78F5h6yvFTOrT6G1tMb91NkkEkGQ1mnEAOkjT309lBL
	LhanHnDw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uP6Vs-0007Jb-My; Tue, 10 Jun 2025 23:28:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: vop2: fail cleanly if missing a primary plane for a video-port
Date: Tue, 10 Jun 2025 23:27:48 +0200
Message-ID: <20250610212748.1062375-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each window of a vop2 is usable by a specific set of video ports, so while
binding the vop2, we look through the list of available windows trying to
find one designated as primary-plane and usable by that specific port.

The code later wants to use drm_crtc_init_with_planes with that found
primary plane, but nothing has checked so far if a primary plane was
actually found.

For whatever reason, the rk3576 vp2 does not have a usable primary window
(if vp0 is also in use) which brought the issue to light and ended in a
null-pointer dereference further down.

As we expect a primary-plane to exist for a video-port, add a check at
the end of the window-iteration and fail probing if none was found.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 7ddf311b38c6..a8dc2e55812a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2425,6 +2425,10 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 				break;
 			}
 		}
+
+		if (!vp->primary_plane)
+			return dev_err_probe(drm->dev, -ENOENT,
+					     "no primary plane for vp %d\n", i);
 	}
 
 	/* Register all unused window as overlay plane */
-- 
2.47.2

