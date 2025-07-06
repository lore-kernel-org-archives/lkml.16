Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D3D1865EE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751834722; cv=none; b=Z+sWf0dKAZKTdNjUkvEM88iP/rnC0FrjlA9f5g7GIU0LyCZvsVTCjSHD3fHxdhTmGYS2a6yHDaGYLx3/b0B/wcGvU9mdlaXBI7RwJ9EtroI2Fs1wvjznLDOJ3RPF8dq/qsqmslAFnhMgZboi/sX/RsfsHtQepTXrd9Nx82oMlZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751834722; c=relaxed/simple;
	bh=fHTkSG5iV3Yyo/h1LA3Y2voIyx/LC1QXbp7R47QKoTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVzd1fJNQVVkGTCc873B33ikmx1MKmhe/hppOfPJD5rtY+Oh8Wi6Qb8mYqKSiuiekeJYDRU6aIMYskjacyPLQ5nW/qbsN5BAtNGaoiLKp7H2qRdoDitFjwIn6QpVMlsAKYcP/KLA3JYug1SPesZ/RxjzKk6AOTUq9shVEUdSwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=HsQK1gGj; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="HsQK1gGj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751834714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XA19Sq9V/6MzTT7NfJNXG6OWdDuf4KxdwbnjQRqh6JY=;
	b=HsQK1gGjHeJp3bjespEArsTx0gRs1S37mkwpkNEmm0eovpkyCr+L7pZGj5zP7h8kIdbQAM
	PPFZfU7rWb5ObxQDi4aPllBJ1hbTzj5kNkdmiPww5g8yicH5XFD8qq7uUeEwtm0EQUHgOK
	WLDhvSWSF0Izi/uS4FPOQ1tO7ACrCdI3JYSd+YfwgP12ubusOh8pbPbVFi5kqzVSEaTGiU
	rD1SmE4Q5yIECKFxYH1qPunkxODDBB0kM4M76Mfb95+mHOO1UN4hHfTti0+glhEY6pg8vC
	8m+YqtwKX8z+eX1ta401f8gP9r47jmG2sqf1w9BDkW74G5E5IgdrG1AO9Qtbjw==
From: Val Packett <val@packett.cool>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Arun R Murthy <arun.r.murthy@intel.com>
Cc: Val Packett <val@packett.cool>,
	ankit.k.nautiyal@intel.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/dp: drm_edp_backlight_set_level: do not always send 3-byte commands
Date: Sun,  6 Jul 2025 17:42:24 -0300
Message-ID: <20250706204446.8918-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

At least some panels using the LSB register are not happy with the
unconditional increase of the command buffer to 3 bytes.

With the BOE NE14QDM in my Dell Latitude 7455, the recent patches for
luminance based brightness have introduced a regression: the brightness
range stopped being contiguous and became nonsensical (it probably was
interpreting the last 2 bytes of the buffer and not the first 2).

Change from using a fixed sizeof() to a length variable that's only
set to 3 when luminance is used. Let's leave the default as 2 even for
the single-byte version, since that's how it worked before.

Fixes: f2db78e37fe7 ("drm/dp: Modify drm_edp_backlight_set_level")
Signed-off-by: Val Packett <val@packett.cool>
---

Video evidence (haha): https://files.catbox.moe/sp1g9v.mp4

As this fix is tiny, if you prefer to fix it differently somehow, feel free to
just redo it yourselves without waiting for me to respin it :)

 drivers/gpu/drm/display/drm_dp_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index db7896c7edb8..7eaa118d78c3 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3962,6 +3962,7 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 	int ret;
 	unsigned int offset = DP_EDP_BACKLIGHT_BRIGHTNESS_MSB;
 	u8 buf[3] = { 0 };
+	size_t len = 2;
 
 	/* The panel uses the PWM for controlling brightness levels */
 	if (!(bl->aux_set || bl->luminance_set))
@@ -3974,6 +3975,7 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 		buf[1] = (level & 0x00ff00) >> 8;
 		buf[2] = (level & 0xff0000) >> 16;
 		offset = DP_EDP_PANEL_TARGET_LUMINANCE_VALUE;
+		len = 3;
 	} else if (bl->lsb_reg_used) {
 		buf[0] = (level & 0xff00) >> 8;
 		buf[1] = (level & 0x00ff);
@@ -3981,7 +3983,7 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 		buf[0] = level;
 	}
 
-	ret = drm_dp_dpcd_write_data(aux, offset, buf, sizeof(buf));
+	ret = drm_dp_dpcd_write_data(aux, offset, buf, len);
 	if (ret < 0) {
 		drm_err(aux->drm_dev,
 			"%s: Failed to write aux backlight level: %d\n",
-- 
2.49.0

