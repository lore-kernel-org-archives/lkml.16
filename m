Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE21EDA2A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302297; cv=none; b=Q72m5dWBhOyaIvmu3O66s9EzeYQquSt+wLE4WCYft2w150gEDWRKZegyvSU2Ului0hiHewNROeYmjVoemW3PVIsMDkdqHMpllhYEyecd/V/6FHbbI2GLHKH7Adq4zNQ738OP/JCTAbItSiYYPtMS144Wl4aVh5W3ufzOkZg+ihM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302297; c=relaxed/simple;
	bh=YJTvIbv6TimfXHhRtMtDx5p4XNNBf7yuwVHAIAtVIYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NACANGr4PDnHZINEwY2YGbrl6FlgBa7ONWOmow2XWbtJmuU+WxZsGxt+BGOwpjgkUKSVo3zlEyTyd4LbZR2lwmDNVTAUJNI3oIm96iEXrADtg5uJKkHl+1i9bByNhr6Cd1ddJKgChfzxeLjggzvCa8OmTJWXJuAWjoCQ42UnptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSVEyjww; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSVEyjww"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-399749152b4so493950f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302294; x=1744907094; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Q0HEw3hrYVGi9s56H8x5ezvg01Afiad6GaTNJBgE4g=;
        b=zSVEyjwwmvS6f1YtRtG4WkfrWjba0G7qKq9Lp/TXt6oTCV+7SKNHRWknSrQCi4ETgt
         UDP8CF0xiv97v9E+ECNAM4hkz7pIhlyiLzFjJzHHghqzj7IY7PAER62p78B+ttI2J9gP
         +rW3gYagpkysNUs98ionJ4z1lT47+ZIndXgFTePGerCUL5dhU+IR60OGwsmzauA0KDKv
         F/pEv5UQE5NiM2F25zgEzB48P33FNC/ByJkr80h6HzDxpxKnkK1JXbaOV6BKX87AvfBH
         1lqKzuGOXF8hTiKnTQz+ak3DsWLClELuDZ1na6Jq1uMtVoRLyZAyOFS1GULPlFzzpWF6
         1jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302294; x=1744907094;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q0HEw3hrYVGi9s56H8x5ezvg01Afiad6GaTNJBgE4g=;
        b=Vu9vmZdNBT2YUY0jLS7ZolIaTrWJdV6r+HLFz5XQIILNXMe9hKEytML8ZrOVSSkLjq
         77uPgaHAipJAix7gzSDVez25MtB6JwknJK6s9RRq7dCpF8Hr8Sij9qhAITURmHxNiMTW
         f8TdK1nFgDs9e24jW3FWVmor4SPga5IQqyawxou72iw2FrDNII0INkKKKtFB2+NIkC8P
         eC3Ej5K3Kv/MyBxxOWau6fTIq0Qaq4zScr6jJxugXeQYVArCbjMt/r7tZHw9PQaL9FG1
         VikLQKFYsdEqBTZKJ+9M4cT/8I3kikaZKOT2FMovAoGftDyappDIpZaJDCmB3haa/8zc
         KhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmv9rJFyWJGe5EMjc+TcMYLOsxeLn06aHdKX1z7tJeCT+05sZDvFm3ej6OQ40be+ZGzU6SngwHFwZlvSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzNsXKjgji3/zd/LwXoXl6SpvfLm6tEQVMarhXvHlrb3TE7akv
	nvDD2RuJoB5fux9MC6O7D83e1zdBYCKjAfL5J8CzZuoaG9IqSpEcr8v/yvlpdV4=
X-Gm-Gg: ASbGnctMLPgldP1GJ4/EWCXngy5qUwJAvzB/pnlYBpb4xTVR2zS5sZRRnecYxntb2w9
	sEZHJhA11ebpChC8rUYhe7cf//5IzuVWArYYwaeE2YZhQ6uoll5qdqA4YklYQf2jtJHxIw0g0i2
	9/dy4zPszOvALkjDqtB1q33FYtG4ESF74e3Bvp8LbqRzTGL4yMl/haX2ZKtYPRO8dQd+DgNs12Q
	DCu03qbPbEjULDMNPI4wphUJ4Lk5+SKA4J8TFq+rHNnmzBX1JeNZr1KjpPVqeutAY2W072Ymm8H
	niH/uQdNSE8PhgXDUc4/PYbNozFhujiKqpvQno5XoB7Unw==
X-Google-Smtp-Source: AGHT+IE5gbRW9QyJ582gnS5/K6En7dv4OcdtzrH6WqFi8GhS+S5YHvq23DQaLTjIP0Syy2HVbmP5YA==
X-Received: by 2002:a05:6000:1785:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39d8f4dcf9amr2828748f8f.42.1744302293770;
        Thu, 10 Apr 2025 09:24:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89402a08sm5153257f8f.100.2025.04.10.09.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:24:53 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:24:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The goto frees "fence_drv" so this is a double free bug.  There is no
need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
allocation failed so change the goto to goto free_fence_drv.  Also
propagate the error code from amdgpu_seq64_alloc() instead of hard coding
it to -ENOMEM.

Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
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

