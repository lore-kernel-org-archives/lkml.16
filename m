Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE51EA7DE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468789; cv=none; b=K+9umA4DUYib67PyIe29+jLxjBjXM9d1aFXeDcepl5+vY2q+SKfK477VO+kPTvr/O073OWx6IEHeoQkhKlcYwLTnR4kvJRGuZ8sziN7PkmkRgUCkCxUZ5zZs+g61br9ceo+6+ITKCMDXIYQje6Wt2JzYiR1vX8hWnsj0BzIFDDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468789; c=relaxed/simple;
	bh=G6sHjtbEI3xpm/YTYV16t7KZ2vRcxMmdD7U4Biu6eCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsrxNguhQc6azIAe4CEFH9caBay04fYsLYXCnCQD9iTZe3PpEkNltsDwDg4NFmYthQXP2ka4e8L+m8b7s7SKYb/UKB1qbDa8yt3rcnj4G2jFnfOruh6n0X8G5OFa25LUJqNpAyET8GDhiPputYWbSk0tRinghCROGH9cjdQrS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9f99DOn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9f99DOn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913b539aabso1703537f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744468786; x=1745073586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0APbTrVqZTQ7b+tNHxNW9om5cpeJ+hNOY66GU+x9GE=;
        b=T9f99DOn+bYUFzlOjY3sL+L27Fz0djKRQd74QLGsiaWi5L384BXhSe76sQR2odO7tV
         T7IlAi/mWLSR7+Amgb6AGInRKRTl06UcvwhOdCFobv2kXFaoUkjexde2ZyxuljVShy0Q
         2Vp7cNToyYafLlg1PfSUHkglG+0RMHFLGOqgYz+UEyUt/W52Dkmb0YBsn9q0DOleujs+
         Pq+QZnTapZbwZg3vf8SYgzfJOQbjLx0cD0yeYyDc663BIY/HdWzNLcP8r7Kk16lW0Fl/
         Bw2t+IrVEHWMzj4i/B3pYUC9QaRcPCKriJwcTKNZCWciSTwFfD96ZtURw5gqXlI2PqR8
         raMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468786; x=1745073586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0APbTrVqZTQ7b+tNHxNW9om5cpeJ+hNOY66GU+x9GE=;
        b=Qv2PGvE//w/PoCuhhIQsU/0zQTGeDcoUT9zeV0UxN+P4BYws3OhWTpkL7Kfa7A9gJT
         FpmrzxQnT3JnJWrslgkqF2v0D4Ab3hLh/zljhlAU7urV0Trj9eVlmju5b6XyD276onGy
         wPPpCsEmX6UrFHS2VPYn9bLfNH7Fr8RJN3DYK1LbIHZU5MLe7SeU6+y3hX/cfzq+zdq9
         bceeUotAVtAbEpihofM8YnKqehOYaOBocLvpFyKAPXhGmSX5AAicDDAlnFzWs1Mgitu4
         /ZVlV3dlQw9eWLseM3nu+cDik06S13gs8iVTsc+hljieAljVRWOf0JrZ0LwRuRyPhSuq
         Pj5w==
X-Forwarded-Encrypted: i=1; AJvYcCVJbkFPFgSin7lWcm18Wt7EHmiDKThpqsVxyNjmb3LbBFQ8x0I5XvKC8DWcjjrIu2WeI0aq0/WmNc00yLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzl3mQALiHLJCc/4tXSwNx0oEbRWt+UtA8HwDawypAWRIKFoY
	wAfLSa6x07aDUHIUbqEgkuxiLSLjQW5CD+mftM368oJlxKTqAPTrO8NcMC3+63w=
X-Gm-Gg: ASbGncvOjWvUfBbRPZMGoqXcr+T8aUVxN/V1v+a+mPUtMQvRS2h3ebSkD4Z+dNbbENP
	9X9uC53ut2NaKxMHuGDe6uUY9S3GOGZ0431ZTjE5pCBelKAbKjKxnrESkc4gpKtubHcFxPVDZSo
	MfMt0PKyqMeGquuhD0+lpOwcVdteVM5QekMeJThbwyhymWqfQ/KEXQY2FPEaJ/U8jdJJ/JRmipr
	B4LShUH6PCmBmBW2FKXrCwDbVbKksuaUG6XmrHkjauh4a4+F0lIldPHbeEu4YSJWMqf4vneAjOM
	bNuyMot6gvFzexpPfRpubNgPfBJeIoz2/rT6TVqW7ALyYw==
X-Google-Smtp-Source: AGHT+IEIPIweCgA9/UK8lpvU9btA6Cbv8a80TioEApKtzRIcWdW/8sHJOEnuxUXW7drGXCEjT/WBmA==
X-Received: by 2002:a05:6000:1a8f:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39eaaecab96mr5356300f8f.50.1744468786353;
        Sat, 12 Apr 2025 07:39:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae963fccsm5179479f8f.3.2025.04.12.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:39:46 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/amdgpu: Clean up error handling in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <b9adf038b3ccf058c49e7e74e1998bc2216e0678.1744468610.git.dan.carpenter@linaro.org>
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

1) Checkpatch complains if we print an error message for kzalloc()
   failure.  The kzalloc() failure already has it's own error messages
   built in.  Also this allocation is small enough that it is guaranteed
   to succeed.
2) Return directly instead of doing a goto free_fence_drv.  The
   "fence_drv" is already NULL so no cleanup is necessary.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: New patch

 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index b012fece91e8..86eab5461162 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -75,11 +75,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	int r;
 
 	fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
-	if (!fence_drv) {
-		DRM_ERROR("Failed to allocate memory for fence driver\n");
-		r = -ENOMEM;
-		goto free_fence_drv;
-	}
+	if (!fence_drv)
+		return -ENOMEM;
 
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
-- 
2.47.2

