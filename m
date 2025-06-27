Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD4233145
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011531; cv=none; b=SPmm4SEZCBQ5ekN16wsP2fexOy4WCWfqt6zqvJfzxCKM84ULJdP+6F7wdqTpZI25Da5rsV8OHjLvKTOf6yB8qgi/HWO9WJkHkjMggKGC0STQ9p34VweHEzEHKrTnk0f8qJyX3u9GXIiIyGefefiVfm535LiXy+bPI1B82A63sHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011531; c=relaxed/simple;
	bh=vBq6teBvqAQ1bOR0/nmtBHZ08gptVykkefcyw/8iwjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSYj8zQsGzbG2tnAsw/DCZNTxp7G5vSziTsY737F0v406SYm/wA4CoiSeVzoHPYQjMRPNxPrTLxH/NjZ55rQMpnMB6wPexYuQJoNyVDM73mhHWcO0jJXQnRiX9CjUQkAUx7R1f9LvtYgn91svjgR3W4zXObi0Y0ucYQQobwjp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PkAMMRyx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PkAMMRyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751011528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0SldnEnAs1P6cPviFJLKe7wqauxrA1xf5p9SybuzQk=;
	b=PkAMMRyxVZGfRFKSG8ktUi1X8KRjNH7thwe3fcvOtIhU3BdxXCpYNVC2UOuPlrc/Ia0SvF
	emVFlS2nEEgXZRLsa37STkChY/+2wBtgoWlkG1odwDDwRcmpn0/2ew3jkTIgUIZOY4BkCQ
	AV3aTvf4lcoO7HD3pU4/k6xgag2PrOE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-NczcwOE0MtSbQpLzr2qo9w-1; Fri, 27 Jun 2025 04:05:27 -0400
X-MC-Unique: NczcwOE0MtSbQpLzr2qo9w-1
X-Mimecast-MFC-AGG-ID: NczcwOE0MtSbQpLzr2qo9w_1751011526
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4535f803ec5so12628145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011526; x=1751616326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0SldnEnAs1P6cPviFJLKe7wqauxrA1xf5p9SybuzQk=;
        b=AHhVp7I4Iwnp6HqGoPb4XseLx3DGCLEDlkINaGpZLa5GShHU5fB7fyW4S6SwOf9V73
         BUsfCYKtSdMygF7v00Uo6C9GP05LKYIRjo4dGLbzmLYZTqEkOCRUQFtxekRsl5RRgA/r
         lViKKWBxDHlODLt/yj9zP9YjweXDT17zLB0ymzYIuP+nX2DGKfig3/OK55SL0v7Nf+WI
         fV8nj8SDT+eD8U9RL9yLA9MYyQmzC131v6OEcQSYNLqbiIA9ZT07INHnvDWdayvpEDcX
         YzCN9am6aLmXMupYyjK5uO15w9sW+xOwo03+Pidd5JxLYC4PB11Xro+ZSObkvcglFIAR
         66xA==
X-Forwarded-Encrypted: i=1; AJvYcCU/NTu/9l8LHOWeTsMrgpfXxSHKloEEtdkVVZ9CMky39NpG8MzEfOkrZMcz74EW+wZwBIOJX+ly4I6PWII=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2gm1WYOEJo2D+fFF952grpKGQPCl+ba1qo0Uqh90kmYt9hAX
	TD2LiZbyaCD04620PiAtbYxRR7RwHOo64N6I1jRxpAHbAex0AbWcFbERWUkFIXbHsYq1GvvUeUs
	vF2PJsIEjFUIT8pPfPPumxUABiJC91UeDPnbb+XPiACcDwJONxMnrASYXTFW8njsM4w==
X-Gm-Gg: ASbGncsCtMHZxZFJhLjYLKuwDQcxNSJvkpQbGDsN/AJ1MeOC9MRfhatk3qvvTYnYa1g
	UPmW1D4gfzsNzBx3h2D8Gn5AJ+WuWyorxld+Sv/cGD2XztyY30Ce35gIwx7aEHuCb+9ODCcyLEI
	grYGhRRVHUBy2v1iZcCj+IPkn1SDkx6Te94Ow7hYuBJNwGHo2w4IvhIIqqd5ynKzCv+qmr4ZRDv
	XxJfxBVYWFmUBNy8wIFQol2yvxwDsaRwu2EDwR7IqhN/+cGEM4GdVNcEmRgkPky8ntHC1t822Zx
	SNAMlDv0ZTwOxvstEQ1KX+Iy6fUaO79HfyDlzGxowi8OhWp5WjIZ
X-Received: by 2002:adf:b604:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a8fdeff974mr1872413f8f.32.1751011525644;
        Fri, 27 Jun 2025 01:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaMJrRYRhoRLux+vk+OsIiQlv9TTSam8bVtWhu6PiNh+mKCLTZbj8uRsmMNhufOC+vLn4+3w==
X-Received: by 2002:adf:b604:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a8fdeff974mr1872359f8f.32.1751011525109;
        Fri, 27 Jun 2025 01:05:25 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.11.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380d628c6sm42196755e9.3.2025.06.27.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:05:23 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:05:21 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, prime.zeng@hisilicon.com,
	yangyicong@hisilicon.com
Subject: Re: [PATCH] sched/deadline: Don't count nr_running twice for
 dl_server proxy tasks
Message-ID: <aF5QwYFj15DLDbBR@jlelli-thinkpadt14gen4.remote.csb>
References: <20250627035420.37712-1-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627035420.37712-1-yangyicong@huawei.com>

Hello,

On 27/06/25 11:54, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On CPU offline the kernel stalled with below call trace:
> 
>   INFO: task kworker/0:1:11 blocked for more than 120 seconds.
>         Tainted: G           O        6.15.0-rc4+ #1
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:kworker/0:1     state:D stack:0     pid:11    tgid:11    ppid:2   task_flags:0x4208060 flags:0x00000008
>   Workqueue: events vmstat_shepherd
>   Call trace:
>    __switch_to+0x118/0x188 (T)
>    __schedule+0x31c/0x1300
>    schedule+0x3c/0x120
>    percpu_rwsem_wait+0x12c/0x1b0
>    __percpu_down_read+0x78/0x188
>    cpus_read_lock+0xc4/0xe8
>    vmstat_shepherd+0x30/0x138
>    process_one_work+0x154/0x3c8
>    worker_thread+0x2e8/0x400
>    kthread+0x154/0x230
>    ret_from_fork+0x10/0x20
>   INFO: task kworker/1:1:116 blocked for more than 120 seconds.
>         Tainted: G           O        6.15.0-rc4+ #1
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:kworker/1:1     state:D stack:0     pid:116   tgid:116   ppid:2   task_flags:0x4208060 flags:0x00000008
>   Workqueue: events work_for_cpu_fn
>   Call trace:
>    __switch_to+0x118/0x188 (T)
>    __schedule+0x31c/0x1300
>    schedule+0x3c/0x120
>    schedule_timeout+0x10c/0x120
>    __wait_for_common+0xc4/0x1b8
>    wait_for_completion+0x28/0x40
>    cpuhp_kick_ap_work+0x114/0x3c8
>    _cpu_down+0x130/0x4b8
>    __cpu_down_maps_locked+0x20/0x38
>    work_for_cpu_fn+0x24/0x40
>    process_one_work+0x154/0x3c8
>    worker_thread+0x2e8/0x400
>    kthread+0x154/0x230
>    ret_from_fork+0x10/0x20
> 
> cpuhp hold the cpu hotplug lock endless and stalled vmstat_shepherd.
> This is because we count nr_running twice on cpuhp enqueuing and failed
> the wait condition of cpuhp:
> 
> enqueue_task_fair() // pick cpuhp from idle, rq->nr_running = 0
>   dl_server_start()
>     [...]
>     add_nr_running() // rq->nr_running = 1
>   add_nr_running() // rq->nr_running = 2
> [switch to cpuhp, waiting on balance_hotplug_wait()]
> rcuwait_wait_event(rq->nr_running == 1 && ...) // failed, rq->nr_running=2
>   schedule() // wait again
> 
> This doesn't make sense to count one single task twice on
> rq->nr_running. So fix this.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..59fb178762ee 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1894,7 +1894,9 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
>  	u64 deadline = dl_se->deadline;
>  
>  	dl_rq->dl_nr_running++;
> -	add_nr_running(rq_of_dl_rq(dl_rq), 1);
> +
> +	if (!dl_server(dl_se))
> +		add_nr_running(rq_of_dl_rq(dl_rq), 1);
>  
>  	inc_dl_deadline(dl_rq, deadline);
>  }
> @@ -1904,7 +1906,9 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
>  {
>  	WARN_ON(!dl_rq->dl_nr_running);
>  	dl_rq->dl_nr_running--;
> -	sub_nr_running(rq_of_dl_rq(dl_rq), 1);
> +
> +	if (!dl_server(dl_se))
> +		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
>  
>  	dec_dl_deadline(dl_rq, dl_se->deadline);
>  }

This seems to make sense to me. Thanks for the analysis and the patch.

Peter, what do you think?

Thanks,
Juri

