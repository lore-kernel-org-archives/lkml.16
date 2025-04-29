Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FF1E89C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953657; cv=none; b=hlocnUxreZS4x3b5ESJArnfPUvgEz1cgQljrmo7HNUJVs49QmNJwpnB7hly4DQ0xHB/XvZ894hUnNsBdFQeSNqsxsr/I3RYidAmZQH74vlaqG+lG6BB6mnlPAEFJqFewmpUUwADxNNEDderqAE2ipeKbODXIGTUffJtZM0BxKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953657; c=relaxed/simple;
	bh=QfLsEpWtC8MR7E6VMh+6DtJfWdE7xVuyhGhmufif8Co=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HS7i/p4sgCuUBse8KGB3/MQRHg5oonsZmltp7virzVCFxsn2fwe83LKDZKGTJMNO8aTxH5fjnAv8dlo8EhXFgaXTgnq4KqRjlAgU7P9N2E4nCZUu4WkpsX1NAHMnpXuGBsFlHrA0zLM88gYEuwB5UJ6aNQXpDOp6vWkruvjTgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2bWG04F; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2bWG04F"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso6513375b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953654; x=1746558454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=;
        b=I2bWG04FZc7rxbujDBccRdQKbzffxqkUU2FzcJDmTXQlWldRRmE2YyVZPWXRgyFA5T
         p3mHj451OVXRf8EbjxgBCS1ECp6Oknpz2h9R+1GoTYSw5hVMh6qpAel7UHR4PcmxWcEg
         PTaBdjuWlzLvk4vs3EO2s4gJKXye829mfqLwpauo2oJ1kJRS8bmtyl65G4X13CGHMKjx
         1lsK3Snr4OuBHVTh89Vt6ycIQ7cNoNox3pYvBmd+ZQzR4S6GUz6p+2ykeDxXQkpAXf7M
         5CyEbt/T0jr7pFxKEVovR9Lmi8ovxKMnklkRyzbmabFuuXTGdUcrg7rawRwHsT4bSaLN
         S8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953654; x=1746558454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=;
        b=vU4wucnWEX9iG9gSnIhJzT8UTBh0esfBrDgrfRtUxbS9FmfybTn+qqcPdz4F2GZvfF
         sUa1TRgutL5yV73qXW9q3fqRWJdpUs5XH4uOdAhjix93yPIniUbXGR7PNcpsQHP3jwkb
         DL7TzaJnKVVMP++JnN5+kpFnAVoOK8T6E6hIan93ZQwVvlGjyLsEkoTOjVyS3tCGhgou
         UknoOCld1Pp1a1VaupkIWVXr8idCSTzQH2hkmN7MzReTKgH6QhlhDXturRQRCERb4ycP
         8Vy+1RqGHAf934X4BR8KA21yqNHTiXTHDlqq5oQDsnvmv2DaYejyakDcQJw7G5dfE5Lp
         7b7w==
X-Forwarded-Encrypted: i=1; AJvYcCXyJ+/NIk4BHbb9hDarl+T0WIfItjUq3IAufJ+LTS21jtHY/UBnjXuqYTr5XVuyaJDbrW4LclnYMHG9ulY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4N/ASAIeSeH135BXi7I+wSWVM0W1md5kRTKSBiEloydBmL+8b
	UkQebVZn6d6I3YvjOWN1SqsjAnXnAlifkNaQKV4RZza6XNbqT8IS
X-Gm-Gg: ASbGnctsa7Bx4mTMdacHcXemN0FOM4Pc+pu5MVCSOeYs+PShQhA/yMjKk7XxUiEQrjV
	ZTWwLzd+KAc+LybSwvCiRximnLTbAXlrQwhFYvBeHX/vUBQ6f0p0vD8EnOUGUysb2+4duot2P13
	9s5ytQoIXVj/Jv4RfQ551W9ztBPAMeyQxDR9eaIa5n5p5N2JZvdY/eVCQXWEzSAhmX7gjjkRvzE
	M385v3+NzDw2VbMuKDal7l6NwoZRQW+DL8osDhKQzlLb2KlivajRwsOL19Wh7D0TFQdSvhS/Uw4
	qjfXsi7lvmdKm1yXRmouQhz65mHmTg+66WnhWEnQX8K6CN7UpJEWHFbRccMpOYvnobS1U00rJwn
	nq2Fm
X-Google-Smtp-Source: AGHT+IF2ts+XG616nJO7RIcanOzyRNljW8qvmYtbI5nighVo0d3L81pz0OXCcq1V+31tmdYRgsHXjw==
X-Received: by 2002:a05:6a20:3956:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-20a8754d547mr149066637.5.1745953653871;
        Tue, 29 Apr 2025 12:07:33 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:bc46:d693:1404:6ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5ea3bsm15101b3a.135.2025.04.29.12.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:07:33 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] drm/meson: Cast mode->clock to unsigned long long
Date: Wed, 30 Apr 2025 03:07:24 +0800
Message-ID: <20250429190724.330883-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity scan reported the usage of "mode->clock * 1000" may lead to
integer overflow. Cast the type of "mode->clock" to "unsigned long long"
when utilizing it to avoid potential integer overflow issue.

Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7752d8ac85f0..fe3d3ff7c432 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	unsigned long long venc_freq;
 	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock * 1000;
+	vclk_freq = (unsigned long long) mode->clock * 1000;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned long long clock = mode->clock * 1000;
+	unsigned long long clock = (unsigned long long) mode->clock * 1000;
 	unsigned long long phy_freq;
 	unsigned long long vclk_freq;
 	unsigned long long venc_freq;
-- 
2.43.0

