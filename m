Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71122FAC3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129723; cv=none; b=nEPKADpyVN4e0U7TIF/9Ou+51ojErANxdgKk6UXgAx/h4eCAM4ohgDWsFrNEO2GPypOqm+EhdbC4Mg3EEuOuOS1Dbxoy6EptWI59N4N7huBtTWRe8MgtJ8bImNQInx4eED0iYHVc1rgDqZ2mY1N77FutNolxCldFCNKyhZTmG+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129723; c=relaxed/simple;
	bh=hqOzvq9hMBH/9S3dZCaj6b8IzSWfiFtV9ykpUOZoLUU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YypdlUOdTjRIJIOAu6Yfe2rWMmPVTFcEB418lZeyOMLcK6UgOwY95OJncKGKbHkj/JfDnEgYXv6zTlDJI4KekVXcblu0LpaAzdu2UN/ni7oGYzVmXZySKXEWFAtUS3oWXv61kYA1mffuDn3cYh/h0t7WoGTS58fc7abfXFka/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUZXR+Sx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUZXR+Sx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso7832325e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746129720; x=1746734520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw8sWllG6mUqgwvbsy2xT7usun9qvN+EL2eeXDknNyY=;
        b=RUZXR+SxEZxsvOM4QRZz4r6Esi5QshT74K8GQ5m6SkzP8zZp/YR2xPfMDoDX0JoUdn
         w/a/Yhq+EgCNz5WK2kQHDSUQKRwYgG8+uXGUmPeQDMepPNT4z9xvOOi2JPrh0GwWIj4U
         iv8NUcw4Y6Q3n0dR8vxnHLsTLuVib0z7MOhq4gGfSGZdk7M/PDpenGtN5BJSPo2OuR5T
         vQixSN0o5EVXv8zFco9uApSgTzVwsEG4eE7bc4h1PefyTDtVYOszevtKf+9T+SYL8JtT
         0JtH06JboQsG3bEJOeUhF/WZhJgfSocpvumyfiQBQO1QboZxfe8u8OBd+HV0Hb/d7oFS
         qFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746129720; x=1746734520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qw8sWllG6mUqgwvbsy2xT7usun9qvN+EL2eeXDknNyY=;
        b=Sjxm5bdQfdh+TKKAFn35zNu+6kz87Le+jZnJ5hWreI++EL8vir74ATuwPbuyPVWNUC
         5ziXUZikt7uFfC85cALjIEEa5/yGW5e/HvTrO8VVN2ThiCnxNKW+IMECH59sWUX2v/up
         +o/vUh2ZoPtBV+PdwlmnO6uoI+q5uvQh2y268HN6zMuun6s7yx9NVgB054nVi4SYVj0O
         QjkGGaOP46AAdgjxhtFyEkOnoSGIbI1ReIdbV0yDQlyBpf+gHw/oLi1dLW8Dy1xAE9sM
         mXk4iJ7BGDtL2OiNeQwoLzQoJWiZIXtTbGZTyM+SeNMknHA+X+tQzclBkSJbrgEVP2rK
         gE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTQGH+0QzxmjMGByHjCtJt+/4C46eAAm8ItpbbQ+R+9Rya5/28ao0ZPN4oOWUzOnzSjdH3zWRxVL9UpRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8AouLJh4QHGliUpJv4jqXTGMNUSlQrWysK/DLdpui8i9KEx6
	3vUe9FcQw3hprVR0ukdYQoA4icmdSQocAM70PPRoxWx3+sdpmvQ9MkgxFA==
X-Gm-Gg: ASbGncv5w3OndbcVlZi75Ca4EDJiZsx2zFsIaNkjZOMTxynoDOoGm92cGGxLRU3eJho
	zrr/6ROy1pcXM26XBC4q9a2Ym2MDFcrhN7Y5fSkwsJqUMEgH9n7sr577Kps4rTKbPUqg94QfaTI
	QUCyEA0TNgaVOTLtH9YCk4dS4cvz362Cd72EawDqgllDkfM2OGQjGA2Xs5hfmDb8trKRTRKi0ON
	1i/2yRk56M24OplkJ4QOGzBWB2k8k+qtnQhJXF9IpAAxY4bXnOpd7s2CqfuFqlSdNweROYeq/EE
	wnsba8SqUVFtxBTdedwXsi2gjZzyH7ognev4T++St4362Tj5YbuF9rMY3c7zMc9DaiQ7xRQ4j1E
	giHE=
X-Google-Smtp-Source: AGHT+IE5LWE3ytNc9YINM16DWIm610BeRRonqCniOHPyNXdGUvw7nM9ANnneGmjycXx79Q1G3siPZA==
X-Received: by 2002:a05:600c:350e:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-441bbe2c815mr1506535e9.0.1746129719929;
        Thu, 01 May 2025 13:01:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b10083sm92350f8f.62.2025.05.01.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:01:59 -0700 (PDT)
Date: Thu, 1 May 2025 21:01:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jann Horn <jannh@google.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
 <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: Prevent size calculation wraparound on 32-bit
 kernels
Message-ID: <20250501210158.5b2c86a7@pumpkin>
In-Reply-To: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
References: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 15:06:43 +0200
Jann Horn <jannh@google.com> wrote:

> The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
> 32-bit kernels: Multiplying a user-provided 32-bit value with the
> size of a structure can wrap around on such platforms.
> 
> Fix it by using saturating arithmetic for the size calculation.

Why not just add a sanity check on 'num_params' after it is read.
Max is 31 (1024-32)/32), but any sane limit will do because of
the buf.buf_len test.

	David

> 
> This has no security consequences because, in all users of
> TEE_IOCTL_PARAM_SIZE(), the subsequent kcalloc() implicitly checks
> for wrapping.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> Note that I don't have a test device with a TEE; I only compile-tested
> the change on an x86-64 build.
> ---
>  drivers/tee/tee_core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..acc7998758ad 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -10,6 +10,7 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/module.h>
> +#include <linux/overflow.h>
>  #include <linux/slab.h>
>  #include <linux/tee_core.h>
>  #include <linux/uaccess.h>
> @@ -19,7 +20,7 @@
>  
>  #define TEE_NUM_DEVICES	32
>  
> -#define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
> +#define TEE_IOCTL_PARAM_SIZE(x) (size_mul(sizeof(struct tee_param), (x)))
>  
>  #define TEE_UUID_NS_NAME_SIZE	128
>  
> @@ -487,7 +488,7 @@ static int tee_ioctl_open_session(struct tee_context *ctx,
>  	if (copy_from_user(&arg, uarg, sizeof(arg)))
>  		return -EFAULT;
>  
> -	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
> +	if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) != buf.buf_len)
>  		return -EINVAL;
>  
>  	if (arg.num_params) {
> @@ -565,7 +566,7 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
>  	if (copy_from_user(&arg, uarg, sizeof(arg)))
>  		return -EFAULT;
>  
> -	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
> +	if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) != buf.buf_len)
>  		return -EINVAL;
>  
>  	if (arg.num_params) {
> @@ -699,7 +700,7 @@ static int tee_ioctl_supp_recv(struct tee_context *ctx,
>  	if (get_user(num_params, &uarg->num_params))
>  		return -EFAULT;
>  
> -	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) != buf.buf_len)
> +	if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) != buf.buf_len)
>  		return -EINVAL;
>  
>  	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);
> @@ -798,7 +799,7 @@ static int tee_ioctl_supp_send(struct tee_context *ctx,
>  	    get_user(num_params, &uarg->num_params))
>  		return -EFAULT;
>  
> -	if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) > buf.buf_len)
> +	if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) > buf.buf_len)
>  		return -EINVAL;
>  
>  	params = kcalloc(num_params, sizeof(struct tee_param), GFP_KERNEL);
> 
> ---
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> change-id: 20250428-tee-sizecheck-299d5eff8fc7
> 

