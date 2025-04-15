Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2E2820D0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713897; cv=none; b=A8KebHDWP9zp8JlmhXaUVbOIAIty+I0EQS9NIdHWyYFERBP88S+p3jXOjksM0jmHsHQOcCpxhCnfvyxuGxnEO+2NvVr6ajM6SpMQRG8FzKkGb1mSSTKt7T66s53e/gRv7maufBd0YKWvUYq8cgZpESxDeeBUcXHq+b4RvuUd2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713897; c=relaxed/simple;
	bh=SSVPDq/BXaFrhLTbxEzi3l66eOM0a6vm/T2BPj4C/tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooy5YQsoi56Tp/V5ZC2GjuMFOHCtQaxsAKfinqA7pE4/qXe1FKKGvDZAN9G07L2bctMYbUxKc2SVN2Z06ofRnmocMAjrr9W3NUgB8WMaugKmUs/rUAQSaCtfYMb2p9HY7TGkxz3ezlVNDkXM2fD88kEZF2woFAR70XJ3qOxrfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XK8QoqY/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XK8QoqY/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so5272383f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713894; x=1745318694; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdo8dneaizrUoQYs0r04kTs5qLNomw+odVlo3gYg1Fw=;
        b=XK8QoqY/MfMNuamODGUJFPtKToHVvyJTt2WL+hUCTXOV85dG8T8H8AJdYQkaijQGvb
         yHO2qZ+bBH5hnX9+m1Ra+6EjRrEAEVhCFjZexHOIfgSXR801V+IAmHj2yBDVPRP7yO5d
         hXQXIl2TLUIF5afE+Xezi3wuu/ZpQN0Z6J+cKFdbmjOJWh5BuU5LDQ8CJ+Msk4mOfDEh
         olr8JLDJwb94styb9VQi6KxpRcKP7Idep9tnhHEKbWoAqoG+ly+lv6LD9jyHEzw9/oFL
         6AGX4MUWONkoBW0pV2ml/bbVV5nLn5pGQAyi04RPMT7ReTDVK7WNS1myWueBCQ8PFGSH
         viAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713894; x=1745318694;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdo8dneaizrUoQYs0r04kTs5qLNomw+odVlo3gYg1Fw=;
        b=vBB0nbFUV1UaanUpx2sY0mX8Iv6S8VWOIaKR1Fk5vKXS2+h4e2uiv1U6x+kpcythy/
         LAMH/bEBb8rsiVnSQEj9BOo7IIQtU2IcySOLxGk8/dO4kWM2q34wUCDX5il/aKkl1UQM
         LE06fKFyzOcXd/Hsll91w2f/ff6v3qgjRbS5+iMhUpdwH5Rh5TuqhDZ7tL2ePLKDDmOi
         jPXPMD3BQhHz20qa0XOuIKFBzsCelzuA/JxaBqbkXZppXcbRoH0bM5LxMkjGRyzUIPDV
         ImJ0R9uhyeqb1/4R8yppt8fPlUAZZmfV/T3KOKS1pBSvbTAQFlZMs0Staa0smtfsxKMl
         Y4fw==
X-Forwarded-Encrypted: i=1; AJvYcCXvRVWelsRyjdM/E49IGauqMMT1vE4n7u1LAJ8Sdf68xCdKXOFJ7Do62I/1beEWdSG3tJpiKizC4WbK3IQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gXAJSA3diWgfVVFK+imsqruTGbVdXIjOp3M3sUN0SFltn4rk
	h7Qgn8gHkIWz6MypV1t8n920X4OibuKkxobiv0DBFOvHBnYoYMZA/gZHPst+S7M=
X-Gm-Gg: ASbGnct2XvB8iRZbtR+J4ybgf0OUmQRCI1ISFg0zyl0gMR0fv58R6+26r75g0s2zYMU
	3lRMi5xnQ+8o9JCHJZTfKoRwsJFF9V9c74V7FPSfNMFG0uhkxLkCZBYpg+7HDTg6d4gl7w3maV8
	3xSce1k2sfstOS5GXq/xzrarMixIs4kEKJB6R0b4AdGixRbFzKTqOF3UPmUFpibaEuGJSJ45MUa
	TKdZu9PNcIF3iicYuUhe5VhOyUCLDoEKJRmIsUCnPuNKX/AeQCZGr6x+C79kjp8Tz9iduAsF7Qi
	D7FmB7bc4Tk6fnzl4ToaQBtjqkkawJ8hnCnjXhTahCEodNXF0XdMSIIo
X-Google-Smtp-Source: AGHT+IGc9RW10knIr3MFj1Pzt4vKOq0H3enobQU/zlnoeN7SKpLX1yrOkCKkuW4z4l4oMeg39rDQgQ==
X-Received: by 2002:a05:6000:2403:b0:39c:30fd:ca7 with SMTP id ffacd0b85a97d-39ea51d10a1mr13006863f8f.7.1744713894209;
        Tue, 15 Apr 2025 03:44:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae977a7fsm13703803f8f.45.2025.04.15.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:44:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:44:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Huang <jinhuieric.huang@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdkfd: Fix kfd_smi_event_process()
Message-ID: <Z_44oq-aSZOsvxTN@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "pdd->drm_priv" NULL check is reversed so it will lead to a NULL
dereference on the next line.

Fixes: 4172b556fd5b ("drm/amdkfd: add smi events for process start and end")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index 727a4ce29fe6..c27fd7aec1c3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -350,7 +350,7 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
 	struct amdgpu_task_info *task_info;
 	struct amdgpu_vm *avm;
 
-	if (pdd->drm_priv)
+	if (!pdd->drm_priv)
 		return;
 
 	avm = drm_priv_to_vm(pdd->drm_priv);
-- 
2.47.2

