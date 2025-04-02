Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB28200BBB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615782; cv=none; b=jktHOS+JHrCAcDHYkOhc2F6lQyvpzJdfcKT4gfIpagiN3GifRfHMkM0Egswbpy0Fdli8NVEBykvI8BCyKhPbpxIYqbb7wzBWEVwTUVxv/Vw2XEjGmbB5IXLXTBNPb0JlvzW+Da+jEkcgskYoRvB3DNiBQmX+Qy6TZE/LGU5n6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615782; c=relaxed/simple;
	bh=106XxGOuAhdnmay00WQENaLHjezUM4Q8dwXi2xfOFYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppwapBkG1Zz2o2pnwNd/+ri3hA1CbHkV7xeLQUUVV/0bZNuvo6uppgAWJhIxYyP1IVutVWrBnECawBnie4jxSY2QLs5fYP2RjEbZBwJbY7OtLgjjx7d1lEIDoRQMyEw7s5C37SC4yf4/8Kb5U8JkOQjXHBtfC9mKpX3Z5NaVm3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MB4fh197; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MB4fh197"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so471285ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615779; x=1744220579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTbNTI64Sdb94F5FeGTeZQmx91wNwlAKHYCBLiEXOdM=;
        b=MB4fh197wASE/KUCsVYm98dHz0MNwfCam9pT4+TIHF50KQq8+qujHgDFGPQZMfueC/
         GyHKXUcSrS5heAe2T5qFi0BxaUWVfHkrI7NSd06lgYgdsUX0kvhyKgbu+r4noCODB6W5
         UjrnL1yr0YiQueKxPTfMQvSzndWCDpBw3TCUMCbPhcziSI+9Ba315wir0cr/0njlDoPN
         X6KlNeyNDvWNR5nwTS7Vwwk5nJG77cSuIErU9TD106T8kqc+ZEduccbBWAjdTCuURCuz
         z+uRcKmJZbdLhUdw8G1w9NKQ/mnJF9SIfEVFesLPTh+VO5UvBKToDQVVJ2UBHkxyR+MC
         jP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615779; x=1744220579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTbNTI64Sdb94F5FeGTeZQmx91wNwlAKHYCBLiEXOdM=;
        b=om4t0udgpxyrbZbCSvGLCP7oJZKh9QCrrE+qMJ4WAVQmNK7r7Yv0vsdLed1VE9m+nk
         mxugyoFjJ00FaiM4HEpH6bfStRQAT/rfpw95A8J5rKO7D+FGksCaXpXFPBgXgwtyTU3e
         dvR7pzq+OogTC8Khhvsr6IEgQ8AM55ADET21uTG/3AIdGoROeV7X4tvj+QIsFOfmrThZ
         G6Xff6FPIuEw1/bQW/79bPKmdtSXm9j3EJQJtj1Bqpjl0aCuN2jXy7mEUeevarPjj/CM
         iiofuTZcsiWGhiyMq2CiEVY8I7qPT9qUAuGKWXdtE8Zwt2rlbO6KabfLymZ3iC2fKxlQ
         qK4w==
X-Forwarded-Encrypted: i=1; AJvYcCVVG9JyOxN2OdEJhA0wf7OO3CU93+Sq/0LOMFW3QuhmLrTwI8VQCqUF3a989z0azmxrnk1GZBTtHsZXJJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/vN4AWwQ1nBqZzjg2BkeohB+RnyV45EgHloXMbRoXaLVpXWR
	mus+nbZI1fFRhZw0igqGJcH9g5O0eBU6xW/J0vAPcvdDIID4wDd2
X-Gm-Gg: ASbGncsx+3+7yBvbsSs4rant9of73+dI9VaPiwFDftHqjwW0HecJGJSB1Q3slL3/1VZ
	21SX+ceFg4e9ozoOUVWf2xudCKdQzXb2ZYb3pZFsZGrhMm+J6bY6M95lIV0vB2GYC+oJakS52EN
	zYqfJ88Hf2T5SHlYS8VQEGKYFRvNWXMn1RQgotVT3H8FHuculBisrINkAgSrCt46I76EyRKSZd8
	9XlD0XOuv984JludgTiXyPATlo8BiMVPcl3KObKkrQb4Wg/OaeFRM4c1m+6w8n7yohEAtrxR4Xb
	82lil87OSV8bgK6pqZtVCXyUcxVm7vZCNwW6UoT3fm7dYO9L/eJpIqd7w5Q+nHOPZXgFsSXY1aT
	yow==
X-Google-Smtp-Source: AGHT+IF3u0H+oGQ2/wIhP84jzTNGBP4fVHIk9OQhmyCTNULQcvXR/2W1nzJq7bC541uOcFJorl3+xw==
X-Received: by 2002:a05:6e02:198f:b0:3d3:fbae:3978 with SMTP id e9e14a558f8ab-3d6d548bc33mr33323115ab.9.1743615779091;
        Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:58 -0700 (PDT)
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
Subject: [PATCH v3 46/54] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Wed,  2 Apr 2025 11:41:48 -0600
Message-ID: <20250402174156.1246171-47-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f32471c8533..2b4f862fe5d4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -279,6 +279,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.49.0

