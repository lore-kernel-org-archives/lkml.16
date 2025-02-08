Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465B13B293
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 00:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974438; cv=none; b=DRDhGUPzPb/6V4naQPomHMgqkqrZiqak5pk4hywFTKwigEeCfko3Btb6iswI6l7tYxORCyu3Y1H7aID7MhiiearDCg47h2y6I3UjiM3tE4wbJTdOZqhwjK8qnQ3HARH/Mui58ToAgsHuTULT1ndRcmXQk37Kh2kEMqM0M1mM7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974438; c=relaxed/simple;
	bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NywGkwBgu9nsqj5UrsP6Z+PQorSI4UBLbf+UJzLjwQGbO5RTJnGAV8dDxMTclcfFoRQFWtKbwrk3zsfnI1P7jZDlTQBpdK3KHiDqsb3HBVdN90U1wobiNR34PI7j8Q5Nm3HFlXS8ogiEjFKwSGHwT2p+eObfE6e7t11gEQazqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKd9V58P; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKd9V58P"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543cc81ddebso2963136e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 16:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974435; x=1739579235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
        b=oKd9V58PFMbmEB77hjN4QCI3lZZ5FxmsD96l8VsLhamJUovz9zFazgqAEESFALEClS
         XHx7AWKvskUJA7vM6SbQZP7iwZRhsPw18q2MF/kWKV54j5DI7z0YvSUjFCVEmoob4R5N
         KtnnycM8FeIrZ7sQZ5Qwmnn356/ITskAFcv5uptjx9i77kO2gUOjUgOQJV8j1QtK8Z2P
         C6ZsywST6FHdNXwUPXA2/dceN+YoaxUG3XYlYZmNXFi7F4XfPE14sKKAdPZFPSbhiSSI
         r91MPRP2wUG6lTWm5HOVaIcDJ4kAEWSSHjd/BOrDrao0HSIp5owjtLkDBjq4J1pJ132l
         Xhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974435; x=1739579235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
        b=ZCApMNj+/U1TMaMg1FCMsVglEr0WUoM4cfGFeV1kUdp0Y7+Lo8/ceXhP8rzdytKpiJ
         jrz4jYDc5lyCJ0nLD9WXeerCbzT2SNe0nQ12WPcvhWAOxoInOF3l0DzFZdevKn0YjV26
         P26I10rJHOv+xU+ABOlEhlhrN53Xds3xpKmb48y/Jt19SCyPoFfvDoDu9tB5/qXRbepm
         bsizD3zokmYQWx+FkQ5dNeo/QuSpvQL2JYpHv93Xmd+ITJJ45bnExTsoFi486op2vt9P
         mNNwtyFEBlwGBPm0fwaxt0RbSeU0O2ms8tyoD5pfdrh7/7RvxgPX/0vnFvgw87heaISH
         LvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsNcVj71pgdQhkDcIHk2fzlEozSLYwYqFl/mU8GKR0dDEv/Aii9Q9kz82w1hgyQxMV1nD0VaI2vfw1oi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhzyS4cNNQ2s8hXWexX0w4F4tvKWLyk6WqZX0CzU2+H4ryPLU
	ROFi4h2JgWcC+MMRSlRK84Qctx7XoN8Y2fCXiukcNkgJkaNI8z8psnD8V+IAnH4=
X-Gm-Gg: ASbGncvs21jpg8LQeg8Xmga0cRu1bxMFZhS16+9eKqQxKRB0Gv1Nxjoc1CehU4XCqBk
	g9VxuafWr/WTLf9iCtoRIFRPfMABtWod9aGZbbPBtEpTcw05+xgoahhheomxGM+cKtDGUz+fANE
	kF7+rykPWeA6uY8C0GoLHp5EQUcxjkOj3yQyiTcgWrefsjy8/SOxcwdmd8Xb3rWkOM90AZZcXaF
	tY6bcRgDOqurSUOgKjfZJX7KmcMERC2FTMEdrbQ7/QVm4Kvi82YFVBY2A/4lvpFqDSTX4TeiuYD
	M5mLtkpiqg6KndbHYmpIIYE=
X-Google-Smtp-Source: AGHT+IE0HRYadLgRlFKRYvwewdKyRJrqdIwef+bzOoB0eCBwvioFcB13g7Pms7VdBytcIFx7GOh01w==
X-Received: by 2002:a05:6512:36c2:b0:543:baa3:87a9 with SMTP id 2adb3069b0e04-54414ae62a8mr1280181e87.49.1738974435149;
        Fri, 07 Feb 2025 16:27:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:03 +0200
Subject: [PATCH v7 4/7] drm/msm/hdmi: get rid of hdmi_mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-4-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTVhekXNgRhbLo/MXTHBp+Ns1DBrCTeoHx8m
 2qQDmR13leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1WDCCACfkXHtGNmUhx68GPVqzQoQbhU68C4O524tof04eeulXgnYHBmCdk5Vi4r5ynnRCpdLuge
 kCIECZgv5ymAymrGv8LjSUSNWI0RjujMmltE9uANd4IhKtseKx7rhd5F+/bxDRH8ZgDhqSa7zSV
 QM6VNcw9csfYsqDu2dVfUc9uIIDAb7Pv4ILiWv5txe/G0AsB18djO2MD4zsQrYSgsM4Kops3ZZq
 2Oz+MvRFEMirCLf3/uhgsrqAz/hMh88zbi9yZUUty0OQ4rQx+nOHMwYX83xjjWgH8kr+u1nNDxZ
 2oDOdbC6xcILj3Vp9d0p9uTRarqCMygGrzhfA9j8csBcUHzs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 17 +++--------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b14205cb9e977edd0d849e0eafe9b69c0da594bd..6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 8faad8440cf70f792da353978b990861b0677ed8..cdd3bd4f37831f9a606a4c3627a48364f5d4025f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4f8e4ffdb2e058ecf243bb319c12c444cb2e5200..15ab0858105328c2f774ec1f79423614bbbaeb41 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -232,7 +232,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode)
+		if (connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 	}
 
@@ -264,7 +264,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
-		if (hdmi->hdmi_mode)
+		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
@@ -320,7 +320,7 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
 
-	if (hdmi->hdmi_mode)
+	if (hdmi->connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);
 }
 
@@ -339,17 +339,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.5

