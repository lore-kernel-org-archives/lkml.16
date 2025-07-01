Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DABD101EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349033; cv=none; b=BHQhaaTdSf583AtRSGDS2vbd/cnKPV+u3mkhq7/qN5u5nk57hPVUInQ2Icg3whZJRHYRuF9o9Ny3lmEgWQF/uUzhMmLvO4q2NRViKshh/pOpok8GFJEpzZBpZO/ZY8aqrHbSs58yY2+9kmqqS2N+unkLdp8aXid1atq9A91ZFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349033; c=relaxed/simple;
	bh=iA0lknFuV9UHT703geLuFxo+3cXUko1QPEGyp39osoE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CtAkhrEirppAARJqUdwF76E3FOTAgwyIQnYQedTf2XZ+K/P4A9CWPPTuZFzcMyj2aP/jmaXKnRCa8DO6N+jwrsmZrjgJWTUKjtlO4qyrD7TVbBWNfJcE1JxpTmokYLhKvip/hCAX5673lieNts35TDPl8lI5ZpymfRpYwqQlQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q4YTB79/; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q4YTB79/"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5615o4f33538314;
	Tue, 1 Jul 2025 00:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751349004;
	bh=3cPMkq4X1dcsq5SZpwGZYCzbnhDDSqUTCMHOl/O7qb4=;
	h=From:To:CC:Subject:Date;
	b=q4YTB79/6z+iHUjKXRZaiCetZgaR8nVIkU8D2Hp8L2otCT/l8HOBg44R2x5v6TW3/
	 2BHIuNBh73Q3cP8oeq4TgZS+JnhqYU3fyq8z1oud/LdlCkDGo3a7B9LGbL1u+J7xHD
	 J3MkvtvyRuTqegDFqCe0QR/aiRLEBOQwRpAQMRJU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5615o3pW3800199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 00:50:03 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 00:50:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 00:50:03 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5615o2UV1007641;
	Tue, 1 Jul 2025 00:50:03 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
        <j-choudhary@ti.com>
Subject: [PATCH] drm/tidss: oldi: convert to devm_drm_bridge_alloc() API
Date: Tue, 1 Jul 2025 11:20:02 +0530
Message-ID: <20250701055002.52336-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

DRM bridges now uses "devm_drm_bridge_alloc()" for allocation and
initialization. "devm_kzalloc()" is not allowed anymore and it results
in WARNING. So convert it.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Warning log:
<https://gist.github.com/Jayesh2000/e42c235bb57cb0f0af06c8c3bf886ef2>

 drivers/gpu/drm/tidss/tidss_oldi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8223b8fec8ce..b0f99656e87e 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -534,11 +534,10 @@ int tidss_oldi_init(struct tidss_device *tidss)
 			continue;
 		}
 
-		oldi = devm_kzalloc(tidss->dev, sizeof(*oldi), GFP_KERNEL);
-		if (!oldi) {
-			ret = -ENOMEM;
-			goto err_put_node;
-		}
+		oldi = devm_drm_bridge_alloc(tidss->dev, struct tidss_oldi, bridge,
+					     &tidss_oldi_bridge_funcs);
+		if (IS_ERR(oldi))
+			return PTR_ERR(oldi);
 
 		oldi->parent_vp = parent_vp;
 		oldi->oldi_instance = oldi_instance;
@@ -577,7 +576,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		/* Register the bridge. */
 		oldi->bridge.of_node = child;
 		oldi->bridge.driver_private = oldi;
-		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
-- 
2.34.1

