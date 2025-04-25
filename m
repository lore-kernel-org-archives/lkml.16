Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E623D291
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576905; cv=none; b=YymJL5mrJ/uRsVV+9JZZDYdD0KN4T+U2vKMKg3GVpyyef4+4Snm9OttQEa2fGYdKqJEG1X6YkunwcB6rK8R1682BwjBy0wU+RUhiXGGisOoMvQj2Y+evLl5//XeLSVX++/4F6TnU9nBfvBi9pi35gcPq020TcKp4/4ifc+ujmO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576905; c=relaxed/simple;
	bh=PTKc0qMhyffZmkIeafEd7FOxZootMCBO9iPVf+gzXDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4cKCBOy3G56lzU3IbSIh+73U/gmf33JxhuPqTv03IUHsb5pcLgV5BQe5Dme0gez5iJDDJKYOeKHJErvawOp4U4CkW5ftr8qcY41tKZ/Z+gonesEJSQikXnXeiYt1nsEMO768kD84nxA7B4tHMGPQ3OBI3txcwc9irY2dogY3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DKtrVxXE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DKtrVxXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576902;
	bh=PTKc0qMhyffZmkIeafEd7FOxZootMCBO9iPVf+gzXDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DKtrVxXEHk3txw0YxSnaTgKnbbFLqG5dt2pS0uBplLjIFGtzTyOtBv2gR0SSBvYRu
	 W+Q2A/wTHXUfIvAA+sW8Tf8MovG5fZ/57PWjpB7Xcnj4N32L2LAGUrZZhX8/wAJg3t
	 c3MvxfaY689KGZdlH555qHFNJevrKP1W7zoMtLBKJkLO2KmZ+Xk8Psd0FYPBaGrMa8
	 ct3AKfAqNtscIgkK5rRJHZDmq3aJ2fWcFlxS92KL0EjddgPxGW7v7HRM+nyPxuVWch
	 R7isXPYov/uTyXPFY9ii+5Xxg+pKFWdTCdt/XB9/s7IgskKzsiutX8SbdkDNQHE61G
	 tJyCIGa56pB0Q==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 263B717E36C1;
	Fri, 25 Apr 2025 12:28:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:55 +0300
Subject: [PATCH v4 04/23] drm/connector: hdmi: Add missing bpc debug info
 to hdmi_try_format_bpc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-4-5e55e2aaa3fa@collabora.com>
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
index a0cb3163f457635cf27e53b009bd83f85eee9336..f54eb5c594cddbd67dfacb5e06d54e9ce7851013 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -578,8 +578,9 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Trying %s output format\n",
-		    drm_hdmi_connector_get_output_format_name(fmt));
+	drm_dbg_kms(dev, "Trying %s output format with %u bpc\n",
+		    drm_hdmi_connector_get_output_format_name(fmt),
+		    bpc);
 
 	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
 		drm_dbg_kms(dev, "%s output format not supported with %u bpc\n",
@@ -638,8 +639,6 @@ hdmi_compute_config(const struct drm_connector *connector,
 	int ret;
 
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		drm_dbg_kms(dev, "Trying with a %d bpc output\n", bpc);
-
 		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
 		if (ret)
 			continue;

-- 
2.49.0

