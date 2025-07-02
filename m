Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D826AFB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422298; cv=none; b=pmPTP0TN445fW/m3emg4oSJRuGj7WfGKdLo5vp+rOtGzz57EQDwmr010xc2jwCGNB2JWEiBpPeEYZnAqArwwNgIGXselcGvdYNiFwzPBf4TxSQtRm3wBjdkEzeL2uC6I0SKjKd2hx8TopMpnnO7ie0SBjdaVcxmDWrPi2zsYktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422298; c=relaxed/simple;
	bh=ZxpM08Bm9vTyHYsL4UkOghyZQdZk96l4oAe+fmDSvVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6+LqycU09IdrbyRz07lVLWZi5wPZXgwCWifo2nLZlfnu3lENnmAyCKFRWqCqZ/41kjMzFP4Ndts63UcOxkTxxXMY5sX1LQ6PHHmRs+fCeX9uHBQ6LdJ7/046wpTZHoD1CN9qyFFULE43NpiJ2tiZWwmMt3+Zpc2n0cP6KMOFw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvlZUjca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvlZUjca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752FAC4CEEB;
	Wed,  2 Jul 2025 02:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751422297;
	bh=ZxpM08Bm9vTyHYsL4UkOghyZQdZk96l4oAe+fmDSvVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HvlZUjcare6+dM2Ep+4iNdig/DyZTKDhF+0jHyBdJKZNiHvt/uh/+tltl61kRoIot
	 3dfQ0z2ivrdAhWt7Z9h7sAcRrTmrRUEjeqHveCiAHOVC6ERbCy/+0/6SGcNO3hWC4g
	 Auy4FVam0fTXHejp+0AehKz5OXJwFVnz9YCydgzZ3et70SdyVrNm1ZUv8TJh/y1J1w
	 ygVv8uhnHbuwlK5y66T61yV4NUhQ6BWkOYBnwPCCM8veUIW9n+5mD/wAVYWSgp2gVP
	 aoJ78wjRQrSwpWnffXHS1eISxlnnVxgl5ttxWmWncG7sjMLZF/vUEUvh6whqlipnkG
	 nvZuBoSUFc/zg==
Message-ID: <22f8ec86-2d50-4237-9313-79bfc93c8e3d@kernel.org>
Date: Wed, 2 Jul 2025 11:11:35 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] nvme: add capability to connect to an admin
 controller
To: Kamaljit Singh <kamaljit.singh1@wdc.com>, kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: cassel@kernel.org
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-2-kamaljit.singh1@wdc.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250702005830.889217-2-kamaljit.singh1@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 09:58, Kamaljit Singh wrote:
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> 
> Add capability to connect to an administrative controller by
> preventing ioq creation for admin-controllers.
> 
> * Add helper nvme_admin_ctrl() to check for an administrative controller
> * Add helper nvme_override_prohibited_io_queues() to override
>   queue_count in nvme_ctrl
> 
> Reference: NVMe Base rev 2.2, sec 3.1.3.4, fig 28.
> 
> Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
> ---
>  drivers/nvme/host/core.c | 21 +++++++++++++++++++++
>  drivers/nvme/host/nvme.h |  1 +
>  drivers/nvme/host/rdma.c |  2 ++
>  drivers/nvme/host/tcp.c  |  2 ++
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index e533d791955d..a1155fb8d5be 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -3149,6 +3149,22 @@ static inline bool nvme_discovery_ctrl(struct nvme_ctrl *ctrl)
>  	return ctrl->opts && ctrl->opts->discovery_nqn;
>  }
>  
> +static inline bool nvme_admin_ctrl(struct nvme_ctrl *ctrl)
> +{
> +	return (ctrl->cntrltype == NVME_CTRL_ADMIN);

No need for the parenthesis.

> +}
> +
> +/*
> + * An admin controller has one admin queue, but no I/O queues.
> + * Override queue_count so it only creates an admin queue.
> + */
> +void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl)
> +{
> +	if (nvme_admin_ctrl(ctrl))
> +		ctrl->queue_count = 1;
> +}
> +EXPORT_SYMBOL_GPL(nvme_override_prohibited_io_queues);

Why not have this done in nvme_init_subsystem() ? That would avoid needing to
call this in all fabrics drivers.

> +
>  static bool nvme_validate_cntlid(struct nvme_subsystem *subsys,
>  		struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
>  {
> @@ -3215,6 +3231,11 @@ static int nvme_init_subsystem(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
>  		kfree(subsys);
>  		return -EINVAL;
>  	}
> +	if (nvme_admin_ctrl(ctrl))
> +		dev_info(ctrl->device,
> +			"Subsystem %s is an administrative controller",
> +			subsys->subnqn);

We do not print an equivalent message for other subsystem controller types. So
drop this.

> +
>  	nvme_mpath_default_iopolicy(subsys);
>  
>  	subsys->dev.class = &nvme_subsys_class;


-- 
Damien Le Moal
Western Digital Research
