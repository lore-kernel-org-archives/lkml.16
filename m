Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900A521D5AA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279344; cv=none; b=VYVY/3c5g3DuawlJwdlbqogvXFEI8QsDH+nFS2vy442H4yReCZGL+vG37GDN0LW6cV8RbqBRrRykCRnSYRTuLlXf2RM1Y15U0/dvIRm3wJLuiRUBQw8aq/gvIyrqHuvn4MuFuSin2z4P5Bip2zu1bNkfSQXDU34McD5pdtTL0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279344; c=relaxed/simple;
	bh=l5UaRJI9ED4qxZ3oMPVtbi+aP7TlXVHBIO9LNim8MDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWVC0jUbqbEFC53T5aULC8wa+V5LWlhszGOQvU4yAzfHBdsCsf0XQ35ug4O2uhJx9bJbmShG0CLPVL4XijB4dey6aBkngaKQPRqKUXsml6gvArY/U7LOv3yRWc5LQyvwGRNDKvUhixrmVbKfZcTRw5zRvA9PctjfXNSb02QjWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nJerHS5G; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nJerHS5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750279338;
	bh=l5UaRJI9ED4qxZ3oMPVtbi+aP7TlXVHBIO9LNim8MDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJerHS5GcEy0ZmtuASGKCKZWxX+o1aZ+/ZRXMuM0Zb26SmnDg/4mOQsxObGrn5AZu
	 SygaqO26BbRW4Mg0O618Y9hF0c8RjINjP0DXR+VffVzCMHojLzF1+wBL7khDGGP/LR
	 DxTXdHro3121TJ2e3iakmylMCP8DJ7bRneTjC3SNVts6ZFHSd/iNZncFTOygP1Tlr8
	 h2PObC67Q+M6wDftvi/ep1uSuzys9TZEr/FQ77c9ToEfvSiz7hIwwvZl7y20nao6wx
	 NH2AdwvvF/WpUoEdP9C2wGaGaG2RoR0/dPeua4ZqfnObp0onna17P7eWkyPZl34wwo
	 A9mWCXqK/G2uw==
Received: from localhost.localdomain (unknown [89.186.158.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gerddie)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72D5017E1580;
	Wed, 18 Jun 2025 22:42:18 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 6/6] drm/etnaviv: Add module parameter to force PPU flop reset
Date: Wed, 18 Jun 2025 22:43:34 +0200
Message-ID: <20250618204400.21808-7-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
index c33647e96636..bf4cae4be815 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
@@ -16,6 +16,9 @@ enum etnaviv_flop_reset_type {
 	flop_reset_tp = 1 << 2
 };
 
+static int etnaviv_force_flop_reset = 0;
+module_param_named(force_flop_reset, etnaviv_force_flop_reset, int , 0);
+
 #define PPU_IMAGE_STRIDE 64
 #define PPU_IMAGE_XSIZE 64
 #define PPU_IMAGE_YSIZE 6
@@ -151,6 +154,12 @@ etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
 			return (e->flags & flop_reset_ppu) != 0;
 	}
 
+	if (etnaviv_force_flop_reset & flop_reset_ppu) {
+		pr_warn("Forcing flop reset for model: 0x%04x, revision: 0x%04x\n",
+			chip_id->model, chip_id->revision);
+		return true;
+	}
+
 	return false;
 }
 
-- 
2.49.0

