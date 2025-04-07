Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5722AE4E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013690; cv=none; b=u7ETRmsM6687V8PQoz6QyBZ2D+dogTUbQsoCg50U7ZbcqkD97e6Jw2GuAjS7qhc487Ny3rh3I/+J21qcUD2UFk96ZX5HwlzRYMAEkCAEtPOmDErdFdRomgd5wScLmCyvTTGPHws374EN4DRinoxdVAtIjT/4v7hLl5zm+zcj4Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013690; c=relaxed/simple;
	bh=ruD0UQijRSTbAbiYbiy92bcwQmGm+acqNJsn/Xwt7PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j4T4E9ZjaDq5HQp24b08syhyN0QFJkfq9VMcj5jvkBzwlrVpdL3NZbzfsRF3Wd6lUnvi8Eg9cu7WCplM+RtdnmwFXHLJeDlakc+BVbMvmn32JGInjXUP0PcWCaOzfMiN2Bk9zvdl77a9or6maQrcA1aBs+qH+K25uqJBlOBk26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqHn6g9x; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqHn6g9x"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a823036so36791315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013687; x=1744618487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
        b=DqHn6g9x2yS3yXvW40AQcRv8mI9GP1XVs/URBpQ3J4tFx8FKAvdQI9dJEi0THQP+re
         r/YhpzS52SmwxhjGQF+PHbo+d9XR3twooyuaIXGV6J3Y+j2NWWFVRcz0Jpzhm5I69H/o
         sl5rB5vWvdt8JvQEMZLSr1h6XmP6ykXzscrrxr56S4IE580j+whzYRQpOeYX149i796X
         41xYD+eZvowMiYcqUgEVCrEoWTJU9FjA49ytZdTIjwqVIJN7aqBa+JC26frsFiQmk7OJ
         sijfrDd/TKA3FDo5ISahJQe+ncEPKPWMuAsbtVikBqn8OcvJqyB9SKgd1QvKUfgKsebv
         Trow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013687; x=1744618487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
        b=Cy0RsMxZ9U1eJOFDPVMp4Zt6CeEJL+NnqMyY+QWd/ZK18px5Fv9c0N3vOIyDfGN+ec
         QlKfEPK0W38tJlh/Gc4T5AtrZ+wGg5LQEYedU1pRspGmQqg+0W39YUQqZov5GytjvdRK
         8osgmPaoWI73qUMmPPiAsuXoSbLBiCoUKTfxgtGyJQj5BoJFH4gwca7xp+AwsdSirPL5
         Wgm9MYTsC4mG6MN79qId2TIYO04Nb6XAXr/150YtYkpkiu1eZVud5mr5/r4t6CvyPLcq
         mTP4iNbzHTCqQGg7J94UzJKU7zX2duhmQxA2qLv3XMSKl4o2+GUOfsCj+cTmICZqboAv
         Lukg==
X-Forwarded-Encrypted: i=1; AJvYcCVP4/pf8QAn/MdkEtaTD0uWOZUkSp9kyKEIjptLiShknXNx8sPHwwwDUcInD4kEu2VOAOLBIhBeooAjI+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcsk9hd3bugNzUF7jQlbWLRW9EMkdhlR4Z9nUtFQWlyrkw7xmW
	uESqt5FPl5wSnZMnF3iZiv0EAEUIqQWj368AeQ4Ysz8yM+v9zVB2
X-Gm-Gg: ASbGncukrO/0t7WXsn67cu2F6Cl4115vjZ2pLYIP8rMUweVlHxHG5NaF9wh5sBa+ueg
	GmN8rQjrEfJ3wr/qHdQlh5jpwG43OqVun/4LIQaH8vZxH4um/eWiC7q06AO/6GGk4vxRZECXmyk
	VjbBziRl7QsPLtgcyKEDOCakZW1qdBmFUmDzOC9jwqt0/mdHp2NCbVkJfYuSE+OWsI4Abp9QA7q
	665aodwMte1WrVepLRWPPwI4W9+C5hb+eHiuR4PyD6UMwOJ1Obdu4LfkcYc2VF3vVS8Poaaq4Rc
	P6pTjMJTvx9ZYmPVwrz8whgZ2OGj97woVM2XZhtCJneZ
X-Google-Smtp-Source: AGHT+IFEC5GG2+hUc2x3gBJXtIb381aGws3rfz4/kdhZc+Tli1KoK5wHEcldern7+kcj8ZfKsinmig==
X-Received: by 2002:a05:600c:3d0c:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43ee047ca70mr75672455e9.0.1744013687392;
        Mon, 07 Apr 2025 01:14:47 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:46 -0700 (PDT)
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
Subject: [PATCH v4 12/16] drm/vkms: Allow to configure the default device creation
Date: Mon,  7 Apr 2025 10:14:21 +0200
Message-ID: <20250407081425.6420-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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
2.48.1

