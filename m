Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2347C269806
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347888; cv=none; b=JeWJdUdHbxwd1I9yzhROIwvIXR/AG+x7VqsjQbs0dLWiGWo8G0zhXJU3IBVzsk6YPwl/iaxB+z9piKZT2wkdyxK7me3xNwSQ6sU/NLP1CXMutA8d6x0bVw36JzbBGDmW82SXIrV5WuHdVmvPCbjE0vZ5CmDw7xuKWNuYRcC3APc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347888; c=relaxed/simple;
	bh=nijtXNzysgHLE928c8E4bJ3fEU89OD4M7b36fpgO9SI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D86w22MvMr6YEEe6dIdVHx3z+WHX1Dj2BeFVfvnuuD3tBrzKV6LE41BiX5FN0B4Xg5+8NBcyD37zehonKwrfE95TooOE1JtGvNf6o948BQJ9J7aMkf5lrBWs5m4WYt36CpEt7ncgrg5pZE2LjUa05XO9obGcoxgX0NvS2jPoZA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CfMsGv9k; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CfMsGv9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347885;
	bh=nijtXNzysgHLE928c8E4bJ3fEU89OD4M7b36fpgO9SI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CfMsGv9kZInhHbdfDUdwGhHCl2qSm19UN7WZWqGPIEuzk3Ic8KhqkfN4Ytoz1rCnP
	 6lCNCLMEgdv5vWqvXQYxX8t0jULGhMrEgIWWo9VdPyg/gjyMWci5lPMPgDO7sMTgxK
	 80LC/8hr9VcgdOvguE+a6weuZ8DKdc/SwhqK3uVj90Angf8FjDVMqC2NGoV7sTGDSo
	 833FwIC2b/PKR9RNlBgWzarRWjyvdzHJ4pOVw5sfC+TT7k8sBoFSIXM34JOMOhD0d0
	 XjAyRxEq4nH0fMYurqLD358VZnL52/fmx6E+5qSHtX6bsZYPnCTwSbeppKukRIXe7Z
	 5IAALtMWs7yKg==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1721017E378D;
	Tue, 27 May 2025 14:11:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:12 +0300
Subject: [PATCH v5 04/19] drm/connector: hdmi: Add missing bpc debug info
 to hdmi_try_format_bpc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-4-74c9c4a8ac0c@collabora.com>
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

The very first debug message in hdmi_try_format_bpc() is incomplete, as
it doesn't provide the given bpc in addition to the tried format.

Add the missing debug information and drop the now redundant message
from hdmi_compute_config().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index b05099c18f64a9cf1acecbfca8c9117b753117e4..45a650b461abdfa50787a92a9d65f48c97f317a7 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -579,8 +579,9 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Trying %s output format\n",
-		    drm_hdmi_connector_get_output_format_name(fmt));
+	drm_dbg_kms(dev, "Trying %s output format with %u bpc\n",
+		    drm_hdmi_connector_get_output_format_name(fmt),
+		    bpc);
 
 	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
 		drm_dbg_kms(dev, "%s output format not supported with %u bpc\n",
@@ -639,8 +640,6 @@ hdmi_compute_config(const struct drm_connector *connector,
 	int ret;
 
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		drm_dbg_kms(dev, "Trying with a %d bpc output\n", bpc);
-
 		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
 		if (ret)
 			continue;

-- 
2.49.0

