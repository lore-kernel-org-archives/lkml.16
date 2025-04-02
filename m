Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146F5204096
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615786; cv=none; b=Ek7r9w6576YLazCCUJeA2K1rpK5jOgCwjmQAz5bSxjFZ3TORU1qqUaTZYRTU7Tj4dABkJSMKfmByRQoY6Sfj1u6lfCgKB1ZOg4vugJnogMWC2vMhEnBfeBGVOw+bQFPDKRCn/vY9oT2z26MalmyvlpEyuQmxBHefXNbAgUdH/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615786; c=relaxed/simple;
	bh=jo1ydT2hB6u1cx8n6xgWYmM/1GUAUgZV4IauZsWcOk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6WhBAi92zKvl+yyWlHxnaK9FhyL+WZIQH2q+tzPPzGgmqb9EJJhvGR+4BbAN6to4ZnfoKrOYiGLZ1QiUrjWYd4bGJz1hg1kAGSB0oLnQISbaPD5stlZ9iLvALUEdlvzbCx0hDbMbruEPCL/N6LARNr8frSiTyRNACq/Wad6uFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvZlZ72N; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvZlZ72N"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso523045ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615784; x=1744220584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riXSD1tORrHtkttiQwAlqFF38I5b7O133kwF8VYREw8=;
        b=NvZlZ72NmsuTsLlOegeIF+4KJ4p24yWGl14KmWoUBRi+tpC6DO9L7+Lj4MckNhwXEb
         FvFDOBvoAoHbYo7tLvU8dTVj9BXIV5JIBXiIvMgwETac6Gctnxci8LV2el+/W/M5U3lh
         HGUCSK2IS+rmixu5NfBHyuUYjQVOgAPxNzgQ1orSXz0OvA9bKw12yvAsH7nll9mN2OPS
         bXdyey/hp2Hg3YCYApBB3p38gL2pwIL45yRD21ejmI2kDdZ/HYWiXhKeflth4gyqaaTH
         T2EGs19VKRHKqkiNQUOIgB4bh19PxbPkuIkcGOEtFt3kJUi3ClCa99OlfrLOujXSR312
         Fp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615784; x=1744220584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riXSD1tORrHtkttiQwAlqFF38I5b7O133kwF8VYREw8=;
        b=Twy8pVitNg7jpGdVhxbG4Pqg/njPY1COmMkGvBFPZc/c/ZZtfMyGfD30cgKxjF5fkz
         aynuM3VXRAmxsYI8yhFk8qgBj75h4ubm/+Jge7Hfuv1O77tb3XkfOYxPmnr07r7aupko
         h2odxakfbOxiRcxPDR7YrOuLVToyT63sHXyrvFeoF1msRfHiar+W/y+g/d28v41L4RcV
         yAuQw6AFWMm9v8VD11AA+BRPp77FeQXtaFycVSlzEu87zcmrQH749W+ABbADLls9WvzJ
         7WRrmw2N9OJL99Lv0aIZcvvAdZHYdlvM9BuAl0K3u+cO1898QDK6sG63z/aVyheFK7eQ
         3Zww==
X-Forwarded-Encrypted: i=1; AJvYcCXKMdcQVX5drxLZkn526GkgA0xYSQIVYcL/L7bZk7WRHdUz/XAcZSS5ObAJSx+Tklud+RHRdATBiYLNThM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp2CtQysgIDaW6S2WQyjf8PK5XA0bfpGx+QNzU5sq+H67PJIQw
	XV1PQsMmUDKmFrSffxuMLcKOyInGfqEYHbxP7PW2VyCIV0/tOWnv
X-Gm-Gg: ASbGnctzjyeQxJU9dwptnp7juW2a8dDXoxfBpMa3lGMVs2G1UBP8r0c+AfUWnWRmdnk
	XGDiOuGiRTAlmEFKkpD57N0vA4iGe+vMMJyZYuJgcPHkoT87EyOAuOIR6NFNSy/VcATEW+H6J44
	5VfjxKKbOhty3F1WORDsLzs5m0B9EPS1whM3mff+8Jalibr6uJWFefSbX2hxm+eAUDvexkbmsRj
	hPfq6jOuw8wxYz5cBnBQLSPBUQ6SBm1iFenv/MUA1JSvkHmSbc4dj8YGQjEBXSz6ou6OiEI3IUi
	427o5s1ZKHIdoUUWUgv+K6YhZZE3qdQuk9RcJvPCVUYPScfy5GIW+OUDRtSDHMetWCSCnMyWgpV
	FPg==
X-Google-Smtp-Source: AGHT+IEbSBP+B3xptDWbc/1upPiI0aJgKHmWB2BUQakR8KahNUKIycomB71fjze7DtGkXTxHa/MFtA==
X-Received: by 2002:a05:6e02:2612:b0:3d4:3d63:e070 with SMTP id e9e14a558f8ab-3d5e09d9fb0mr177162865ab.16.1743615784292;
        Wed, 02 Apr 2025 10:43:04 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
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
Subject: [PATCH v3 52/54] drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
Date: Wed,  2 Apr 2025 11:41:54 -0600
Message-ID: <20250402174156.1246171-53-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..481d18561688 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.49.0

