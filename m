Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2B71EA7DE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468774; cv=none; b=Zy3xpzx8El6SmYarNy2r2ZvVBFasLlaEboc28aebJva9/bzQpRz2oxf+QPt/rBnCUtsP7Apbu6rZ+yZ6R1ZnP3Ps9SB1ehwNCnIt2Sj8ZaijKdnd5GMeNpBGAdQWgf643HAh1KQXH8cF8BmKxrTVLsAZ4yrkEcMoDGhgYN06xWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468774; c=relaxed/simple;
	bh=5AEJ9areGBRmt76KdsbvWdyDIPrFMpusyvmYyOiYDm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmAStIUeKmpvEb+xXCbYjuRcY1umMxEPrsmUjNOGfdLFJ/k2td3ABXM5ZC5c4OIMfJrPKhcflJFeX4rqINfXjLTxhf//K31jeXKcTzJKi+oNBR1qVNx66yWmQhZytqU12eAVZSxooHXJeqXG1kr+159Zwf3eq8eQnR+xvR73OUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKjCIqid; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKjCIqid"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39727fe912cso1350555f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744468771; x=1745073571; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fH5ONljI8GT+5P19EKjih5JtNzqqyZ9zYDYMcWxctBA=;
        b=qKjCIqidTAuJcLxrdPY0wB8dqzm8gqrrJD2dwb5yJEltsuoAv+kSOc5d91TwXei9mx
         cWaEqz6dsgWMc+XzmXmQEOT4mPbKcaToIZjaZ3KNQZ1a8p0aLtcx8qFRv+WPNNIvQ0OI
         rwtvfbsOwQ/DKSgO/q1GiGl3d3pB22AMw6xcACjLnuakG0Y4Kw66APwCEGdhouLOuzyd
         Asz7HvCgeRS1vVoJtZ0FztlUpivGTIRHpO6L37tvohliKpFSJOI6U5QAu/1YzOr0o5oN
         NFfrYmlsHBVt2Fle83Duru1JGwfnBsu/XLUGJ2WGm8dE0IYMt/s+VDBoNd5bTarZtYxO
         xEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468771; x=1745073571;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fH5ONljI8GT+5P19EKjih5JtNzqqyZ9zYDYMcWxctBA=;
        b=QbWODLwksr5M4tXYcdulGg1O0pbD5oKGqstZtfpuYWXP/bl2uNLOlXloFcgGMjIP0D
         JzK+Dxikzx3owfG49x04oSRLdVhA944kC+yWIxWuHP/eQSTnTk2tT4QWAn/MiIYfHEQF
         qOwyex50iPplES6AHltcg6RcyE9HcrBH6BLxkLkvTZ7nSkH7EH2oeD1ASye1kZVQckOR
         ob2veZfiOnfv1VlfFBKNKegqg5vYCfZwihJMKjggdqCDfeZ1HgI5y+t6xg9moQydEoRf
         o52ZCKWsV6Rj/cUqVwy2WZYhjY2eK/oikd7zPqxM1+/7w9Ybk2yS1P0s1gu65lyHJtb6
         QsIA==
X-Forwarded-Encrypted: i=1; AJvYcCWSjRLwDGzWeKFob9TqQlMDDUvsbgNWaJa2hhL1io0elAlOypo4Vmc5no06oT6fsk/jUaaQXRXvgyx83sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx91T2HRiUGiKMiY0dJp62waTnhFmQwCCP3JJivGM+z56u80Zac
	mkLu8hsX8r10uWwHlTYow++ZovhKW2P7+Hx2/EiWe1P4hOCfN36lsILKgUVs8oI=
X-Gm-Gg: ASbGnctjSIZp8LZXGCizeNRUJIH+Kt7IMgELbytpLu28KcMpIjGRUyTga94Jt+kJtmo
	V+N1eqv+tVYyLLcpW1BlMMePZOaPzIOEFXXBz7ipYQ6yk91PFhGW39mXaFnF4mw86J73vHQ+bzD
	aptIUbGkKr9HDCN1GIf5ljRu2hUwZ8AhvrDpULTGZDajjfa9Hn8N/lLmxvCUjxc7zTk3edDwc0q
	SWFk4UeS4fe+kQf1Ovvzz+TRIEjkVBrOj0t1Rd+jSffNxlXIdVmjt+Ix3XRSvV82X231oNwU3cx
	KUlmVO1HphihknU/BILozLjNK6UbD8TbcxnlJAh1A0EMUw==
X-Google-Smtp-Source: AGHT+IF4Ob5u/42ggewD7xMGFQEe6dX1to90QjwleLQR/ueLvNKKi8zaTz7pgBKjx4hQiQ1U9Aob6A==
X-Received: by 2002:a5d:5f4a:0:b0:39c:dcc:6451 with SMTP id ffacd0b85a97d-39eaaebc75dmr5347890f8f.43.1744468770666;
        Sat, 12 Apr 2025 07:39:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2066d14fsm120982665e9.21.2025.04.12.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:39:30 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shashank Sharma <shashank.sharma@amd.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/2] drm/amdgpu: Fixes to amdgpu_userq_fence_driver_alloc()
Message-ID: <cover.1744468610.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This fixes a double free on one error path in
amdgpu_userq_fence_driver_alloc() and cleans up another error path.

v2:
Did some additional cleanup

Dan Carpenter (2):
  drm/amdgpu: Fix double free in amdgpu_userq_fence_driver_alloc()
  drm/amdgpu: Clean up error handling in
    amdgpu_userq_fence_driver_alloc()

 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

-- 
2.47.2

