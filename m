Received: from tretyak2q.mcst.ru (tretyak2q.mcst.ru [213.247.143.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1A4C62
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.247.143.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412532; cv=none; b=iS6Sa7pfD8e2bVpNrCNvzhIdaeMQeiG+PSEWC8sKscMbNW1tolbvV2GMeVTVAovLlx8eOPEtgTG1hxUoLSG6lyOtXv8aPj46YC0imzopwgbJOLx+eyLriSPloo6V9kIopQhidcjcoZ8rSrVjaa+1cuh/sExK35tMU2ulhJxPOqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412532; c=relaxed/simple;
	bh=zg/AQ5gV4jDOd4xWr1sF8Qt9hjFNpKZ311GM1QsVosY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ATIw7LDYRUKcbz0Lwu6s8EcLxVG/SPYaTY85qp8e0o3JFWk/G8TK+WFYoM3ZpjMia/vYvdBs/B4r6HtSzkr2aDSMJQoL7rinoPADkLoPy/USOADRLlEJAecu/LFFoLHtk6gvhAwlbqCyT2vsp0jc7/5fcIY4+N7N9HGSqs+tF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mcst.ru; spf=pass smtp.mailfrom=mcst.ru; dkim=pass (2048-bit key) header.d=mcst.ru header.i=@mcst.ru header.b=d2vTtl4t; arc=none smtp.client-ip=213.247.143.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mcst.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcst.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mcst.ru header.i=@mcst.ru header.b="d2vTtl4t"
Received: from tretyak2q.mcst.ru (localhost.localdomain [127.0.0.1])
	by tretyak2q.mcst.ru (Proxmox) with ESMTP id C26F2100C2C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:39:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcst.ru; h=cc:cc
	:content-transfer-encoding:date:from:from:message-id
	:mime-version:reply-to:subject:subject:to:to; s=dkim; bh=2VRR1Cy
	u8OkmME9Et2pZK3JY6/+89JeRSKN0C/QUg+Q=; b=d2vTtl4tZc+HUgwG2Iy7X+w
	3L3+2Z0JugeEVFTndi3dPvldn1XABXCP1aD+4Xcgdg/48Q3IIFzzttfHkXrbZo39
	i1BMZaHUNsgoBEQm2eMD1hspDjWS/WwgsOk/mSEOICkwwmxeX0Zpq98ZtzVsxErN
	pl58Y5t8fA7+6W8OKdqGOz0YEkK/M5oUHOWXSr89FOY5aKXxyU/Rfmrdov87DaQP
	FwShXl6hTxjUHP9odX29IA194l42XJ8LAGH5MqI3hESyCgmVQNiBxwsg+l/rhBN6
	zKrZa/n9pcNTZYfmelm93+tv0mxuS3+nCgP2fVhTerQM4PJv4DAHJd8nHTzW8NA=
	=
X-Virus-Scanned: Debian amavis at mcst.ru
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [lvc-project] [PATCH] drm/radeon: fix possible NULL pointer dereference in atombios_set_encoder_crtc_source()
Date: Wed, 23 Apr 2025 15:31:42 +0300
Message-Id: <20250423123142.1499351-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function radeon_get_connector_for_encoder() can return NULL
and its result is checked before dereference in all functions
except atombios_set_encoder_crtc_source().

Add a NULL pointer check before dereference.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a4863ca93ccc ("drm/radeon/kms/DCE4.1: fix Select_CrtcSource EncodeMode setting for DP bridges (v2)")
Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/gpu/drm/radeon/atombios_encoders.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index d1c5e471bdca..0cda4e6749f0 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -1913,9 +1913,9 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 			if (radeon_encoder_get_dp_bridge_encoder_id(encoder) != ENCODER_OBJECT_ID_NONE) {
 				struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 
-				if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
+				if (connector && connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
 					args.v2.ucEncodeMode = ATOM_ENCODER_MODE_LVDS;
-				else if (connector->connector_type == DRM_MODE_CONNECTOR_VGA)
+				else if (connector && connector->connector_type == DRM_MODE_CONNECTOR_VGA)
 					args.v2.ucEncodeMode = ATOM_ENCODER_MODE_CRT;
 				else
 					args.v2.ucEncodeMode = atombios_get_encoder_mode(encoder);
-- 
2.39.2


