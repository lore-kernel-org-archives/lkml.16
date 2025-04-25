Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EA242D80
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576909; cv=none; b=SZKd1UzFLuIciYfXQA2d31NvrP3B4z/a/hcksEH7P3hVvN0QSBsVjVlXP+6GSGB2plFvjJFmhajFc828+OtuUEBsopauJgrVyY065vHETplgBw6peeG9DW9IEFjrNeSzA5ZsGlSKjFpEGwD0bUJAVpTNvCdc3S0Xav0uHIrsB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576909; c=relaxed/simple;
	bh=gAIP7DBJR1I+Pay7YI7x/+8SSQw+HDHKnXhqLk+agE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMwu3h6hyhCZ+OBd3PdWGD1+s6e7sXWFZlxJ8Sn51VFShn/fniGu4ZzLS0otVgSg7ThLvqYhSHRGDD4jE3CZFJ/qC6nY1dyT8HfCPXOKvdiG+WMd7heA6qSaaegiOMUnrPo5eEJ0E/jrxlsanBUVLA18fKwfhhCG/ibi6c3ezuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Kiif7nTb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Kiif7nTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576905;
	bh=gAIP7DBJR1I+Pay7YI7x/+8SSQw+HDHKnXhqLk+agE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kiif7nTbc9TUu8Oc80gEVJlh8BP7OGWIeiWDrlHq2wED9GkOD4ptR5V+/XBkiPfYW
	 Wa0kccLC2Dp5LVUmPzNQjKBqc/nXmOPvjrmCB/7a/iXmZnBC/Db6OQvtY//BsBqh58
	 BFp+/8bldGnq638s1/x/cnAjwc1nDMTl7zecaSligIElb4psNnQisrPjMzuzGV/rr3
	 qPPxKAynhOT/8mA+UXWOtds/e700c1KnhhX4Hzq2eql6u2Q3GLnCAojA4D7KEyvofu
	 2eM60+E547Ad5Rrey1GUPsqQaal4PtCsKUciaZYnlZtCXiluFg8utjBAG2uKy2aRRR
	 3GZEA7pgJpFSg==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6D33B17E362C;
	Fri, 25 Apr 2025 12:28:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:59 +0300
Subject: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
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

Factor out the HDMI connector initialization from
drm_kunit_helper_connector_hdmi_init_funcs() into a common
__connector_hdmi_init() function, while extending its functionality to
allow setting custom (i.e. non-default) EDID data.

Introduce a macro as a wrapper over the new helper to allow dropping the
open coded EDID setup from all test cases.

The actual conversion will be handled separately; for now just apply it
to drm_kunit_helper_connector_hdmi_init() helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 +++++++++++++---------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..36734639d19a3f279abc4631eb19d5c2b20ca315 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -140,10 +140,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
-					   unsigned int formats,
-					   unsigned int max_bpc,
-					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
+__connector_hdmi_init(struct kunit *test,
+		      unsigned int formats,
+		      unsigned int max_bpc,
+		      const struct drm_connector_hdmi_funcs *hdmi_funcs,
+		      const char *edid_data, size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -197,29 +198,38 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
 
 	drm_mode_config_reset(drm);
 
+	if (edid_data && edid_len) {
+		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
+		KUNIT_ASSERT_GT(test, ret, 0);
+	}
+
 	return priv;
 }
 
+static
+struct drm_atomic_helper_connector_hdmi_priv *
+drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
+					   unsigned int formats,
+					   unsigned int max_bpc,
+					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
+{
+	return __connector_hdmi_init(test, formats, max_bpc, hdmi_funcs, NULL, 0);
+}
+
+#define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
+	__connector_hdmi_init(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
+
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 				     unsigned int formats,
 				     unsigned int max_bpc)
 {
-	struct drm_atomic_helper_connector_hdmi_priv *priv;
-	int ret;
-
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  formats, max_bpc,
-							  &dummy_connector_hdmi_funcs);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
-
-	ret = set_connector_edid(test, &priv->connector,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
-	return priv;
+	return drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				formats,
+				max_bpc,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
 }
 
 /*

-- 
2.49.0

