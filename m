Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F662040A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275105; cv=none; b=SuYuaImtdPFvesXJpkXIPCAZJ/t2geVYszViQAd8NA7WlU/9rfct//c0W/DIcmd392IXLAvQiDaWTUBmCW+YgLi4S7jGLvNdNiaYEWF+X6bxIUEEnQjVzRrTZ2Tx8VXQeLX3tSwaASZWhx7kEk4vxRvUn5Ifs6gdgD9j75mMgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275105; c=relaxed/simple;
	bh=dkVvOKAgK6qPh+pDw5xq6qCVYF1F8ux3X/+qzDeUkQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VedKqwCfipae9ukDXlCleSGu9s+Yj0yJtzp9F4bKy/8JtCM8Mv8Nh4G5iMEjrY+xxLq8UxLfMP6xqTQtpA2MHrY4YYRI5pFbYUNjCydILjtZA0tBWNF1qbgiDHdav9N0lKCb/dVuU/xdnCtTjmNGMHp4U698JLF6rgEG3+cVpEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=asoQZwdM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="asoQZwdM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22928d629faso5029455ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744275100; x=1744879900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOqcpIPS5XQiRrSzeP5uJMKmPHIJo5Vdy82FiOSmbp4=;
        b=asoQZwdM0gJycRJISWGKMO4A0/yotopRNxP2DwekvNHJwV7D7Hz/fE7wzAbAKQIOab
         +S+BUvAIEfQkmtQJEhYmnc7ulLwsolsGf44vCDFYOfjzrsRqBSiIEvJUx375x791EpoO
         yljj53DShguCHjL6/oLqin00vFpMT9egmzx2KF1E3KVJ0FfSXePq6gHDiwKdn+014sSI
         xhhOuIBBhy+g3CjiB9i4B8pdyfTJVvc+KuUP9B/LWo6l/2LQ1TU+P1IdphtIzaTMFA/R
         EGKGi2dUzinv1YhkSdRp9EZd3ZB3mi8EvxhX2GRGxpjXNGnOz7URiaChNzggc4CgWHyl
         IaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275100; x=1744879900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOqcpIPS5XQiRrSzeP5uJMKmPHIJo5Vdy82FiOSmbp4=;
        b=idf6/XZKcKa+dH+bfE3VzzbE9xgDkAd3EWYq5R3Ae6m2+we5cCi5ahi4QM4d48JdIL
         xhu1yArU7XzeuVzIalYJL6rSS/NQJmb+hMbRS1RM64USn74KcJKk/pSIhVHEmOxDyNhB
         ErR4QDX/AqQFx5HMiQmBRH3RojAcwGSYhuzb8+uHAoBpMhJ0y3k1oC+lguHy2Fw9L1TF
         X8sFG3jD5J700yneI4eG5sOw9S/evNozvU8bW93v/9Zu0VocL6qy70s221GEAoVKwWCg
         WlPCmAVxTewG0dsOghePKg6yUKYlOfxCohlStIk9Tdc2eM7RiJtzT0dcXj5/oLYRnswP
         RukQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG4x3MaGWmnuEYEk6MD0wgwMehKl83fZ/epV3TSXCdOXh6sG/gLLVHgsYCN+JSi53bIWndKoscxKDfgTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzypQLtX8xWcfWRcrRfRovJOv3AQFz5G8rbwWM0xqkF1FFd+6YB
	uVcZp0o92lX6WKs+ppxbvtI4TucCR8PwmKOJz7rgnuvT1v8Pxj1BreZ5lKdAl0s=
X-Gm-Gg: ASbGncum+tgilwPBddUfW4cBLdQdsP+Pyt4W+YB/TdVFL5LsCyWQI33YN6h4tSBb5Gq
	+aiJs9LY2HJQSI5hnZ/WM4U0/+fZlM5LH7v2U6mS5rgTYNb9hLu3DEBVX98GXKGmMOqQHrkE85J
	OdhdEJ6yDr9VK6r8McZcAytWZIKIXESYWNU8zLt+xeR81SwW19j1Y7n424R6JSBguCpC9xeflyM
	VH+1weSLzhX3d+ouOAMnohYFctJUfmJrFmoUw+XFS7FrutVl2QUIX9vOB9P9pXkzTUXjaNGONg1
	3QH7QsepZDnUJ3ERWu8ouiBS/ujmhDo9oo5ylGjIjV8BxRg=
X-Google-Smtp-Source: AGHT+IE+o7ppDy+FXGtXoyeveWQdsEzfsXfX/p3qd+EJn6Bpx+HDb20PNSdt8xs/rC2WUJQ8Ct171Q==
X-Received: by 2002:a17:902:ef10:b0:21f:1549:a563 with SMTP id d9443c01a7336-22be02deb9dmr19929885ad.2.1744275100482;
        Thu, 10 Apr 2025 01:51:40 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2601:640:8900:32c0::e120])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22ac7b8c7d9sm25237845ad.96.2025.04.10.01.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:51:39 -0700 (PDT)
Date: Thu, 10 Apr 2025 01:51:37 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <wagi@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250410085137.GE1868505-mkhalfella@purestorage.com>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>

On 2025-03-24 13:07:58 +0100, Daniel Wagner wrote:
> The TP4129 mendates that the failover should be delayed by CQT.  Thus when
> nvme_decide_disposition returns FAILOVER do not immediately re-queue it on
> the namespace level instead queue it on the ctrl's request_list and
> moved later to the namespace's requeue_list.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>  drivers/nvme/host/core.c      | 19 ++++++++++++++++
>  drivers/nvme/host/fc.c        |  4 ++++
>  drivers/nvme/host/multipath.c | 52 ++++++++++++++++++++++++++++++++++++++++---
>  drivers/nvme/host/nvme.h      | 15 +++++++++++++
>  drivers/nvme/host/rdma.c      |  2 ++
>  drivers/nvme/host/tcp.c       |  1 +
>  6 files changed, 90 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 135045528ea1c79eac0d6d47d5f7f05a7c98acc4..f3155c7735e75e06c4359c26db8931142c067e1d 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -239,6 +239,7 @@ static void nvme_do_delete_ctrl(struct nvme_ctrl *ctrl)
>  
>  	flush_work(&ctrl->reset_work);
>  	nvme_stop_ctrl(ctrl);
> +	nvme_flush_failover(ctrl);
>  	nvme_remove_namespaces(ctrl);
>  	ctrl->ops->delete_ctrl(ctrl);
>  	nvme_uninit_ctrl(ctrl);
> @@ -1310,6 +1311,19 @@ static void nvme_queue_keep_alive_work(struct nvme_ctrl *ctrl)
>  	queue_delayed_work(nvme_wq, &ctrl->ka_work, delay);
>  }
>  
> +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> +{
> +	unsigned long delay;
> +
> +	if (ctrl->cqt)
> +		delay = msecs_to_jiffies(ctrl->cqt);
> +	else
> +		delay = ctrl->kato * HZ;

I thought that delay = m * ctrl->kato + ctrl->cqt
where m = ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
no?

> +
> +	queue_delayed_work(nvme_wq, &ctrl->failover_work, delay);
> +}
> +EXPORT_SYMBOL_GPL(nvme_schedule_failover);
> +
>  static enum rq_end_io_ret nvme_keep_alive_end_io(struct request *rq,
>  						 blk_status_t status)
>  {
> @@ -1336,6 +1350,8 @@ static enum rq_end_io_ret nvme_keep_alive_end_io(struct request *rq,
>  		dev_err(ctrl->device,
>  			"failed nvme_keep_alive_end_io error=%d\n",
>  				status);
> +
> +		nvme_schedule_failover(ctrl);
>  		return RQ_END_IO_NONE;
>  	}
>  
> @@ -4716,6 +4732,7 @@ EXPORT_SYMBOL_GPL(nvme_remove_io_tag_set);
>  
>  void nvme_stop_ctrl(struct nvme_ctrl *ctrl)
>  {
> +	nvme_schedule_failover(ctrl);
>  	nvme_mpath_stop(ctrl);
>  	nvme_auth_stop(ctrl);
>  	nvme_stop_failfast_work(ctrl);
> @@ -4842,6 +4859,8 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
>  
>  	INIT_DELAYED_WORK(&ctrl->ka_work, nvme_keep_alive_work);
>  	INIT_DELAYED_WORK(&ctrl->failfast_work, nvme_failfast_work);
> +	INIT_DELAYED_WORK(&ctrl->failover_work, nvme_failover_work);
> +	INIT_LIST_HEAD(&ctrl->failover_list);
>  	memset(&ctrl->ka_cmd, 0, sizeof(ctrl->ka_cmd));
>  	ctrl->ka_cmd.common.opcode = nvme_admin_keep_alive;
>  	ctrl->ka_last_check_time = jiffies;
> diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
> index cdc1ba277a5c23ef1afd26e6911b082f3d12b215..bd897b29cd286008b781bbcb4230e08019da6b6b 100644
> --- a/drivers/nvme/host/fc.c
> +++ b/drivers/nvme/host/fc.c
> @@ -2553,6 +2553,8 @@ nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
>  {
>  	enum nvme_ctrl_state state = nvme_ctrl_state(&ctrl->ctrl);
>  
> +	nvme_schedule_failover(&ctrl->ctrl);
> +
>  	/*
>  	 * if an error (io timeout, etc) while (re)connecting, the remote
>  	 * port requested terminating of the association (disconnect_ls)
> @@ -3378,6 +3380,8 @@ nvme_fc_reset_ctrl_work(struct work_struct *work)
>  	/* will block will waiting for io to terminate */
>  	nvme_fc_delete_association(ctrl);
>  
> +	nvme_schedule_failover(&ctrl->ctrl);
> +
>  	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
>  		dev_err(ctrl->ctrl.device,
>  			"NVME-FC{%d}: error_recovery: Couldn't change state "
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index 2a7635565083046c575efe1793362ae10581defd..a14b055796b982df96609f53174a5d1334c1c0c4 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -86,9 +86,11 @@ void nvme_mpath_start_freeze(struct nvme_subsystem *subsys)
>  void nvme_failover_req(struct request *req)
>  {
>  	struct nvme_ns *ns = req->q->queuedata;
> +	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
>  	u16 status = nvme_req(req)->status & NVME_SCT_SC_MASK;
>  	unsigned long flags;
>  	struct bio *bio;
> +	enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
>  
>  	nvme_mpath_clear_current_path(ns);
>  
> @@ -121,9 +123,53 @@ void nvme_failover_req(struct request *req)
>  	blk_steal_bios(&ns->head->requeue_list, req);
>  	spin_unlock_irqrestore(&ns->head->requeue_lock, flags);
>  
> -	nvme_req(req)->status = 0;
> -	nvme_end_req(req);
> -	kblockd_schedule_work(&ns->head->requeue_work);
> +	spin_lock_irqsave(&ctrl->lock, flags);
> +	list_add_tail(&req->queuelist, &ctrl->failover_list);
> +	spin_unlock_irqrestore(&ctrl->lock, flags);

I see this is the only place where held requests are added to
failover_list.

- Will this hold admin requests in failover_list?

- What about requests that do not go through nvme_failover_req(), like
  passthrough requests, do we not want to hold these requests until it
  is safe for them to be retried?

- In case of controller reset or delete if nvme_disable_ctrl()
  successfully disables the controller, then we do not want to add
  canceled requests to failover_list, right? Does this implementation
  consider this case?

> +
> +	if (state == NVME_CTRL_DELETING) {
> +		/*
> +		 * request which fail over in the DELETING state were
> +		 * canceled and blk_mq_tagset_wait_completed_request will
> +		 * block until they have been proceed. Though
> +		 * nvme_failover_work is already stopped. Thus schedule
> +		 * a failover; it's still necessary to delay these commands
> +		 * by CQT.
> +		 */
> +		nvme_schedule_failover(ctrl);
> +	}
> +}
> +
> +void nvme_flush_failover(struct nvme_ctrl *ctrl)
> +{
> +	LIST_HEAD(failover_list);
> +	struct request *rq;
> +	bool kick = false;
> +
> +	spin_lock_irq(&ctrl->lock);
> +	list_splice_init(&ctrl->failover_list, &failover_list);
> +	spin_unlock_irq(&ctrl->lock);
> +
> +	while (!list_empty(&failover_list)) {
> +		rq = list_entry(failover_list.next,
> +				struct request, queuelist);
> +		list_del_init(&rq->queuelist);
> +
> +		nvme_req(rq)->status = 0;
> +		nvme_end_req(rq);
> +		kick = true;
> +	}
> +
> +	if (kick)
> +		nvme_kick_requeue_lists(ctrl);
> +}
> +
> +void nvme_failover_work(struct work_struct *work)
> +{
> +	struct nvme_ctrl *ctrl = container_of(to_delayed_work(work),
> +					struct nvme_ctrl, failover_work);
> +
> +	nvme_flush_failover(ctrl);
>  }
>  
>  void nvme_mpath_start_request(struct request *rq)
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 7563332b5b7b76fc6165ec8c6f2d144737d4fe85..10eb323bdaf139526959180c1e66ab4579bb145d 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -411,6 +411,9 @@ struct nvme_ctrl {
>  
>  	enum nvme_ctrl_type cntrltype;
>  	enum nvme_dctype dctype;
> +
> +	struct delayed_work failover_work;
> +	struct list_head failover_list;
>  };
>  
>  static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
> @@ -954,6 +957,9 @@ void nvme_mpath_wait_freeze(struct nvme_subsystem *subsys);
>  void nvme_mpath_start_freeze(struct nvme_subsystem *subsys);
>  void nvme_mpath_default_iopolicy(struct nvme_subsystem *subsys);
>  void nvme_failover_req(struct request *req);
> +void nvme_failover_work(struct work_struct *work);
> +void nvme_schedule_failover(struct nvme_ctrl *ctrl);
> +void nvme_flush_failover(struct nvme_ctrl *ctrl);
>  void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl);
>  int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,struct nvme_ns_head *head);
>  void nvme_mpath_add_disk(struct nvme_ns *ns, __le32 anagrpid);
> @@ -996,6 +1002,15 @@ static inline bool nvme_ctrl_use_ana(struct nvme_ctrl *ctrl)
>  static inline void nvme_failover_req(struct request *req)
>  {
>  }
> +static inline void nvme_failover_work(struct work_struct *work)
> +{
> +}
> +static inline void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> +{
> +}
> +static inline void nvme_flush_failover(struct nvme_ctrl *ctrl)
> +{
> +}
>  static inline void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl)
>  {
>  }
> diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
> index 86a2891d9bcc7a990cd214a7fe93fa5c55b292c7..9bee376f881b4c3ebe5502abf23a8e76829780ff 100644
> --- a/drivers/nvme/host/rdma.c
> +++ b/drivers/nvme/host/rdma.c
> @@ -1127,6 +1127,7 @@ static void nvme_rdma_error_recovery_work(struct work_struct *work)
>  
>  	nvme_stop_keep_alive(&ctrl->ctrl);
>  	flush_work(&ctrl->ctrl.async_event_work);
> +	nvme_schedule_failover(&ctrl->ctrl);
>  	nvme_rdma_teardown_io_queues(ctrl, false);
>  	nvme_unquiesce_io_queues(&ctrl->ctrl);
>  	nvme_rdma_teardown_admin_queue(ctrl, false);
> @@ -2153,6 +2154,7 @@ static const struct blk_mq_ops nvme_rdma_admin_mq_ops = {
>  
>  static void nvme_rdma_shutdown_ctrl(struct nvme_rdma_ctrl *ctrl, bool shutdown)
>  {
> +	nvme_schedule_failover(&ctrl->ctrl);
>  	nvme_rdma_teardown_io_queues(ctrl, shutdown);
>  	nvme_quiesce_admin_queue(&ctrl->ctrl);
>  	nvme_disable_ctrl(&ctrl->ctrl, shutdown);
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index d0023bcfd8a79a193adf2807a24481c8c164a174..3a6c1d3febaf233996e4dcf684793327b5d1412f 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -2345,6 +2345,7 @@ static void nvme_tcp_error_recovery_work(struct work_struct *work)
>  
>  	nvme_stop_keep_alive(ctrl);
>  	flush_work(&ctrl->async_event_work);
> +	nvme_schedule_failover(ctrl);
>  	nvme_tcp_teardown_io_queues(ctrl, false);
>  	/* unquiesce to fail fast pending requests */
>  	nvme_unquiesce_io_queues(ctrl);
> 
> -- 
> 2.48.1
> 
