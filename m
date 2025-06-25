Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D782D5409
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864952; cv=none; b=r5cLhxPH9r1xt/Ahp4IHT6ApPzvk3NyEpsFzqxAmHHQkd34WFts1qeK9YHqIZmTT7suwk/cquma6Ely8YdqrQmZ4KNNyArYFf68ei//3V3nbm1F7Y+5Gvb4Jex8tdmFzfIiUe2uUzEcElTdO2VK+TjX2/Sile3qobTD7jALh15k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864952; c=relaxed/simple;
	bh=h750Dg9nVgGpkoaJBvLMDscZZNL/lSyHB9wANtywhQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFpvHyrXLjWb/XIIfCeUxJnnaxgsXLopo2FuHup9RF6NuWoNBjHUm+6bcdGuidk/KYrouGK4D8mnUPyJaTY3VqVR9ugXNbdecRZIhqhGqpv6Y33V5a6aAMYozWoxxKi5jx5/uLd46nZGRNI/gqwa0jWxyQvCTRmwqQkbwK+zniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ge96jNp4; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ge96jNp4"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so18165fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864949; x=1751469749; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AotgDT5LaYynHW/ZEfD1/SGeGKITLpNV/LQfaww2/4=;
        b=ge96jNp4OUGktaTmUKyIgT9WB/PInF/BjND0ftsxv+qeAWAmHGxO5qI0NpCbyncJWN
         m+eQlaYHbJ/6mOGvT4W4A/eJGWRvVXIU/Lc60Jf1lI3Zu2VsUR4SalQUIayjkSMvvbx4
         fsJ7ZYfrjXHYjZODXRjeisMOk/nHDEfGF0B76IPBHQ5umyOs11sk/arv2gJcnsf/atm2
         gfCmZ8IBzPH7VxuqBC4+JaE4yDFJhfj4QcI37iCEx+ee7rC/Y85T/WPK1mLDQwXhIsMv
         d7gPOw3rLU0eddqLvwmkhSQBe9HSf+AL9zoLuJkpb4y6ec9KkGkQplqgVAw1eFnx75/f
         OY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864949; x=1751469749;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AotgDT5LaYynHW/ZEfD1/SGeGKITLpNV/LQfaww2/4=;
        b=bKy45oyMQT+YacI9IqcDYBe6ncyVEioHF8BUIAYQydcPN7xl1BQalhGmPriahM+vMB
         e7WjwYspBN0gWDA0/mp+y0Lwzh6a5Ygx8f9Vz6tNhVRkkF6kzUCsM0Yvz4LWJGVLmRXU
         H8/oD+sjq1A3mOE2npWNZ7EV+Hs/aSRMIxalhQNKqfpoXtSj7cIid3tiYS8J1FKr9Zia
         Vlid9m3giPOH7pafv/7Lr/Vv63MilQjsM4UmERyTzr2Yk6FG6acO6CukQ21XiW4LDY6Y
         GenqMrWxeQasUp19fFnjQ63rAdHN26SuEnm6wDGxWZM4qCOsGKhym4subCRXOyoJI10o
         /1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVJRJQtmZtdV5D0IgFfmXTZ7LPPxPMN8MRPnuBmqwHnlzivH30xsia/6nWscQF5BUYYcxM8h8TvLy1BB/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZ3Gu5COKdJr3iX5aoJLLyOPpr9P+zVMmezr67FAJrRzsV2Dx
	QnGLF1qpUVI6zV0JX40iL9ZOvEKK4zMsNu21XW+ZnYN7M3ejcpYNRcp5xHuTPlxYGgM=
X-Gm-Gg: ASbGnctUGt6mN47XbhF7qDpYGzVGw/t983V0FuewsBo9Er/4P8KaYnjkwkmcATjfpt1
	QSf40YXBcNQ+x4ESS2K787Dx9CHKQnOAT7GB2bMGqknGUuHOEG7ZWy11zw5dodZcLxDo17F0O2L
	Z14A0PjFapHYbhXVKfxG3xdkSJsQ1hoHxTX2tCvMimfQXvnJkP2AnzQhOFfy6Ni4DgVmtd184MH
	PUJyu+gnKD9bhNzreot+/DivooIAprOMQY6rjNuIr7XArq3/VvQBkCtj7tjHBhYEMx4B94V3kV3
	rx/F4OXntQy4P+eAAGfdVlkDGRcNYqtvM+tAIWiJMv+XHdIqzM87G8Gu2L9rpp2c382caw==
X-Google-Smtp-Source: AGHT+IGsr3ucc8CyFqc6Gm9yOw1rdKd2Ohl95Xek/6xI6751ZImxrSCLvS3rUdnLDFx5jkH5lTS+2Q==
X-Received: by 2002:a05:6808:1817:b0:406:1e0c:3196 with SMTP id 5614622812f47-40b057f075amr3033719b6e.28.1750864949418;
        Wed, 25 Jun 2025 08:22:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d3f540sm2202840b6e.50.2025.06.25.08.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:27 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Min <Frank.Min@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Samuel Zhang <guoqing.zhang@amd.com>,
	Asad Kamal <asad.kamal@amd.com>, Ying Li <yingli12@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: indent an if statement
Message-ID: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "return true;" line wasn't indented.  Also checkpatch likes when
we align the && conditions.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index d777c049747e..a0b50a8ac9c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1400,8 +1400,8 @@ bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
 
 	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
 		if (adev->pdev->device == kicker_device_list[i].device &&
-			adev->pdev->revision == kicker_device_list[i].revision)
-		return true;
+		    adev->pdev->revision == kicker_device_list[i].revision)
+			return true;
 	}
 
 	return false;
-- 
2.47.2

