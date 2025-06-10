Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA919B3CB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566043; cv=none; b=LY4DR4bKTcZuB2oAvp+2QbWIREDSaJJmU2Qwzn5EkLAKSqfKaKZ7/MPhkZ5ChviM5CjLClEs77t2q1ZxuldXdn4412S5goe8UhybUv5/GwWqYBLEkUvVtYLB/KPs4TbYPHyai/JaUQft/HfD13tMnE/RvgIZ3ny4riM+pOqm/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566043; c=relaxed/simple;
	bh=pAKxeGee5hYim+nL+Rs/49E6KsFoJV+dqj4fAlLpzDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmplrMd2kSRe6W5F3JAzuSoLmxzTdY22qJ95lAmN8BWDeqCB6Noj4UKz5kpWAyBDwy7K1lR7qj1n2z9+peXE3DV/LAO+OIevBqDrwH/ZhOuNo/Wwof2zX0G7B3WRu4TXj4wE+yUn9TTjfQ6ku1MbeA1oCbM+0VGnvkTEPIrsXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=uXRrrlKv; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="uXRrrlKv"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8731c3473c3so144776439f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749566038; x=1750170838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekBoU2yYMPWW4Dnqk5aHWEL3RevwpBEXg8v1UkgbqYY=;
        b=uXRrrlKv/v4gNahOzqz2E5Iuz1IU2B8im4X3TOliFz27x8J95njyKsICvm7Jt7dmot
         SgfCoyEbVWFMRM3nuxgoEsK0i47H/4nhMq+U2vyQQEevJRw9LBfpGGLSeh4DopgaosNC
         ndZ1nW+4su8sHsK9iPHhSlYKQ4PMoIrr55X+d0q1tO+LVjrp/M0zSYA5XuIaroLl9VcW
         /pXA5UUumzzQurtNSsajRB+kO7Ux9vJeEfH9VXX2NbLRCO8sE7s20TzYgpSYUSLh1vve
         hn5NYbcmA7Sp0No/VO3y6pjFzZqbitveFRSk4N9Yd9wkWarSQcgwoCgbMEHZxRV+R+F1
         DxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566038; x=1750170838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekBoU2yYMPWW4Dnqk5aHWEL3RevwpBEXg8v1UkgbqYY=;
        b=ZvMFzI7Dwggnsd5A8ZK+ZpVS0gK0BVd6JcUS4NrxTIPSgbxzWa3mG+32whrIvu4U5p
         1KJnyhe4brPih6Jwzy8BQ4R1XgL1PoLVJ1WNkLvSTIOrT6140QpG/84soSqHkww+xfKI
         bNkNi5mYT/nbPVZ2d3e8QmaORSG9Vsy+7fHD/OKccEFUoNyGXpyNku8NaQunMCPeJw26
         F4miMijra/FvcHJqtlk1YBHRCrN9lkZnLAdB1Co9aegbM1QfX6YnnKMc8MzKBhampa23
         XaO13QoFfwC7gkehNfZlrsEsgakEFMW3KBmXgjRC1nSi3qdexyjamaT19z6R6i44J0/6
         b+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBZ+m0HYUjvtcnXf7IC4JRMXMbuadKgu0p7mczEPpau0x0y7G7vuntgw90JMYl733rNLpuizlC5nLQU/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5gvMnXQzRuuuJrxtDcD6H8pPram/0U3VBR9p5ZZUY3jJC310
	tvoqxilTVz2zhqHttjAut1JbHRQA91hubjspd3MgQzHzCpy+PmdCR7EymRR6rxYb5yM=
X-Gm-Gg: ASbGncvlBC1nc/0CmIy/e0ZUHWLgbA0+AwHIpJC5Wld3D94ElurCma1/SYFaBpIoh4B
	t4KV/lSDjJo2/+fA7tx2pcXFY/5qs+diJEf1J5B0qu0NAnn/9ahTYhqf8HAMHPmLBsEQUAZoDmM
	FrAbtUa/gWTojLlbgYnx2T3H1LTyf74idP/tjHSnvG0pdfgFms8pMkzlZHQg/xt3eD0G8hT/FjF
	/WcJk2oROEGlfEdj+I8i8NP3K7ayn9jnLw3xhXTlfk52cXZY1YRi/S320R4gJXilN/hyFWfMHeV
	VmLB4V/H4DnmMx6BeTlFUPdKva9Juu12da1RvDarMePnZk+NrOg0bSM0jic=
X-Google-Smtp-Source: AGHT+IFtnHWEz/+j2BG9QS02+XZtsC51R6Y1Jc7tbT048c7lAH39CFIlkqW/kelKNrFEkzXDFWCCdQ==
X-Received: by 2002:a92:c242:0:b0:3dd:89dc:ab07 with SMTP id e9e14a558f8ab-3ddce3ef67fmr186968655ab.8.1749566038458;
        Tue, 10 Jun 2025 07:33:58 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df6102e3sm2315805173.128.2025.06.10.07.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:33:57 -0700 (PDT)
Message-ID: <ab764b69-6b94-4163-b114-f4889a043040@kernel.dk>
Date: Tue, 10 Jun 2025 08:33:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix use-after-free of sq->thread in
 __io_uring_show_fdinfo()
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+531502bbbe51d2f769f4@syzkaller.appspotmail.com
References: <20250610111721.37036-1-superman.xpt@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250610111721.37036-1-superman.xpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 5:17 AM, Penglei Jiang wrote:
> diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
> index e9355276ab5d..2911352bbae1 100644
> --- a/io_uring/fdinfo.c
> +++ b/io_uring/fdinfo.c
> @@ -141,19 +141,23 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
>  
>  	if (ctx->flags & IORING_SETUP_SQPOLL) {
>  		struct io_sq_data *sq = ctx->sq_data;
> +		struct task_struct *tsk;
>  
> +		rcu_read_lock();
> +		tsk = rcu_dereference(sq->thread);
>  		/*
>  		 * sq->thread might be NULL if we raced with the sqpoll
>  		 * thread termination.
>  		 */
> -		if (sq->thread) {
> +		if (tsk) {
>  			sq_pid = sq->task_pid;
>  			sq_cpu = sq->sq_cpu;
> -			getrusage(sq->thread, RUSAGE_SELF, &sq_usage);
> +			getrusage(tsk, RUSAGE_SELF, &sq_usage);
>  			sq_total_time = (sq_usage.ru_stime.tv_sec * 1000000
>  					 + sq_usage.ru_stime.tv_usec);
>  			sq_work_time = sq->work_time;
>  		}
> +		rcu_read_unlock();
>  	}

Don't think this will work, if we're racing with the mmput and then end
up doing that inside an RCU read locked region...

> diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
> index 03c699493b5a..0625a421626f 100644
> --- a/io_uring/sqpoll.c
> +++ b/io_uring/sqpoll.c
> @@ -270,7 +270,8 @@ static int io_sq_thread(void *data)
>  	/* offload context creation failed, just exit */
>  	if (!current->io_uring) {
>  		mutex_lock(&sqd->lock);
> -		sqd->thread = NULL;
> +		rcu_assign_pointer(sqd->thread, NULL);
> +		put_task_struct(current);
>  		mutex_unlock(&sqd->lock);
>  		goto err_out;
>  	}

You do this in both spots, why the put_task_struct(current)? That seems
like that would be very wrong and instantly break. Did you run this
patch?

I do agree that there's an issue here though, let me take a closer look
at it. This would have been introduced with the getrusage change though,
no? This one:

ommit 3fcb9d17206e31630f802a3ab52081d1342b8ed9
Author: Xiaobing Li <xiaobing.li@samsung.com>
Date:   Wed Feb 28 17:12:51 2024 +0800

    io_uring/sqpoll: statistics of the true utilization of sq threads

as that is the one that added prodding at sq->thread from fdinfo.

-- 
Jens Axboe
