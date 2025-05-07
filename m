Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C2289827
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626093; cv=none; b=BBAIo0DMffnkS1MV+IFzy3tINXqP4fzaXXaqbxl5OFX2uw0V09uXHhWtlyyN4ewcqJ0YzLbTivRnQuBo6jMBE1nbnbUUbPr6a1zGNyWDj17dbKqhHa2ksGVgrdQxJPam6QdBCqW0EASEfowfHNJbxM4kDVjfLFYLob2T5FGB+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626093; c=relaxed/simple;
	bh=pqUkG5pPZAQuWFiXDSONHcLU3/phVQ5nFrwCiq55Qxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKFaYFwwoBltoVj5NBRMw2zBK8niiXjDYw9gYYXufYMsTVMstUPWM31POuqWUcPz2vaCN9LZ7gU0826pWClPUO30vLwzyAJH/K7fAhsXHewbfZBS9Oa6F2fF+iyotWhfq8WwLMaVSpDr01SioxPGXdnTAZ4QAk2szj3axJJGZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUZySloI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUZySloI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0782d787so44426935e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626090; x=1747230890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YuRwz8f2hm9m7I6mJzRn6e33kisXWPP7uKIXupdFzE=;
        b=DUZySloILVhyGHjCJdwWWZbrtPVdMKTcAqg4pHymqgCY43hPR3TRTiO6kVW8tM5oXu
         gt3nTAOdox8evJQ8KJbtXXZ+BZZy1d+Z/JFRSQxkPUCEhVjx1ZSzKnclcvUgz0x/tmM9
         z4TWi5kqGA4anZcPk+hdcV7eAC9blxQpb79ApcESHRg0YbZsK7wXxDV+7Uyse00eU6em
         HKCaDQudBi7Q/gYUzw1WJzDpyA23zM3nzILQAJ0V3ARAE2LJH+dmv1padSbAc6x8YRub
         IK1bjEtx2oabrqJczoZYQ5QwQ77kh7XT30sfzeFKjAr3MbPupYho1oLcZNP2v/1rt8GE
         EK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626090; x=1747230890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YuRwz8f2hm9m7I6mJzRn6e33kisXWPP7uKIXupdFzE=;
        b=Ida4yvBuaKlG6a/r+JS/CKKMlrm3DtyWhF9lhkZROyrcebyOMQ/3C0aabqQyFUSwLb
         +dlvJs9HLFO/tgp//cznQHTpBWkwklMpP+iQ21Tm8R80uOutx/8QlKqI/yu8+nyD6xu5
         Rk6LikENENUQWGy9BQEM6gUHAcqdaV4m8suk955zsDXRmTMoOJjYvpiqZcKOWsd0U4qu
         0tQ85Txq0VzOzZLmcFFqmI4CI2aWXU/OsuqmXbHnfjgyfnH7etqQP19aA1FnDi7/YtCM
         FsTLogygmtVZ0xXywCBqXXwUi7/1mR+AC/l3jNsRPr2+qIG9zL6Fiz3dv5BMn5ftEOoI
         wq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKSUp90eyfXbnRBM7MSFXqnCrhZico/dvoa3XEkpxpc/m7yJcM45LDPDKZdcg4X0cUR6WgZn7QcesfB80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhuNYaZf+7n3p8iPiz3SxJSbCzgEOvOA/xmPZiDhH8l4lzNTG3
	OZknbgG+3gj2+pwZrM4jxMHs6o7r/TLYXhiwFf/HpT/OUhT/OiH5
X-Gm-Gg: ASbGnculACvlsOzu/SY1aH9MBlGQGxf0Dg5lmiGZ/hxdlYOLsQwFDNzkAQ9xW/7Q9pk
	pX8uc81+jVvmSx881gTQkpCynq9ilbBNPHB7PFySUnsPzSxLe13UPA0C5On2BhzON/LyPEU5ozV
	oVZhkuHa5qSDiYVMl6AvQgysyiurovfhLC7/4G5A2o/MKVXXrxkl4GwHRQTfo1lE7RgoMqpxvMX
	btmTJ5kKfl4LUacGmQArLmRWCAT4sAbzD59As3HmqxpBvJHhyGps2H85YFAHkEDnFWUdmwppYf8
	w8cvCbaHGib0MvwEWN6ROp2sc6mf8vw89BYdYOYXDQ==
X-Google-Smtp-Source: AGHT+IGgEkenNlvKaapknt+N0+kCv1udjBqtfUNTUtiVhvLQ4hCJxf/W2wwohiE2nA/36QexVoD1Jg==
X-Received: by 2002:a05:600c:4454:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-441d44c3353mr31394405e9.10.1746626089945;
        Wed, 07 May 2025 06:54:49 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:49 -0700 (PDT)
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
Subject: [PATCH v5 12/16] drm/vkms: Allow to configure the default device creation
Date: Wed,  7 May 2025 15:54:27 +0200
Message-ID: <20250507135431.53907-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new module param to allow to create or not the default VKMS
instance. Useful when combined with configfs to avoid having additional
VKMS instances.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5bcfbcb6c0c5..b4ed19c97576 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -50,6 +50,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool create_default_dev = true;
+module_param_named(create_default_dev, create_default_dev, bool, 0444);
+MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -219,6 +223,9 @@ static int __init vkms_init(void)
 	if (ret)
 		return ret;
 
+	if (!create_default_dev)
+		return 0;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
-- 
2.49.0

