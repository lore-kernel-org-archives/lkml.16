Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473326F46F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347891; cv=none; b=h17gknZCLg2gQrIDqLwKzwBzgFYkqZwz7uCm+txvj1m9OXgMhQgdcs/XOsoH0Ih44YNHaBd+VIxM0nfub+kt+JdWkaztFxJvY1H4+PBxBAsIZ/N7hDziAv1zPxmmO3DCOfILx2amrPKE8pZXaXFHiXoEMImo5sf3q21CDgVx1+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347891; c=relaxed/simple;
	bh=NruFgDuKcybA47PQbjsX1kS5Pj95cphmU3z7U+LSFiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClkY+QbYQv7+GTnhxMQlcmuyNVZc7bcfPSznNdZlRiKm1HUshbZGC0mFrnmYgeEp/DLt7HYIIMYzWQrJclGt99IEdh0W+E1R7IT6A1ymJACo4/z/FUIbast22n9A73QR/HNxN2UeXhXDmYbRXciCktR3m/hqs3EZPqKpbG95+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p4vMYG9R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p4vMYG9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347887;
	bh=NruFgDuKcybA47PQbjsX1kS5Pj95cphmU3z7U+LSFiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4vMYG9Rh57T4duGrZ6KfXVGLOH4S6eZYLNFHtyMzg1zG3HoFPRcecPP1qpMYNv4/
	 D8kY4QgYa2VL4FZQtS2fEo5/eDkp8UHFPA7a413V6Jh9W1ohxEiTPv5kwxnC1dtugA
	 lW3GnOnjzoA8dzFr6jsPbEPkQ6VD7ryufue9GbAEqDWvSfGTg+b03B9QxAeVzEmSAb
	 UDUCz1gFs7/8VVgQqAutTiGN3OwKOAJj6OCWebhBxvv5LXV6zIZPdcj9Z2oe5GJ8Cs
	 Spx2RQBqHqROXyOFlkORJBAFmLS6kj4o99enm9p/EWsGsAxif5I5D5pntLfW6mbLrJ
	 atI92u7ehEuEA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 96D0717E3789;
	Tue, 27 May 2025 14:11:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:15 +0300
Subject: [PATCH v5 07/19] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-7-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Improve consistency throughout drm_hdmi_state_helper_test.c by replacing
the two occurrences of '[_]MHz' substring with 'mhz'.

As a bonus, this also helps getting rid of checkpatch.pl complaint:

  CHECK: Avoid CamelCase: <reject_100_MHz_connector_hdmi_funcs>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 7ffd666753b10bc991894e238206a3c5328d0e23..c8dc6fa0f925e35e9903a18bac7f78f9d8165960 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -89,15 +89,15 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 };
 
 static enum drm_mode_status
-reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 					     const struct drm_display_mode *mode,
 					     unsigned long long tmds_rate)
 {
 	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
 }
 
-static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
-	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
+static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -1934,7 +1934,7 @@ static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
 	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
 							  BIT(HDMI_COLORSPACE_RGB),
 							  8,
-							  &reject_100_MHz_connector_hdmi_funcs);
+							  &reject_100mhz_connector_hdmi_funcs);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;

-- 
2.49.0

