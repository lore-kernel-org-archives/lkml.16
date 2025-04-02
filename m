Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D771F892E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615767; cv=none; b=s/JdHlXHp3v3dxc/Hg4gx2UUe76SZt0yzx1hAhAt3bJwyQ/DVqHplGtPLHkmgESiwNwwRgKbiMwzNwF+ckTov6wyLH+x+96Tzv21W5LDbIo18sjKvTwqG8Ne+QbTrqQVb2YZn3nGffECoqkxV1+PWG+KknyP9/uCbGTo7XFg0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615767; c=relaxed/simple;
	bh=v325/R/096chjTXtqgrNRnSwmubhuU0T03Rv9PPtR4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDDBrdK1SYVf6HxzkTt1lEf5+DG9gqCIBzklq5YY5Ja/6XJ9UjlOsjjBKPBylx7iR7lk/SLOx39NrSwWkEd+SdIJmCqaFjf6lzXMpFy3rbrmgc93QR3tg+7FkyXLW0bzG6RiioOGG/XwEdu19qr6vjqD0scoSdcUsQt6srcbDI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ3Dvp7Z; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ3Dvp7Z"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so476305ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615764; x=1744220564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtBnrd8yWB3oKPUJX24gJEUHr1Wu50+TDt3ZzWgKjdc=;
        b=cQ3Dvp7Zjai3xIWibsReYtIFWWADyUrVYMRY9qdeMJZpA/Ypr0kSUrTBHxgI6uxXmO
         E5baG7nAMYL4MZ0KV4bGWDP3Q3amDAhJP7PloF5j/xxgI9x+A+npDEcbkPY8RK7jAeTn
         KmDNmy8zg7CS6YvjiKm+07u0nq4lrmFPxOm4l28n/Mp3h2h5lGKQCBx8oGMBbBGFnjeG
         xIZJfT7Fe6V9lFfR7Wm2je4hOhsD3ncWQIrQzRkmE1DuYQYrqLABNfVUl6Wo5iIYQAzt
         4x0VHK2UrLdo1OUZT4uXC9PCnD6RZ1BwPqZkO2oDXghAWGprnMkqNIZ3lYLEKWD39Wml
         H6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615764; x=1744220564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtBnrd8yWB3oKPUJX24gJEUHr1Wu50+TDt3ZzWgKjdc=;
        b=XNpKYruuRdl1nqWHdTosXe9vqtRS15qNaExuyDfrw6AC7Al+PNivH0qUFeIaDllNvs
         Ep/Rz/2LGrR5DCckjzyPJu5gPnYK1YRgpry87Vvo3nGF4p/cuQdipLhQQS3b1pRPElWU
         rxLD+gUfF3nGC9j4n+D/rc9sbziAg+6PhiG+Bzv3i+C7BJ3r1LZzVhrPB1RkBvI/WvJS
         4/7x0YrKrHajCf4EVaLoA6sRD+x6GFLt1btebO6GfLeBILSjUCEa+lwKTOegU3FCMTtm
         WnH95uP6h2DS16xVcKgBswBB4+TLL3QPZTUqby6ytY3IJ6jlyvp+/YS5qyHVrNR+aJd/
         LCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3sv/sCTJ2D9TqRKmPRyBm5girxUwpj7SeZLvgiW7IYsVsV1PtNuSRRlMJ3gjCjQxKYaJSRe5haAITff8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47s5ZmUOIStXXmdUmAARzrk1e4GkyViEM5+8Y+KW1q0hpFCUc
	m2L3IKJVT9nA/BSkHYq1RzvuojhUrXJ4v33DUNViCEGJ/Ymg36e2
X-Gm-Gg: ASbGncs1hvpcAccubE+FGrok/hDyJIayIlaU405be+3hw6UNLx312nd4CcDyypgM+TT
	xex+qDmozTcoSA88gTSBUsLoHtLpiMWhGSbThCTTut8W9ane/g5HheI9VdPXfJXSglFrHCD3kox
	BhhPLA7PFxWD7LSImxB/zouE+QwovXkjVZwS/1h/4DS4LykKKtUFBAFl8a/OdB3At4eos3EzeEE
	PmMVDRi70e06aC1v8Qiv1EWBoFcqBujTzfkdeNb1it0BrZmMKrzLbnPMzoW85Rgj1++wO3vGPdA
	wu8HaIAAGwi522fNLP11QY5chdsT6s2Zt32CS6e2C8E/096AEXGLRpHlaonVZpR6DgzdgQdr2ve
	t0w==
X-Google-Smtp-Source: AGHT+IGTBl3lbbr6SJDgP5PSLh5HQqCvYpL4DLPKQgcBrXs/j8ELoLu+4SyOVWtWqWN9s2TkWLcitA==
X-Received: by 2002:a05:6e02:1a8f:b0:3d3:ff5c:287 with SMTP id e9e14a558f8ab-3d6d5535a0amr31636715ab.14.1743615764063;
        Wed, 02 Apr 2025 10:42:44 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
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
Subject: [PATCH v3 30/54] drm: use correct ccflags-y spelling
Date: Wed,  2 Apr 2025 11:41:32 -0600
Message-ID: <20250402174156.1246171-31-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56..704f94efc804 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.49.0

