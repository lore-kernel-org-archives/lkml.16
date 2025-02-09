Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B11AA7A6
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077642; cv=none; b=qf29frqsiNUYub72gGc1CD0E3/GJgqQR3aAdadLgibcRt9L6BNoO8pvOEwYVU+rVk2F1dz7PtrHVENnrZ9daf/Jku65C/GJuAnLJ2VNADuS9M+ZlEUPFX3Et8z6uM6vcq7/bf1yCzlurWOeD6HlKSvNzmDh7scsYlOlrrVUIVKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077642; c=relaxed/simple;
	bh=CPzYHspMawaj1ZhasAtWHWKW8kSrzV7QWMnVrxr5HkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bv2Wr5owWerYbr+UM3zMIsyrdrMKJnic9aFPreldN7odWKwhStcAjLbXVXSjXdveaEXtK2tXfooGKEXNpNINYr5QZnB1a5dzjbmSKMGE8WjpXvdP5d1FwL8fzAoBH3nScTowf9h1OZUYJqhJe+du5J9njmdS7iBKLKpJHxG4NjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6WCK13z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6WCK13z"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54509f46614so199828e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 21:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077639; x=1739682439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjApZDAdahQIG0TxYhGE+9LrTC+9WrAVuHPpJuw1/8=;
        b=E6WCK13zsWInNrb3Ly3YGJCKWMjwOQOFZ4YXjoDK26iq1EWflYENaGOd55dgEoVpcW
         c+IOQmreZVHzFeqVBiJa3KmCHLiCp+kMRhsSG3I2xe64ZzOT3A45oztHWyqtGG8dx5RN
         JNp2sIZa2qHFgmh3UDpdRSgPghnSSb0bKk47vCJ3lptlOXKn4qXtdWcXXXvl89E1HT0Y
         eOjLfhSBEHuqqQuI4Si2lOWKfQGKkShY1O1OTgbwQ9GREfRVomIVHkw4s/FqsRequ1c7
         A/+xgKJfZDbNdopbl2Lg+QgP+ZQ+PJZNqlM2LmzzaPFNwyXR+nd0b/xOAwZkllm8g9KS
         /Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077639; x=1739682439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsjApZDAdahQIG0TxYhGE+9LrTC+9WrAVuHPpJuw1/8=;
        b=LQn4V3s3CUhZYQG/p3EMuqM75iufwakRSmDWOv//SDzs2gNuo2nmh7SmRtoIQRgiGG
         OpEhVZ3DDdo0W6IKJS/1ZSSonGntuj00MxK7N1UpswHCWgOx2mAoaDjZrOjooy5FGz4Z
         J82a4WJQG8+87vqn/nHth1kMTz2G70GalYHCa2/eVYBWH6j+KdaBCx1iN+TazXjG+qWb
         ZQIZDp3yyX6yl2i7p2Xxp9UlOLOX3wkswt9yh5vmZBGUIjrPAPQiw1ntmGFGnf6CwO+X
         12vXm9WPc4+KgNk743aepDF0Xp7txel1XYOa6X+FM3SjqM3rBbKidnVRNYZBOoN401LT
         8H5A==
X-Forwarded-Encrypted: i=1; AJvYcCUUA83Ww0FjKShaPc18Z8OjMh4CAfeuarfV1488qG1MWenD7lrUWcf5ohFEleOuc2keiEBqy96H+WAt+8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBgGoV4PC8RY5NYBHuMLBOEuUX3UhkmGixx1Rum3QAf1OmtGy
	IiuUYEQ/5ton91RFuI/dJPtn9E+Ss8dXxN2N8KhJWZC0DqZqovJkDE8bd6m3Lac=
X-Gm-Gg: ASbGncs3jGEs4BC9pLyBYO4RKVfxwHc/L+qQMScH5HsxsZwEa/hiEHJMRLUmnYn7mHT
	r+tmkWd54JUp+k6bfgwpvaakEouStF5g7Qjd8HWK+mVinjo8sPh53g7GgvkF8tM8GVfc5WX8I0Z
	N+ofDzhibcnh7cjL5OG3zjJqXPVbXGaVmH68P9GOglR6hm+EGB9TcsydasPv6calIGPH8rq0LZv
	DVeGNLYbebI4YjnffOJ0vi41zebgmYDtIxM4m0yQtccLB6wmEUuqXnjc7fhUrpBmX8iYU2zbNwy
	Z+p38gxu7DyruBBovpcBrY4=
X-Google-Smtp-Source: AGHT+IEUV6vDEmH6QH2VbLdRGrQZS/nO/l7LtZmxle0OOHyaPvHgIitk9/cYbQnjmRzYjEvCgZ4FQA==
X-Received: by 2002:a05:6512:2115:b0:542:2e04:edd1 with SMTP id 2adb3069b0e04-54414b01bb7mr2258617e87.42.1739077639078;
        Sat, 08 Feb 2025 21:07:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:58 +0200
Subject: [PATCH v4 14/16] drm/msm/hdmi: ensure that HDMI is up if HPD is
 requested
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-14-6224568ed87f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4128;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CPzYHspMawaj1ZhasAtWHWKW8kSrzV7QWMnVrxr5HkQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/oK88eSHpk7Ql93ub9mUjtem3PTN2W+9P4EDjuxyxEqX
 +bYhPR0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiE9aw/4/PtS84291Soe+z
 JvviPv2qby0/Luqc3hj7+L+VeHOBcv5UN74TNmd4Ph17GM6u+CFPYnLEgZg/UjkMvnJ7A9hOGPX
 s45B8KNFVy6krcLj4W57jyeCTj3osVZddLD+VfDJWfJrUs0sXDi6R+1npeb+Iq/zNv9jS69Uboy
 L2SRuFL1TbzDlz5WbWe6KmWytnnAg/XiB0sMTq8Fd+hy2vd6w+ezfPVb3CIr3/q/3HFsMvPmFxf
 CWsUyfd1ci4sbnLvq1LRzP6oFa6we1rWfcumWcHnQz7H5L0U108tny3hNXPvVt9FwSU8LZM2m3X
 oCJbUKbPv630nPPjnsttZ9MsXj0qCPihJ852Zu2sRn45AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index abe2c9e1df550a36914ed19f51e7b86e5d3d24c0..b0292750265082c47093ed5cf50bbcba9e67c955 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -293,6 +293,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a40d69ae328ced8b9f7411cf809a3fa8641dca33..39adc8929bd601d4846f75b35c087de93c3df6be 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -41,6 +41,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index fedcefbf53d1d8d53a4882a545427f5ce6570a76..f97f8b104f93bcca20e5f81f928d9b23c14fbe28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -303,6 +303,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
@@ -310,6 +311,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		if (connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
@@ -332,7 +334,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -343,6 +348,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d63f0fd96f0c00bbe07a13f8ead26f05a5133084..7726de95be4891e4a821ec4e056482263f23ac05 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -73,10 +73,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -106,7 +110,10 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }

-- 
2.39.5

