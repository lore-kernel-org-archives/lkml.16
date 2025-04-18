Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792D171D2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935690; cv=none; b=htDsjda8TDTV6sVBW1RdJte3surwzS2vBwPGDt6wkyn7g5J78nE92vEBdAhYRXsl8f9fKxNE0DVq2eR4jxuUpp+i7jz7MBy9X8to4sfChNWyL2ok8R7Wvo1+Ky6P9dAVMBpmfL0N1UTl3yuDkDEnvUqNyz4A5uufTO+PGLu0BzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935690; c=relaxed/simple;
	bh=0Wpx4d2+yZiKkA9tDn0IJZm1Vft/zF3+F2AVmsrW4rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQ+0/gyBE4sRXX46OFnXptctF4ZgK00reQ/bcvgTuCoMaORUdAQHw6QbKoMbhwyxa9fk63JfItwfFKmo6ZUa7BjJl6tDvmJKBZqAh09LUB8z0/7NRyNPAS5OmEqcCUpTcOwZSnVmT8aVschGB5o7fzfh0kBHlrq0YIy+oH4JUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ogchH08G; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ogchH08G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=n5RAqA3OL5SQ+Vv2m3AsajeMYO7tR1OhXLpj2nJvWfQ=; b=ogchH08GG7S6jGFs
	zZSPUt012HvnLilKm0IUmbyVAHlKlq/QbrIj6J+RV9iTovW/Ujkz6xkgbt3RsZzY7JzPzbVKw1LLZ
	zBGOxVZRuYfRok0OMg6qe7BysWO1K1JuY+hAdrHCyyiQfYcUOUMOVOnG6Mdq4C0jW0GYpQ84Ovbgj
	i3MoWUM+/vcGu/l09CiGMf2D3pN1I1zOHNxdaZoXCjZoroOIQA1UpCw/DLKM0yfpt8NYcSEAQ98hj
	cb9hoAJ7MdDlqfB41n14xDEwmwgdsW/Hy9HRyYjOZ5hkAjnQ1vrrBO0g/UIHZlwf8acaeoC6E+Gpg
	ucVqeS6KKdO4QgM/dQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u5ZTr-00CPl8-02;
	Fri, 18 Apr 2025 00:21:19 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/4] drm/radeon/radeon_audio: Remove unused r600_hdmi_audio_workaround
Date: Fri, 18 Apr 2025 01:21:14 +0100
Message-ID: <20250418002117.130612-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418002117.130612-1-linux@treblig.org>
References: <20250418002117.130612-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of r600_hdmi_audio_workaround() was removed by 2014's
commit 6e72376dcc66 ("radeon/audio: consolidate audio_mode_set()
functions")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/radeon/r600_hdmi.c   | 22 ----------------------
 drivers/gpu/drm/radeon/radeon_asic.h |  1 -
 2 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/radeon/r600_hdmi.c
index 661f374f5f27..9758f3a9df75 100644
--- a/drivers/gpu/drm/radeon/r600_hdmi.c
+++ b/drivers/gpu/drm/radeon/r600_hdmi.c
@@ -290,28 +290,6 @@ int r600_hdmi_buffer_status_changed(struct drm_encoder *encoder)
 	return result;
 }
 
-/*
- * write the audio workaround status to the hardware
- */
-void r600_hdmi_audio_workaround(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
-	struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
-	uint32_t offset = dig->afmt->offset;
-	bool hdmi_audio_workaround = false; /* FIXME */
-	u32 value;
-
-	if (!hdmi_audio_workaround ||
-	    r600_hdmi_is_audio_buffer_filled(encoder))
-		value = 0; /* disable workaround */
-	else
-		value = HDMI0_AUDIO_TEST_EN; /* enable workaround */
-	WREG32_P(HDMI0_AUDIO_PACKET_CONTROL + offset,
-		 value, ~HDMI0_AUDIO_TEST_EN);
-}
-
 void r600_hdmi_audio_set_dto(struct radeon_device *rdev,
 			     struct radeon_crtc *crtc, unsigned int clock)
 {
diff --git a/drivers/gpu/drm/radeon/radeon_asic.h b/drivers/gpu/drm/radeon/radeon_asic.h
index 8f5e07834fcc..9e697f10f9ca 100644
--- a/drivers/gpu/drm/radeon/radeon_asic.h
+++ b/drivers/gpu/drm/radeon/radeon_asic.h
@@ -401,7 +401,6 @@ void r600_audio_set_dto(struct drm_encoder *encoder, u32 clock);
 void r600_hdmi_update_avi_infoframe(struct drm_encoder *encoder, void *buffer,
 				    size_t size);
 void r600_hdmi_update_ACR(struct drm_encoder *encoder, uint32_t clock);
-void r600_hdmi_audio_workaround(struct drm_encoder *encoder);
 int r600_hdmi_buffer_status_changed(struct drm_encoder *encoder);
 void r600_hdmi_update_audio_settings(struct drm_encoder *encoder);
 u32 r600_get_xclk(struct radeon_device *rdev);
-- 
2.49.0

