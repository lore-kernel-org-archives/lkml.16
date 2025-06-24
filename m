Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E9723AE93
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750743936; cv=none; b=VcIMRWakI2EowdfKPc1CV6TuXGl9hsbuSTIPgpppHnKRc/9eoNoAQTPYeSkw7lbHKDLc6y5OCY60c2BSU/DE57e2sAj49ZitqBlxdzFH+yktwp8c5pxdEeDXz9KVZDXZHBeAd0EddswUE9ZzyZQtHSy0CjkZEVoxWvHcVFF1WtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750743936; c=relaxed/simple;
	bh=OBAiCbAi6fVz+XTvyALcP8zJLR+pxp4JUShxX6scJoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXWBSDMAoHG0ge8/AxLWTpBkC9biLQhaPcmd9KSd86Jf7GIsZa13J8Fc24GvjE4HPgM3urZEEiObca7r6+ru7oq19h1HwrJ1AZ6ql1ENav4pJWMDSVcg/l5AVRH/Uof5pHrx+idMq2Vd/tDxyN2xa9svruUzzexmUWhQZakKAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e93eRH6i; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e93eRH6i"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O5ivMH1774783;
	Tue, 24 Jun 2025 00:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750743897;
	bh=OtCWgGi0zFu+dPj0LnaynkKRaG/pa3knf1ZXJVz9eTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e93eRH6iLuInIRefU0iGTonLHMLYvfMrUC20gFpNF/MotvvHIiRD8md628/4czEbA
	 8j3ZS2ZGbfZzEGjxKRSNDKew5OzvMSg1d50ZEi9fKi0JU45GDvoNfS0dusZm+ZNiwD
	 D9GDet+5ylN2ogiT6f8gxQ496ArsuKUnSIP6nN8g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O5iuYu4181716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 00:44:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 00:44:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 00:44:56 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O5it8t962013;
	Tue, 24 Jun 2025 00:44:56 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
        <lumag@kernel.org>, <dianders@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
        <airlied@gmail.com>, <simona@ffwll.ch>, <lyude@redhat.com>,
        <luca.ceresoli@bootlin.com>, <viro@zeniv.linux.org.uk>,
        <andy.yan@rock-chips.com>, <linux@treblig.org>, <javierm@redhat.com>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH v4 4/5] drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to drm_bridge_funcs
Date: Tue, 24 Jun 2025 11:14:47 +0530
Message-ID: <20250624054448.192801-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624054448.192801-1-j-choudhary@ti.com>
References: <20250624054448.192801-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add cdns_mhdp_bridge_mode_valid() to check if specific mode is valid for
this bridge or not. In the legacy !(DBANC) usecase, we were using the hook
from drm_connector_helper_funcs but with removal of legacy code, we need
to have mode_valid() in drm_bridge_funcs.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 872a2c4e1701..3ce0930bf5aa 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1998,6 +1998,25 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
 	return cdns_mhdp_edid_read(mhdp, connector);
 }
 
+static enum drm_mode_status
+cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	mutex_lock(&mhdp->link_mutex);
+
+	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
+				    mhdp->link.rate)) {
+		mutex_unlock(&mhdp->link_mutex);
+		return MODE_CLOCK_HIGH;
+	}
+
+	mutex_unlock(&mhdp->link_mutex);
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_enable = cdns_mhdp_atomic_enable,
 	.atomic_disable = cdns_mhdp_atomic_disable,
@@ -2012,6 +2031,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.edid_read = cdns_mhdp_bridge_edid_read,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
 	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
+	.mode_valid = cdns_mhdp_bridge_mode_valid,
 };
 
 static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
-- 
2.34.1

