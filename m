Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14AA1D7994
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498044; cv=none; b=XRTnjsDtyE22pnUF0Ka3PWK3qfn72/CIPStpwP+61wxNLCeWOt2gIX6EmXlenBvW5QND9371jE0MOE+pKKSMSdY4SYCZQiZQa+9rlh9s8qYOnMTfukXYz4yI18ev9zx65n+0MXCUbJm170Nn0AJM6QiMGF+SsxCBYpYvZ+KyBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498044; c=relaxed/simple;
	bh=RjjhvUseWPk0WJktiUGr9igyfvy7Lala3huHY3iwjag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9BIi/1yKkAgN+jxQ1I3X6MxQk4FSioHwlwBVEPHJPF+o6LP8uSEtvCQgfEMagbglnlptXii1fuw4muTcfsiRlvcU+kFaSLoxhWU4BK+GtaStCXIhWFUDc9ZXzGrs6wcyz0ZTh5Wk4C3847KYYXuNjx9XLNdcmeOy13G/qbu0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkB7ENq1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkB7ENq1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54024ecc33dso3559768e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498041; x=1739102841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F59sj0XNKbiGtLNc0GKb2ggGZoaV7/aeIrEMGH1u/DA=;
        b=FkB7ENq1tBI/P559zHHgBYXVbLNyYc4pGhDVoW4uw63R+nt1DOyJRcN+S78dSNOpvQ
         kVOMpwL5JK1emQQ3hwtEyN4YMd/Vx44qzXcNlLvQmxjo72uMKdRToQHiZZrDnr9TQJSD
         fvC/ZPVj00PCL/nuv0b3cbpkVa8xDqlc99UqhbYmjvatrZaNVlYIhRz3ytmILgdAh8me
         rOU5lKmrkgLJHHD6Zb+CcgShBOxJUU8js3hrrX6WkbsSJ3XH5Z5l/kpuETqUFROiNSV3
         gnbph6Ru4fwwWd+RrMuFTLBYVWWAsslOvDhaN+g6WW7XnK1fjxisyMtN7bg96DzM95oz
         F3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498041; x=1739102841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F59sj0XNKbiGtLNc0GKb2ggGZoaV7/aeIrEMGH1u/DA=;
        b=WcYLbBxvdbkJWvKWqLZH4Ah/fGve/sNG/Y0Xk8Qfr/0ntkTv9MOsTushiVsRaRGj3r
         qwLePwgPeoymKN4QdRq2/uS61kxSWcal2qHtm3LD4PBvJ/cPg1ybdBMTVBQjX8cUk9Va
         6TFEGu2kI5J0lcIvW2LHNze7SREQ9D379wqu/Cjyd3Rv2unJnSpanjEMZboUUCXdNyiM
         v+FX220SKKvm85Wnb51uVdE2QgczRQn+0zoArHmH1e5VnGE/wgqxEjnzYm+P2BT3ivQm
         Q6NfSigNtJsSgKTid9529+anD+1xHmV3ucvfz1mEyGjUttq6q6j7TsVWJ/aR1fg+AzTl
         PX8A==
X-Forwarded-Encrypted: i=1; AJvYcCU5QgsKCllgexziKgVVRIANJMYepmyVcvnQUThbg2+YZ+dZCOhDHgYcuGwcexo+rBO2kkiLEYONtvZnQmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YynZM6YkaWEWMHQXfS09RvucC+cZpMdNm1V4cRmp+uiHOLtO1WR
	ONUqJcucQBt1Z/LX8uaWk6wwsDaqKgbf+yoVSJuGNkc+z7Qoz3cvFcvmUZMJHfo=
X-Gm-Gg: ASbGnctv/MJtnd3ImDB7NrMXetGUJBQi9cIVockKXiYXSKgSFWiJHcsdhNo6ho8cqvX
	xyPST4xXitcI/iU+Cm0Vljld17DJiN862pTYNR/QBBFuAd1rLTuXDlkLVUsPinT5nwEdg5FYBpL
	danBmLUyDXbIuFFIz3sg1o4h96CiWs9cqdE3BSGphGXldg4haRZNIEgcoH2poqrdcZCQ7SrBgBO
	y2CCtnH+1cBbl2C1GzSQXBlsDSC1bhjlvzBqB8DJkrUM6DoIdl77reqOnJv3KgwMbexal6ME7bW
	7+BMUkT+WI+WqDVe0HmdlBE=
X-Google-Smtp-Source: AGHT+IHVYRDC4J4iYdmsbDvkkAZqI5KPrACpL/BZx5B/ZFeHipes2e1xGC3WGrn3XHqGwbLb5pLbxg==
X-Received: by 2002:a05:6512:102f:b0:543:e4ac:1df6 with SMTP id 2adb3069b0e04-543e4bdff98mr5145760e87.5.1738498040651;
        Sun, 02 Feb 2025 04:07:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:09 +0200
Subject: [PATCH v4 02/12] drm/connector: unregister CEC data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-2-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RjjhvUseWPk0WJktiUGr9igyfvy7Lala3huHY3iwjag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/uOkPHmx9sBYxzjPWzemPGMPzzOqhkgC7Xu
 e6Vd/xrdy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7gAKCRCLPIo+Aiko
 1Ze9B/0UqNqVk6rEOBuY8R/S2llohsLFWnYF4vZbOMuOFKEHwS8TxSdZzXX5gMO1qJj5R60aZU2
 X/yRTLBR48aitZUCoEjKS4x4X0VBgf5oU4vO3DMTrTLMnBxuQfjTOjVesDhenEpxfWWHPdXKo94
 wHWhh33axXAdAlJ9fZf+GDoqOKdctRFm8GxcSUgVM/GiW8xQa3mJQd2ybhNmWCPnZFX4UqyW1oC
 kafGoUEYeM1SKrFuu+olg0yZBA7EoK+/ax747+Ahw0iZSWOjFnKKw+nJCTrUCR45Lekq8c1ib9T
 vgEFAjSbTEG2rmoxTq/zcMX71GOPIWYAHaIQIdz/apLvUHXX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to make sure that CEC adapters or notifiers are unregistered
and CEC-related data is properly destroyed make drm_connector_cleanup()
call CEC's unregister() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9890b00e8f9be856f67cc2835733a056ddb98efb..fffb718b09eaaac200e6abc7524bbfe98c4741f4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -699,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+static void drm_connector_cec_unregister(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs->unregister)
+		connector->cec.funcs->unregister(connector);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
@@ -719,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
+	drm_connector_cec_unregister(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;

-- 
2.39.5

