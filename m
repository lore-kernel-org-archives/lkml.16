Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB80A239561
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234286; cv=none; b=Sa2EbyHqZvh66EFRVYFJ3ha9inouR50eHqA1QL1IB83Qb/ZpeI/6BCTgLJuUN/E+gdZb4QjO0sLOgXPmgDKay3ojdDjasqPvbUtjClexs0OqtdJOTaQShIFIaGgDFmnt7COq+9ZKeaR2Ar4hapBGx4qXbVIuwN7yzcdL+VQP3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234286; c=relaxed/simple;
	bh=h5QGTcnIWHnz3b6jsTHTkeVKOJ5MS/jLjfaOL38TiWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgvseTRXTOwwCKp0ZBVfpRgomKLSu+eDeFJOUHsRx32zBi5tohSunlCZuUcaS6e0b4SbcJM+5c9z+xR5l+v27yX2Y6atQlFJDfasX9SJ2V9kXvA63WLeJBLw578nLCLCWRE7oAqJU5Cb50uR5m4W/kTdbwyV1LcS8U/QJoHY8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cRLKLibd; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cRLKLibd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SG
	cSb4qrOG3O9MCBW38eyABjbPdzTYy8UGZPX8GL5eE=; b=cRLKLibdzKL7O6/s2W
	oiWr984pUzdHjrV76NkRvyzUKkYBM664azoIVHvWJpfRZB+bnVvh11MeFqFq2vYA
	5ia7nMpmX4YHYoURc8ZDEUm7J9ZUsA540PR8RtqONOwUevtxmRxwZjiLzoFZAu/S
	WvodH5CB8VAevGADD8rabp2jU=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXuD9adFJoIEHGAA--.6009S2;
	Wed, 18 Jun 2025 16:10:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/panel: raydium-rm67200: Add missing drm_display_mode flags
Date: Wed, 18 Jun 2025 16:09:55 +0800
Message-ID: <20250618080955.691048-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXuD9adFJoIEHGAA--.6009S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1kXFWrWw4UGw4rtr45Awb_yoWkCrg_KF
	18uF43Xw4Uu3W3ursFva909FWxt3s5WFZ5u340ka4akrnFvr18Xan7Cry0y3Z8Gr42yas8
	Xa4xXryjkas7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8FPfJUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gJwXmhSc6oZowAAsn

From: Andy Yan <andy.yan@rock-chips.com>

Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
flags. Those are used by various bridges(e.g. dw-mipi-dsi) in the
pipeline to correctly configure its sync signals polarity.

Tested on rk3568/rk3576/rk3588 EVB.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index add6099ae8a64..92c3e20b903f0 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -478,6 +478,7 @@ static const struct raydium_rm67200_panel_info w552793baa_info = {
 		.vtotal = 1952,
 		.width_mm = 68, /* 68.04mm */
 		.height_mm = 121, /* 120.96mm */
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 		.type = DRM_MODE_TYPE_DRIVER,
 	},
 	.regulators = w552793baa_regulators,
-- 
2.43.0

base-commit: e1070ed6f01f471547b67ee23b0cb8febaaccaca
branch: rk356x_rk3588_rk3576_dsi

