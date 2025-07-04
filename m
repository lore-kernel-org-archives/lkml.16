Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619572ECE8F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622563; cv=none; b=KICgj3P+ILto9YSg59mbV4deIZgN4MQw648bD7aQTl1OBzOoqwwKozDLZOjezKp2cbZyNXaWjF+A5CgX3W4aT4282eqEflh8IpZACCvF9NsLAo2dU0FLM95EAmP8znKn+8qPYcdn9EnDdDzRzpgea753QS02XL65KbAKe3wUqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622563; c=relaxed/simple;
	bh=36gJH3ZwhZVT9Se30mN/01OFgD3xNct+1x1uQL8YzbI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GoVy6t45uPkxa2wu7W5Ij9qUpDkiMdc56p0vcmlep1fL3bwNPfpG6yjaP4wHO4damJyslZOl+nYhmbni6HIj3n1rmnHdQEBzo6j4s0W3UyTeKnCqFFsdRi57uY2jFG/UYac4+sq6q6t08qVNijJxvwxQJlvvXXmzruuZSH65skg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zOoTzbWq; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zOoTzbWq"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5649mt73269354;
	Fri, 4 Jul 2025 04:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751622535;
	bh=UP9LQYetOJPkiZbYukAULkfmlbLIEnD230eLWmZEAzM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zOoTzbWq+opFn50KRNxDjM4VEUUS1KGcs9U3Haql5HbN7Sw9fqikVtcImFvme1Bf9
	 Y5ejOj/YnGHvvGJgC7rq4XeJwKZNAtrJLCt5bPtMIZfEiHEmoDZx4cFec9XC1FqjRl
	 chISP49rtIF2yGMYWv9EKapeo0QZMUd59/OKEnHc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5649mt6r1258201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 04:48:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 04:48:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 04:48:54 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5649mrjr2499115;
	Fri, 4 Jul 2025 04:48:54 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v4 1/3] drm/tidss: oldi: Add property to identify OLDI supported VP
Date: Fri, 4 Jul 2025 15:18:49 +0530
Message-ID: <20250704094851.182131-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704094851.182131-1-j-choudhary@ti.com>
References: <20250704094851.182131-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TIDSS should know which VP has OLDI output to avoid calling clock
functions for that VP as those are controlled by oldi driver. Add a
property "is_oldi_vp" to "tidss_device" structure for that. Mark it
'true' in tidss_oldi_init() and 'false' in tidss_oldi_deinit().

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.h  | 2 ++
 drivers/gpu/drm/tidss/tidss_oldi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 0ae24f645582..82beaaceadb3 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -24,6 +24,8 @@ struct tidss_device {
 
 	const struct dispc_features *feat;
 	struct dispc_device *dispc;
+	bool is_oldi_vp[TIDSS_MAX_PORTS];
+
 
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index b0f99656e87e..63e07c8edeaa 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -430,6 +430,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
 	for (int i = 0; i < tidss->num_oldis; i++) {
 		if (tidss->oldis[i]) {
 			drm_bridge_remove(&tidss->oldis[i]->bridge);
+			tidss->is_oldi_vp[tidss->oldis[i]->parent_vp] = false;
 			tidss->oldis[i] = NULL;
 		}
 	}
@@ -579,6 +580,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
+		tidss->is_oldi_vp[oldi->parent_vp] = true;
 		oldi->tidss = tidss;
 
 		drm_bridge_add(&oldi->bridge);
-- 
2.34.1

