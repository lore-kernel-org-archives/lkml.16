Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DBE239072
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752267; cv=none; b=RtEPJoJpr7vagi/ajwAMV72XXpLqABb7pCjocwg/WYJNAsbvIt0vt2f+xAZlVInDWgIvGxBiQ7aRkMkrjS5Rjldo4VSpEE1l8TGY4PKu92h8JyyHpXanBy9EX8Feh+Mn4koIae3C3ibrLyerMT02GAz/kIGDNEnwfhg3nsrnUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752267; c=relaxed/simple;
	bh=QNNTeYMU6J1udgGIyv1nQlykXHdCCPdiaSVkqYwLcXU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pb3ohwL1cguiBe2lqZm3kvGDzVsF8HR8brJZite2nB3I8GZ3P5wUz3rrcDwFsJ/om7ycBOJZEeuHJ4y7uF0XtTKi1GpQEosc200MS+q2d95l5HoBwmTvLRACcYC6jMEqBdX26SUs+LFbbuMUvMWRGxJNSOh9BA8lGc9H7Eo9AFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uazzApeK; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uazzApeK"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O844eu1726985;
	Tue, 24 Jun 2025 03:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750752244;
	bh=33z9xxjSSjOnsngKmrms+RQUsseVC2988zNqt3R9UeI=;
	h=From:To:CC:Subject:Date;
	b=uazzApeKCnlkX3wsCdCxk/ZMDAdlwygmplmXGKp06egqPt4rxVCTthc0UL91S6T1V
	 y/fOFjAM0uOr2ywqkwBaBijCtlgwFEOvZOvZBq01gb3jPmEJsaRlHwF+zPJHlqc8Ex
	 56/TWckvKNelQ9EbqHRPeftnXHGVex5BDO1j/RRg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O843h21534973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 03:04:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 03:04:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 03:04:03 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O842jn1417778;
	Tue, 24 Jun 2025 03:04:03 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
        <tomi.valkeinen@ideasonboard.com>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH] drm/tidss: Set crtc modesetting parameters with adjusted mode
Date: Tue, 24 Jun 2025 13:34:02 +0530
Message-ID: <20250624080402.302526-1-j-choudhary@ti.com>
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

TIDSS uses crtc_* fields to propagate its registers and set the
clock rates. So set the CRTC modesetting timing parameters with
the adjusted mode when needed, to set correct values.

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Hello All,

After the DSI fixes[0], TIDSS is using crtc_* timings while programming
hardware[1]. But while testing on TI's J784S4-EVM platform, I noticed
that crtc_timings are not propagated properly.

The display pipeline there looks like:
TIDSS -> CDNS-DSI -> SN65DSI86 bridge -> DisplayPort

Consider the case of 1920x1080 resolution where the EDID mode has clock
of 148500kHz. After adjustment, the clock changes to 148800kHz. While
this change is reflected in mode->clock, its not propagated to
mode->crtc_clock.

[0] provides the **essential** fixes to get DSI working and its
patches are Reviewed and Tested.
The series improves the condition of DSI. I have observed that
800x600 and 1280x1024 modes are working now after [0].

This patch helps to enables other modes. So taking this up as a
delta patch so as to avoid respining v5 of [0].
I hope this approach is okay!

[0]: https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/
[1]: https://patchwork.kernel.org/project/dri-devel/patch/20250618-cdns-dsi-impro-v4-3-862c841dbe02@ideasonboard.com/ 

 drivers/gpu/drm/tidss/tidss_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 17efd77ce7f2..da89fd01c337 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -91,7 +91,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 	struct dispc_device *dispc = tidss->dispc;
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
-	const struct drm_display_mode *mode;
+	struct drm_display_mode *mode;
 	enum drm_mode_status ok;
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
@@ -108,6 +108,9 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 		return -EINVAL;
 	}
 
+	if (drm_atomic_crtc_needs_modeset(crtc_state))
+		drm_mode_set_crtcinfo(mode, 0);
+
 	return dispc_vp_bus_check(dispc, hw_videoport, crtc_state);
 }
 
-- 
2.34.1

