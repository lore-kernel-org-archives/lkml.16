Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C61E32A2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202760; cv=none; b=g5vl2ruVEHicf546oJjLMPn8aS486AXHiXYLXnVAemGU9IMW8vwVg+dhG1fRvyrw0w4zKmzCuOvnyDhARHRPPRuq/2qPzISJu8GtT4VeQDBd1X4yek71rHZe3cVzUl5/ANz79ZdyLyakBkdfez+ny6G2aRGTiY6ktCgsBUpgj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202760; c=relaxed/simple;
	bh=dbgPVkzKzM9CKBPX/eJ3L19EFwFMyl9joEkMFw47fDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzOEt9XCEYcp64P+lC427weR4YGwbtmm6PkGtvkuPCmFDufLIZWGM+1AMgunP5lxXCStDSFkVZxvFqPefqcUMSzSFX1JquuSCVKv5l0R3VZtz9DTeQ4JFPQlBx2cPVNqtA94YIxryZQ6jaD+ryXWmpe9ef1qYk6ee+71uF86hy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=gpcRK5qT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="gpcRK5qT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436345cc17bso31380805e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1739202757; x=1739807557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwcghbDLhfpEKI26qkNX4Y8A/7H6gZuyW/uIEoD0XHE=;
        b=gpcRK5qTPhNuKd0CTTwa20BeVJyitrsL3qf5a6rLNBlnO67wDmnS1803v5ZAdqR0Ff
         cHB7b6ycEIrCwAOFPOx7nXCVZ8aVKZ17tIc07kFwglKfdu1Y6XECKP62aK+tn3RPOI2b
         VGhyhoJCWSkuCSPonBKVkD2fCMTXIv4Cf1m+FHIK+5EhKcICtC+efFuPhFYJ9Cbdnpow
         Jlq/2aNJaEVTHmcn33pXDJizbkSqDHw5h0lhHbO2xOoROOLuLNWoKWy0d4cs6Cg9BSrA
         lQZKIH3NPEV0I/gYm9YmY7LKTK9CQX3QCQ/GDlHalmrqCScrylY7dVtrXpfipL77Iv8K
         eROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202757; x=1739807557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwcghbDLhfpEKI26qkNX4Y8A/7H6gZuyW/uIEoD0XHE=;
        b=tlipu3mcMsDW+9cb/rD/dpriZMtrrBxQVxmHridZ7AIhMJtEBwY2QZ07Bnkj//MC9c
         wDJ0xTREbG5jKBgY7KNYSKu+BhD/IS6npVTFnCIu6GZyp8+JLGC1tDsRy1P1gj4/MQAl
         PvV49PNB85TyHyR+hdq2TDRXLnT654SKTwH3icu9wEtKA5vqx+Ec+sjTrv/YR69VIS1C
         XyJqD0y0kdIr/vO9COe48kjW5w8GrdA7ENY35ArLg4WMGlnIB12K25/dQZp/Iwwjil3L
         A33JeivbqPr4q9LxabHV/UUCV2DwHs7XeY0bu+XjCDw7tQVKo4tN6bWQCJUmmMOTo9lt
         EbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXizbtQMNm6E8fEvPHBxLFHW/J4/zA97AyuDMqqXeOTQDooSeq7fVPBqdXpUO2Z7TlGeVmnjrLuYKW42ho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Dy5COWC/GzdC256w+9ZO9DCwFat+TnSYSeOUG9bWgErL4KSe
	NmKCY7OFWgsoc9tgG9cX3SGNDo6/wG/9Lm4rGHWzejADllwuvEalWJBZWHOLRA0=
X-Gm-Gg: ASbGncu2VctaPA13w5N7k3HLyNzSMjkWHQ5LY2gAXld8Ck73+GhSFmClK+0me/VFRaB
	N8obnYVGufmgVu+XE7hdv7/cD8t7PoRBGCJgzdLmWqFP2RC4uHGB4BXZ9GOYJWjVPo359NBmYGg
	rAqaHV5P1awM7f0TlbOKrBPUFiagd8lUe6mML2p5du1cegOnfiDGDNUPF6aesRO17xBziyx51Ll
	aivP/jSkZGzQYrrJHKTFzoSxvm0NdZfrxkjx+32OXYxF9Uy7F6MjSGNsqDW9CW9TckgZzNxd5cC
	DwT1MKYL/9sqdPsYPqoMnBTVP3cxfrE=
X-Google-Smtp-Source: AGHT+IEGOFGcXaagghoiZrtFqwpV0sDrO7e3NQ9lVK6/2NzWEtMCQ2D8esE/k6+VcKNG+ZVSQyP+jA==
X-Received: by 2002:a5d:6d0b:0:b0:38d:dffc:c151 with SMTP id ffacd0b85a97d-38de41c3d0cmr52236f8f.48.1739202756935;
        Mon, 10 Feb 2025 07:52:36 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae129sm148183925e9.17.2025.02.10.07.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:52:36 -0800 (PST)
Message-ID: <2ec2a848-90f4-49bc-aaaf-8eb256f271db@ursulin.net>
Date: Mon, 10 Feb 2025 15:52:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250210124203.124191-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/02/2025 12:41, Adrián Larumbe wrote:
> Panthor's fdinfo handler is routed through the /proc file system, which
> executes in an atomic context. That means we cannot use mutexes because
> they might sleep.

Have the debug splat at hand? I am thinking it is not because of fdinfo 
reads, which are allowed to sleep, but has to be something else.

Regards,

Tvrtko

> This bug was uncovered by enabling some of the kernel's mutex-debugging
> features:
> 
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_MUTEXES=y
> 
> Replace Panthor's group fdinfo data mutex with a guarded spinlock.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
> ---
>   drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0b93bf83a9b2..7a267d1efeb6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -9,6 +9,7 @@
>   #include <drm/panthor_drm.h>
>   
>   #include <linux/build_bug.h>
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/dma-mapping.h>
> @@ -631,10 +632,10 @@ struct panthor_group {
>   		struct panthor_gpu_usage data;
>   
>   		/**
> -		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
> -		 * and job post-completion processing function
> +		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's fdinfo
> +		 * callback and job post-completion processing function
>   		 */
> -		struct mutex lock;
> +		spinlock_t lock;
>   
>   		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
>   		size_t kbo_sizes;
> @@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *work)
>   						   release_work);
>   	u32 i;
>   
> -	mutex_destroy(&group->fdinfo.lock);
> -
>   	for (i = 0; i < group->queue_count; i++)
>   		group_free_queue(group, group->queues[i]);
>   
> @@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_job *job)
>   	struct panthor_job_profiling_data *slots = queue->profiling.slots->kmap;
>   	struct panthor_job_profiling_data *data = &slots[job->profiling.slot];
>   
> -	mutex_lock(&group->fdinfo.lock);
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> -		fdinfo->cycles += data->cycles.after - data->cycles.before;
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> -		fdinfo->time += data->time.after - data->time.before;
> -	mutex_unlock(&group->fdinfo.lock);
> +	scoped_guard(spinlock, &group->fdinfo.lock) {
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +			fdinfo->cycles += data->cycles.after - data->cycles.before;
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +			fdinfo->time += data->time.after - data->time.before;
> +	}
>   }
>   
>   void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> @@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>   
>   	xa_lock(&gpool->xa);
>   	xa_for_each(&gpool->xa, i, group) {
> -		mutex_lock(&group->fdinfo.lock);
> +		guard(spinlock)(&group->fdinfo.lock);
>   		pfile->stats.cycles += group->fdinfo.data.cycles;
>   		pfile->stats.time += group->fdinfo.data.time;
>   		group->fdinfo.data.cycles = 0;
>   		group->fdinfo.data.time = 0;
> -		mutex_unlock(&group->fdinfo.lock);
>   	}
>   	xa_unlock(&gpool->xa);
>   }
> @@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
>   	mutex_unlock(&sched->reset.lock);
>   
>   	add_group_kbo_sizes(group->ptdev, group);
> -	mutex_init(&group->fdinfo.lock);
> +	spin_lock_init(&group->fdinfo.lock);
>   
>   	return gid;
>   
> 
> base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
> prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
> prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
> prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
> prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
> prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5

