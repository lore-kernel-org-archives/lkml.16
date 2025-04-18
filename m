Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABEB1A00E7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744975854; cv=none; b=uSc7Td4tpjErfxepQnS6ixZmn9A70K2BcwiNBfqtNwIcwotMrzwlWwdL7IcEjWc8GsGzuOGZ/GKhVWi/oRTY8vezIrd0ZhcZfNpsQEphIN8R+SxsX1hafCi0JlPyl5UR0qZKdhjfMu5bjtLpqa9fYB+ejKHhHbZTbZ3/30Gijio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744975854; c=relaxed/simple;
	bh=mAQSbd2c6J2sWnEmggeIvDXSAGrSG1rkMB4M9PRBYsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0pqIrNgJtMIcryqEHmHs+a9OA3msSK4plR3yHDGMGCLR11RwI0UcZ7kapqAaySlc3zqkEX4WvbrnDPqbD+jwUmY2U4k7pobkn4aFCLyocDA8J6xdNqGQKdmez7YVfiASQps3by/M46a2fM+/7b01y6oDXdYDO/NhzOmitIjUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0782d787so12606875e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975850; x=1745580650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec/XzVcGOwKgl03ZmFZTdHXNDJONfrH6xIDSGmbmdKk=;
        b=lzkwKMz/Z1xWo9OdY4+BOq6cWb5RN/kBwb/GtWqkSAk6WMXb/gvVx0nfiuSyOxoC8m
         WmJS0LSlfRHr/WHbssEdV019UkNFbKW6LpW9/MmmSkJ5Z04KxRvGwc30LEseKU/ejfmU
         HJ+Gk6Kek268hXcUx1jK5bp0mO/8E4j8blge6KsveIaTuJrUYbclEQwRs/VHPOr/F+JE
         qAiPPS7RfdGtaXFMCJjO1pxt/O9W4eqDe6Zc6dDhZpxpLFzk43+xK/LiOm9fxiXEWD9k
         4uw00l9UC4ZpNJt8kyLPeszxuNTze81+uis4EcrNhPnk1QSHyVcQoytFVLDnfjZ9x7mO
         6+iw==
X-Forwarded-Encrypted: i=1; AJvYcCXUxoioK7XnywOTTMK8Lh+RNIcXsVQZ9NriLV00LtWJIUJ3EBmvhVWnaeMDiekKECDHHuybmYMx0DqTHwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BjgBrnAYngmMx7Ju3TleZtEjFIdWPzJbiZC1vlCoXsfAGJXz
	suJ7yrFxU6smrClZSAid4KxPsKSbBgggxvNR4rUh/9/KsoSmYRkc
X-Gm-Gg: ASbGncuyTbMZkyFic/wL+AetyDLOL/UrRq2CY44V/qjuiqo32vP0ioqET+HMYx4xpkk
	5bOI1m4mttpjjx1ypSpQ3WTDoLMsfsOKqO/JyJ+Hw4z+LLDiTxIvn4Mz59UcvtuCuEQKpKOzbLJ
	+IkPrQMDTO8tBNqB9GA05SFqHbr6F0dmRsJtw49gujOyD89kR3CBIgMlx9m0ZLbQNscOLf8KS+5
	dTmbW8WMh0KzJcMFMprgHWe8QUA2fC70rhe6wESz5GE5ZhAHC3/w2pFjEZUJsjnSpqcMWsLszfZ
	NMQGxPR8XP/1RVrL57s6N1iZlhdeQH+IlsIsCy7T
X-Google-Smtp-Source: AGHT+IHopOoTjCgVg0Mcg1+7QOl+DxqAuGkARymIBOfr2XaYZywOwRZjhRW0NML5Krd9zqG52QhLSg==
X-Received: by 2002:a05:600c:348a:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-4406aba5f97mr22060475e9.16.1744975850184;
        Fri, 18 Apr 2025 04:30:50 -0700 (PDT)
Received: from [10.100.102.67] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5cf2dfsm19346195e9.29.2025.04.18.04.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 04:30:49 -0700 (PDT)
Message-ID: <acc46429-6228-475e-8fd8-bc3d43c7f710@grimberg.me>
Date: Fri, 18 Apr 2025 14:30:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] nvme-tcp: wait socket wmem to drain in queue stop
To: Michael Liang <mliang@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250417071359.iw3fangcfcuopjza@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250417071359.iw3fangcfcuopjza@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/17/25 10:13, Michael Liang wrote:
> This patch addresses a data corruption issue observed in nvme-tcp during
> testing.
>
> Issue description:
> In an NVMe native multipath setup, when an I/O timeout occurs, all inflight
> I/Os are canceled almost immediately after the kernel socket is shut down.
> These canceled I/Os are reported as host path errors, triggering a failover
> that succeeds on a different path.
>
> However, at this point, the original I/O may still be outstanding in the
> host's network transmission path (e.g., the NIC’s TX queue). From the
> user-space app's perspective, the buffer associated with the I/O is considered
> completed since they're acked on the different path and may be reused for new
> I/O requests.
>
> Because nvme-tcp enables zero-copy by default in the transmission path,
> this can lead to corrupted data being sent to the original target, ultimately
> causing data corruption.
>
> We can reproduce this data corruption by injecting delay on one path and
> triggering i/o timeout.
>
> To prevent this issue, this change ensures that all inflight transmissions are
> fully completed from host's perspective before returning from queue
> stop. To handle concurrent I/O timeout from multiple namespaces under
> the same controller, always wait in queue stop regardless of queue's state.
>
> This aligns with the behavior of queue stopping in other NVMe fabric transports.
>
> Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Randy Jennings <randyj@purestorage.com>
> Signed-off-by: Michael Liang <mliang@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 26c459f0198d..62d73684e61e 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1944,6 +1944,21 @@ static void __nvme_tcp_stop_queue(struct nvme_tcp_queue *queue)
>   	cancel_work_sync(&queue->io_work);
>   }
>   
> +static void nvme_tcp_stop_queue_wait(struct nvme_tcp_queue *queue)
> +{
> +	int timeout = 100;
> +
> +	while (timeout > 0) {
> +		if (!sk_wmem_alloc_get(queue->sock->sk))
> +			return;
> +		msleep(2);
> +		timeout -= 2;
> +	}
> +	dev_warn(queue->ctrl->ctrl.device,
> +		 "qid %d: wait draining sock wmem allocation timeout\n",
> +		 nvme_tcp_queue_id(queue));
> +}
> +
>   static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
>   {
>   	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
> @@ -1961,6 +1976,7 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
>   	/* Stopping the queue will disable TLS */
>   	queue->tls_enabled = false;
>   	mutex_unlock(&queue->queue_lock);
> +	nvme_tcp_stop_queue_wait(queue);
>   }
>   
>   static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)

This makes sense. But I do not want to pay this price serially.
As the concern is just failover, lets do something like: diff --git 
a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c index 
5041cbfd8272..d482a8fe2c4b 100644 --- a/drivers/nvme/host/tcp.c +++ 
b/drivers/nvme/host/tcp.c @@ -2031,6 +2031,8 @@ static void 
nvme_tcp_stop_io_queues(struct nvme_ctrl *ctrl) for (i = 1; i < 
ctrl->queue_count; i++) nvme_tcp_stop_queue(ctrl, i); + for (i = 1; i < 
ctrl->queue_count; i++) + nvme_tcp_stop_queue_wait(&ctrl->queues[i]); } 
static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl, @@ -2628,8 
+2630,10 @@ static void nvme_tcp_complete_timed_out(struct request *rq) 
{ struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq); struct nvme_ctrl 
*ctrl = &req->queue->ctrl->ctrl; + int idx = 
nvme_tcp_queue_id(req->queue); - nvme_tcp_stop_queue(ctrl, 
nvme_tcp_queue_id(req->queue)); + nvme_tcp_stop_queue(ctrl, idx); + 
nvme_tcp_stop_queue_wait(&ctrl->queues[idx]); 
nvmf_complete_timed_out_request(rq); }
