Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0A5187346
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274067; cv=none; b=gdIE4y2l4SGivT9neESoN0bst8AcK+6Nsfx55rE3YLh3k3+r5qX5n868DTgxvdVIjP+L358bEJ5OczSuXaIe+5sgF5olqspGsoEpglFb5/vgxnqKktMiNKTlxocJhsNPFhbi5+GEV7ZpZUObB+blpxcmwpIL2VeX5S8ja9B/wXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274067; c=relaxed/simple;
	bh=rfzCgBEWaYCiudOe0Ir2DKKsp4oc2CFcNdaoEmUwWRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8Qzx7gOtiyDGWiZ9U6maz5pomGfwo9ctnXJ5OSVwGd6+R60bMJKHws0iCw/+wowPU7OonnqENgeBRoGfzVczgLz9mbOnpOr2m31Szy89AOx1ZqPfj/2BzatIdu6wtLSwBPgEuqwYqvA3pZ/jhVhwGjjisei1htJJ3IOCRs/PjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRNvhvU5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRNvhvU5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so27192795e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751274064; x=1751878864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w95P+dWG3ZuObvzvYSEnqdj+iXFN6Vo8U0ez9iwhMbM=;
        b=hRNvhvU5HoZUaotzJONCLsCIVSO6uyubm1NfMpGKTa0N0Uq4U8DaTzGzuyBmFnpljk
         CAANyd2O8oYDRcI0arQjf0+LMw6PJpn1wxzDli8DjKNLqRvpDlFpCDCSYQQFetv64Tgc
         /XKvl5thqQS3ZtDFwJdLRsBxZEsVXMlbooiToBF8Da57LNUmlhd1OEr4I+9GaxVFG8/M
         CjfyYAqbtEqgga5ggvJvA6Lshu0Zhpk2Z4EU8LMc1h8mHF7Gy4fasCj3wzbiQkoknqK+
         LbScRTd7aR+dAeSwWmRGhZqxxY4We9bElfdo4g8YZ3lfO6mDX1REVf9H34lKqJ2v7tDa
         Gm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274064; x=1751878864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w95P+dWG3ZuObvzvYSEnqdj+iXFN6Vo8U0ez9iwhMbM=;
        b=Jd+vvuY0yX3Z6jsC3YYiw2Ih7yioQmkct071F01cm0yCGXE/Z9N3tAqrD+OLAzu5JJ
         euGU9cU+AQXCgduM6VdejKWa7RU5yYXtuIcSeqiBKQa4yud7L/ED6YGOtclqyMBcveS8
         0hbjYhf+Mj/LwcTYo7CPipo7uCE38R2jlgjZcY6gKQOB5M6aEIfod3TNEUIl7Qg3IpAw
         bAhCjvWQZqw4wfSiHVIRJRjMCd5YwiXzqRlikrOX6V8EtJD8FzOOZVZZDUJHLzz48PMU
         sf56apVwNca7imowNMbykz5DRPvxrUNvx8Dsz8GZb1zOv+CLfd0Ed9dI5EFaGFu5b3J9
         ay5w==
X-Forwarded-Encrypted: i=1; AJvYcCVMnUDvvffGIUp3lFLYJ5GZhdea4ApBVDkeOYoF6jWi8+l2vA7PsYHtIXsE2gdq5XhyMc3zkgMfYJ9V/a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEB/8rdvNCIr3U2o49J3yS0hkX0M61TYz2OPhNb02jWHWcCdPO
	bYmY8EiOcWaVvoFro4pqvw0c3z8qzCHFvwo6Jnqlgdt3hOgJxiIcNYwR
X-Gm-Gg: ASbGncsLW8TI0UaZsGwWq/6vT7QjsHQcjtp6wa6q0pmvxs9aTKwr86CQpij1pg8dsQN
	sjbzEJZXegJRf+JQclr/0jm07W3F8imCEtzZegbpUsY1k7JXiKLmnRM6eZiH65udoKPz22PULKT
	BMHSWSWOeYRmoRJ94cyUTQ4PvFyUZJNXwGP4C4KJW2qavYJovlf2Ic6b5LCeFQTP7kUlQjESILm
	Grpm0+aFsK6KVZXkNlbe+GTHTpPRUBLlfN5KWBIWFoOpPtWjfQHVsXWvDyh7h3hCQW70rNAWrCE
	7UbgCSnOSNNIP6JkFvZAvbzAbxTZp3oJVvuPHdNmgN4qErQ/IpulX9UODo0=
X-Google-Smtp-Source: AGHT+IEr8Bta3Dn7/9urhfz6+RJ6qK8vLaQt2JKl5jhIuXqaJyQdCt0DGEZzIL5ZZLcRPHKk0XkHHg==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr98930845e9.6.1751274063522;
        Mon, 30 Jun 2025 02:01:03 -0700 (PDT)
Received: from fedora ([94.73.34.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b516sm9588408f8f.41.2025.06.30.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:01:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	lumag@kernel.org,
	cristian.ciocaltea@collabora.com,
	gcarlos@disroot.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] drm/tests: Fix drm_test_fb_xrgb8888_to_xrgb2101010() on big-endian
Date: Mon, 30 Jun 2025 11:00:54 +0200
Message-ID: <20250630090054.353246-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630090054.353246-1-jose.exposito89@gmail.com>
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix failures on big-endian architectures on tests cases
single_pixel_source_buffer, single_pixel_clip_rectangle,
well_known_colors and destination_pitch.

Fixes: 15bda1f8de5d ("drm/tests: Add calls to drm_fb_blit() on supported format conversion tests")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 86829e1cb7f0..981dada8f3a8 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1040,6 +1040,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	memset(buf, 0, dst_size);
 
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
-- 
2.50.0

