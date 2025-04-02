Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0396F1F91C5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615769; cv=none; b=K/+mXJbskmVMSLRxtcgA7fPHOfieYKQIcs9Ki7jJ9g0IKbAuxm9ls0aPu79IXT3ZyT46iIKGKtAQVgeezz6T/ZtJQrRKIyCC7Jy64GG3ypB/Eg1ftVdMYs562rwY8aqRdhCGu2tSEUGFtET5JpNAAAIqjBR9mB7WlnDqUl+d7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615769; c=relaxed/simple;
	bh=oxoKuUQUV2T3S87wJDy4o3Zv+jpF2cD2sTqsjNtu6ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGPKkMzpAnZjOPu/HulBSBqoA0eu2GRr+hyvOIMxL3pm/X0rjT9j0VUzqFtJqL0gpgsOsfhJMFyRinKA7Z/EPFgQ8esdr+q8UfBZum9JHS0j/hlDRGWaL44bLGON8C15AQCN4Ajd59pkWMcyoizazsj7nwgCiAWFtwKEli7oCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFy7vsKS; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFy7vsKS"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d59c8f0979so3699705ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615767; x=1744220567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfz5L+gbGfT/xExPgo+08GeL0GIfXertlxd83qmdF8E=;
        b=HFy7vsKSELDzJ/UEO41+EaxaZuNMO0vlfsypgxf7MiGCm01rK/To2Wom4aGi9ve224
         nFZGOilK6NbBQFn0LxUp/g24k6c2I7nBdPnA2mTcnWSYoUUanpApm+SP7VHlCpPGDyiS
         JaXIwrNDE9S+xVp9wWN06+eMExVmmi9i4AllFPjsyagFnDvN0VqYQv9gOzY2gTqFfpTp
         ic+qCJpW6l1IsmnMsmFcPmT/JUSVNi/W5f+M9zlUOWQNUAJXzZ6s2hY36Huu/P+NS3C+
         z4LKC2vDPyG4FShNsTCzNGbVgY4jxz/a8d9zWXS858dCSYLMm+h4+suliMpogIKKqc80
         yGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615767; x=1744220567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfz5L+gbGfT/xExPgo+08GeL0GIfXertlxd83qmdF8E=;
        b=qllwqgtmEevPR4TEXxC2qttjTad2UhcE8tx4goimBCxXAOK47OBT5Fw5ooilKNeyZv
         5tJ3h2aYLTAGbh9G8JDQYC4fUDj2rd+AoAbeu+NU8rQT2feb8k9juHTsh8jM4j2kWovq
         lD69DY8bMqCaQdofZTZ4R3MWYZlaRFuI+5U2byRJPbsNOoEFTu35AM+BLsMaDDniBjZ0
         xISQfASFVk1iWhkG0MUD7kcY3SGBiXnmRuK8DAC2vZz2BlLDfmKmCbHMub4I+WZzmKF7
         1NpC5EZEO/9IkeR9xhx9xki28Q7RK/A54vs58iCP0JhRNgk6hP/XKiBkin4mDkTv/fh+
         UnPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFmaM/u1w4H7VfrE+yXlj6FMO6CrZxnZPo8UBv9hvy3+fhOMQKQ6q45REurEc3uCy0LwNkVpeIcXrKM6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8sepjcS5Fn6DsFWKR/EQkhVJEUD82fas7ClFyfr8Bdv+te+Iu
	ThGyG9OcFnaBbpL7QBxcsMwiEw6UpVovMlI2JwS54sf3U2GgStIuF/t5/XYm
X-Gm-Gg: ASbGnctBmICEPLjJNEo7sKqh1bOBX6OjBhl/xRXWk405MWrJTD1Azv43nOygN/sswjx
	Np+SSkUEjYiTUMJj/SrNVVDxZWzJZB9eDX38yHJdB3WEH3udizJYn2WXnCbyzQPHHBqviL74qO8
	tRhJNMQgujCPuBmTwPx63jAhr2EEm/yxURf82p4p+vNT4aj2rCHGDUVU4zbXvTHJ+mPAX/C+l8m
	yY71d1+seU/X5Q0/O9Z25FDpaMgUwWWxta36KQSpwGh5waN7n+L8fMB9CmSnoUjPi4ReKp7u1Pg
	i57OP5LAQV8dQawzZbwPIYKn3uZu4MKQZPOnWiHCVFiwi6OXKhd/F5NtuYwE9TTRFSGMG7MCDsv
	yxQ==
X-Google-Smtp-Source: AGHT+IH23Mb806SUSpux0H1ekpyWa2rzurl+V62I0zvWkX0PXGUg8/Ozal3zIS9c5pZxy7jQ85b1yw==
X-Received: by 2002:a05:6e02:240d:b0:3d4:44:958a with SMTP id e9e14a558f8ab-3d6dcb5e21cmr6314435ab.3.1743615767041;
        Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:46 -0700 (PDT)
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
Subject: [PATCH v3 33/54] drm-print: fix config-dependent unused variable
Date: Wed,  2 Apr 2025 11:41:35 -0600
Message-ID: <20250402174156.1246171-34-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 46d53fe30204..41ad11247b48 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.49.0

