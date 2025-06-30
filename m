Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992C18FDAF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274066; cv=none; b=ZWefa6vV+1srlZjf2EEONB5LUnhaO5uCDEf7DgHRWdu94uikoxTt4R1E72C9QVz1Wy51g3rN27ddZdJoB48s7lT/zSh4/WYoQGZ+Pt97lZHIgyfWSq8APD8sVwI2WQLkmjPoY9TcxJ+dtXdRxluFAAwv/axO7+gAfqPZvL18KrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274066; c=relaxed/simple;
	bh=5npngOdxUmHN+lF/SqrPiA2DpEkWG8CGQgBm0/L7I8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xiv1ROLnIz4G32u4oFJNAf6CB8sblXR6a+BbUT41zE4euYBosChnPbWO/jQk991wCAUB6XIPfVck8Pboo01zk1MebD730zghWQYRw9ikzy/tUFXKzQHnX8brLM+yzySbs/1d81MD10lltBjb7/eSnANCJqQn3vRT87EU+HeY6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAzkttBK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAzkttBK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45377776935so21311775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751274063; x=1751878863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8D5fEs3W/3OgFaAso4SEPNW3BjgOw64cDQiPdn3KhyI=;
        b=CAzkttBKayDnOMEldfSg/bQLkW0LQ1inzFBegojc5i+byhtuDShCmShn1M+hFP0qkJ
         vns/6DMiFFQbAu2RBHz+gNfXDYKVwZaOQOhsdvr7o7Rq1MEyvrabCvzHja0r4U4XzevH
         vZhorxzO985AVz3v5vHt056odw2mOae11St12vdx0IUvVNAVGxndc95QhtRHUnMvvd7t
         5XfIEO9OPs8co8/8FIuSo7sl6aT7ZJtdQFX8oH+6gTtWdN5XHlyhXt0dTik7RPorhyvK
         1aKv6qLDtpV9sA3zihfCbr8LfnVi5uRR87k3Q8OkG7KeY8Lt/cMbsscGNaJz+2IEbKIV
         2c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274063; x=1751878863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8D5fEs3W/3OgFaAso4SEPNW3BjgOw64cDQiPdn3KhyI=;
        b=KChBGsaZETRzTHhNanvkccFWxQNhrQtIEWLhJVir3lv8UdWLsfjODxYNlzbMfGTn7L
         3CQaX4BrRvWOuXRaFQdgSqfeUHOclJgTDZKDga4iiFuZUeUlFtOpM8DkG7agvcBvbfqH
         658FdEWEdM8I/usmaw5bUa6nldGTYZMKLYCWa7yTBRvTizDJCpI8b0127qywWKYtl7GT
         vbgwCe9H2KSeM5uC9PhyTI3E0rxyToayEDugT2w1AnGsOHWHDrhCzTWovtGyONt6cwnJ
         EGYedTQdz6ztj3xSyWZ8XzdKNKqVc4ZOqL3RYWaiRUkf3Hl7MHjUfF/ZVV5zfr/979La
         I8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtsrDpvCB3bHTt7aBONztGx4345FPltae99R0LK3Sl49R/1bx1rn/C0U/Vq7P1/TDp1bis1YMJlmCgTBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIS/Clj4iMVHUA7+3vpztLBFCADHz8KWtqr26XMGMho60y+RP
	ojhpMOBP9/eInP09EdSBQxgw/t6ZM6uM/kAZrgsqRKKaiXmtmTDMtVze
X-Gm-Gg: ASbGnctFuQxv0sUFU3W18FYLhbnYBstbPS7ZnX/HDRUjhKPDUnAjhMY1TxOwclIsAUr
	7BSXaRmwA1yPGqh7o9w1brw5diY6D/IjWhDYpp4+58FtI3oGi5Ocv64J/DzAS/Y/xWjdsQdccwR
	Rj+KShBXrva6+8wN+1DYKBtCSaWqjA9ulE4AS9VyBeUZx6bo0n6mRbz36VIFX8W6wjTwV8pwLoi
	ihju4AsjPlp9gwRrY+lNFtCIYqpSDOVs18mQwoToZzrczsuHgtEvllLUQNLya3NfNcDKOi1MEl4
	BXnoKbpIUdvBRsXG2ucUm7wd8GvMEWcE1oyHOe7Zqc7GeTTTRXgnQY+K0ZI=
X-Google-Smtp-Source: AGHT+IHzmHSs+NRUkRNMpZU3xwBsMXuAdiecH+Fh3OOHUPJW3ttnLedY0OMvYKUuBgt2yaOFrdVgng==
X-Received: by 2002:a05:600c:4fd6:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4538ee4f9c5mr110923885e9.1.1751274062747;
        Mon, 30 Jun 2025 02:01:02 -0700 (PDT)
Received: from fedora ([94.73.34.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b516sm9588408f8f.41.2025.06.30.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:01:02 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/tests: Fix endian warning
Date: Mon, 30 Jun 2025 11:00:53 +0200
Message-ID: <20250630090054.353246-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling with sparse enabled, this warning is thrown:

  warning: incorrect type in argument 2 (different base types)
     expected restricted __le32 const [usertype] *buf
     got unsigned int [usertype] *[assigned] buf

Add a cast to fix it.

Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 7299fa8971ce..86829e1cb7f0 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 		NULL : &result->dst_pitch;
 
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
-	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-- 
2.50.0

