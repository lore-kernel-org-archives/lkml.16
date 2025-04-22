Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBEF290BB6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339559; cv=none; b=EhDAYS8KAUSD7YZZq83jVToGfYif6yV8vVpbFTm9z/yjMkDaLOV+Dm7skNbvLAag74eeqyevoNkriG3Lawo3eDAxXGtiKVmnPGgqQcWU/0uV9mJS2ErGS49W9K8NEgQCvVEsX16ZGctF6x5D914ntdm24d9RStL0jgWx/N+joSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339559; c=relaxed/simple;
	bh=Hc/a/N/czd1QJv27rjO3dbrnoqAvSzODqlF6TDvG0Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gG+6pNzZBSy1c356E4OQBTsiIkoRylCyJMgqErQIUdQ/FZKUXIDxRkgxaeaw69/MFa/eVO0oeOjcanG4BsEnlyZEuoFL1VgHFfgCNhU148AW+xlBjCQAIj8KZ+X9XRKZC1LdT4Bhq84MVXSIon09x+bxTD0txdsmPCQUUm03EQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=JJ+ErcEa; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="JJ+ErcEa"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d8b6954251so13426215ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745339556; x=1745944356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BI9KG26m9xjN9k6dbGw+O0NB/svh8sdwPuBKvebFKKY=;
        b=JJ+ErcEacJcnmCKKdBqYjTgPYOlb3oEIuQYoXzfTrgWjxvznzuKQcZUY89gbNVAV0X
         UStMCUWyEW3CEgXcAkoqxSmOpCO+7JeaSdxMSGFsQpYZwov2gzFuKcBN/IL1yDQQ02ve
         IZSOE+/ssGWpFUhAXojMGNsNpQJUSt8Nlnh2uWOP8fpMFG393SnFoT6N4RmTMPqCJohJ
         oVyIwc7LB1DBrmKXcVY9LR4YJhiNDTkbYBiVwCUaSTXlQ4gqZAdABvedekgKpx5D3PgX
         bWyBKrXzloQQ6379aFoDGBNoDkAaKDRKyVYR+Zm3mSPOlfMaKyBghGOGS3SZoCFGfHzs
         TRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339556; x=1745944356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BI9KG26m9xjN9k6dbGw+O0NB/svh8sdwPuBKvebFKKY=;
        b=XdZVF/EHyZqH/kvuHMb8esbTd+16UmlA11Do2Mg+w+nXywdmsexV0mDhgPF6Jx6mVG
         74xxcWk3b1jAlJnyisliJiGqmMd/DBGJgUWVKBZ8INnDjZ+pHmQr0LE/1xCFqEImTVrz
         4IjFFYf+a1EzY9TU9kzqGah8lbNSeLLH0H5je2kQzgZeZNq++JlnIk4znmNPc8JD7yfe
         w/8VyTtOB4rjc0CLogTsQwHqJADGQm61MNrCKzDWTMo6dKeYpqLSIiHYsezlSA592hkY
         65SStmxjIEVX/APWdvjnw1lh1H+rxEE++gBcogERuzLEouSgyWXL/rfxeidpAuTqQ0ee
         Iq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOjVqvPdfP5qIl+ZP728FWWSUB61W/Tz+0oosPciVQkC4BPdnCPPYwyliT5TTelxL5HJknlY2buWuxXTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHzOZUPAzLsYiprGYo7fhZyxnnZ4YJhIMx92wVp4P4EaX7BEdo
	h5SeeGGM0VnJaIJoyDm/s+Nxbr+Ou23pxEqza27hTUNiWlQj7Xt09wm2jevS+4Q=
X-Gm-Gg: ASbGncuP3NXQ0RB8c2DyAbUQZYtzQaFokYCzvAeIXoh5sYoUEFKo0mefu61tjnwA6uz
	Gt0eleQPIQFIOaPobrR8GKb1ihNKjXHETDXAV0k+s1QFyCS76Y6Iuuv0vQno8uft7jNrPyM7VKs
	vdywv8xzvpHZiwF5qv47kEphyXU5KHYfK1GdlefMePvZMAeTWT9rKCgrWjFHQHrT9+cZsqHPAKI
	d0q6E3AEMsG8jhcDh6ERCmbKCUsJ/lPpiQ7wr6dchhZzMtjPxZHllFMKN80DhD4FvHmuBL37690
	BVLBoxdx6qi7qEKLOTU2375dSuFsERAYCTwhAg==
X-Google-Smtp-Source: AGHT+IGFUtqoZyoWSfs3yKraYI/uOz+4B4kDE1UUkceCkMGC1DfmqmAIi/faS6XWXrDcN0tXD6ot6Q==
X-Received: by 2002:a92:cda5:0:b0:3d8:1d7c:e190 with SMTP id e9e14a558f8ab-3d88ed79da8mr170240475ab.7.1745339556060;
        Tue, 22 Apr 2025 09:32:36 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d821d1d7casm23248195ab.10.2025.04.22.09.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:32:35 -0700 (PDT)
Message-ID: <14195206-47b1-4483-996d-3315aa7c33aa@kernel.dk>
Date: Tue, 22 Apr 2025 10:32:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] io_uring: Add new functions to handle user fault
 scenarios
To: Zhiwei Jiang <qq282012236@gmail.com>, viro@zeniv.linux.org.uk
Cc: brauner@kernel.org, jack@suse.cz, akpm@linux-foundation.org,
 peterx@redhat.com, asml.silence@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
References: <20250422162913.1242057-1-qq282012236@gmail.com>
 <20250422162913.1242057-2-qq282012236@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250422162913.1242057-2-qq282012236@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 10:29 AM, Zhiwei Jiang wrote:
> diff --git a/io_uring/io-wq.h b/io_uring/io-wq.h
> index d4fb2940e435..8567a9c819db 100644
> --- a/io_uring/io-wq.h
> +++ b/io_uring/io-wq.h
> @@ -70,8 +70,10 @@ enum io_wq_cancel io_wq_cancel_cb(struct io_wq *wq, work_cancel_fn *cancel,
>  					void *data, bool cancel_all);
>  
>  #if defined(CONFIG_IO_WQ)
> -extern void io_wq_worker_sleeping(struct task_struct *);
> -extern void io_wq_worker_running(struct task_struct *);
> +extern void io_wq_worker_sleeping(struct task_struct *tsk);
> +extern void io_wq_worker_running(struct task_struct *tsk);
> +extern void set_userfault_flag_for_ioworker(void);
> +extern void clear_userfault_flag_for_ioworker(void);
>  #else
>  static inline void io_wq_worker_sleeping(struct task_struct *tsk)
>  {
> @@ -79,6 +81,12 @@ static inline void io_wq_worker_sleeping(struct task_struct *tsk)
>  static inline void io_wq_worker_running(struct task_struct *tsk)
>  {
>  }
> +static inline void set_userfault_flag_for_ioworker(void)
> +{
> +}
> +static inline void clear_userfault_flag_for_ioworker(void)
> +{
> +}
>  #endif
>  
>  static inline bool io_wq_current_is_worker(void)

This should go in include/linux/io_uring.h and then userfaultfd would
not have to include io_uring private headers.

But that's beside the point, like I said we still need to get to the
bottom of what is going on here first, rather than try and paper around
it. So please don't post more versions of this before we have that
understanding.

See previous emails on 6.8 and other kernel versions.

-- 
Jens Axboe
