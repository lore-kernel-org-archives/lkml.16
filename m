Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F0A1E5B87
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272161; cv=none; b=a+XT8wvznvyR0nQ2iNedvDI6ppsdYAFqosFIhBEQsbuYCXfjUR1mDeMkXArYkm6qikeiHjbBcz/0/xWc9z6aAVbaogaB57cqpA98f8bv5ZtZHN668ITlc72L7Q3Zhuox1fnPqqkmkQH4XltEU17AIvNYaG70NE/L07LNbDfZW9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272161; c=relaxed/simple;
	bh=wfSWd7+rjeEbpIBLGRKWCodTxKEd6xdW/hr9jo+ucfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNu9/CMZJenp3qveJOeNEIPSfEh/s/5G2WIQuBMWmJI9nHlV03sUPWFJqhfugkK+KYfiY6L+DoLXJ5DLl6bxtFTcBxB9vvHYgXhmznHS1eXByWNy2v/lqmPWZxpzkVpOzxzFrif8uALGCpBPCpO1gJ/09TcBMkjqp+WWlaXb/IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH6vmdQF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH6vmdQF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso10724705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272157; x=1739876957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqPjNzN3hIOUqf1ihOkU/QGEBU1cO5gaJEuNeFStEvY=;
        b=cH6vmdQF986nUuP68S55YIcy0rWWBU/kp4Luqg1cJMLe8gMk2Jhjw8jTUbvtmX8Lzz
         zC5ClOmYJLzDNrMx0G2IFOmqOxkzWf5IBeZ0Fp3pe5pjpMVKR+1tksw1mIl1QRc8hyo2
         0tUIVqOMUEVqkSy03l5HGnkVNV5Z26iDNitsDJ3Z5cfYVTwrfo3lLgS+oarAmcdlvCa4
         BULgAFwmLV+0+VCUmsijEYU1jcjbvz9IwfUOdJRduwiCFWmI3SMhIbfXgcKjrScASIE/
         Mkjdt3xUB7D5q6NSLosArAWejo2vceKtRHBGg7cpeIbTvP7KAAQvpebzUzFtb8pi5YF7
         X+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272157; x=1739876957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqPjNzN3hIOUqf1ihOkU/QGEBU1cO5gaJEuNeFStEvY=;
        b=qiniO2wC5fDL5muRktMCBlR3YJGe884+xNczMzzUhcc6Z3VR9MtQBfDpEvVHmlemJ9
         vlwf9EkYCP1SeUpRZie7x7VHN8bdvhkwjqhG0TiL7TkYaX9LSJPWvE71W+ad7l47QoTL
         RsFWz4rJatOR4ABbDZx/j4hy64Jz36WNs4nsoa+c4m46iN9BUAhs2KmRRQ19dMKwr2T6
         UU2IiNUDsg7yVtf8BwARpDth4BgPWX0CYgjY3k6sViK6J36Wh8TnCivBEW2bYvRHuiQO
         VD29iAx6I6S0O8ECULO8Bw5mNBarj06+xsR30nJOPVQ3TQnQ38OEUQif8axEANiKrXjL
         QA3A==
X-Forwarded-Encrypted: i=1; AJvYcCXfLoJRiaf1uSFY2G8xsxBwrastOUSrvKs9JbPCSD23q8oAF1rwVa8PwTLyOGJzqcN3P2ZnqAmG91nRR1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDOtz+el+X0VRLyhEEn1pCYLH23Xkp2PUHsqMtKEZWFpHlxPSS
	EwuZIQZq1kK0JrBILEL0O31wcshr0LIDDfY0xLSTpRdo/4fEH/TU
X-Gm-Gg: ASbGncvYnCDSvSWYr3eypb1K6dorxGQ+QHJtQs02oILBRiolupaES2uF9R3vxg4GJMb
	xK6sbm7WzOJBVuMUJRvYUNafhq7y2ft2CAQt6zdzxIjuUm76iu8F2CHNCwHariNEFyQ3CCsxarQ
	Fbephx9WLxM77LK6A3Ik0Nnm8M5EreowXfcrbTDyBcdEevOEvgMehxA58/weTo9WdXMZPCqhjxE
	1qgeLTdIsg8fb5A2L2QHL8Dvug1JKrb/t5ocoJ20nPFyI7RSvSdPdGjSjtSx4HB099PG+NNFMfK
	Zkem+JEqqPKWqr9l
X-Google-Smtp-Source: AGHT+IFlaMdG5xYT8daUity03Cn/YyaHakX4RFbJ81EYHMnPhENehZWM/3i2t+R5N2A4WjM1CP0j9w==
X-Received: by 2002:a05:600c:3c8f:b0:439:3e90:c535 with SMTP id 5b1f17b1804b1-4393e90c71cmr91082515e9.0.1739272157348;
        Tue, 11 Feb 2025 03:09:17 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 01/15] drm/vkms: Fix use after free and double free on init error
Date: Tue, 11 Feb 2025 12:08:58 +0100
Message-ID: <20250211110912.15409-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the driver initialization fails, the vkms_exit() function might
access an uninitialized or freed default_config pointer and it might
double free it.

Fix both possible errors by initializing default_config only when the
driver initialization succeeded.

Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 7c142bfc3bd9..b6de91134a22 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -235,17 +235,19 @@ static int __init vkms_init(void)
 	if (!config)
 		return -ENOMEM;
 
-	default_config = config;
-
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
 
 	ret = vkms_create(config);
-	if (ret)
+	if (ret) {
 		kfree(config);
+		return ret;
+	}
 
-	return ret;
+	default_config = config;
+
+	return 0;
 }
 
 static void vkms_destroy(struct vkms_config *config)
@@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
 
 static void __exit vkms_exit(void)
 {
-	if (default_config->dev)
-		vkms_destroy(default_config);
+	if (!default_config)
+		return;
 
+	vkms_destroy(default_config);
 	kfree(default_config);
 }
 
-- 
2.48.1

