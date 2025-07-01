Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4826FD95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363781; cv=none; b=eXsLNhWDkE26NxD5mAJrx655u/iv9QhvDkvpmQ4TmnqE5NvGLF9RqxNqHWyodwwblGB20EGkapma7VfWOwhajsPULrlORna4fZdEhIfyjldf353aq1gveCrya17lxQU7/j+yEpaOxUXeDLw8OFRpCIzSCvdjR8QjwoNBtQmGaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363781; c=relaxed/simple;
	bh=Ht+CZLzb/417M0V9ezmlPD5RQoFR6MP7ke+kkzZyze4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mbVzLVlhnjmT35YVDttP6ZiAoatl0RDJYpxcug7O5quL02KaSdUme0rqssYVBhKr5gXMTbnXxG2U4A3sKAusHMLXNm/Os+aIf3TweMnu2jCgdt7qEVA9qI7AAD4Mo0EjlrYDkd4j0W1XHDnv5cfd62/r3ZZlwrf13C95vxI8dCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qAUxejhY; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qAUxejhY"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5619tlSa3596182;
	Tue, 1 Jul 2025 04:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751363747;
	bh=ywrZgXJg88AM7XP2laOSpIYJV1lgOH9RNo8T7VwMTUw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qAUxejhYRjlbU29YTmN97sgp+SYir4/oHXpeNlYnDpX0HdpV5nlEy3hYZ+MmNvha5
	 kQ4Fr63ODiY1TLe6cjaIOwbUem7RCv0mEnq5KsHLYQ/3EO7bRCUt+XLgP4ZHZsK9Q7
	 ZoiZlsL94c5TTp8g+p2RZLxaDPr1Ka1mSYMT7j8U=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5619tl6P3972674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 04:55:47 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 04:55:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 04:55:46 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5619tkuA1073005;
	Tue, 1 Jul 2025 04:55:46 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>,
        <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v3 3/3] drm/tidss: oldi: Add atomic_check hook for oldi bridge
Date: Tue, 1 Jul 2025 15:25:41 +0530
Message-ID: <20250701095541.190422-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701095541.190422-1-j-choudhary@ti.com>
References: <20250701095541.190422-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Since OLDI consumes DSS VP clock directly as serial clock, certain
checks cannot be performed in tidss driver which should be checked
in oldi driver. Add check for mode clock and set the curr_max_pclk
field for tidss in case the VP is OLDI.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 63e07c8edeaa..a1f5fb39b32c 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -309,6 +309,29 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int tidss_oldi_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
+	struct drm_display_mode *adjusted_mode;
+	unsigned long round_clock;
+
+	adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (adjusted_mode->clock > oldi->tidss->curr_max_pclk[oldi->parent_vp]) {
+		round_clock = clk_round_rate(oldi->serial, adjusted_mode->clock * 7 * 1000);
+
+		if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000, round_clock) > 5)
+			return -EINVAL;
+
+		oldi->tidss->curr_max_pclk[oldi->parent_vp] = round_clock;
+	}
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.attach	= tidss_oldi_bridge_attach,
 	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
@@ -317,6 +340,7 @@ static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_check = tidss_oldi_bridge_atomic_check,
 };
 
 static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
-- 
2.34.1

