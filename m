Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0314885B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763008; cv=none; b=fV3EkjZTu8vvHxtrwLaaY7Hfa7XzjAmyAG2epA/1KzFmqwYMOy93Vt2y7585hI9FNHgwJfK+cG65w7K2HEQFVbMtCmqhSOerQTPvLi0O8wDwWZ31xKKpMSqNFsa8iFmDTDfFQGX+tG+tYplol9aUBldfr4udfgcQub68n1Xjq1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763008; c=relaxed/simple;
	bh=KoRUD2b4yEccDIQmXJbcCwhNzM3xxAp0Sf7zTuyBIGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEF+v48LIgzo0ymuFIv/siUkCWVEjQQUH0FC0pcZlmPL7dnLpY6X33TItx4HD2c0gj0rL513yMX7Z6gQqA2MnOKoV1In7GQjUxIgBTtm9/ENbRyNHRx5chGM5eWUF8VQYiw763305CtNlD55+qjrqpNE2iY9BWDDiaXbjwVcP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=L0y/evVy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="L0y/evVy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224171d6826so87107475ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744763006; x=1745367806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw0pUso11WucIlqdtormnEIGUdCPzU4SSaBeRiqQKmE=;
        b=L0y/evVybmSGolSCcXu5t95MoG6XD9OjaG8/iaCJfNHCXk8Qc2dP+9kJwf4HW2QzUq
         DFBRnNlmuX73Km8Sez6ZOpwVm1SdgPG2lyTqgeUD/hFzPmWOMA0zomnOu5ovlkekY7x+
         JPmR+RM5+TGdqBp4nYQzQU4/35EHnUVu3BB+R4uLfiIAvGz3pTgcFYkzQPTJXhIcYg8w
         LU1L0gAml4x/a4Bc3mlk9nECoVWGxHUe5HrpwWcL+zsf2v9bqTSAkejtPrRfw3qhopGm
         aPUIVTCdJgzWDH3qb1LMDO8EqML/w95EVEPugOQVof+GMBDs9P1D/JiWydcpGYo4IUkB
         ZOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744763006; x=1745367806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw0pUso11WucIlqdtormnEIGUdCPzU4SSaBeRiqQKmE=;
        b=Yp8PKEUnLQCVlqQ5Hp6W6Vs2dBE/U00m9q2jAsPYPJs9XnFH2jSjNMJqQIGFWmPppF
         6k4Gcs4Cvn54d6Zup2Ar09q3dgq/rD6OmnY4sH7eOprIwvLlPxs8XVNoEZprSmC7V768
         Xlv2DdUSPxmg4JznAfp4prmpgfXoXCay2XXuaIAB3ZrUNoTPiX6kcxD9pHsEq/v/zT9z
         enbAuavevZD4/hOriA+DoUHzQ32TTxcSdNZxxwzsed0NOW8FSyAtKE5o0gGYOvqyvYvV
         8shcxcv6Lz7Kj1dGi5XugmiqcJaE1720m0VyQ99XKp7cFkjGEhjyFViF466Uv8fKyF7D
         TKTA==
X-Forwarded-Encrypted: i=1; AJvYcCXKp+n6Z/44/A0X33xAE7cTF/pcnbLUaQgtld+prt3LqYAWAH4gaRdLsQNVSZLPtBjjHK30T4U97A8GQFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFdYbvxQI5sPKDeBr5Y0U4syuzygpDEqOQRnMhj2LGShuBLvz
	/KZC2mfGaklDXmPwbmlqpAHCKKZaBnCmZ8WGirGTNv4Q4NEH1N3ieoLF1W0LeoIaykgaNfX5o4T
	3
X-Gm-Gg: ASbGnctxZBhzAz7kr/vpyvXIzoSPUsoghqB0ODpiszVyi1DxyIeE1z8OLS45Mw0QGYE
	2vFVfim0ST1uZ/sL/0ifWhFLFTv1fRgBHlwkbmJwhJpisCfYLQJVxkc73KttwcZe0U3OkXLs4bB
	lu7Mm4eBfi71+H7ub3eGpugAOzirXuLbTj2waaekfaPCJ7lJ3PL9Ir5geW2bSXPxSYq0nzfbFGx
	Q1cT6nOl09xxe8S22paSoY6Kd9MLoyx/4TwyMyrVYqMxbCdEwQFCZn3Nomf708LnAUC4gjj2L4s
	q4lcuMI2i4JcIEyyaELn18yjV+VoOMIuUvO7azybVRO6drNjvXcProBoz1b5LA==
X-Google-Smtp-Source: AGHT+IGJeuMbV3k0jW0loSUVH+gLC2S4UZu8cTZSGuHwWDNvXgkQSKSyUr1KJ9g5nRzZz+sWuGPBcQ==
X-Received: by 2002:a17:903:2a83:b0:229:1717:8812 with SMTP id d9443c01a7336-22c316d894dmr19110515ad.0.1744763005749;
        Tue, 15 Apr 2025 17:23:25 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22c33fe7289sm1417125ad.244.2025.04.15.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:23:25 -0700 (PDT)
Date: Tue, 15 Apr 2025 17:23:24 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <wagi@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250416002324.GB78596-mkhalfella@purestorage.com>
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
> +

In case the delay in nvme_schedule_failover() is larget than request
timeout, is it possible for timeout callback to be called while a
request is sitting in failover_list?

Is there any guarantee to prevent this from happening? I understand from
the patch that we do not want this to happen, right?
