Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57291DA631
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498058; cv=none; b=fT2ythqm0BxfScYmxD2wW1MD3RhUfUV7DlT8kDPAVDgaQURE0p6DcTa5yVhUAkbFLbS1dv57HeysdR7Zp+7NSifVQpB5bKuWLQjD7Di71gUbh08gcEAB8eu8aGYqjoY3ANhsohtyA9L6BLQUTJ048FI2GaxdZCsN9DfhXCvv8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498058; c=relaxed/simple;
	bh=8WlbJltbqK/InBjSkxjv8tslfatfI2kL2pKEGE9R5LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ly8WYU2INWd+fetK2sGMKfQ+bMHwm4suHLTnphYqqOangqw/3CbjxkFTJhbibD7JW7znMzhig8zu+AaWXlUkcUk1lnt/UviONFfTZv5aaIku1wdZUPeNvq5pBYGb7TMSyEQ/ZwqBXieC0Zb6YAOp5NHhO31B5VXyZO6+kyEdPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4fLIDvc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4fLIDvc"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c52000dso3540626e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498055; x=1739102855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgAVEoNSYZyEjLuTE1oB7V3YJmMK3i9hrDmIRjnWJHg=;
        b=F4fLIDvc/NtqgyNCEFdv3+A8gnsHaKvyyiJMoAq3SmF/9Kryt7VocdF54LTdpxVYaz
         ANYiRgZIsdFxaveQWZHibkzrz5eOvQPpCKCAdYa18+ofbnf2x2cVDU3aMW2zxZ9IMhDe
         Ec2/ezVHvxpc8qHF8y0R4NpAyi0H013Dd3Ih3I/Hcqf9ewr7z+SlwPZ0oE2aGIDrO7Gk
         c63miMwvtbIsNJyDuKkI/m18v+qMhkQiCdA+rpuhLi2OOMRC89d63EdlrvzeTyfZXvRt
         /zXdGyhxjs2A08IRGBMeRKl+A6qZLbw8s5a2eA/vtVonW4WpTm/XSQ18tgn9X2KCx28V
         4K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498055; x=1739102855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgAVEoNSYZyEjLuTE1oB7V3YJmMK3i9hrDmIRjnWJHg=;
        b=KB9wx5ygFvbL3QqjPIOBOFiErP7Ew/rFIwuAKO+XbS8W+0OnCYNtgj6Pq7HYKM/5ti
         tOC2KVqUIxGLMRYW8EGs4M1bCpesVNuBvjEtJQKXVTbEsvD1HzUJPBwwlolMlOWK7xzv
         rr/RuCwOToFRjyJG8MIbEMeA87tNITxPHKkctEGaDfhTdjRN6k0S3d2ENXJAjqkl9Iq7
         9MYlVZQd5sKhT2Y6SnbnF18XrbH1WrNINDoD41Rp5GK0xaoBeT63onwVEaKFsqD5YF0V
         wFb7sJtdiETPNHzDQ3ywZZPjc5t91stuNXWUmFvNT8+vx08WPlQZLPAqrmojpb8xk1wU
         41oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtHsfOfWmLj54Hp8DaGx8V2hCZJdHBTpkoeXufjwA8hvMHADEn5zKOkY4+MY1KigXCFOGVZPN2h4AhOFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QR97CN67e+/k0ffFokfWQpsDxQh6q2Q7+FiptV4HhGy2Txan
	U6a2na36oOjHcFDMF3dKCn+MDALkdQqB/SdclJigbPHCJChSnDe4TeZ5zeZlTx8=
X-Gm-Gg: ASbGncsEI4n/17AwRwTEuTAs2C6N9EZnksRu/41eEq7Ki4WmHrMjVkdLDK+OT/rxfkg
	rLkPxYR815ay1BgsYOAzVWnlueTAXCxDAUXvtN9Tv1X6vLLbcW4EP0Q0LorPXhr2ZmRw/7GEnWL
	1LLvJ9c0BXVS/RPe4rz6X91bCE5/vPxRqCd/UofRw20vqjH8r0c0qgVp4j3LhwrW3QMKNBTOI7v
	9SmFDl/+j0afXQPN8EswllNR8uCOAQJv85ggOv1H1JLOMqAvcw1ZaMT2ZU2EcLNC8CN6PFstsiX
	K4vFxBUJknPfd7UmGOlCBsM=
X-Google-Smtp-Source: AGHT+IFOrkSnrb0EMOZSD3f2+JhY3H6H4djvQ9Cngu8qQR0jXh4YrgCDc8p21Qjtyk4TkLK5BPjAiA==
X-Received: by 2002:a05:6512:15a5:b0:540:251e:b2b9 with SMTP id 2adb3069b0e04-543e4c2966amr5607513e87.41.1738498054836;
        Sun, 02 Feb 2025 04:07:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:15 +0200
Subject: [PATCH v4 08/12] drm/bridge: move private data to the end of the
 struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-8-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8WlbJltbqK/InBjSkxjv8tslfatfI2kL2pKEGE9R5LI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/vB+CdW60aRQrg/SfxiyTccxBejN5Z8BgD7
 3nntMf02q6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1fF9B/9bM6P3l8/EMpoAwseVEvg2NuykTNvmxRhTvIGk+cljuVHczEdCTGyy1w8WuAvLUL1FFly
 EZnQxQGOWK/bp1H769ZVsj/Je+2GxD2pp3Q+bPMojWNOCbmw80zxwJarVnS6OKuZ2uzJlklTYNh
 Fa0o27p+gjtUXnaX3C+4W92uxVqPVam3uuGlv5H8x93aMnyLTYmofm5lFn//1iHFuUV8SYZBtVP
 8o98nDxFqSLvepCgEj0lezWyf9CX9JJVU1jEKF7KUZc6oMYGwSt26dkMa9/yZvRZJO5ElqoNEln
 2t1cGfh96jZG6Ks8vn1qyUUOm12tAgZTKy/4iYeUax/geqbW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WHen adding HDMI fields I didn't notice the private: declaration for HPD
fields. Move private fields to the end of the struct drm_bride to have
clear distinction between private and public fields.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_bridge.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1f1670e3c6aac39b8b891b0d5e7e91254eb0d3a1..348778f233b06265a6ae577762c6558e69cdb396 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -872,21 +872,6 @@ struct drm_bridge {
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-	/** private: */
-	/**
-	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
-	 */
-	struct mutex hpd_mutex;
-	/**
-	 * @hpd_cb: Hot plug detection callback, registered with
-	 * drm_bridge_hpd_enable().
-	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
-	/**
-	 * @hpd_data: Private data passed to the Hot plug detection callback
-	 * @hpd_cb.
-	 */
-	void *hpd_data;
 
 	/**
 	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
@@ -938,6 +923,22 @@ struct drm_bridge {
 	 * @hdmi_cec_notifier: use this bridge to register a CEC notifier
 	 */
 	bool hdmi_cec_notifier;
+
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

