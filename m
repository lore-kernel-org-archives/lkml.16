Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57D4199947
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744976971; cv=none; b=Xdl54yNixnPrXqBsE/X2/KnSilE7sD1X0CQRGSMdlBI2OC9kGTurc9fAPMdqEL22nfgrA8+odfgizTL6k5svqh+elK9hM9WEVLs1I3I+AeezZS1nbWoN/JuMGpvWxMU2rSXM9Eo6wyl6hyukLpIt5K+HX/+h6y+4kp/egg+FBXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744976971; c=relaxed/simple;
	bh=1uzu1kv2ZLD67E6okRuI51JM7knTFomsz1LXCyXqN/w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PpRZkAW2npTA7WKq8FxszOeZqMKe1jtizRyFCsa++dlNfYQsPx610H663p/wktwTAbDFQ6R4K+J+rLGaNev8prBGlwS1JaTPh//PaMQ5FzuanfDcm4p7fKlGA8lawleH87C4zp+8AtAuW87wLwR30/NLGtaO92f0AQgunNqUJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so20651765e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744976968; x=1745581768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVAZkueF6TO3vmEWTnRcjkq4LoD47LWe63XR/UPIPzA=;
        b=rSii8sNALiReKqaJtZTG+ZiL3jeN1F6Lo8d0rkqcO3nq4dZESjWMX0T2wYHly+z/3I
         Sed6RyZGnuaL/VZ52m8EOkOY4kfEp0/zmSxHai7OBzlsCzB+NYXR3k9S6qh0wjNyBbwb
         8m2sc615WctHzqynsohmGYjSQ1WPdDVJJg28rcPsiaVMIth+dzvUd4BZ2CIj2cq1dXe0
         ZepEEZdVOi47XAOaboSvWNNMRjQBm7t5vNec4NjfZjIRlURsVzl/Gn0flX2EPLmvRojM
         CY+ykOX+x39t1n45NUQMitpYBsQBl+if6Bwgtn+E2V/p1pikpkiLh+WGkU0ZvELgJs5J
         3/vg==
X-Forwarded-Encrypted: i=1; AJvYcCWfB0wus8yZmXfr5kMgQIdEy3Ks+nJUyCzT5kfvq9p6n4oAut//ktvhduQKfpxU/jRAv7dgBdfvAK6ufLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7OCSlGtqRRLg0qzRWjwPJWvTe2iDFOrsIl6w5yeutdgGmtq7
	VqZoJnktx8LoiLkOqOOErQj7P+7iRKelQEJ7CuHsbOninLNSL7S9
X-Gm-Gg: ASbGncujwZxszJGyUfGIyi4aVTiiT8suSpaL7/eHSGOPA8vHaQqwVo7Foek+dUDkyFf
	TcDHYmwY2+Dtji0n/GO4JsDac6EDq5T9JKTxOmeZk5agqA2ab5UmW7/vQ/YxPf+S6pr2CC42J3w
	HIOFgEYYtQn444srn8dtnGdrKN8idE9QqFNSXX/JlX/cyG1/TCOts938pQRyoXXr3CfLz8+Eujq
	eJLcUquREIgHi4al1R7zMmXmiZBSnJkQh/Hi4A7zb7Eyp+gOf4sSZ3iegPm8KduJtSComtPo+SV
	aG1J7IC7ZJEiFKBIp/SKtUyYsRQsb7K4eXSoibe41vTGgX/CbOU=
X-Google-Smtp-Source: AGHT+IHAD5tCrAKdlb+hKiBaU767bCq+juH84w7mFehf7472CiKBwwZN5Ga2ogjoWSPneMEPliij4w==
X-Received: by 2002:a5d:5987:0:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-39efbaf6e96mr1812477f8f.50.1744976967991;
        Fri, 18 Apr 2025 04:49:27 -0700 (PDT)
Received: from [10.100.102.67] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6db117sm19288545e9.26.2025.04.18.04.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 04:49:27 -0700 (PDT)
Message-ID: <4683e355-166f-4b9a-a3ea-529f7b058a84@grimberg.me>
Date: Fri, 18 Apr 2025 14:49:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] nvme-tcp: wait socket wmem to drain in queue stop
From: Sagi Grimberg <sagi@grimberg.me>
To: Michael Liang <mliang@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250417071359.iw3fangcfcuopjza@purestorage.com>
 <acc46429-6228-475e-8fd8-bc3d43c7f710@grimberg.me>
Content-Language: en-US
In-Reply-To: <acc46429-6228-475e-8fd8-bc3d43c7f710@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/18/25 14:30, Sagi Grimberg wrote:
>
>
> On 4/17/25 10:13, Michael Liang wrote:
>> This patch addresses a data corruption issue observed in nvme-tcp during
>> testing.
>>
>> Issue description:
>> In an NVMe native multipath setup, when an I/O timeout occurs, all 
>> inflight
>> I/Os are canceled almost immediately after the kernel socket is shut 
>> down.
>> These canceled I/Os are reported as host path errors, triggering a 
>> failover
>> that succeeds on a different path.
>>
>> However, at this point, the original I/O may still be outstanding in the
>> host's network transmission path (e.g., the NIC’s TX queue). From the
>> user-space app's perspective, the buffer associated with the I/O is 
>> considered
>> completed since they're acked on the different path and may be reused 
>> for new
>> I/O requests.
>>
>> Because nvme-tcp enables zero-copy by default in the transmission path,
>> this can lead to corrupted data being sent to the original target, 
>> ultimately
>> causing data corruption.
>>
>> We can reproduce this data corruption by injecting delay on one path and
>> triggering i/o timeout.
>>
>> To prevent this issue, this change ensures that all inflight 
>> transmissions are
>> fully completed from host's perspective before returning from queue
>> stop. To handle concurrent I/O timeout from multiple namespaces under
>> the same controller, always wait in queue stop regardless of queue's 
>> state.
>>
>> This aligns with the behavior of queue stopping in other NVMe fabric 
>> transports.
>>
>> Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
>> Reviewed-by: Randy Jennings <randyj@purestorage.com>
>> Signed-off-by: Michael Liang <mliang@purestorage.com>
>> ---
>>   drivers/nvme/host/tcp.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>> index 26c459f0198d..62d73684e61e 100644
>> --- a/drivers/nvme/host/tcp.c
>> +++ b/drivers/nvme/host/tcp.c
>> @@ -1944,6 +1944,21 @@ static void __nvme_tcp_stop_queue(struct 
>> nvme_tcp_queue *queue)
>>       cancel_work_sync(&queue->io_work);
>>   }
>>   +static void nvme_tcp_stop_queue_wait(struct nvme_tcp_queue *queue)
>> +{
>> +    int timeout = 100;
>> +
>> +    while (timeout > 0) {
>> +        if (!sk_wmem_alloc_get(queue->sock->sk))
>> +            return;
>> +        msleep(2);
>> +        timeout -= 2;
>> +    }
>> +    dev_warn(queue->ctrl->ctrl.device,
>> +         "qid %d: wait draining sock wmem allocation timeout\n",
>> +         nvme_tcp_queue_id(queue));
>> +}
>> +
>>   static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
>>   {
>>       struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
>> @@ -1961,6 +1976,7 @@ static void nvme_tcp_stop_queue(struct 
>> nvme_ctrl *nctrl, int qid)
>>       /* Stopping the queue will disable TLS */
>>       queue->tls_enabled = false;
>>       mutex_unlock(&queue->queue_lock);
>> +    nvme_tcp_stop_queue_wait(queue);
>>   }
>>     static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
>
> This makes sense. But I do not want to pay this price serially.
> As the concern is just failover, lets do something like: diff --git 
> a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c index 
> 5041cbfd8272..d482a8fe2c4b 100644 --- a/drivers/nvme/host/tcp.c +++ 
> b/drivers/nvme/host/tcp.c @@ -2031,6 +2031,8 @@ static void 
> nvme_tcp_stop_io_queues(struct nvme_ctrl *ctrl) for (i = 1; i < 
> ctrl->queue_count; i++) nvme_tcp_stop_queue(ctrl, i); + for (i = 1; i 
> < ctrl->queue_count; i++) + 
> nvme_tcp_stop_queue_wait(&ctrl->queues[i]); } static int 
> nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl, @@ -2628,8 +2630,10 
> @@ static void nvme_tcp_complete_timed_out(struct request *rq) { 
> struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq); struct nvme_ctrl 
> *ctrl = &req->queue->ctrl->ctrl; + int idx = 
> nvme_tcp_queue_id(req->queue); - nvme_tcp_stop_queue(ctrl, 
> nvme_tcp_queue_id(req->queue)); + nvme_tcp_stop_queue(ctrl, idx); + 
> nvme_tcp_stop_queue_wait(&ctrl->queues[idx]); 
> nvmf_complete_timed_out_request(rq); }

Or perhaps something like:
--
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 5041cbfd8272..3e206a2cbbf3 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1944,7 +1944,7 @@ static void __nvme_tcp_stop_queue(struct 
nvme_tcp_queue *queue)
         cancel_work_sync(&queue->io_work);
  }

-static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
+static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
  {
         struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
         struct nvme_tcp_queue *queue = &ctrl->queues[qid];
@@ -1963,6 +1963,29 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl 
*nctrl, int qid)
         mutex_unlock(&queue->queue_lock);
  }

+static void nvme_tcp_wait_queue(struct nvme_ctrl *nctrl, int qid)
+{
+       struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
+       struct nvme_tcp_queue *queue = ctrl->queues[qid];
+       int timeout = 100;
+
+       while (timeout > 0) {
+               if (!sk_wmem_alloc_get(queue->sock->sk))
+                       return;
+               msleep(2);
+               timeout -= 2;
+       }
+       dev_warn(queue->ctrl->ctrl.device,
+                "qid %d: timeout draining sock wmem allocation expired\n",
+                nvme_tcp_queue_id(queue));
+}
+
+static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
+{
+       nvme_tcp_stop_queue_nowait(nctrl, qid);
+       nvme_tcp_wait_queue(nctrl, qid);
+}
+
  static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
  {
write_lock_bh(&queue->sock->sk->sk_callback_lock);
@@ -2030,7 +2053,9 @@ static void nvme_tcp_stop_io_queues(struct 
nvme_ctrl *ctrl)
         int i;

         for (i = 1; i < ctrl->queue_count; i++)
-               nvme_tcp_stop_queue(ctrl, i);
+               nvme_tcp_stop_queue_nowait(ctrl, i);
+       for (i = 1; i < ctrl->queue_count; i++)
+               nvme_tcp_wait_queue(ctrl, i);
  }

  static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl,
--
