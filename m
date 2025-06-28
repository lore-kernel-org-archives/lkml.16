Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAF21CA16
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751105628; cv=none; b=bA88a1iWqSHRg8aGizYzGXRySRPdQir+emUNUUvtAmN3Btm+WIajGr/DMni6DA9iWuVa78UHaEnrK7F25uL5iwx9GTr7vrkFp58/twE7V9sty3ph6wx1FlcVlQlqLffqQ0ZylUvULgr/9nVtbyUVX/svxVFCJsArwHPn6DJ1qao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751105628; c=relaxed/simple;
	bh=d/0zLntRfBGNvApAVLZ1/oyiFDUhc6y0h/AEBDqdmxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4QV2KXTwOt8NbkBT+mXFO/GincFgmLRMn/WjV2RqNOuzI8mBrZK+n7tEb/5SJzWra8hjn17p95auw5tAZeK1RnjD+CPB861UwRpdqd2LDCSrM8NhJaYMoIqVjCRCUEItrASqwRoJSaJW4HAvRNp/7KsDwTh4IiH3zk3S9goDRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso17314925e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751105625; x=1751710425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAeip+ZgoQPXyxkDsAJDwje6lfQ4g6jf4qqXOmEFdYg=;
        b=DulD0jhFh57Y/NBHW7NNa9uXmNFNWMRZPgMsb3kz9d9bA3reKlHfiKQt+a9UyOsKkN
         wkrVwZ96kGgfy3gatHpdnQRQaV4Ug3Hb+b+oA10ee/8YnH4t2SnqkeByKpHyOFD2u2Mg
         /ASKloXwLHkfWiy//hD8aa/4Vq1eUwlDkICOYZ8YbV3Im0o/1Bvf99wmkNbPSJtME3tS
         32xbUE1ZQxBANiAgLshZp+HtQUqb/iFOQ/hqqENYnt1a5UDz1O/33TuxMZ4buj+iw0Cb
         5fxovDBqohJfMTThLMQtoYbzZ4UiPrkJ3urpDjSug5UYYUq4uUrWZ6OqYqcWzR/Dw1nz
         rNLA==
X-Forwarded-Encrypted: i=1; AJvYcCUyobUWqd8cWRDFRG8UWZT0c9EPIAG2JIa3Y44VezLRXT40PFQqwLRdBEM8Mybo8ir5CLjaZRi/HVP97S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMAW2a0KBjYzcGvCLDllRj5xLnOYysrQTgB0t1uv+UK9rRUSV
	BHngfW+EX3ag6zLbrPd46KuL2GVHxcC9ruLLBZtCqJrff8e88gt9rbWR
X-Gm-Gg: ASbGncsdvUPwk0oPDqjFoRYFKw/AOt5ya+JdAvEiuBTCnjVUMTYAhAm6lNlPZnqqE35
	Jm6/Brnzl7wQyS+8mPNYw2fdcKZmvm5ingGv6O6hAMLj8CJ63nS42kpmWFMaD65h6fvPSTt0wnn
	Jo33nWTAlK/31uFTs8hisjtnnjQ6wmVGjAD98m4DaNTqz47NHO9aMS9w0K3tFHsjrQ2qNPxGb8Q
	gfZlnFI0uI1M/F985JNusm4kK6C3o3Jyds9lPhNNiL3F3a08ALXukGye2Swk15xvuFp4Ts0ieYk
	nVcXTN8Of4hUecZg0MynHnkrXPkAu5lWKen2NriPao3TH2669FLtQ6xJ4s9ONPhnwY6zFplCXl2
	UvCv1fG5kpzpHxIJ3I+Augg==
X-Google-Smtp-Source: AGHT+IGv3C9+CbOxvwovO1McDRPkuH/sVtjblzbZ/xKR7LXlp4Iz5f6FbX/7Cnv0QsRt2HxPje/tCw==
X-Received: by 2002:a05:600c:3b2a:b0:453:7713:476c with SMTP id 5b1f17b1804b1-4538f2bfb46mr62616475e9.2.1751105624590;
        Sat, 28 Jun 2025 03:13:44 -0700 (PDT)
Received: from [10.100.102.74] (89-138-75-164.bb.netvision.net.il. [89.138.75.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad1adsm106139235e9.24.2025.06.28.03.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 03:13:44 -0700 (PDT)
Message-ID: <af65c545-a108-4045-874e-c67f894a3235@grimberg.me>
Date: Sat, 28 Jun 2025 13:13:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: clear nvme request for nonready request
To: Yu Kuai <yukuai1@huaweicloud.com>, kbusch@kernel.org, axboe@kernel.dk,
 hch@lst.de
Cc: yi.zhang@redhat.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
 yangerkun@huawei.com, johnny.chenyi@huawei.com
References: <20250628064634.3823093-1-yukuai1@huaweicloud.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250628064634.3823093-1-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

First, we need change the patch title to clarify that it fixes a bug.

i.e. something like:
nvme: fix nvme-mpath misaccounting of inflight active IO

Second, we need to add a fixes tag (i.e. addition of nvme-mpath 
nr_active accounting)

Third, we need a code-comment that explains this subtlety because it is 
not trivial.

On 28/06/2025 9:46, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
>
> It's found nvme mpath IO inflight counter can be decreased to negtive by
> following stack:
>
> CPU: 12 UID: 0 PID: 466 Comm: kworker/12:1H Tainted: G
>     6.16.0-rc3.yu+ #2 PREEMPT(voluntary)
> Workqueue: kblockd blk_mq_run_work_fn
> RIP: 0010:bdev_end_io_acct+0x494/0x5c0
> Call Trace:
>   <TASK>
>   nvme_end_req+0x4d/0x70 [nvme_core]
>   nvme_failover_req+0x3bd/0x530 [nvme_core]
>   nvme_fail_nonready_command+0x12c/0x170 [nvme_core]
>   nvme_fc_queue_rq+0x463/0x720 [nvme_fc]
>   blk_mq_dispatch_rq_list+0x358/0x1260
>   __blk_mq_sched_dispatch_requests+0x2dd/0x480
>   blk_mq_sched_dispatch_requests+0xa6/0x140
>   blk_mq_run_work_fn+0x1bb/0x2a0
>   process_one_work+0x8ca/0x1950
>   worker_thread+0x58d/0xcf0
>   kthread+0x3d5/0x7a0
>   ret_from_fork+0x403/0x510
>   ret_from_fork_asm+0x1a/0x30
>   </TASK>
>
> The IO inflight counter is not increased from nvme_fail_nonready_command()
> yet, hence decrease it will cause it to be negative.
>
> This is not a problem for blk-mq request because it's already
> initialized before issuing, however, nvme request is only initialized from
> following nvme_setup_cmd(). Fix the problem by clearing it in
> nvme_fail_nonready_command().
>
> Reported-by: Yi Zhang <yi.zhang@redhat.com>
> Closes: https://lore.kernel.org/all/CAHj4cs_+dauobyYyP805t33WMJVzOWj=7+51p4_j9rA63D9sog@mail.gmail.com/
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/nvme/host/core.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 92697f98c601..8caafa25c010 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -764,6 +764,9 @@ blk_status_t nvme_fail_nonready_command(struct nvme_ctrl *ctrl,
>   	    !test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ctrl->flags) &&
>   	    !blk_noretry_request(rq) && !(rq->cmd_flags & REQ_NVME_MPATH))
>   		return BLK_STS_RESOURCE;
> +
> +	if (!(rq->rq_flags & RQF_DONTPREP))
> +		nvme_clear_nvme_request(rq);
>   	return nvme_host_path_error(rq);
>   }
>   EXPORT_SYMBOL_GPL(nvme_fail_nonready_command);

