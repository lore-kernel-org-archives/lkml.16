Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971362144DE;
	Thu,  6 Feb 2025 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824348; cv=none; b=LHP7jHCieWns0G7PiGFtfmXgK36JLjARe/+bcbsZptPFQ21rja3zmsu+Y/r1OUPLPYFknlMwvnNekODHFg56bV1Erda8vF3wCios8O41RgpcA31pQElLzdrtPjHuD8VpSz62lnLWeNBXZCqlK9s4g5le05rUlDNhhXFLL6lHte4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824348; c=relaxed/simple;
	bh=zf9l8kFYdpYcCRlFpfth8jYHWJFleBosyhN87ch4A74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHSfBFZt22Gpgflcm+PKlcX6sknLrYHeqLvNKIGFiv9LMhqhqiI2Aze1tHAXmX95axKL/ldQKwN9VsMfaCt5Y0l75/8eEkCSvR+gE9wTb9xhSNoas4wdvL95otTAaOSSHc5AqlfLuLfKBSvAv9THT2Iw77GtM0b1sJLNjivg8mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mh+Z0Nbs; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mh+Z0Nbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=1tK63
	p6E06ruoBhr4yP+6MI3hNsxARoiIZJBTFpZRnw=; b=mh+Z0NbsIZEIqC8Im+oyF
	GDifm766HvFE6fJUkAt0btjpq9g8S4OaK/sLwa7Ma5ETOcIeRzqLWmpubFAPAlSV
	clRLrdKdklgw4DDoy2+CD4Jw9Ja6b2fULmLzR4vw070rwTShSPAOOuWRJb9j3eH3
	o6FoNPOydtpbIyYo3S0jaA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3fyNsWqRnb3bDKQ--.52146S11;
	Thu, 06 Feb 2025 14:45:13 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v13 09/13] drm/rockchip: vop2: Add uv swap for cluster window
Date: Thu,  6 Feb 2025 14:44:37 +0800
Message-ID: <20250206064457.11396-10-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fyNsWqRnb3bDKQ--.52146S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW8Ww1kAF4UAw47JFy7ZFb_yoW8XrWfpa
	13ArWqgw45Kw4Iq34kJFW5AFWSywnxKay7uws7tw1F9ry3KFyDG3Z0kFWUAr1qyFsFkF47
	tF93JrW7Zr1jvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jx0eQUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAXrXmekT+DQ4AAAsE

From: Andy Yan <andy.yan@rock-chips.com>

The Cluster windows of upcoming VOP on rk3576 also support
linear YUV support, we need to set uv swap bit for it.

As the VOP2_WIN_UV_SWA register defined on rk3568/rk3588 is
0xffffffff, so this register will not be touched on these
two platforms.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 6040fd2388d3..3e9581e8adab 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1373,10 +1373,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	rb_swap = vop2_win_rb_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_RB_SWAP, rb_swap);
-	if (!vop2_cluster_window(win)) {
-		uv_swap = vop2_win_uv_swap(fb->format->format);
-		vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
-	}
+	uv_swap = vop2_win_uv_swap(fb->format->format);
+	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
 	if (fb->format->is_yuv) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
-- 
2.34.1

