Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E8D1D86F2
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498046; cv=none; b=sElsapTxgksfV4Y6OgWhlRqYbwl/l3ukMLpGdltYAPwMHepRBeRQxOUqgZSo7FVAwn95cr5+JiJ2dlD4Obbd7eDHVSwicM6G+oc5iUD9O2Q6+yspd2ZjKwuYHCTigzBW7CNNXT4SDIv9/PSZ1xIOeNzq0Tn7KyREuPsSXd3MRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498046; c=relaxed/simple;
	bh=N35nxpcqv/VwAiJBDWTPiOI+qtC0Bzqx1moc2EZyRGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOo7wvmXdR7jIA6rS8Zq4iCQfunCcfQv/8Lyt4LNNbqimX3jYCcxejn8OGWMbcw8aXnG5Lomm+h1iAjVX6HkKEpaIcULvaongPQK5hqkbgpRUEQJm+L6g5tT7X6fqoF2vDnSBm7rkeYBBE4h7o/FJcEZbRjRHZL04XnxOawizEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6JJEW2i; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6JJEW2i"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540218726d5so3236501e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498043; x=1739102843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuE5UZz+cJnN2iWNBz/RDp/GoaoZW4HCu4zDpH0F6WY=;
        b=o6JJEW2iToo3ZMEW/JvviU/nXzX5exzV1RckyCW5rolQJwydylw2y8m4iMIZAVTKUI
         +iT0SCEe2kU7IIeNW79iKmzuQ+t3tL6MIXIKR5F5C7F1NgxirIrH2oe6R7Gh03KegGoY
         O+sEfZTibp4N3cQyyvC9uzMGuW3t6IOgxKPb2PMkNtRimUisxzzcmDD+ryknMr/3A9+w
         Sm15aYfWu1Y4y/IamB6Dr5oWArVtXBugT1Z8OlEA+V9L2IwdXa5xExpvDQwrI5BlDRNP
         Tx1liZHN0uZSveukFZUBv+JOREwWUuXOo+7cS5/QB092d9nQSfEWVXO7Q/73sP6cugzf
         tSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498043; x=1739102843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuE5UZz+cJnN2iWNBz/RDp/GoaoZW4HCu4zDpH0F6WY=;
        b=GVNYF+JJAgIP0uPW2zSvq8N68r3F4TQjBE9yTLu3db9+jwPCTrg57gLnyukFTyre+u
         +4IVgaPUsjSGmpglXYWHyMgkBdXdD2cF92B65qgRqXNdWXTRqH6K7lap1/LWmPCwUm1Q
         v3DY3nfNJlEl6jlDcOKZLoDXYv7us/+W+WdzIF0qI28rVeogxnYohqVNXCGqkm0FtRRZ
         gStVc5Z0iSmwagqLqftxE54tmHUixtGrbbg5pYNbPi3b7JW3TArqm8xiooz8YHYEcj/t
         BLwYd4/JdZDUYZXqplkJ/UxBSxSsau9gPIlkRYT0OVW6HZgZdL+ijbsJEA1Qcv3NCOeF
         kaaw==
X-Forwarded-Encrypted: i=1; AJvYcCUVVlpGm7dp4Og8sL62l1whOQzGeYct2TqDukF6RB4JwRng6xcrjlEUIIPya5oKI9zbxCa7qbmKsK9SCb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/aAgK+KsPNIolLr3gL8u1Vrbp4I8TaaFC2S4DEQQBZKPAOd1
	jpGkgWlZ9nvxEamYi+0KkAqmK5PONe8PEOV8QZaKL0QnGcTXVXdhXXE39OeDql4=
X-Gm-Gg: ASbGncuwHf2H1/N6Kx+S22IzqttvO/Us31S+0mwHV+2Jn2audAWyiIn01TJ54ltAUJd
	duGv/twTCtyMJ3Ot1ZW3XJRdBguFdgZd3K3ivqFcOmvOjahFB+qNVoaRT7T8y+9aoDA5YjMovRi
	ZJWoMXTsDNkwfz4K5Ge8BYdPYb6lhP54HmtI5oFKNBuAHZIbnDWzWiHphte/vD4az/jgrBlH/Yb
	I56SqVovuxE+RsqLcF0qfQw7IsOWXQzUF2LGQdjTX6hgJRfOFGcIzgKgriipCyu/jPWe7wtKA4n
	HyRbEhvk5JEi5xEoud1FNHM=
X-Google-Smtp-Source: AGHT+IHhKuZSfZysf15dskatOSlsO0er3UYdEBLmh1KotBNeQy4VZ9n0d7CGOLX8DBU+YghkRGkeJQ==
X-Received: by 2002:a05:6512:1392:b0:543:9b35:5abf with SMTP id 2adb3069b0e04-543e4bdff84mr5103464e87.2.1738498043139;
        Sun, 02 Feb 2025 04:07:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:10 +0200
Subject: [PATCH v4 03/12] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-3-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N35nxpcqv/VwAiJBDWTPiOI+qtC0Bzqx1moc2EZyRGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/vEceJ0AVRHfa8eoYTEwUn9OxWnesJPlP3A
 dW+x5VtskSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1QadCACEVwx8jVOTvfRK+G6WUSxCQI7BvAIklNfD9fop2nd1n5eD0ytwhdOz2aR62RW70jfe9Lp
 fHHycymMltPQVHqDGjvIN9O3QTxqQPEc8PUhAwJiU3BOodDX9rvLq5uB178/OjHD4jhythQFRhB
 HbU2hvHPGVdJGv67vgTAXhPD1trergimgiXXOlM6fTQmPQco5AKzIoGWyjvuZN5L8+TV4Gh0Ro7
 A1FZElbGd4hJk16UiMS0DZ33beE5HzxVtsqRsVZhczVpZmyyaCJRW6x1/nmsSuLDY7/xgsR32Gu
 1sBJp6GT1m/7E3VKeUuXGncBtFKUGKIFINmfrPQF+MZYcppN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
toggles whether DP_AUX_CEC support should be built into the
drm_display_helper (which can be eithera module or built-in into the
kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
selected to be built as a module. Move CEC_CORE selection to the latter
symbol in order to allow it to be built as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8d22b7627d41f7bc015decf24ae02a05bc00f055..3666e791d6d6eba58f095d7fb691de1fd0b95ed3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,6 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
 	help
 	  DRM helpers for display adapters.
 
@@ -23,7 +24,6 @@ config DRM_BRIDGE_CONNECTOR
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
-	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
 	  DisplayPort/USB-C to HDMI adapters.

-- 
2.39.5

