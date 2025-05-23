Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF32248F4F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016602; cv=none; b=AqYg3bIjBkIzB9wBoc/ua/QKiZFQmSJJBtc/J7U1Ob4apYdyd9hvTZ36nMPM4k5c443/sMbshyHx8m8/heSVy2z7GS7bXxlN847lhKErkaXoa2ZWpDOInZul9g2uTlnEQfZ5/7J0VQEaejRLNrQBj7bIRj2JQEV0q6RCQSA9Gaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016602; c=relaxed/simple;
	bh=Ckf2jUAJFRz5XxW1A+FCrCqbO+DN3zf9KbfrM+7gGv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjtnY1wdYI6ld+By23OCuylp6oSq76NjRgHA4wfbDWoW89MlF78BNyTbmylgfGLRjSbqq9AcX3wvlZetgfM6Dhx+TtMSWrIbBXDi0pjHfwW6BWVNwjaR2IrGySehjeknWXQZXVThZsUq++iLc80BNQqW/g39glng2nAVwbonkn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYS1q7tP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYS1q7tP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-445b11306abso41187465e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016596; x=1748621396; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui+xdwWINFM5L07zkqDWB9NaMyj6SNEWap+rmv8ceEY=;
        b=jYS1q7tPXP7UeocYNmmABadjZxb3ZS9DMJXu4lDPBKbMe91D2irTJodV0J/u9pZUuD
         xa7cSGXdDCaso/4gMN3dx8W1juxvu7l9tNFvkfazSZa+FRHLlRjo/RvZw1n3jUxQ05Z+
         ML6XYWCfB4hcgJQzfC95HHtbUoQggyzSGNzr6Bu6BzM4RfxiRWZFpbMxZoZzKLeFGTfM
         cFoSTnplqbHzncWl5hByAmf7pMQFOqhVMNRPQIYyj46PI5Qi2jCGydWkIKxJ6JRIaGwt
         xBAQei1lS5EqxaN7P9Sh3H3vVqiqCVZUl6fNFnUX3WcTcf4cx9oJLUMTBCEMVR1pqBKt
         72Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016596; x=1748621396;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui+xdwWINFM5L07zkqDWB9NaMyj6SNEWap+rmv8ceEY=;
        b=tq2Gbcq6ops2leaHnG+kBgt0j7JjuyloOiVuqooxMms7Es3TlJmRf1kD21nTork+BN
         3vhYgfuD6YGR/TcfVHRJhWpOC7TCwHj8HOvhz5CEWfNrUouD+ba5+Vyszaxx0WY0PFaK
         VtJoSiR9QgpzfQPiIUl0/tfNkHfWkO7eD0K7/hUyuZtdiszy3qz/Wn/Owg43RnDe1u8e
         h4ZaBP2A07GUvZI5Z/saLSW2hy3XQU6NtxEb6aDxYEprbLrCpWyFf1MDGgecjYpfiCyi
         23XuTf7bHqk8farAJsIg5vhevIH9ABRRzyKnTrlbwr5r10vKd8A3cpq03j0xSiDCA/PU
         KWyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8hqLl9cIbHiT8DFI9UPTQbB03i4SFaYStTqWJDLy0v/CrX9NKlyRZeYf/VxGg1GDUpf74K+xzx0WNDkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfEeZPznqiUi+ur044OKzGcjq8veLqJuA/tUloAoZzDtYjTxfW
	dh6C+CrFMbMr4xbgRREvRB+hjj55FaMcQuzY2o4N18gwl0Np3g3jk4mACJfVvWvx0dI=
X-Gm-Gg: ASbGnct0X1TOvBaTbTVLqe8KZDEHOxhZV5ByqbCdXlGgpHwtVDzyJDGn7UQil11yGFT
	KjUfXQIoYDx9gtKOKfxpAaPJOebgl1UUujRrC8qC7F8xcs+CRfZQkA18CQe5g0SYUD1jMG4w9Lc
	t4YEaCx0/pESoDY9ugtq6tcpKzHHFtka2ZaHep6BF5dlB1BtlEb0cnARRgUHRprCVZSobKhn7LD
	dNtaEj4GShtQENkiL6M2eX7Y9NQpW5wPoiWJ/ryIhk74zjZnL3U28wB0oiFsENARIDH0hvUnILE
	E2KGDKEUUJaN2N1mHsTOoYCLiMtqZdRZZUSyoQtmN2xbGKJInIDQIyLZ4JqHC6HjFJY=
X-Google-Smtp-Source: AGHT+IGqMESqzvP/96nvyjOYKe0RppaRLZiQpOwJY6/fZFSF8xVdTA+Yk7GHTTmFzbVLBQ3RWhPt3Q==
X-Received: by 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-442fefdad81mr267539755e9.1.1748016596132;
        Fri, 23 May 2025 09:09:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f78aeb8csm144108785e9.28.2025.05.23.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:09:55 -0700 (PDT)
Date: Fri, 23 May 2025 19:09:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arvind Yadav <arvind.yadav@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>, Frank Min <Frank.Min@amd.com>,
	Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix integer overflow in
 amdgpu_gem_add_input_fence()
Message-ID: <aDCd0MrLste5b2HM@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "num_syncobj_handles" is a u32 value that comes from the user via the
ioctl.  On 32bit systems the "sizeof(uint32_t) * num_syncobj_handles"
multiplication can have an integer overflow.  Use size_mul() to fix that.

Fixes: 38c67ec9aa4b ("drm/amdgpu: Add input fence to sync bo map/unmap")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 2c68118fe9fd..0ecc88df7208 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -58,7 +58,7 @@ amdgpu_gem_add_input_fence(struct drm_file *filp,
 		return 0;
 
 	syncobj_handles = memdup_user(u64_to_user_ptr(syncobj_handles_array),
-				      sizeof(uint32_t) * num_syncobj_handles);
+				      size_mul(sizeof(uint32_t), num_syncobj_handles));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
-- 
2.47.2

