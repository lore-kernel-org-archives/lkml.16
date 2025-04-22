Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24C1F7586;
	Tue, 22 Apr 2025 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360621; cv=none; b=NGGzbRsS+po88X6O9NUtc3GZvQohDFVeeNEeWnvNc/Wso6ZMVVPwTGlGkf0gkr5IJKdwZEvT/BYcXH4w8kPVdiRKss2qgGX6JnnnXFdP27D4TTuQXRU1TiysOUqNZAPZKgYkjqYfOp5qwMU5+2WwlzT0fCdhwSlt7T6wQRlhet4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360621; c=relaxed/simple;
	bh=9F0zXgeVp5ifvUS64b0moRpsXnPlfbW4N8IurGNDaLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i3qg3LRxQ2rJ6Wx3jNbwGAn3PGZJsG+IQZGW5GA+Z+udDdKROZf+g6J4TxiMy8jubaWFfyda1/9MZvHFql2UJp+252s0JLADq7BEGVUro9anbT5ojG5s3jGdmEQMdkTHm3npBmIFrcN1sAmaogLMr8KLiC7QuEJ+12T/3mwCYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naLod7FL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naLod7FL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso43014195e9.0;
        Tue, 22 Apr 2025 15:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745360618; x=1745965418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mpjNdoT0vNqdUgGK2l3zCpCt4Cszl2krvQ+lX887CvY=;
        b=naLod7FLBQSzdr8eWLEjgCsNCeFBEJzXhs23awyFA07+4fcTSWTjUt0sYhBPKaByNA
         ycFk/Jp8BSAosQ54wwjXuTD0k+B7qV/L6RoacX8NnxcTbBwK4tJUplPUoSUnwe1jESx6
         ps6fz1wQyMK5W2uB/3+A1qRsRU6uSFB3kbmVymrLVo5BTLgInGwfm7iY+mTAuFT+qyyU
         7P6n+s8uyAYSkup7uTy399/NOg93cXlXAoSMUfr/34fX4X7HxQzBY8zaVl6ltYqzxh4Q
         AGhu1th8Sjnl4JvWvUkY/NQc5pCGr+qaAO53e8I5nUJJrthNX5wclgT6Pg/MM3XeeM04
         UrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360618; x=1745965418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpjNdoT0vNqdUgGK2l3zCpCt4Cszl2krvQ+lX887CvY=;
        b=RLO5aT9mujciwCAvPBg9lF8e74nMQsrP5iNd0myJHNtAStyNe9cQHDoGNcY4hlsZAk
         WU8ncSoujjViZdlC1/Z4DoxwucoLon821aGCKCfNztLJ697G7olrSYPKdkKrPVAsTuiV
         6dgyborfCrPrwYKFjqu6sL6n7zFp75iE0mQtThuaQb0XjnvLhoASX+mOoOqApm+Jkqks
         yRo5oaZn2+xirdBIre9PD5jkXfiGDtTBqSJYquu5WdR7bqNqpFvkTakh8jlK0xFD6xF+
         n4a6/zrthe1MHiT3YVLj/bRUsxhg2lzja50VAaXHnvnbEbSLcnRpWjtLnwHCgB2FANdc
         0R/A==
X-Forwarded-Encrypted: i=1; AJvYcCUqkXbX/+7pxY8TeZtJcA0rBkSDNkwm2Gk2WwLKm3GszorvzzWH4aWbnqbB3lvwXpg/0OyL5uTPyyUQnv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEP3PhuWbuv597in1jWj0xQqhxAh8nngD7DQghIbuEfWpff+DZ
	vWA8tdwqF63gcUoYAUYWjlXGkkQqnV5YZW1lNAQ71bA9MqUyKryD
X-Gm-Gg: ASbGncsPZPnqIBRuerV6dJuoxlQ5XbYIbGMxE7MjE9FV5uTqwB68lUKsi0dnuNY07yU
	kdPdRayQcZWGPSrCntlAFrV6AkrOqLHsEEO5xA6hiigs52xH5/v/uNymCVRvYet6AcZuLEiDdH7
	32EXoNBrKdzOvnu8PU2CypgG04v4CeZ+YKeO1IyAo3dmmtSAeD068FwEIqToOrHIh+zNt9mJpBp
	ypNNvIYVPqJeOug8nYfq1DPdYcaLfaB9MIhT8PLJCXDZWSVo1b52iSn71oNeewAK4A99vG6eHTh
	oQ3lyj8VKxrEVWrd5hX0vdhTvMXsnGpOMcjwQ/1L/A==
X-Google-Smtp-Source: AGHT+IFNDZhu8PiiePLkH2v9nNw6Q1B+/qYMU/BJuoKYhmX0pDLtcnAunVa0MgmlqxO7csezXTThXQ==
X-Received: by 2002:a05:600c:1990:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-4406ac3d219mr164938315e9.31.1745360617706;
        Tue, 22 Apr 2025 15:23:37 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43bee6sm16391632f8f.45.2025.04.22.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:23:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/display: dp: remove duplicated check of ret < 0
Date: Tue, 22 Apr 2025 23:23:30 +0100
Message-ID: <20250422222330.90736-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a redundant duplicated check for the condition of ret < 0 inside
an if block that also checks for ret < 0. The ternary check is always
true, so remove it and replace it with just return err.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..af62d99a0d94 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4044,7 +4044,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);
-- 
2.49.0

