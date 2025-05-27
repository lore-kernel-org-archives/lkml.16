Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95021267B73
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347886; cv=none; b=ABQjlgmCfiGrV9n8R1wOYqVmxhJdtyme2FEDVretkVxJ8908Gd9UqUP5xXj0OuEmSnxH1XSxelKp0Z6GZZXoET87gitMKCvs/QFKp4HjyIugoRUobLtJMjM69rB/5ASx9kjkHgB+oVTOfLd+1nk5P+LsOm+PyU5md1TQrEE1tGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347886; c=relaxed/simple;
	bh=ertypj0AnpHiBou1hqzJWD+8cegVzAjr/+BAe6GSyhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koLebZKOliuIhseDv9hAC5HFf/6gjxJ0GxEOn6v/OtvQIAyu2NRM6+ABx5hqWvKqgQeTQGqWScT5I/bi1hW9mZkUJK8nnp6VTaMUamN6alG1ePbp/ZPvvE5sOec2as6iH1JwhnqgdkIlYFH1A+KDcV+hlzUIlKJYY4f7lBwGuts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZbJXsSCo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZbJXsSCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347882;
	bh=ertypj0AnpHiBou1hqzJWD+8cegVzAjr/+BAe6GSyhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZbJXsSCoZqaJYHC8sILS2YjrZEFImXntFuL1yZI0v+JcZbnTquViCcKeAaQyOUBH0
	 DE16Nhm+KTPrBuHS7MUy8OxFTxF7JzKuWDF4dDd0sUeKJcbhi0y/HKq505CXYuOdBk
	 Pe27qW47SkVBXCpQhM11Pd2xg3TvRDeAPRF6rtFwjafQ6I0kWDEzD2OWT8/GkOTxPK
	 bN7fH9Hxl4AYStUXf+eWxS4lbi5NJj7PvgLLFM2VLWU3dRR1nEct6WLn5ybsxb2sv5
	 xxn8ivH9XWX850w3EO2h4lkwkG5xbQ6qFFBlAPG58EUrc14i9scRVU/B1YYDdyZeHB
	 MBcyjt4qgFvIA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7DBB217E0FA8;
	Tue, 27 May 2025 14:11:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:09 +0300
Subject: [PATCH v5 01/19] drm/connector: hdmi: Evaluate limited range after
 computing format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-1-74c9c4a8ac0c@collabora.com>
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

Evaluating the requirement to use a limited RGB quantization range
involves a verification of the output format, among others, but this is
currently performed before actually computing the format, hence relying
on the old connector state.

Move the call to hdmi_is_limited_range() after hdmi_compute_config() to
ensure the verification is done on the updated output format.

Fixes: 027d43590649 ("drm/connector: hdmi: Add RGB Quantization Range to the connector state")
Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index bae7aa624f7db61cc7d5ff7a86a413938963543f..97cb4f29c4b5d88f4b6288bd93c6abb33bb7c17a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -799,12 +799,12 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	if (!new_conn_state->crtc || !new_conn_state->best_encoder)
 		return 0;
 
-	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
-
 	ret = hdmi_compute_config(connector, new_conn_state, mode);
 	if (ret)
 		return ret;
 
+	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
+
 	ret = hdmi_generate_infoframes(connector, new_conn_state);
 	if (ret)
 		return ret;

-- 
2.49.0

