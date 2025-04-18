Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015F21B8E7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998763; cv=none; b=dFiBjC7QpOFf3sTEFBVNBql1J1CT9C3jtr63B2u6XQbx6/7B2xPyTXyQ7zDO5Rs8zfRPxxwOFoM+meJNjvVq1P2Z+BT5EgAIq4zxsqiqUXB2fL3MRhLafVfI3AsS2BQ13rO3OewG+mFzocjGEhEZKjjkJLSSutNma3v7RkwLVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998763; c=relaxed/simple;
	bh=4mbPWT/gmCATMZaROBARbZZ9nfhc7WXdi1LY1EDDOPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/1gsjgjGWCMioPOxCS1RIqGzmAV2O4bcssDYKlqfxu6FBUGgNMN344mVo2kRghM0mkB6LZsT77gVZPLPtFkqT0fh3/r5t9X8V/SZ8V/S9oJZpjrEAWuLjYqC91rFrvw3oWiSIf5VVj5HJdrLXJuKnP/PZuVfFUy0aUxcXuHV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Mo08Q3Fx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Mo08Q3Fx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so2858196a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744998760; x=1745603560; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TsFYuLGh8xNnT8t0lny4A6t6txQ0jUe2g78tYPIMlyM=;
        b=Mo08Q3FxX3fpTD+8m1Eh/JVgTtMWyk54FwtdmDthFKkI1IUqg/b5qJ7XJESpI3rUBs
         IEIohGYuf8LTlrIFRAXYCUzofDId7k40TcpW/IGq9d2Miak7RRnlzQsxm3dLZR33JFuQ
         Sl806byM3X6AcjaNCb7MCQLtgLsnodFCRr7ZlXGBJ9ezi94jOCLkYw87UKhCgAViR1bD
         WAPWCYJ628BEsQwt22V8+foAGvwc0Om6jpYAHhQxw3mRJ0bfabjRQEno7A89oP8wQrs2
         qFWNoS0BqnxkG9y4A6I1igD3uVpur39kk6g+yb1oN9OWz/FxJTzyxHxKuiB41qEyKilq
         xLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998760; x=1745603560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsFYuLGh8xNnT8t0lny4A6t6txQ0jUe2g78tYPIMlyM=;
        b=nfE+6eZ//Kd5lapTVhlXT1TonH5qoMQ3kLWtqcEj+VkmgW/HTWREn7O/Q2R2fIEhuR
         KbGP6EDjsW8M+47vtaooMqFrZPPyTB0lw3NFESGS/xtDztVKd/4WqNWJAJzr3LSf5Iih
         vvaOjX1jXPVJoY6umXP8IMeta9KPOiz8tustcl5KndbjYL+N17XkHfhFyP/KOM+22Wcd
         VYtfpvDjhsyXDc+kX/aiHsWAvbNauXc+fuqovbePeUC8W2k3C6vaM/KfY4pa6xSFOMUw
         lvMJ3TZdOn94GZ8O1Lpwt6Fh8r2GaTflwcySigCVC6FEEZdMG81t758jdqA+JUkV1FKE
         BXPA==
X-Forwarded-Encrypted: i=1; AJvYcCXgH5nsd6oH//X0VlBqw58hTbMvHBkKYj5xsq1JFqdi04msAysDT2A26lbe1o+m8D2Y78XeQEB6/+qc1mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMsYOYfyySWtgY/BbrXV2qfiXVGnZ/JNY2Rd2gEBQst/efXlW
	tEp6WJ8QuljyZqUT4I7Y3Sg9hg4kVRNhtjNlVAAE7y+EZcP2dLIUSC7vlrAkwYc=
X-Gm-Gg: ASbGncs6S1CQiWbJNATDbsy/QSHCj1y2b2ywMP3uPmoQpkh2UtFWv8X9lXFWAcTNf/p
	xkJ6dC3OTy3XGCDs9P+iu7qvIUfoI+YARPhJuPzw1FpXhfeIAeRxl0nfwenxyqVq8tQIxTuXjaR
	7jD9qRiA3JeL2arrWLAZ77ZYbIlNOvpTARYIWqLktgIH9GU4c1caSz6awQne1K4HuXiRuQXVlXA
	vNesBnRyt2J29pDBSktynkk1YLG9udQSgq/+JVWQ2AT7ZV5My+c64vkMxirWQ6WjDu752x3/9Xe
	EBNeTMKTp63KDjORdztNk7vvOOpEnAYIkCzlcxTZvNvdSVXAdCQn0Uo9Vs8=
X-Google-Smtp-Source: AGHT+IEBHa67QvFzFQWm2yneuLwm8SwQ0zB337f+xHQo9e3mbRKUfgTmVGCA972hVNU/U2G8mQE2CA==
X-Received: by 2002:a17:90b:1f90:b0:2ff:6ac2:c5a5 with SMTP id 98e67ed59e1d1-3087bcc39b3mr4166935a91.26.1744998760049;
        Fri, 18 Apr 2025 10:52:40 -0700 (PDT)
Received: from purestorage.com ([208.88.159.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e0feb21sm1525744a91.32.2025.04.18.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:52:39 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:52:32 -0600
From: Michael Liang <mliang@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250418175232.7mxlokunrackcjbn@purestorage.com>
References: <20250417071359.iw3fangcfcuopjza@purestorage.com>
 <acc46429-6228-475e-8fd8-bc3d43c7f710@grimberg.me>
 <4683e355-166f-4b9a-a3ea-529f7b058a84@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4683e355-166f-4b9a-a3ea-529f7b058a84@grimberg.me>

On Fri, Apr 18, 2025 at 02:49:25PM +0300, Sagi Grimberg wrote:
> 
> 
> On 4/18/25 14:30, Sagi Grimberg wrote:
> > 
> > 
> > On 4/17/25 10:13, Michael Liang wrote:
> > > This patch addresses a data corruption issue observed in nvme-tcp during
> > > testing.
> > > 
> > > Issue description:
> > > In an NVMe native multipath setup, when an I/O timeout occurs, all
> > > inflight
> > > I/Os are canceled almost immediately after the kernel socket is shut
> > > down.
> > > These canceled I/Os are reported as host path errors, triggering a
> > > failover
> > > that succeeds on a different path.
> > > 
> > > However, at this point, the original I/O may still be outstanding in the
> > > host's network transmission path (e.g., the NIC’s TX queue). From the
> > > user-space app's perspective, the buffer associated with the I/O is
> > > considered
> > > completed since they're acked on the different path and may be
> > > reused for new
> > > I/O requests.
> > > 
> > > Because nvme-tcp enables zero-copy by default in the transmission path,
> > > this can lead to corrupted data being sent to the original target,
> > > ultimately
> > > causing data corruption.
> > > 
> > > We can reproduce this data corruption by injecting delay on one path and
> > > triggering i/o timeout.
> > > 
> > > To prevent this issue, this change ensures that all inflight
> > > transmissions are
> > > fully completed from host's perspective before returning from queue
> > > stop. To handle concurrent I/O timeout from multiple namespaces under
> > > the same controller, always wait in queue stop regardless of queue's
> > > state.
> > > 
> > > This aligns with the behavior of queue stopping in other NVMe fabric
> > > transports.
> > > 
> > > Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > > Reviewed-by: Randy Jennings <randyj@purestorage.com>
> > > Signed-off-by: Michael Liang <mliang@purestorage.com>
> > > ---
> > >   drivers/nvme/host/tcp.c | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > > index 26c459f0198d..62d73684e61e 100644
> > > --- a/drivers/nvme/host/tcp.c
> > > +++ b/drivers/nvme/host/tcp.c
> > > @@ -1944,6 +1944,21 @@ static void __nvme_tcp_stop_queue(struct
> > > nvme_tcp_queue *queue)
> > >       cancel_work_sync(&queue->io_work);
> > >   }
> > >   +static void nvme_tcp_stop_queue_wait(struct nvme_tcp_queue *queue)
> > > +{
> > > +    int timeout = 100;
> > > +
> > > +    while (timeout > 0) {
> > > +        if (!sk_wmem_alloc_get(queue->sock->sk))
> > > +            return;
> > > +        msleep(2);
> > > +        timeout -= 2;
> > > +    }
> > > +    dev_warn(queue->ctrl->ctrl.device,
> > > +         "qid %d: wait draining sock wmem allocation timeout\n",
> > > +         nvme_tcp_queue_id(queue));
> > > +}
> > > +
> > >   static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
> > >   {
> > >       struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
> > > @@ -1961,6 +1976,7 @@ static void nvme_tcp_stop_queue(struct
> > > nvme_ctrl *nctrl, int qid)
> > >       /* Stopping the queue will disable TLS */
> > >       queue->tls_enabled = false;
> > >       mutex_unlock(&queue->queue_lock);
> > > +    nvme_tcp_stop_queue_wait(queue);
> > >   }
> > >     static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
> > 
> > This makes sense. But I do not want to pay this price serially.
> > As the concern is just failover, lets do something like: diff --git
> > a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c index
> > 5041cbfd8272..d482a8fe2c4b 100644 --- a/drivers/nvme/host/tcp.c +++
> > b/drivers/nvme/host/tcp.c @@ -2031,6 +2031,8 @@ static void
> > nvme_tcp_stop_io_queues(struct nvme_ctrl *ctrl) for (i = 1; i <
> > ctrl->queue_count; i++) nvme_tcp_stop_queue(ctrl, i); + for (i = 1; i <
> > ctrl->queue_count; i++) + nvme_tcp_stop_queue_wait(&ctrl->queues[i]); }
> > static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl, @@ -2628,8
> > +2630,10 @@ static void nvme_tcp_complete_timed_out(struct request *rq)
> > { struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq); struct nvme_ctrl
> > *ctrl = &req->queue->ctrl->ctrl; + int idx =
> > nvme_tcp_queue_id(req->queue); - nvme_tcp_stop_queue(ctrl,
> > nvme_tcp_queue_id(req->queue)); + nvme_tcp_stop_queue(ctrl, idx); +
> > nvme_tcp_stop_queue_wait(&ctrl->queues[idx]);
> > nvmf_complete_timed_out_request(rq); }
> 
> Or perhaps something like:
> --
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 5041cbfd8272..3e206a2cbbf3 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1944,7 +1944,7 @@ static void __nvme_tcp_stop_queue(struct
> nvme_tcp_queue *queue)
>         cancel_work_sync(&queue->io_work);
>  }
> 
> -static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
> +static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
>  {
>         struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
>         struct nvme_tcp_queue *queue = &ctrl->queues[qid];
> @@ -1963,6 +1963,29 @@ static void nvme_tcp_stop_queue(struct nvme_ctrl
> *nctrl, int qid)
>         mutex_unlock(&queue->queue_lock);
>  }
> 
> +static void nvme_tcp_wait_queue(struct nvme_ctrl *nctrl, int qid)
> +{
> +       struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
> +       struct nvme_tcp_queue *queue = ctrl->queues[qid];
> +       int timeout = 100;
> +
> +       while (timeout > 0) {
> +               if (!sk_wmem_alloc_get(queue->sock->sk))
> +                       return;
> +               msleep(2);
> +               timeout -= 2;
> +       }
> +       dev_warn(queue->ctrl->ctrl.device,
> +                "qid %d: timeout draining sock wmem allocation expired\n",
> +                nvme_tcp_queue_id(queue));
> +}
> +
> +static void nvme_tcp_stop_queue(struct nvme_ctrl *nctrl, int qid)
> +{
> +       nvme_tcp_stop_queue_nowait(nctrl, qid);
> +       nvme_tcp_wait_queue(nctrl, qid);
> +}
> +
>  static void nvme_tcp_setup_sock_ops(struct nvme_tcp_queue *queue)
>  {
> write_lock_bh(&queue->sock->sk->sk_callback_lock);
> @@ -2030,7 +2053,9 @@ static void nvme_tcp_stop_io_queues(struct nvme_ctrl
> *ctrl)
>         int i;
> 
>         for (i = 1; i < ctrl->queue_count; i++)
> -               nvme_tcp_stop_queue(ctrl, i);
> +               nvme_tcp_stop_queue_nowait(ctrl, i);
> +       for (i = 1; i < ctrl->queue_count; i++)
> +               nvme_tcp_wait_queue(ctrl, i);
>  }
> 
>  static int nvme_tcp_start_io_queues(struct nvme_ctrl *ctrl,
> --
Yes, good idea to stop first and then wait all. Will verify this patch.

Thanks,
Michael Liang
