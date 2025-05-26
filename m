Received: from mail-m21472.qiye.163.com (mail-m21472.qiye.163.com [117.135.214.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9091DFE8
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262218; cv=none; b=FMF6LNhIYtv0oiuBgnTgwqCVCrKZtjmQdAifDtfpeHDYBo3abzJsg20romqtsIufGgDOA+OUqOhC5yF2FQp4cngngbitoSYbavlLzOwUfyGmiTr/7lzBbk2zlKVhQ7eAJa8SXA4sLt5YYoPRZl+58QfuSMa6RgVDJ8xvicKkkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262218; c=relaxed/simple;
	bh=QTe0hDKQs2iydccp2G94huZggIGhX7dRaAOLYD4TljE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mTOleiRoFawL4nJSkR5auvo6noNr1Nej0/gZbgMAXdzgZTo6AlF6x4spI3O1/p6zfJt6uYUFRFmThZIoLOmeQs4LX6zK4iTkHI5Ht6lIRzZ1YRtxOFiUvgQvamYi/D8Vju99c7HJ1aS2qRytDSoU6Kz40xNCyWLMUpMQpRc2nH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=OkIRMNSi; arc=none smtp.client-ip=117.135.214.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="OkIRMNSi"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 166d9dc8a;
	Mon, 26 May 2025 20:08:08 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: andy.yan@rock-chips.com,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 1/3] drm/bridge: analogix_dp: Formalize the struct analogid_dp_device
Date: Mon, 26 May 2025 20:07:40 +0800
Message-Id: <20250526120742.3195812-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526120742.3195812-1-damon.ding@rock-chips.com>
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRpOHlZLQ0odQ0tKTEMYSElWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a970c7e389903a3kunm0ad049025254aa
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pi46HTo6DzE*GAw8UVYyOC8q
	HQ0aCj1VSlVKTE9DSU1KSUNCTEtNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0xMNwY+
DKIM-Signature:a=rsa-sha256;
	b=OkIRMNSiNrExEXyJCtt/DMx0F92VUu+Xk1upPcakeBYgSJRI1TEs3gQjmns5hkIi44SZIogO0bPasHuJRzu4NdhLN6n1d06JpkMxecJzEOyx0cuA7j9Nzv4qUkN1QpFiN3181yKE624yY4aubtDMvXYxvXWJynQoKLhfFs/Ja58=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=l9z58+dUS3LVJZ34dR/oJyGQCDJfxmvEUWd/6tc5fw4=;
	h=date:mime-version:subject:message-id:from;

Use the tap instead of the space for &analogix_dp_device.aux and
&analogix_dp_device.force_hpd.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 2b54120ba4a3..9f9e492da80f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -155,7 +155,7 @@ struct analogix_dp_device {
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_bridge	*bridge;
-	struct drm_dp_aux       aux;
+	struct drm_dp_aux	aux;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
@@ -165,7 +165,7 @@ struct analogix_dp_device {
 	struct phy		*phy;
 	int			dpms_mode;
 	struct gpio_desc	*hpd_gpiod;
-	bool                    force_hpd;
+	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
 
-- 
2.34.1

