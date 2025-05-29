Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EE11C6FFA
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748528751; cv=none; b=ArjGQ9rerXXWaqQHpXGuFTvYttWgrZurpEIDbADn2nT4vL33p259E8xwsY59UuIIqd6DgaZY6kxhXqC8T0QybNFMmb4iaiNvEspKV7LJ732GFWLDQJ7CxWOnZANvURCzg+DWOXGeYGj9EU1b177vygAlJH8P8hPZBT36p3B1ANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748528751; c=relaxed/simple;
	bh=SsjsGxTBvTGtRBP35SrLqNTHoP4g9IfX1SAOTZ0GYO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VNatc7hv8+nGcvMDic/VK8IPU33W7jGIKptDWt+WVD+1WhlLY/y15crupBsmSlW9bVelAiH4JF0F+Fd5/nVUpYXHvMMVHBqQqa7JbcbHYyeEk1Pf4wzT3+H8sHdsXBAzFx6I+kOaUeETY/vaCk2/m2MK2NuNuS/ltcFj41V/N0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yGY1I8wz; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yGY1I8wz"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TEPNgf2393285;
	Thu, 29 May 2025 09:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748528723;
	bh=kT8L7KgS/xkj8O7cmNhRhEJz+/ns+sOCyW1c6BAS/ig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yGY1I8wzSciXOsFoNEDUR6l7iQPYUS52oxynktF/PzReSJUzzGeRRqonoTvKmkgfh
	 CiFUTUS8G4c36F8167/HbHx8NtPIQEYeraMs1iyt/ixDNRdx1G+YPcKpS5dtRM2X5h
	 CB/orcUPg23n1Et2548Fkn1KUq7LHk3UzY6PVd9A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TEPNEg090812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 09:25:23 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 09:25:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 09:25:22 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TEPMhR1657176;
	Thu, 29 May 2025 09:25:22 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <andyshrk@163.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <lumag@kernel.org>, <lyude@redhat.com>, <andy.yan@rock-chips.com>,
        <mordan@ispras.ru>, <linux@treblig.org>, <viro@zeniv.linux.org.uk>,
        <a-bhatia1@ti.com>, <javierm@redhat.com>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v3 3/5] drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector earlier in atomic_enable()
Date: Thu, 29 May 2025 19:55:15 +0530
Message-ID: <20250529142517.188786-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529142517.188786-1-j-choudhary@ti.com>
References: <20250529142517.188786-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
NULL pointer while trying to access the mutex. We need the connector to
be set before that. Unlike in legacy !(DBANC) cases, we do not have
connector initialised in bridge_attach(). So set the mhdp->connector
in atomic_enable() earlier to avoid possible NULL pointer.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index df604c384bb2..97ecee98851f 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1759,12 +1759,21 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	struct drm_bridge_state *new_state;
 	const struct drm_display_mode *mode;
 	u32 resp;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(mhdp->dev, "bridge enable\n");
 
 	mutex_lock(&mhdp->link_mutex);
 
+	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+	if (WARN_ON(!mhdp->connector))
+		goto out;
+
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
+	if (WARN_ON(!conn_state))
+		goto out;
+
 	if (mhdp->plugged && !mhdp->link_up) {
 		ret = cdns_mhdp_link_up(mhdp);
 		if (ret < 0)
@@ -1784,15 +1793,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
-	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
-								   bridge->encoder);
-	if (WARN_ON(!mhdp->connector))
-		goto out;
-
-	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
-	if (WARN_ON(!conn_state))
-		goto out;
-
 	if (mhdp->hdcp_supported &&
 	    mhdp->hw_state == MHDP_HW_READY &&
 	    conn_state->content_protection ==
-- 
2.34.1

