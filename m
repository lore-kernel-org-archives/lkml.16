Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8A201032
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615783; cv=none; b=LMqhDd1aZLUrR1RmQP/FGVObL7YFj2xGkyo08dcZ1rzmFUKMpuzgFybf5jfpI4bUGC7kbZ4yC9UjwAbOnWXEq8QLMDC7eNj+sfoqWETBpM1IQ7rUcinu6RA2q3niCcRY7uHH8ulLx23I9XEOoyRszhq08041GHzbNao0s09oMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615783; c=relaxed/simple;
	bh=CwWS1tqqtSrGX5l/zPl5jVAGna1ng5cXDDz/wrrMCME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGWTuPZMnab4M2MMcvYVg+QLlRBQTC7+DmeiEgWRx8KTBwNwKlIqHZbth5nH6uH/T2282pOTLLnaNJi/UVrnYnzMMu7/qnFnmNQ0LzY6bWoXCswEY0/+uvsZtIACP3JVSTFbpNv/p0wm4am4YWP5/JCbVj/93soBjsbYLD31N+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLm1pLQB; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLm1pLQB"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85e15dc801aso1021639f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615781; x=1744220581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phnE7T3rE82X9afYdUepg2ZaVnfZbBYGopazv1dsHzc=;
        b=XLm1pLQBftX1nwCQ6QzViTEbPhHsh5vuxd2jGAzfEXghRzPICftIYczlguEp1YTYAM
         t6SVfCL/EUhyoK/pc4F6kcvCARmjYlo7TLKkmQwLgkkPbSqBHpccLYXrPD0tfLS/BQtF
         8rKmWcWRnhUFE8EM1V5b69/Vq6YliCfsoSirxLz+UbCmP3Zq7YyL8KxeaT71ab+2hkr6
         40vcV73iw6KOrFnz88gy8STHLXUrPbkUF8uAPzxlGnFMwhKc5v38dh8hJbLSh1lApv3T
         YKALShViaO/fOYdYWqmh6DzUTyrglGmOaL6S+kMmVau/KVYvJyVsWK8bOD14oHnE0Mtv
         ZbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615781; x=1744220581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phnE7T3rE82X9afYdUepg2ZaVnfZbBYGopazv1dsHzc=;
        b=QLBSS75HJQW4W9P4z6ltohA2OWxDheCF3k94fqejeAyk5VSWgPEoOG9mT0ayZhNl1G
         LbEMCFN/VPVvQQrI8KV0S/jtZmVLQqrub+iolxesZfPaDpfijNfBR7I1mIxe/67YWTTo
         tVe4Vl+Il7G1r1aALFEdz4oHG4WehhbEw7QBznht9PRUnK3mH18AN7pUfDIB+g5gQhNp
         8GoxIKRl1I7hUDE8+bg2bgSJ8xjCZOMJAg7axX2iZ36gBv2QOTu/yxgX+VQzJiQ4TsAe
         sos4YfuDhcRCcN5FM0EGRqv5rskCFWdE+uMFPfKk0efVnYYfz0G5NhbJlWu5CzGKGTbo
         DPzg==
X-Forwarded-Encrypted: i=1; AJvYcCUMfuh8Y7g9UrqCS8RmUHheup3GDFai/tcwoeSOtY4XTX1JWIula82D3DJ8ANrII6Xz7XrJKF4E8s7AgL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bk82Dda+4MQjIZwIOfvjH+cjRVfv56+7ANryCcL9Bun0W90q
	SJx/bBRzkLkTAcjLzwj8GP5Vd6yjiKGftRVE1wgR9mL3xIsxIejo
X-Gm-Gg: ASbGnctRDZBKo946jjZno1zc30tyAPG9ENrJZUfNn/smKDtvtJ+XTVUx2oTS0xuRBGH
	YEZrGEqicruP2rPGozR9X9+uc5hijfuZ81mNITi7sgj1R+9oL/yNtKfOs6DVx3napHiBnmLaNJX
	eiwNy2KmPjSB0wk+eQEsiF+1D+OVD5bSJOes1kISAfVTacmUbiKSjjXybJ9G+IhrxA3yuZaemtA
	RNwh5xVoPKdzQZPzAJ+j3TAJYsse5crLuySMqfA+RrCS1K0dp06Ks8mbg3I5awsrum7rPf5StS4
	K9a8a6YPB5FCtgIPZuhNS/nA/MasBXL4Hq8sG5HqhuTmYpVbPuRdJBWtkwLB/TOtyFJjcELgrxl
	CZQ==
X-Google-Smtp-Source: AGHT+IFuJV2A3WyeGyRKkWOVHXtPxLV1+Mi2JNfQFD+IYZFzlTa+4ZUBb0ebsjuh3kRTyYLqlLO2Zw==
X-Received: by 2002:a05:6e02:180a:b0:3d0:4bce:cfa8 with SMTP id e9e14a558f8ab-3d6ca5b1d53mr103006025ab.3.1743615780941;
        Wed, 02 Apr 2025 10:43:00 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 48/54] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Wed,  2 Apr 2025 11:41:50 -0600
Message-ID: <20250402174156.1246171-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..ba57c14454e5 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -19,6 +19,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.49.0

