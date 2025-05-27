Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54CC270EAB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347894; cv=none; b=lZEqMJCtluQoAnS4+oeWumkI0MTK+EfPf9bHXmvWX+EIkFr4DEZJ4k4MU0kiJzVkHOOnQwbKPnJVg2iI20+yJrcEVeX/QLNxj7mQl3DdkGLZcyzMn95KQHkGZVSQRA1qNQdmbiw1YDVhHJhpqxF4t1hkW+Jrb6qRtk17or8QqeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347894; c=relaxed/simple;
	bh=1DuTA5HzhC4tan5w27hz1UdHQupn7FllR02MG7+gbxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfVCaoCBbu4+yrfjpcLJMjrsKLL9u2g2AGMBaEhxlAOBCc/AomL99Lbm+qwtyFi9ehdQB5D9WoeyrNWjxboEr/PKhi8W7XY4wqiPpMc51JsxA03UoNDjNA9HilvpULislyG7Xb3sqPoLs39Q52PrUGXvw44PSZzjIrjgwRhsHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nmxZmoM1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nmxZmoM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347891;
	bh=1DuTA5HzhC4tan5w27hz1UdHQupn7FllR02MG7+gbxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nmxZmoM1lXW1lTEq2BqXzI0nIFfMihdrRRv5Ak7Jbu0h2SBVGzvVmoNIOA/ZK0C/N
	 CUfC3B0JnxoYMOeSWUugOilPudLJGSKRoFrDrmnxyGUykOd3v1QD8sjzaW/SmgHPW3
	 qZWmkkUOo2BCWaRm6/Kg+k5TOJBonnpxKYfnaoRdQ9gApJQg99LxkQ0vhWXV7uSZqR
	 JA1rNABoXUa2Gwysc/rs/nsguxkiWY/Uk21m6oBeGxXsZvgvg+QySoQ10pSpCHhGqN
	 o1EySuEjqEqhURL6eQs/AdtEpvjcq42QxBKd5g4/KKZtjJdsG6G69YWp9+jUu1X52C
	 5CKBTUItnG3Cg==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E41B917E37CF;
	Tue, 27 May 2025 14:11:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:19 +0300
Subject: [PATCH v5 11/19] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-11-74c9c4a8ac0c@collabora.com>
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

After updating the code to make use of the new EDID setup helper,
drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
it.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index b8f4dc677be7c8833a2cb09aa6b44b5e9b2f5378..64037110bcaa9713999d77a254fc9377170a41bb 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -206,16 +206,6 @@ __connector_hdmi_init(struct kunit *test,
 	return priv;
 }
 
-static
-struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
-					   unsigned int formats,
-					   unsigned int max_bpc,
-					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
-{
-	return __connector_hdmi_init(test, formats, max_bpc, hdmi_funcs, NULL, 0);
-}
-
 #define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
 	__connector_hdmi_init(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
 

-- 
2.49.0

