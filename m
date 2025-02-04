Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7F20F074;
	Tue,  4 Feb 2025 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672829; cv=none; b=o3DuV+OTW6g7u6+SGBRnwozNaYjxMwFnzv7cPa1Vac3XtUp33ogZew2A6u/q92+MMDpNH8qiguhmWXMATYNmW/QJqP+txXAY//fCghtBRZ/rg/N1V8pCoV3SGWmqvMB8JAsTt/bmFAuDcDRI1CKsBycu0L2RIiy5VAysVCROcUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672829; c=relaxed/simple;
	bh=+lrETwUWImzgNwi0/PC9cnZAZnFk6zd3T35vyvvzK/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TAJMfET15q6utZpdByvQJtXMPQ8AJHgy7McIUUbfbFbYoJiWBXD6qDSGmTHHOd2ua7RdGHzXfPE19csoQVmDw0BswyK3bB+Aulgc2ZzAwedv6vm6Zjoz8otCs693TjYpyW8UI1BT+u94gJac350pZwKffllFSt0dEeeN1906dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qgPcuxay; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qgPcuxay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738672815;
	bh=+lrETwUWImzgNwi0/PC9cnZAZnFk6zd3T35vyvvzK/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qgPcuxaynp2S0Bx5f+Zgnuu7LCp4sN6mr+I2PN+WknFqNMUdCUR1/SB1AOjX4Ymzy
	 fuBmX8SR7+au3oK3tHz0LkFLY7/TbCmIQGIS7S3/kBgp4aEidEjFA/qfO+tygE2K2y
	 UpNkV7O8JQXAyU0SN1o57yb5fy0Rxe7RNd79gQKJzmdzW6lh0sv0VQpiN1i+zBrDma
	 09dlbTjPk+pU+uzXyoGpGR/gFESBPS/UoJpvfab28v0PGsEJnwtmNvw+Rq0IyGPiIJ
	 3v1S6w51lfQjqBfC/CkP06OiZNb2Q/WDyMalZkZ+BHgoZGnVYWPjPBJxhJfKDqqmB8
	 wy3/vzfIWlGDw==
Received: from localhost (unknown [188.27.43.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C164517E0FB0;
	Tue,  4 Feb 2025 13:40:15 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Feb 2025 14:40:05 +0200
Subject: [PATCH v3 2/5] drm/rockchip: vop2: Drop unnecessary if_pixclk_rate
 computation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-vop2-hdmi0-disp-modes-v3-2-d71c6a196e58@collabora.com>
References: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
In-Reply-To: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The if_pixclk_rate variable is not being used outside of the if-block in
rk3588_calc_cru_cfg(), hence move the superfluous assignment from the
first branch to the inner comment-block.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 17a98845fd31b5b223b734ae9f72f171230aa7cf..2455d4a55abd6751d54b7c6ecad3dda8a614bd36 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1905,8 +1905,8 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 			K = 2;
 		}
 
-		if_pixclk_rate = (dclk_core_rate << 1) / K;
 		/*
+		 * if_pixclk_rate = (dclk_core_rate << 1) / K;
 		 * if_dclk_rate = dclk_core_rate / K;
 		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
 		 * *if_dclk_div = dclk_rate / if_dclk_rate;

-- 
2.48.1

