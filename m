Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396F12B71
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751240126; cv=none; b=gfIQMj2s5RaY/sh+1YvNlsTMpyUi3+Z417dgIkVyRFcz+UCz6EsB3mq9+BXX/4RMdbYfnugTeb1m55JXpTM6zbsDbskoaKFkYZYgiU5miYmLa7y4UQCzb3axahGMy6E4WgnD4eS/wMBUlHsZOGbtqCKW6TegqcoBFgOfSZnIp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751240126; c=relaxed/simple;
	bh=hnAex+xrS8FpUWygXla21LOG0suo16GMo41+67qfg/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZpEK19eVIZMfyyGGFfoXK6HW7oDAO56Ma6AYtesQ8j3tElmuvJA1rIa2Z6HbmIefVPYXCjqpFBNczUnBhADTQDW2v+VqEuXYYMlaomgBfEhutXIyFrTlw+SQG6ogidbvcsvYTLc16nG93MOQbpwIURrMXYPT7BbpDsCBF66DzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2q2tm1d; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2q2tm1d"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c33677183so31218835ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751240124; x=1751844924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXPOk3nqEUuFIqBZ1Us9rXYq5TplB4NjRHfPRWTgB30=;
        b=k2q2tm1dHKTijZ8O++7MBB1wy1txKT/JhU8TuTG8mo9xze+AsdV3FD9zRQAsrPlvbX
         heNXaaDKPRbQEp5Qu7P0arIIqZVbhyzjWxUxNSituQnRE34VHfYkb2yOhutoku9mUCdC
         NYEWw/7t6NYifI9xEijHeXjGiMP5dZd6keJQsmDY9pv2cxjx1MQJWdLUp8TW/kLMfJGi
         SJKsjVdJ39PDR9Hs8gWcs9un5oEihDXZccLqLoVKMvchbaNrUHhXLcmIl85lmlq3pILE
         gWKLZWZzYmhUu/dsQ4xLoPmRJqo51RRUEQ/86sNUOoO+lwL1oq6SIqdpszT/Nubg5EQU
         CZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751240124; x=1751844924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXPOk3nqEUuFIqBZ1Us9rXYq5TplB4NjRHfPRWTgB30=;
        b=aSLaJXWtY1remRsyyd3mGPWTNJHcLDS/OXj30f5VMhOiMlW0sVqI55snsVS4MHAgul
         y5xnAe+GH0OT1976io7FLQaoj+NboJvIUsQzRQNRh1bIpefdGO5d8dq7J6YOndWive42
         JhidTX+y2vTcWxAeCL9nU8IbjZaiVnBBsF+Uz/0M211PN+YzsPkD984eCrJbuqcx/9re
         TZFvgP1h13A+F7UQxTMZemHXpS75u5Fu73M1lwBwzsi/KaWu0c0zZcRmRPK76zc9iELx
         YAVsWKbMu1iXIgjy0dbP3W/cEair2h5ix8ysbLlGmM54SJHiOe/ZJ3puCIlNvrwklStD
         FWeg==
X-Forwarded-Encrypted: i=1; AJvYcCXTeI4I7SPqay6TY4Od5TtaX09EiYVldgWioa0boLoT6whvne5ChdKmfJBHtY72Q3LcyU0ZJpMIB5lAqso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX5RUh5yNwGagaHVe00Zxht6wrtHzHtF24fhTSyy04ZO0XAUQ6
	WeaWCZMHJWx39iCeyDSplp/ROyaQ5mA5R0vHt1G2y3xO5dnnzPF3eXgz
X-Gm-Gg: ASbGncs5Qy7C6CkCvfvfmka9IyH3fUckvTGk2Wk54Ddd/YxihoKFlM5mrQMhfYehUyi
	h0o0yUhNYB3ZN33FiRmx3SLJWANupT3hrPbhRLx2S2dTXnmrRY/+JcaqjQeQKNFIcBKwNSW7bAM
	+nkxN8m31fsY6lJXaS0x5F/djKaUMxTMBRlbx3UkeLWyvZGQ7038ARRYyfXUPNQ7q90L88I6Atu
	3rkjLavkV/kM/b7enn59WCEEIA1oe50TeNmC/vVotulzYtsgW62YuwE1Qj8lyPjZqV1aXdgYbVo
	ZLwRCvVhx/TjLx4FLfexIEeDuWtyR1/EbqWA1OpBzGiWh27b
X-Google-Smtp-Source: AGHT+IFO5QoN4K5K/v4sh7hmW17whurpIN5P0eVHuHATG4/IgZWs2ApHRywY+DGQ0YFm+ysET+U3Qw==
X-Received: by 2002:a17:902:ccc9:b0:234:909b:3da9 with SMTP id d9443c01a7336-23ac4680f11mr161686875ad.27.1751240124361;
        Sun, 29 Jun 2025 16:35:24 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c9695sm69433775ad.238.2025.06.29.16.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:35:23 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at in debugfs show
Date: Sun, 29 Jun 2025 20:35:09 -0300
Message-ID: <20250629233509.291786-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the receive_timing_debugfs_show() function to utilize
sysfs_emit_at() for formatting output to the debugfs buffer.
This change adheres to the recommendation outlined
in Documentation/filesystems/sysfs.rst.

This modification aligns with current sysfs guidelines.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afe..98bea08a14e4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
 	struct it6505 *it6505 = file->private_data;
 	struct drm_display_mode *vid;
 	u8 read_buf[READ_BUFFER_SIZE];
-	u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
-	ssize_t ret, count;
+	ssize_t ret;
+	ssize_t count = 0;
 
 	if (!it6505)
 		return -ENODEV;
 
 	it6505_calc_video_info(it6505);
 	vid = &it6505->video_info;
-	str += scnprintf(str, end - str, "---video timing---\n");
-	str += scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
-			 vid->clock / 1000, vid->clock % 1000);
-	str += scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
-	str += scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay);
-	str += scnprintf(str, end - str, "HFrontPorch:%d\n",
-			 vid->hsync_start - vid->hdisplay);
-	str += scnprintf(str, end - str, "HSyncWidth:%d\n",
-			 vid->hsync_end - vid->hsync_start);
-	str += scnprintf(str, end - str, "HBackPorch:%d\n",
-			 vid->htotal - vid->hsync_end);
-	str += scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
-	str += scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay);
-	str += scnprintf(str, end - str, "VFrontPorch:%d\n",
-			 vid->vsync_start - vid->vdisplay);
-	str += scnprintf(str, end - str, "VSyncWidth:%d\n",
-			 vid->vsync_end - vid->vsync_start);
-	str += scnprintf(str, end - str, "VBackPorch:%d\n",
-			 vid->vtotal - vid->vsync_end);
-
-	count = str - read_buf;
+	count += sysfs_emit_at(read_buf, count, "---video timing---\n");
+	count += sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
+			vid->clock / 1000, vid->clock % 1000);
+	count += sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->htotal);
+	count += sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hdisplay);
+	count += sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
+			vid->hsync_start - vid->hdisplay);
+	count += sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
+			vid->hsync_end - vid->hsync_start);
+	count += sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
+			vid->htotal - vid->hsync_end);
+	count += sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vtotal);
+	count += sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vdisplay);
+	count += sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
+			vid->vsync_start - vid->vdisplay);
+	count += sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
+			vid->vsync_end - vid->vsync_start);
+	count += sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
+			vid->vtotal - vid->vsync_end);
+	
 	ret = simple_read_from_buffer(buf, len, ppos, read_buf, count);
-
 	return ret;
 }
 
-- 
2.50.0

