Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0E1EA7DE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468779; cv=none; b=qFDLezY/1tBUwh+LeomJw+TR3bDD5MB+AwaSsgi+uvktLLaH6b97elBfQq/7kCU3nzorrA5OJHffaGXbZH9infthQfQKpMD0ZVN0zQHkGjDixSgxmA9rZxjPREbwb+BzuNdmt9c4d4uGdBqfq/F8t2/+r5joPRNDdIZO6eTOFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468779; c=relaxed/simple;
	bh=Lx+bDLHthI9iyrrGlSyJ+z/Lx+eAbvyJRdAej+nBU3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlKOuIzu9hbl3kEF7lL/Kkvt0RAU0TbkVVgA6jWw71B5oWb+tYCuCI+aBKXENjuS1gShbltvFs/R2dk3GuFS7dGeVrCdKEyTjA9iMBKIH3oryQSk2MAOp8Vj7b2UeztLFiV7InYlbs0nTbnHKTHW/XGYYExup6rcoVTEBed2kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5dhEFZT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5dhEFZT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c30d9085aso1715775f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744468776; x=1745073576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nm2H6iLUjvnbWXFUPqhKNdAW5lLeAEyGiUbQz3duIYw=;
        b=q5dhEFZT2XhylvEg8qb/T4IBtyStQ5UVbzU1efku0iox0EbxBDYGoo2ZILCKziJuRz
         4SeATsgJqhxLDvVni70n2mOFRgbL5Tf8Lqd/5noBfd4c10G7drQh+NqBlAbwWwrkuExS
         PsgVf+iAZWW8q5kJjCscuyLgkwXvDD/ov8L7Jt8XDqrLcg7hn01pA62DzAA3nlzBF98r
         oe3bDydHlNsvQEn5uDziGaI92ajQzCg/A55528WVHC5aRcvs0TJtdoQo57GhRAqLPd9p
         tarVRP+7ZOny4GIjjZNYkSUvZgwOAij6s06ZHeYcZ2eHhPcpvzJLB3APf+8UAV78fGtx
         Eimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468776; x=1745073576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm2H6iLUjvnbWXFUPqhKNdAW5lLeAEyGiUbQz3duIYw=;
        b=OfZf3JMN//53S20zYx9NwiSjGy4mQw3zMXPad9sUq3jRML+TkaAUhJL4eM4tPjhkUc
         bps/TBWTyHVzwFIvmL7R6ei2oi326jghduBm3EVmBvKP/smgW1uQ6ksgluGgyub/6kJb
         Kc1PCYpq7TJ3ici+6YZabPdHorYGV9Txxlizrt/ns18Z7u4aR8LBAkWilflMrLcsoBG5
         KUWlwuQQN4+hA7ljhFbqQ6KI07tqTMpgcT/9L4djoav6QWyb3ewiDbGRfiMLOj/yIdSZ
         jV1f7PqMsQibu8NO0YsrBE67Si9fklRuIJiyn5OzmjIVannjOzSpwkm+yEckC8sKYQwN
         XXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9+P3EHb0g7PBA8GsDZ9j70GXs/P4G7HCUnt1F2qXlLlDnvpU8qekCGHydKr4B7dfgvbTMlHXRMyEtCvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGXc5vf+vbPYre421cv85frvSZX/bf4IvotxbMwIAm/ejs9a9
	77kZxjhXSGyrtb9cw4hE02kOWG2+E92r0YqDIv9vUelzSM5WGseRW3pN+JksFjw=
X-Gm-Gg: ASbGnctfq1+hhJois6dOHIi5aTOtEkrq55/k/fuaVplPHXhbPBRq9xyxLYOzrwWNj+a
	IxOkH6gO7CagGLlCYDTwFWRD4nJg5yr6aJTTIue84CDauvReRX81+ZPUy3xgi03YxF7nhlPh+07
	Fve5rpJ5QGd9rQ0QRtEA10J9z3/CEVkIJDQZmL5wGfcDltuMAS/eFOyaa0AGLsqLMyrqdAArEgZ
	aMMqrO2dGAjijYpUyWDUBAdw74/u43kM3LB4RwaQ1czMi+bmBAGxJZitxeU8KAJ0G3xP6S97nvT
	1SLjbY+9XPtvu3JaISZ9dNBYVHj8OnQvwbuJNtYHnTAx6Q==
X-Google-Smtp-Source: AGHT+IFPnZPQh+rWoYat/40mbIFtQogM3jyiLm0FL3fS2Hmqy/RSAmRPjVkSRty4HpjLKUq4NyrWdQ==
X-Received: by 2002:a5d:6d88:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39eaaecab8bmr4810516f8f.49.1744468776133;
        Sat, 12 Apr 2025 07:39:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f235a5b08sm120684135e9.33.2025.04.12.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:39:35 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <d4583e103f65e850f886babcf1b290b0855ba04c.1744468610.git.dan.carpenter@linaro.org>
References: <cover.1744468610.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744468610.git.dan.carpenter@linaro.org>

The goto frees "fence_drv" so this is a double free bug.  There is no
need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
allocation failed so change the goto to goto free_fence_drv.  Also
propagate the error code from amdgpu_seq64_alloc() instead of hard coding
it to -ENOMEM.

Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: No change.

 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a4953d668972..b012fece91e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
 			       &fence_drv->cpu_addr);
-	if (r) {
-		kfree(fence_drv);
-		r = -ENOMEM;
-		goto free_seq64;
-	}
+	if (r)
+		goto free_fence_drv;
 
 	memset(fence_drv->cpu_addr, 0, sizeof(u64));
 
-- 
2.47.2

