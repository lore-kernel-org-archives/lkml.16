Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12438A923
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620938; cv=none; b=XssHkWp/QRnB3oxwIbtOvzHJGJZ8xCagTNXe/MzQlNQ3UgSejwg0Z6AJwVLRWe3Tp3QmZzT+1+Ah671hQY1GyNeLRUyYt5iedut3pM8eeof9efMbpa7/LdIow5ZgWUSjW9LZrT8PmUrbHkt0OelhOu4GjawmJdo9hAGk1dgqj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620938; c=relaxed/simple;
	bh=E2p22McrbaqEHRKI9B/S3hx0Dx/7v7nviR/yq6hqhSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXOpsJ3FqlHpn7hpfxzPK9Tgd/fupbmYOkdxZHpNUvXdgE5BclnRsI7T7sRtc2WRiJCagUuvGrS2/EAutE3BBsGLNYf0tbODsShehVvd+WxxrlFJLgPKzp+8TD3KBGYMaQ7bPP1P6DjTe2ZHAAXkC6NtYyEOcSblD/bA79uh5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hv9I7e8w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hv9I7e8w"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso53102975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749620935; x=1750225735; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxLsl1EtZ+/S92kRfUwyMhLwGpM1C0JZqmhvFyqhsOU=;
        b=Hv9I7e8wiBA89/jkZOm04/uYx1i7msMsiyHx0a3nACro4aNlBgCCbGYMkkxTZcPS8K
         INcx79O7h5BrKrqWZM47tHSjGcYrdPGCAvjAlWPkTcu3bJWDD/NkQyKEot3MTvBjjI5v
         NPLrnLgPEjr0sqXbyNj3C1taLZUQohjasJUK+L2F9uY4sBb7C6j5r+lXdkLAmbjnvpT4
         tlWaQ3pfNEkBEcBJ0zp7lgVon/TCOPCr1cpTZ6WYCMceo9PgCRxA62hYLIyZtlME+OXH
         S9GEQWcUHU7TtI4o4OcKIbz56T9GIFaxQrbev5thVO0va/rsnRjRnHk/xdyBB3kmlc3n
         7isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620935; x=1750225735;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxLsl1EtZ+/S92kRfUwyMhLwGpM1C0JZqmhvFyqhsOU=;
        b=I/RTGAO3Nyy5af5oTWMd8PNC2F9qpGpom9YDWc3E7aNqRrWrIOupiKlgtVeyFbHdJO
         zyFvdccJeF52I/Hz9GKnbx1J4APO9TEIpU8Rk6va3h7/vn3o1bxHwh69ZX5JKjmAcPET
         cL5qW/rIT+kvAIMyTpY1uibAOJN9H9nwYM4uTtJG/8EVeMZqktdqhMdto2pqhs55Ldw0
         esM4oSoBRF9xVgdHBkU1D4xywoeNQX4BsfkJzmltSc5uruq1ebgDbdFInqlH6jKmnbCx
         ZH2ni7d+/o7vmOAvibqTm6WpjiWsDxuo678S8DlCmPVh46cIflGMYD0Yi4GpPvjA9C8D
         PZUg==
X-Forwarded-Encrypted: i=1; AJvYcCVjTZS175w/JOjja0zaD0SDZLmhI5mjb4VfN2Vac/5HS/HcsnzceYzBjEqlhQZT+k9kw6aUmbria7h4ogg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfWuXnfF5wWS3pmVydTOEJmU6mXZCQvxRkhJKqkvMMmVPP0t8k
	0u/tSgZSN6eoiXCDDwHp5j6l0aTY/1Vyfb7xUVRGwjnWnZuxbDB/zpd1
X-Gm-Gg: ASbGncudWT1s2EasZ4S05Ci72jp2fSzkyzIH5bqKW+WIv7WbVbsn6E9BDyXmSaXLSsF
	XPRI9ae1jvk5RDjJhiTzj0sFhm4XDP222/JDGwvZtXXVqSjR7BFf1jgi/vuFH3oKn7LeHx0HIyO
	Rs/MFn6Bor1I4o9fcDkMDkR8xo9TvcRNbYrObZEfj8LdqHGDN5pgLKicK1giDFjeVTXVFYj6AOI
	h7+60iFm1THutLm9waowRmeFgBJ6DlWcaABPjF8Ejqgw1IQYmdtw6LsxryXgFW/OPDQwTT+OxqX
	vVzynsFEQ5EUDvL1mEig1Ky/kuDuab31fX/W8PR53CgVf466VnA=
X-Google-Smtp-Source: AGHT+IGtvTLfWgn3tSC0zbpaDKA+sRi4y6yGMt4LLOqYRwJFJ634U+zXrAaYuqs7XFm6Gu2WJkUySg==
X-Received: by 2002:a05:600c:4f10:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-453248796eemr13119685e9.6.1749620935177;
        Tue, 10 Jun 2025 22:48:55 -0700 (PDT)
Received: from pc ([165.51.67.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532056486dsm23083735e9.1.2025.06.10.22.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 22:48:54 -0700 (PDT)
Date: Wed, 11 Jun 2025 06:48:51 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drm/xe: replace kmem_cache_create() with KMEM_CACHE()
Message-ID: <aEkYwwhFQqPxyyey@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use KMEM_CACHE() instead of kmem_cache_create() to simplify the creation
of SLAB cache.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..b54f758a905e 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -20,9 +20,8 @@ static struct kmem_cache *xe_hw_fence_slab;
 
 int __init xe_hw_fence_module_init(void)
 {
-	xe_hw_fence_slab = kmem_cache_create("xe_hw_fence",
-					     sizeof(struct xe_hw_fence), 0,
-					     SLAB_HWCACHE_ALIGN, NULL);
+	xe_hw_fence_slab = KMEM_CACHE(xe_hw_fence, SLAB_HWCACHE_ALIGN);
+
 	if (!xe_hw_fence_slab)
 		return -ENOMEM;
 
-- 
2.43.0

