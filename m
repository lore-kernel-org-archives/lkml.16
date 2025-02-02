Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C491D90C9
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498052; cv=none; b=P4NV4Ns5zgj865XAmW/twQCTcyPv52xoJpHcsjwlX5c5NYqoiPQdPFG5I3Ns8M1XYdmd973GhcqKgIyrYAuZVQFtwWAtwRqB71so7TZdUjG9gjV+ypWw/p6Rmy3LJtYGyeDcut78spE35z0B1GtlimaP9kL5T7K2CnQR/6VdVu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498052; c=relaxed/simple;
	bh=/bwxxqot5Orp4aaO3bhvKAHJmqfOaxqag+YV2Q0Zeak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8vS3tpaggfKgdQzbT9+XtMdmwIpkgwPlQv1QCTme3VRgHM4LocLmaCuj+MKZuWe0uxfBY0HMgzrQEnfRn0400oD8+t7OPylc0yhcOHQvWplTmgLVbxyuYvU/DExbDP51scZauAjhUi6xEly2/wNnQPYYemNdjInBOQKbw8OlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yla92dOB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yla92dOB"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c52000dso3540558e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498048; x=1739102848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jL3SY1S6z4Uid1XoM99vjSrcwjC3Oh5zHftbBQD0pk=;
        b=yla92dOBhmaZupvMxyXO2QiFyXL9e3oJquKrdK0FCO1GM26GxLlGg9miIpQreEoPjS
         va70OopGNRB4N33X/YbZBI8Yqef7LKlRlDYvtEWyoLf7FFSA/oTUiPxeN2gy8BQg7ebR
         11jBxgBCoWl/seb9xu3/Zs/5sEbRW6X86OgktBidnaiwNsU7by8dMpJl0AdOD7WP/6Ey
         SZTdzOhPsv4RwwT+CM7bV93mHoOByByXc9g/i8NaE1vU7OJyIvJJ07WskZGWU7p/YpIX
         R/gh+flD2XiEBIVr325qFoGtzxGTib3LS6GbE1Sd7mcGEqeOFEBbrJ3tI5rKUOw/X1X4
         Aa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498048; x=1739102848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jL3SY1S6z4Uid1XoM99vjSrcwjC3Oh5zHftbBQD0pk=;
        b=G3rT2j7Vhf3c/EtbIb8gSjSgmI7cvTtLzb5jfuU2U70K1HhBitrpcwHbROEinAHwQu
         7kd7qGSz6jheJkX+7twevb+5wPN3W7bxqh5YVERKu2fBlNJpw9DbL8awMcvuLHIQVcmh
         tWH7bOvuKfzmYgBCxy7AEzwU4jYxOnSoY+sqsrEaZBKxzhmzoQ6QrTFYmh/MbhmRQL8c
         zrPnjwacZvsYpWiExtNyGXtpR5ad/rBnZtKIgfXvkTdVN/vOhenOy74r1CP1m+aafcFN
         MD0H7j4V/GxNKb/E4EICsdfdKjknvlRc8ZNzbT7k9qfdBIAyFQ5YOTTbruEqp476up2Z
         yv/w==
X-Forwarded-Encrypted: i=1; AJvYcCU7k2nkSWDUrvc48OzMUHjoSO8amz+PAcSRTilOjIHdbG6Ikmvggo8ZytI1Mpt7kEMBclgKHLeji5dOFyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBROUxJfl2ti1LreVVQecYbqGb4MHz71nt+PxBdeFWwID4hCS
	ZaCf6cIGtSJstqUir1zAmrVY/1ZLVcFccvG+jlYCGYngax5RFz56MSBQT4TmaN4=
X-Gm-Gg: ASbGncsNo876Mkzj9ONA2DcvwkKYQmgLNm0F2X+HmyGrkX5IxFM+DA8K1AlOtilFIKq
	3ZNWO77vaHrLbW97asALSq7vwMpG6ORwgPOe/5TIt7ZYEmRHmOMvwFcdyePONbR+BaHY973KGDz
	5HfII42RYkGTETQsL7/AY0AVjMfgzYVyrJP/sboPPaikOr0d1nVEu48RdbxBRbUZWYPeNEfw6oa
	ZKT+v5GLtd0I6viG0OB3tW6GmOMFkIvhJemaUxat4JUiNX87uVS4PN++2WszGc69jREswhearhN
	eNob3s/XZKFrdhk1SzcQcCA=
X-Google-Smtp-Source: AGHT+IFQ2qvN181ZDuhcMPZNSJiVwciarLswp3cHLOkosjzsrof5La2FVo7LVxq/uWfUgjgWG7L/7A==
X-Received: by 2002:a05:6512:3d21:b0:540:1fae:b355 with SMTP id 2adb3069b0e04-543e4c37a94mr5458133e87.52.1738498048159;
        Sun, 02 Feb 2025 04:07:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:12 +0200
Subject: [PATCH v4 05/12] drm/display: hdmi-state-helper: handle CEC
 physical address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-5-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/bwxxqot5Orp4aaO3bhvKAHJmqfOaxqag+YV2Q0Zeak=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/r8+Pd/VIo6maxyb8aGPtbn4tUp4Ky8ccFgXr7SvcSdv
 6WtDEM7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARzhYOhjls1duOsutql9vs
 K94rcSku8rn9TR5tI+49u6xmvFPw8gifKsD1PWL+zpsTdZ4Y8R3YnPXO+LpnaHvpDU3DmEQ+hec
 3wowf72A11nIzStpdsqj485aXulZ/25wj625sC7KRPy5TeW1HZp+t7Ix+hlaOl+br30x7+olxWs
 OE6QotMe9v5882LzRpKFI7bfDITF5Hc8mr+bxOTBY5aQrvy7pS7mrGmcv/tV80h99+TUa/0L7Gl
 JqkK+XSV3cq/q7QzlSX6num0/nAsXvaB+F/8wUOLZgwMUHbpr3TsPmo7qbVBtvX8v3sauvKTeH8
 WFmQaSLi0S9Qm+rYd/76FZ98EeW05wK7Xz/ZIdSmvwQA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Call HDMI CEC helpers in order to update physical address of the
adapter.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ca3c99b3805fbd78fb3162818b3877450d72b178..1e7ea9b387088d5f407b647a9a3fead7a2929a30 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -786,9 +787,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
 		drm_edid_connector_update(connector, NULL);
+		drm_connector_hdmi_cec_phys_addr_invalidate(connector);
 		return;
 	}
 
@@ -802,8 +804,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		// TODO: also handle scramber, HDMI sink is now connected.
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
+		drm_connector_hdmi_cec_phys_addr_set(connector);
 	}
 }
 

-- 
2.39.5

