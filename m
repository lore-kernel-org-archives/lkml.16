Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5AA241693
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576907; cv=none; b=PvxfSHzPJFzUjYQJHPpAl3VATbx8Lym/n0KNUnVBnh3fCFz9hLbpwHTF2sfaaDa4fhsZuFk7UCLbX6iJHNanLz88GmIuuZ+RNlT9uAy8nmIJ9qh1eKKdko1eu8vQlzezr7dcwxkUD/e21VLkZhy0hmEwnQX6LoUhEpBFyN/FfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576907; c=relaxed/simple;
	bh=hj8rzcU5KaXu33k1FiIJ/Tj50IiApAELLP5G/q5n02o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdJF79rYdugYzo0vQqJerSAtRWJEYG8jmA0JWI9tpzoI/3RILWrtSH/8nUgyzzFH7l3n6bEM7bT3w5+wbfn3OCyNE8+8g5sF6bbB42wZhh7sz6H+QIzOg6x2Mzt+j+7rPMUF8lMTlxiKqWl5J4QQqIr5aCr1MJlCBAxjGDhH6Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m7B2+5nf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m7B2+5nf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576904;
	bh=hj8rzcU5KaXu33k1FiIJ/Tj50IiApAELLP5G/q5n02o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m7B2+5nfaG59Qa/hVbWZN6j1uUxKCjcQYIVy12iv5wMQD7sR7SJpvqF+Dmy+E9B7H
	 Uh/rctL53vKy01DKUWGGsp6UnM/VEbgvVexKU26WF1B9+BAO1psuzW3mYw2sfh7b5X
	 3AJWX+rgm6YRR5iw3+s5hy33F8GXeA2zJM/AONmiO2W/GvD/bJDixuYuOZ06Xy9Bxr
	 kKyc1M6XPAcpEKcfkusR/iWJ4iqm2C//8hk1GIF8W0xWyVczn0OZG3LfhrwUSv+fRc
	 f7+Ww1lBEiQdXQ7cqCT/AR6ZYlh/9wqf4i2un9r0cIb7xO6lcdVEBV6NB1/2fZUN8Y
	 NLlUqktKNdvZQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 8FA7017E3626;
	Fri, 25 Apr 2025 12:28:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:58 +0300
Subject: [PATCH v4 07/23] drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-7-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
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

