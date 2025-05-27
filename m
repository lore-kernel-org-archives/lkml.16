Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C3270572
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347892; cv=none; b=Zk2HQbyiF57Sm1Gj/ZWH0/lHTH+avNUNwZYl1317yjLmF6gSlRf+cwiFle0znqzCrvYFkukQN4xId7K6CERlVQfeNPLNalPZdTvxoxKqr7xAhttnVyaTlJasqIv6sOKtVp/4cAVhsbJfAx/MHbmRU6okuNDKpvp+mi/Htk1gKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347892; c=relaxed/simple;
	bh=L/0iOYUvrFmB2bU6oHMPLyfBc1hpgRFdxe/rWnvnSRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJA4tVmNVD/uAWp3lyTtSTk0NpCBa/L7iCsTjZ3xWQgTg+K32xulpVrbN2Y+524EEZn5KtzAua+A5XtrSqKrZEEqv+rCszoaPwFbLhyNC6ks/a1KYOSD/uqGWJTJbbKmzBbQFaWFvVvzTSJ2B+MYFtMVizxGa0itYUXfIEsXoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KSunYObP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KSunYObP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347888;
	bh=L/0iOYUvrFmB2bU6oHMPLyfBc1hpgRFdxe/rWnvnSRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KSunYObPflWL9GGUUmQrltwsBZFrF//8xb/ZwvnnwfnzXuee++51PPlosdDpZ5YCV
	 kPnF/xDzGKO1sp6I+CmiYdgC/pM/Y7TPQQRsY+hR6CbJ7qgLJpMluoPbhhuvGpaAV6
	 grXewBpOlYo3GNrr4au3qcYOL+exi6KNNqrwWJmt/FrFXEWoWZ0G5obO5eMh5/cEYl
	 4mavZ3UrEeTBux8jWf3axT1mBA5zAPBnbzeg/PzeCiB/he7Z2D+24ROnD2lUS++kno
	 o8mvFaISPy/l4JWHIT5Hoxyf2emFFcrw3sbjdyFlMrttErbIfZfxyUZg0uOr5H9kZG
	 Qd/ns9o5wSJ7g==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6D3A017E37BE;
	Tue, 27 May 2025 14:11:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:16 +0300
Subject: [PATCH v5 08/19] drm/tests: hdmi: Switch to 'void *' type for EDID
 data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-8-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
X-Mailer: b4 0.14.2

Replace 'const char *' with 'const void *' type for current_edid member
in struct drm_atomic_helper_connector_hdmi_priv, as well as for the edid
parameter of set_connector_edid() function.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..00576f747f1f36a100e13b0316cb492f76474d45 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -33,7 +33,7 @@ struct drm_atomic_helper_connector_hdmi_priv {
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 
-	const char *current_edid;
+	const void *current_edid;
 	size_t current_edid_len;
 };
 
@@ -56,7 +56,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 }
 
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
-			      const char *edid, size_t edid_len)
+			      const void *edid, size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
 		connector_to_priv(connector);

-- 
2.49.0

