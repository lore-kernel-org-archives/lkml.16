Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B31B0414
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077645; cv=none; b=lcBUmk0E635xwyQFMwg0XqD3UMIYXhxvoHq0gE8Iw9mve6zxlcfr9HkDYc7+Y6LmQsCUKoqs7ZxWPfJ6yCkxFb22fg7TnKsdlpNEGti1PkSLF3t08DUb7D8kRaqjTewF/VdpZDssVxKLLpKJN5e4AjI8U6lNW3LubdbYct/0Y0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077645; c=relaxed/simple;
	bh=vYpQX4Can/9pA++xmzUVsvBmfqVytun4ULSAJD2bgJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qx+avhPZkKQts+Sz9/kxsB8YJiE82xG2yiT5RoDtLSLRV/JcRbNA4kgcuq0sL/JcVOKXftXSBfLj4S3tnjYT9zOmdJsS0ANiDk95T182X6s6Vy6twjdtk+nUd4MDN0foTb28Qcoury9B6jEUwlgsfU9wL7uJnI6hT27vEKQXZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNqj4OJ3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNqj4OJ3"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5450475df18so1029977e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 21:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077641; x=1739682441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xZToT8Ipw+PUjO7BMQGdecD6LauDPp0cZ9YFUj8vWA=;
        b=hNqj4OJ3G12BF9zobvSAtCihvt29ip78/FYWd6KLvBCx8k6Q+yK0fwV0Jx2ytrL9OR
         B7nGfe6hP3KIiNhwRr8k2YN9A/M5aPnSUVdyzBAIYsbdADk1TR1wOKQCbk5OByEdZOcV
         kCiR1Ln3aejJGvBQESb5WUK1Skd4d3BX56tOTtICBv80dYmkwrXUmMRX0i3s5KC15fb7
         jfhjN07OCTUy8TvOwo6E8AmbfA4HBnY59nN7/Q5oofY03/vvHkLpDJU3El9y08EECEaQ
         TIX3yCsXcx7Kh30TfXLX7f4dHDvR24KJag1eP8iM9h2lg/sLS/gzagtQpfanOH5v1NXm
         O/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077641; x=1739682441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xZToT8Ipw+PUjO7BMQGdecD6LauDPp0cZ9YFUj8vWA=;
        b=DWGYec8Sah2DpYLhkdpXyT0nrFNaevJPp/eybYWklwzhe3Xpi1xD6/FKkD1MjrIRDN
         qb4ycK3OH9HDkgcQQ5UEwR5UlFG01jJfvFBs1GSiHQe2jA0nxkkh/urwKYQbmUfw51df
         7BsXDZAIucm7bR5ve687CNXwqbPHLS2BKST/tP3jiqECFgy5F4CNNaMFBS5UYKWT8EEA
         v+I3iuggzlfT9+PMlDojMnW2ov+z0QqjoefAdGyGGmN7FinvfUlH6StSPQ3pafuSIKP4
         NSu9k8lE3cKn7K0OLPJV/TIA4DWMiKNmYDtH7lmJA6n8rkPzyst/SiPQIIXMjaPcV/1j
         ynWg==
X-Forwarded-Encrypted: i=1; AJvYcCWdkapkSjXa+mgP30i91GiBkrUOElEINg4iQj2a63wL+t+bHQoTnmMMsWaEoiH7JLOmjm9C/1V1IlhHrek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmm6HynnS2VJAXcHfrtl94ROGUM4EviN7rhVC3u+Rr0QT20Pb
	zJ3KBG7mochyB9P2xdpIccGGdDWNOrQ8ghCwZkLi8UCOzQRczmtGH4kLk9Weoeo=
X-Gm-Gg: ASbGncsItmidVzN+DgGKvztTAENpD+Iq4fVzCD/01EEH8HaVMNwSr5Ka0fryuHpK8Yh
	IKPuG1mL6Ea0GgIGG8vPWV80fs8FbOCmoYF7eoYYLRbKl/5+IFxE7mmSIBO6VbVJ9j2s5oOmkEi
	sbX2tWHmhxc8rxpKs3tVVYhbfnt/q02DsB1pn+9Xs7c5yMuAylesw4UXalhuhw9A1qtCZn6yth1
	FC/SamtYKSdwg1iwlx6GVJUX8axn75adTdQ8zlAW+NjgP8tI4c2L32hjqqfBVzreezdDxkaG/Uu
	jZ2srsbXtJ1uysFsuAEvqto=
X-Google-Smtp-Source: AGHT+IGUIoNub6sm47xBPrwhQD2mG90ISalcUTKePpFjzxx94Lo1dp3HQT4XawwCjUCjbA6kpfg6Qg==
X-Received: by 2002:a05:6512:ba1:b0:53e:df2b:df25 with SMTP id 2adb3069b0e04-54414ab6943mr3253079e87.16.1739077641516;
        Sat, 08 Feb 2025 21:07:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:59 +0200
Subject: [PATCH v4 15/16] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-15-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vYpQX4Can/9pA++xmzUVsvBmfqVytun4ULSAJD2bgJ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfktyJ/HyMNRFnPtswfbXaSvIUEhqYROBJ0T
 mK3ItZNpo6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g35AAKCRCLPIo+Aiko
 1Wo4B/9wEko2KqapmTdzdtrGI05PnVyOMHtGr6U0m5DtWqAvsXy8q8aLx+EPLrXuh4d6/X6pN9w
 BKvU+doQVrevh7GR54HOPGdIdY6o6aThjw6JItlIZOzHnZcfcLtiCrbvACurjF6ttN8ZcdISSbc
 PLsmnqzXx72u2bvsrnW2pUDgummi4+lKGGICyAM6i9gCJ9ru1ZTxBaxlhpwULRe9YMX+IK3Kj0c
 Ctb4StyJljvtFV0bij01C6835twtirGRYCnhvwKfLVz05XHsUB9hTizzRFTWKi9IOzwlZABi5bS
 IDep805qclyL8OJE8++hZ5W0HyuOUtMlAX37Sya3F2PLjEB9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI driver already has msm_hdmi_hpd_enable() and
msm_hdmi_hpd_disable() functions. Wire them into the
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
dynamically rather than always having HPD events generation enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b0292750265082c47093ed5cf50bbcba9e67c955..f1898d8eed6fa46c47c9b632a90daeabe74f4359 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -200,12 +200,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = msm_hdmi_hpd_enable(hdmi->bridge);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-		goto fail;
-	}
-
 	return 0;
 
 fail:
@@ -261,9 +255,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	if (priv->hdmi) {
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
-
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 39adc8929bd601d4846f75b35c087de93c3df6be..679a2dab762c1333153c97709c99db8cc5a76d1a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -214,8 +214,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi *hdmi);
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f97f8b104f93bcca20e5f81f928d9b23c14fbe28..4de0f9b870a426bca825469195b1e3fac7729445 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -462,6 +462,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7726de95be4891e4a821ec4e056482263f23ac05..bd17f63546dd2e3d3484aa9d46bae87274001a82 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	unsigned long flags;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (WARN_ON(ret))
+		return;
 
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
@@ -99,12 +99,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
-
-	return 0;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi *hdmi)
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
 
 	/* Disable HPD interrupt */

-- 
2.39.5

