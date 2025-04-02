Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B001FE462
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615774; cv=none; b=jTXEn6GhAbIrL3Zp4BVrDEU72viV5ZN8Ho5fO5h/6mTJS3bwtD//R09CPsAYWbnq1py2Hg80k4qSwv6e+bRt9P4Hce0tI9VNjBEjHxkRiS3QrHjT/jd6vEa+VGAZdhavxj7DE9GjFRm8mLhyc6/MlV2vy563Yd1B3u2RaWooijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615774; c=relaxed/simple;
	bh=CCbGtZN0MSaNezxNIEzBeKb+PPD7j4O1rDbBtijIoDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+XCw4nexTfCFEco7cUDOkJMrC06oPzOO3irEtmuWEgg3p+tmXhhGOc3szRReALluBpVcuApmca4I+3oPeiZwsa2gbel7rjQD6jejUa68+f1O6/tR9sWieqjBsJJu39rGDgnelI1xpV8bMj5G3uXHkd59eo37fh0g5sJsBxyAXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGS8HUwV; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGS8HUwV"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so491455ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615772; x=1744220572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FATfNmmYepyBuSsmf/EtXKQeipPGgu5dSGlE3AdOnp0=;
        b=TGS8HUwVqqL62Zrr85z42iN0u+AiSHWQcFwyXbMGDj6EAyM4tCTOIsC4COmOFn7gox
         7R4rGUx0+exOCwr98h5Sw2Rq5vw3jAjPXUcToocaIPoIRXLWBq7zuFdkB8sit5ptEwos
         Ow7mim2Qsqn9brfiCUkzhq4xfSjjbPKTMAyrkJ+guiwHcgzlYH352yizWJIW5sGHqaDX
         VGeY7K0Vnmtrnjse+CnetpQVGUS147YlJeBceI4G5OZ1wBVG82R6lOZ4d2SVQWBaN40w
         wgmtSnXh8wWcgKx+059Im8qiFCstEWiewecSdFo5tjXRjbOzU+H+8Kk42OkmQvwW7JAf
         LS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615772; x=1744220572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FATfNmmYepyBuSsmf/EtXKQeipPGgu5dSGlE3AdOnp0=;
        b=kiq9v0avLl36X/1ogTRPbpA0cxNk+HjhVOYJg7Q8eFobAm+1XtiyLvLDVALa8vDU12
         eLh7xm73BicpnjSihKVWzFcOSANX3CawLbaHbBkEN+ZUVwi9suwy8erwfiW1wY57OisZ
         na9oWCUDw1w4wEc8oLNk/aPgXophVO/oWzgyeM1oC6TOZDGDbXfVxKz+gRoiGjsK+XwW
         L+KxbX/1cJd3vkq9sTsrrYz29YSrmNzo1gUL3FoxptZ6XtGpm+PLMEjS6pX8cKYiLnu1
         sZLIFR+Gt/Ky0QpsaVUyUNOCNKmrBgNNlfqGQo2wZHJCeGtv7nEYINuAbvTcU8uhDdCH
         +Whw==
X-Forwarded-Encrypted: i=1; AJvYcCWTF4MXyzRmlsiLpRYHJpn0eedUxM8/+/OFs4noQUAd6wEd3Ro0Fdk+/1aDtVYZu9ZUOSeqZYkpbR1nX3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6IZLHjI/5mIbtLhhJ5jpLatMmgJ1T4kepQhO5EioIRR29hwi8
	Y0oiG0gmTpEQoq366EUaYM92aM4Xk86bzisyvlofH4okCjDaAEu4
X-Gm-Gg: ASbGncu6x2su4anHcrNfLSOSouNXMuZIx3r+Oa6dCq8kzHXW0ipv19G1RLIzR+vlGXr
	DPM4lBpi6Jamlp66LFMGCOCMZamKN1m6CDSOW/p0ABoI9LBKuL2eeCsz4vEhqrfK087xZY/VtGK
	SjYKmOsFVTjlH3wJsSyFutdNqD68vEWylKLCGGNNj9GGHIFgm4nHL1JFukBzw02N6DHtRxhIFl3
	I79voKudXiZZJbvzO3tae/6YTQM++xo/y5CQqr/Ew3qbyBM+S3NgDKlez9i4P+OF+1pqWe9oJ8P
	iUeZEP3einL+/LaVWrSYnHuJSgmJou7WyrwiPKHBby1etw/Q1DKGMEApMprNA6fXoR7prCyffFV
	GWw==
X-Google-Smtp-Source: AGHT+IGe4ZjeecOx7VkTalotPIU8Orb/rdY2ZWXpy2CrhIYZ0sCG25kLdKxcJbOn9Bsi7SG3UWODzQ==
X-Received: by 2002:a05:6e02:b4a:b0:3d4:36da:19a9 with SMTP id e9e14a558f8ab-3d6d5535b1amr35121145ab.15.1743615772465;
        Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
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
Subject: [PATCH v3 39/54] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Wed,  2 Apr 2025 11:41:41 -0600
Message-ID: <20250402174156.1246171-40-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b922..756dba5c88f8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.49.0

