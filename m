Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0441D86C6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639021; cv=none; b=ncJCV++ebFM86naHxbjZ7bcAJOT6Fv+J4AHSZaromHMWOT20E9hZZy3zXGFDmu6BEXd2XKE2HtBdFExCgqVw08H7326y1XPWmn3sQYC9a0GRuo3CXmpNKF3BGRDJR88lteZoPQNitOIsHnmXQF7YjaVnnW5/UlER1QDTXQHphNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639021; c=relaxed/simple;
	bh=gj4rXTi5xhvc6UX7OZe6K8Cx8rlffm0qUchexNCC4L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxoF1e8VFLDwgqLQirpmN58EOPQBSrGeuZaJGsHyX4u+oPSD3u9ReSjGyJX5Z9551z4t7YrvjR0XU+JqMrXRXgqEgOSq1bcNQvM/Y3NTW7Evzy3GocSGQL6KPoBioSnZD1e5IGpJGbBpsvO8QecmRpXRfpKe7jVs8htRYiqwkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iw3CUVpA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iw3CUVpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639015;
	bh=gj4rXTi5xhvc6UX7OZe6K8Cx8rlffm0qUchexNCC4L0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iw3CUVpAyfZir4XEsTPjG5HuHvHHttxjJ8tA2DNO7nE2SUAeIVVZoggYhW3v8QQjL
	 EMwya6C7CY7j3J7xkC1oElN/2mYvpRumzRy/pZUVA2WxiCWAUkcKvx2RjGhtjQXYxE
	 xdZVR8kyQ97ZriC9bEXoenGZn8FFRaAgXmCry7weStgFcAkRlWNwPkQvdSWXrYkXTE
	 mDu9sFcKaxsIcq7fbVGK+MTZQ6PLW0XlYkpUfOmmhn7mtZt3XTLMhw7ACU339ESko7
	 g/4p6cP1olCYlo+buESrIiAkJONqpPaAv+E3mSfW/7/r6ozjscsli/y0qjfyuV4Li3
	 PIIKxkcB/2RDg==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 589AA17E0F3F;
	Fri,  4 Jul 2025 16:23:35 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:26 +0300
Subject: [PATCH 5/5] arm64: defconfig: Enable DW HDMI QP CEC support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-5-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Enable support for the CEC interface of the Synopsys DesignWare HDMI QP
IP block.

This is used by all boards based on RK3588 & RK3576 SoCs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865fe8edc54911213321d6f1278aae4..0363ba916e0ed7e7d9dc1169f447f3726580de18 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,7 @@ CONFIG_DRM_CDNS_MHDP8546=m
 CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
+CONFIG_DRM_DW_HDMI_QP_CEC=y
 CONFIG_DRM_IMX_DCSS=m
 CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m

-- 
2.50.0

