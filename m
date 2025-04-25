Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC1244684
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576910; cv=none; b=Fr0FMHnSu0JFB5NCZQPS4T4U4u+lG7f6q5h5S/hdFxTkP5nTOnxloZlPhuafdA3keF/e+EB78zcwOQsQnUTvNRRcSy2c3otZp8uDUB9NkUI+juQd6b3jY8ZrOQ9ATbCWvEbHBeZobezr3Y75vYwZmC5FIB+4nSG/UHFifsSsQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576910; c=relaxed/simple;
	bh=4lg+tZhIc+oaFlZ18h7Sr9PgPxrUHhP/ALL5+NI4Jyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/PiUhfdJRvZ7yk0YrlL94lEAxREIakXsQtXLxkmr2DKbs3veDsh3mrHxb+kZF/uj+FTCxzC12CuVunvTmQIRYIFI5yWx7iZzIv94DlkUgUqy1i3KBIJdeCS19fk+jV61K1LM1N640fTweAjsVDIpPQBHgcLcFSncOsodcK2HwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P4AwPH4P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P4AwPH4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576907;
	bh=4lg+tZhIc+oaFlZ18h7Sr9PgPxrUHhP/ALL5+NI4Jyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P4AwPH4PNP5xKBEwfNCTd9U+rJZFZoIr9bvKx0s8P4BNFM3vWRJ3eKIyCzET3FYoU
	 xe5GEf9gEVEsAHiQ8oCwV3SvueR8u4qM04vGepvywnB1FhjjAybMsLXriGdg87K6LA
	 wVH/qY81lHF0nbST8asPVa8lAN/w+IQOk4rgWL8MctONcvdmC/ONjnXVvF2nNVP8Uj
	 yCuZDb5qPvv4lsE/uzfiF6NdfJXBVj91hwr9vCw2dE5n9s54/kE/kQEVZ1tcRHWspV
	 LNgfkHsmexdqUANf2PVkRhREDrM57mq5tPTrV1EBtPA853RLh/E+bf2+muCveRcEJB
	 Y4fdHPXkOMj3w==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0C43517E36BD;
	Fri, 25 Apr 2025 12:28:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:01 +0300
Subject: [PATCH v4 10/23] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-10-5e55e2aaa3fa@collabora.com>
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

After updating the code to make use of the new EDID setup helper,
drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 921afb732797f1530d3857ea6d951c5df79d42b4..6b4000aea2f2eff373c803d95c3304281c879176 100644
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

