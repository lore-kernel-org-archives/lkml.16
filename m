Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB961A314B
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739077640; cv=none; b=LFpxNNvlLbJhiPhrC19aelQvYJdYz+YawtYarqrTClxc6lwS+F8EBDwUXPrXGw4ClB0gTEh2clhwbPo3W9XJYup9DlKAZ/Rg676AiJ7grX1EowdZ21D257kIVduMCqPRpKGPrEUEjTfd5uQJ6AX+qtUaDsmAmv3G3SxYWd6T06g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739077640; c=relaxed/simple;
	bh=bHZ+8WYzHrJJ+NgSrs9nDogjdV+FFAB38y+PAaB4SrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=il7dunjal0/ZpzofkhDqscr3WiPTlRAbVjGjx4b/t0RiGus836yD69kIl/WLU0nCflZaeX9Z1P7l+ZitrilMFhZ2iGCFzn86pf/rMhdbHXoB1fJeuylklA2Hz5+IHcu8wSRCRd/IWwBLm700pb75b0SuUhiQXt9EWIMm304s+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O9mUo8Yt; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9mUo8Yt"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5450475df18so1029942e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 21:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739077637; x=1739682437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQN0+9Nxsmop3hssFFkRG5gm+YC2hGLzkxVXuFrHYbk=;
        b=O9mUo8YtLvaQ8oUFOnZuFfyueJjgycDmaeA/Q4mFeAL0ldukJNJ1hs+fYa4QbIhD2k
         /iz0+0eA+thQPCfq+Lj7Bfpr7mee1w4SXMsJW6wUtplHArR8jlD7ytckmB3RJDke1IGF
         a30vLy2Ww5b/3fcvwXgfahh9O3nJC18zGJpmnyNFciMaHHNj7pbX21t/I3KNy54kVLmB
         BeyouoJx8puFJO1Ggj08vtW1xnliWfVYCsylUQ7TV1ay9K0+G3Qu/HMTxAHTFw29bfcJ
         SPypxHh8zs21MNo7dRO37QSlz6uCahVUqwFkv5P45oeuAp79E1WCAKcd2STtHorpbM73
         p+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739077637; x=1739682437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQN0+9Nxsmop3hssFFkRG5gm+YC2hGLzkxVXuFrHYbk=;
        b=cpepap8+/vQ8uDw/yUg7lRX599YOxi97YxmS3WwPmOb7UrZfhnFEVFU12EMEyET0jQ
         v4j1FA7XGjbGo69d1ZwbkTt15GylW5EATvBOn9hTYe7OCB90i8I3lLr1ftla1cb693Bj
         jh5j/Hwdg2tcr7x+xNwkFwhbmubj9V3qyiCiD+6bCuRJui+Op09ezV+f/iqMO7QXlN0q
         OKQ69CTYdfjHDQ80tNHsBbEYon0PZQMt4U4veovh8XPDXVTC/HhNtIg6dsSdc7d6b7fr
         PslVcD/N75RmB/M8KqexH5wnvjKdLXqrO/6QA9odTgfk7ofXQ9IPoHnc/aGZaTWCOlvO
         O22A==
X-Forwarded-Encrypted: i=1; AJvYcCUqltCemFZW94K6zdnm+1MVp2ZNLU4pzbvQhuRHuqvqj45qLI0lpYa5dwdaLx0Mkzg/p+M/fKN8RL9nR1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YySUumg8ukNGO1Q0pFIlTwWVXAiJNYxf2Bhu2fEjbBI7AP4Dsbo
	MUc9yQjtE9WzlhKYQL+4+rE/gE2XR9jMPHk0zxNNwsPTfyx3M+KDiTdpL+04WMs=
X-Gm-Gg: ASbGncvZGSfHJrlGRRU2tZrIkIuKvPxHf7XevImmpIHRZwxAGr9uiF1Lrue5q5JE70M
	TbSwmI5Bb5NvKBXa7x0ujvazRUqUJytsLFDmZLIxTaGEmy/1VE5yMFG5jPs6TOq/e8taHBxBtV1
	0lWT1kUknehkFhZSZJ0fPNjuMakJsONAe2EuV3u5fq6If63iTIYzvZ/F7JHDxW4ceyLZ1DFrxd+
	B3YBGgxYdF6RpgnEddBesNe1x40VfxqHsN9paGc8pmVmQ7tOaah5CqTPrcaMLdXJ1Y2V3QCg3dS
	ZWGdh6CD6z3qzRyxOeQOFOU=
X-Google-Smtp-Source: AGHT+IGp/15rtM4WUZVM/z/LrVJYA8lGK9lfX+FXcNamZzHbk22gzs/jyxYxDerRvXrH1oHxGPPxwg==
X-Received: by 2002:a05:6512:a8b:b0:545:ba7:26f5 with SMTP id 2adb3069b0e04-5450ba727f9mr21247e87.46.1739077636734;
        Sat, 08 Feb 2025 21:07:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 21:07:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:57 +0200
Subject: [PATCH v4 13/16] drm/msm/hdmi: drop hpd-gpios support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-13-6224568ed87f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4525;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bHZ+8WYzHrJJ+NgSrs9nDogjdV+FFAB38y+PAaB4SrI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfjEbNj1xGsfjY7qcPtcbZDe1Jbntpt8hWtV
 hNun8j5xyGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34wAKCRCLPIo+Aiko
 1YBbB/45QpIZuxWXosnWOeO5OFPRAW5AOBQIRXJZ52Pls3macQD9qAauDoCLtSI0iEPZ1daMbp3
 1OVi92DXGwz97C4/PmsoKMPx5BQwNffqYcI7dNWDKqHloG4VlYE0s1SJa4iuK3MuKTFo8E2mpsS
 1YBn+MHA2vVYBmeRywRkL66hJ8cwM1mnj1198W5nPfmHnEmeaVBnu06JNzphQuZ8m1eoMBHKh8A
 wyqYM8UFd4zJAflGWp6pGBDvF4W4ksxmxT1PPjRRZ1koPeK8qsOyu+t1pjZtswtWuw7Z5jc8GkY
 P6r9iHbbQoTA+vCKc9bqisiHcxZc8wU3qXxNJYpWV6VRdLN5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Supporting simultaneous check of native HPD and the external GPIO proved
to be less stable than just native HPD. Drop the hpd-gpios support,
leaving just the native HPD support. In case the native HPD doesn't work
the user is urged to switch to specifying the HPD property to the
hdmi-connector device.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 14 +++-------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 52 +++----------------------------------
 3 files changed, 6 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3d10fe6f8545198365a047b2f5652081703101aa..abe2c9e1df550a36914ed19f51e7b86e5d3d24c0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -352,17 +352,9 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
 				     "failed to get extp clock\n");
 
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod))
-		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
-				     "failed to get hpd gpio\n");
-
-	if (!hdmi->hpd_gpiod)
-		DBG("failed to get HPD gpio");
-
-	if (hdmi->hpd_gpiod)
-		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+	if (of_find_property(dev->of_node, "hpd-gpios", NULL) ||
+	    of_find_property(dev->of_node, "hpd-gpio", NULL))
+		dev_warn(dev, "hpd-gpios is not supported anymore, please migrate to the hdmi-connector\n");
 
 	ret = msm_hdmi_get_phy(hdmi);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index fb64652162b6c5e6e2fe3357b89c40e2a28aa47e..a40d69ae328ced8b9f7411cf809a3fa8641dca33 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -51,8 +51,6 @@ struct hdmi {
 	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
-	struct gpio_desc *hpd_gpiod;
-
 	struct hdmi_phy *phy;
 	struct device *phy_dev;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index a42ed26a5b7c7d916d543aa2920754347903062a..d63f0fd96f0c00bbe07a13f8ead26f05a5133084 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -69,9 +69,6 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	int ret;
 	unsigned long flags;
 
-	if (hdmi->hpd_gpiod)
-		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
@@ -144,8 +141,10 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 	}
 }
 
-static enum drm_connector_status detect_reg(struct hdmi *hdmi)
+enum drm_connector_status msm_hdmi_bridge_detect(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	u32 hpd_int_status = 0;
 	int ret;
 
@@ -161,48 +160,3 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
 			connector_status_connected : connector_status_disconnected;
 }
-
-#define HPD_GPIO_INDEX	2
-static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
-{
-	return gpiod_get_value(hdmi->hpd_gpiod) ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	enum drm_connector_status stat_gpio, stat_reg;
-	int retry = 20;
-
-	/*
-	 * some platforms may not have hpd gpio. Rely only on the status
-	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
-	 */
-	if (!hdmi->hpd_gpiod)
-		return detect_reg(hdmi);
-
-	do {
-		stat_gpio = detect_gpio(hdmi);
-		stat_reg  = detect_reg(hdmi);
-
-		if (stat_gpio == stat_reg)
-			break;
-
-		mdelay(10);
-	} while (--retry);
-
-	/* the status we get from reading gpio seems to be more reliable,
-	 * so trust that one the most if we didn't manage to get hdmi and
-	 * gpio status to agree:
-	 */
-	if (stat_gpio != stat_reg) {
-		DBG("HDMI_HPD_INT_STATUS tells us: %d", stat_reg);
-		DBG("hpd gpio tells us: %d", stat_gpio);
-	}
-
-	return stat_gpio;
-}

-- 
2.39.5

