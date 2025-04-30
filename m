Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC0209F38
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000323; cv=none; b=nRu0va55djlAqARiwa9KwfUQYOqawr9m6HrEpP+Ui0b63yzYhjzAnOJ8hhMDxWNvGQ3b8dWG92Ma2jqF1XmRy6AyV8ihd7OgO7QkKEqSijlKoRSCa+BeOHrf5tyh7cU+aQu7hbSUp4qv2e9z/NI86E107rfyBflUwzLQJZpmBbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000323; c=relaxed/simple;
	bh=kH6E+aEGNz9CP4yhozHj1ifZzwFtPtUsQEfaB7h5NBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpsM3vHjKd0yzQJvDqiI7rw7AznqQq+oUnLAfbJlC2ekKCa8bQkll/HDr3XpaW0Pknodfq8akcCp1G/9w9rRa+Tu7emzjltVAMA1GBgAL6LGTssdwcNdL//fJ2qe8KZIHIrjublbIcKayUuATQA5GVzN/EeVYSZHwz/fgsYBs+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=teLTKoZ6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="teLTKoZ6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf848528aso49558115e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000317; x=1746605117; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD6CtIO/TisXjPtHYMRMSY8vPIJC8aCPMTopK7WpI/k=;
        b=teLTKoZ6F0L64azdy0zdwLz0qDsa5mjz3OOL5FTmAAA3Rfv7ksSTbWiXtxXctTQNcX
         orVGgySifXLhih9c4d+bRyyCwgAYlUsHVv/hlUutHHx8q4gjl4AswwJwWZ5u2VJPzw0r
         7cRebwhzU/2ISFeQM46D4Q/o6n28YZWbR66GlCeDwhpT2fTYbEJbaqNQUDBLMjJA6lQH
         UDAVIii3+uYUKr5EwDTzntlDB0rsVib55Vs0CEP95GK9JuoPz2k9AbYXLhtpyAW+ZNnJ
         64OjagBmXuEWYLjFpVOAlNE/j1ko/Uhz6uGU1X+f+w3by24RHwz41mrgVoNro5hu9jsq
         4RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000317; x=1746605117;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qD6CtIO/TisXjPtHYMRMSY8vPIJC8aCPMTopK7WpI/k=;
        b=SScPbt5kEwtCZbHg4quIXAgUpumwTaa9cRLin8dXEaE4JQtIv1nGDqS5JB0D90fVAd
         Go7R6mcWRFh0FRoYxf5GIKQ/5frGbmOAHg/ThDrEh40iEZdcqyFndFJRpN/bCBIBfVi1
         3O51UDuvdgS/titttXvXO4qEIdW3jQoB1J4K+pu6LJavnYpqr2tNsYY+3NNfjb7WT9Hd
         jNJsVkmBm1/8yztndolYJfAtfvVQrsf7/CfAjQkDmgnJkHD34Iit3x7kTmSiYPEbGFdb
         0LH8AQa+BDpDLyqK0yRhp8cWz0uuhXSkcOxp3ZdPfKFAJljQDT2itc8CuG0zKcBgrVbL
         pHNg==
X-Forwarded-Encrypted: i=1; AJvYcCVMq4WUCIC9dS3DOVe2rkwJgyLgX5WY4/fclc/C46WPhdUeBwy2JRgh4C1pHX0s9GFqY5l2KIim9xi4fR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCbfVazuCPsL/8qghFGEY7WoqWSrkEbVGukIsVVyGatYXeh7W
	Fuh2EZqHixxQ2GuROZb5gBZCthl9L3xafOR0GAL7lbV902sMbEy9MfUSEIqDeqA=
X-Gm-Gg: ASbGncstdy4Z7PELMQv8S4YUApfmkQDN9o3f+IB32PVA3KfGa+f8GbQo8iU+X6e9+2n
	QxB2qXUM2kUzo9wv8dO9XWMlsm+FrBYscBwW+o4+wqP6goyPZcyGZAiUkd5LrVxv/HMi6mMud/n
	7qeUO3WZxitS4YNvkHxfAzu/YqH+MPT+OIRcwciJNKf7XnqkxKRe9Qwt8PiId9GOkxSUYSDriCk
	VfwUDwcvq6qgttFKDguLL9PUY9h5axAgch9+osceILZgrAo/vy+g2RbpaFsqp0bunkYs9N+YDZS
	HagYHdMr613G8MUxZ+TuzzssCennQDxH9i4t9uA5OgOcHg==
X-Google-Smtp-Source: AGHT+IHdEtFR63Z6oiW9IVvngwXx6ZQiZzLOjAXgoM9uBkm6EKIWAveHvb1hm/cJiMmkSf12Z002jw==
X-Received: by 2002:a05:600c:c054:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441b1f5fffbmr15536155e9.31.1746000317302;
        Wed, 30 Apr 2025 01:05:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b20c3fsm15479405e9.28.2025.04.30.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Message-ID: <aBHZuejTTKkdnGaZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ticket" pointer points to in the middle of the &exec struct so it
can't be NULL.  Remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index b0e8098a3988..7505d920fb3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
 			clear = false;
 			unlock = true;
 		/* The caller is already holding the reservation lock */
-		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+		} else if (dma_resv_locking_ctx(resv) == ticket) {
 			clear = false;
 			unlock = false;
 		/* Somebody else is using the BO right now */
-- 
2.47.2

