Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AA018E1A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016365; cv=none; b=AHTQTiPsCIfA9yPNH/HGvI4ViDwTm8H4JbB7xES6RSV1L1W37wp8L5gCdlEIkLcN8TL9D1Zbnsbq/na3lMF63ZPGw6B2gogzfM9hTQEw1chGMt85srZQMZjLmBAhOqLPEY+sZLTYZUIDjOOCr9hSUL+HK2zastMan+/vMke7fqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016365; c=relaxed/simple;
	bh=jVrjFU+9I/Crz5h30CzwkjrvZVdhY6m4bkGyhy25dtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqndvSki+ruKzAPPrdv1EbZ2gkWa30/uef87cvrz8CLVCAX81pSlpsvXtuzmc3olF1crMYxMe+D3M0rUkyWay691psusILXGQbOIUSj+G/1Py+0KDvo4TUWE7YdHMvGniftnidYcFHF2etTTnrJNAbJrzLwradPut3J6C/Yd5Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaqZG0Yf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaqZG0Yf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso65129815e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016362; x=1748621162; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3PqxfXynfBYuWj+aBPHCbylQDdPJlTEN/Ktqk3XEWc=;
        b=gaqZG0YfQVTtXky9B6SERccgUHkTrRyRC5xRZwI33eRe5vJuE2mwzX6ubbyY8Ph2pU
         4Ij/TRES8tMSqZMZtPgNzm/DygatYWqNQBSr+3mVUqooHobm+Fa8c00V+1OsfjKwuU4d
         PzB623DktQA2teDISnhvbD2fSNHvHHZSxSXSPBUNDPbfE9I3WymojqFiuGksBaFyQmFx
         q3QiM0fot+h200BCPja6MnyfgfEJ/VjI/qoD65PzMjQEme2BxyxbbD5z6V5EBjJpQe3m
         aCRyEa+ay/jnd7pc0Xq3RczjKxUmv0YIE+UIKSrY2D3V8wBMcj5FlR1kjkJkBrQFF/3q
         xeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016362; x=1748621162;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3PqxfXynfBYuWj+aBPHCbylQDdPJlTEN/Ktqk3XEWc=;
        b=qHem27cStrH3A0Js26m7eZJX0fB0WKD4PE6eb/r0HtXc8yDVplR5eyaf9QWZKYwevz
         xBMB65q9u7ZHpKZwJYuxnb78eJl0nHmRcejq9Mx5kzQrj76leiDDrTUu69HMos0Uue64
         56XNTGSG3CqL931fIOyUrLYMhqpxhlwpAic4AYM7SJr+3Teu/+PNLnjgit5gucHyFvnI
         Abpat1GvC6cco244zsUgttKXZesq4sW6KCZ88aOFt5xURAroa5N0tzwQZqnZ7sI77/sj
         MxDff5h+kTZJC3q/YkUgf7yd3I3esLiRnw2Gvgf6BbrKAKoZnppHbHlvDKJsjmwQY3oZ
         eeBA==
X-Forwarded-Encrypted: i=1; AJvYcCVr29W5noxsQRy7z0ce6BuxOFrokddcBliDp1iY10y66XmhJTkw9u8vzNGnpiN7XdOfwEv5Zk0w9kHZ/Eg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyud2k52eV8jfBnrj5z694Sa/caQMhD3JLaZ89MCQkDt2oYChsL
	YXrPwABpvFN9LFZnt8jbYptVHsnaZoQmCLUdmENanKeiDPbzxcNEgFGeea2Ak5MtiCE=
X-Gm-Gg: ASbGnctvGoATt8ok5+GkbXRW5IhGPL9VkuevycYhyLuNwrO9Tknb6245m1c0cMnPN1k
	htjA/eAUk/DM7qF9tD10e5ogklzRaVcDmafdgGDrso2vbi/xfo5sa8mr6I1yW2blzhSshHt+G2c
	91/XmXiFXPEznWUIaz30savq4SH1kT60lNS8iIi4H9gh0CeAoPuoyb11TC1Y543WsXaTTSQELq3
	2PpxfEJNt2UddkGtfUUhVl3xqRS2Bz/kOtkejJs0cewLJv6UAlkXOfMlCOe1fre8C/mSOZarndY
	0mMKYQ3oPF8rMDMWZSErZZSa6jLWWhDhHt85i5B/GsJy1ONBGcrS3hxc
X-Google-Smtp-Source: AGHT+IFJ5XQsT7wDZaHxzFgw6dPrlGsnDhIqeTPzVlX0Fk5sLByi/O7PehwjP3rV11vD6uhtm2P9yg==
X-Received: by 2002:a05:600c:548c:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-442fd6759c0mr247232745e9.33.1748016361628;
        Fri, 23 May 2025 09:06:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f73d3edcsm150813565e9.20.2025.05.23.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:06:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:05:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix integer overflow issues in
 amdgpu_userq_fence.c
Message-ID: <aDCc5kawU4cWj-Cx@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This patch only affects 32bit systems.  There are several integer
overflows bugs here but only the "sizeof(u32) * num_syncobj"
multiplication is a problem at runtime.  (The last lines of this patch).

These variables are u32 variables that come from the user.  The issue
is the multiplications can overflow leading to us allocating a smaller
buffer than intended.  For the first couple integer overflows, the
syncobj_handles = memdup_user() allocation is immediately followed by
a kmalloc_array():

	syncobj = kmalloc_array(num_syncobj_handles, sizeof(*syncobj), GFP_KERNEL);

In that situation the kmalloc_array() works as a bounds check and we
haven't accessed the syncobj_handlesp[] array yet so the integer overflow
is harmless.

But the "num_syncobj" multiplication doesn't have that and the integer
overflow could lead to an out of bounds access.

Fixes: a292fdecd728 ("drm/amdgpu: Implement userqueue signal/wait IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 029cb24c28b3..bd79f105d77f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -430,7 +430,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 
 	num_syncobj_handles = args->num_syncobj_handles;
 	syncobj_handles = memdup_user(u64_to_user_ptr(args->syncobj_handles),
-				      sizeof(u32) * num_syncobj_handles);
+				      size_mul(sizeof(u32), num_syncobj_handles));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
@@ -612,13 +612,13 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 
 	num_read_bo_handles = wait_info->num_bo_read_handles;
 	bo_handles_read = memdup_user(u64_to_user_ptr(wait_info->bo_read_handles),
-				      sizeof(u32) * num_read_bo_handles);
+				      size_mul(sizeof(u32), num_read_bo_handles));
 	if (IS_ERR(bo_handles_read))
 		return PTR_ERR(bo_handles_read);
 
 	num_write_bo_handles = wait_info->num_bo_write_handles;
 	bo_handles_write = memdup_user(u64_to_user_ptr(wait_info->bo_write_handles),
-				       sizeof(u32) * num_write_bo_handles);
+				       size_mul(sizeof(u32), num_write_bo_handles));
 	if (IS_ERR(bo_handles_write)) {
 		r = PTR_ERR(bo_handles_write);
 		goto free_bo_handles_read;
@@ -626,7 +626,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 
 	num_syncobj = wait_info->num_syncobj_handles;
 	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
-				      sizeof(u32) * num_syncobj);
+				      size_mul(sizeof(u32), num_syncobj));
 	if (IS_ERR(syncobj_handles)) {
 		r = PTR_ERR(syncobj_handles);
 		goto free_bo_handles_write;
-- 
2.47.2

