Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70421EDA0C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743199755; cv=none; b=HGfOQX+4oZYdxDFXv/IZkK7GhmqBszUL4caclthK0cRVVzUUSU+HALEPdP/TCEtPgkf9zjORuo2BZ3YFnppR3URd88UXsu9b1fD4Uznb31HyiAEK7dKpegB3aHxlMIHnzyv0nWZCSdlofk2XSv5hmLGMJkuGyHk+jCTdSzvVinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743199755; c=relaxed/simple;
	bh=mahYWJ6R0qCvefG1hqhEtP/t/af8s4f/zTpIh0cvmdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/UCG1niEI6Xu1dcPQhMmWXzcwtfFpiec9EFZaN86gjSgoKe9Q185e7AblwBVTVa6yXbq3RCbhp5yg6bjD6goSy43ARw+LZ+FClFzx+LrkBDiMJXpR2pEJLZYUd7825CaJNdJxUQBwtjBoUiYtjdoqFCv2r8HIW+F4FtzUerdM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpCpF8Z6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpCpF8Z6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15700C4CEE4;
	Fri, 28 Mar 2025 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743199754;
	bh=mahYWJ6R0qCvefG1hqhEtP/t/af8s4f/zTpIh0cvmdQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NpCpF8Z6mt7TcuyUYAqBOOOtsY0trtsyBvhLLk7ZKpv7iwVzec2qqi+jiXkeeemzl
	 MOY3qVWyIROMeQmMiy2X7Ke/K6YAUdhnblebVUmzuH7LXBYw5lL4cH1UFS83cBt9fq
	 enIpn/tfuNP78XtdG9naa1zYwu9XbcwtyRYipMZzIlXhc1Dt7fk8JQ3z/dUU4fbS9R
	 rel2vorMceYHfUtfInYZiYqyw8x+ZMoBNVU14gXIo9edT0m/m+gsi27ljpF9gDF4p7
	 6lDgWs4nqpcYsYpTB4N/zQ+N3emzxrG14NkxVW9G9q7hfPDb/t87GFjfwh290eHFVB
	 7zVnzw1M5xl/Q==
Message-ID: <ca53c3a8-8af2-4e34-b0e6-3571cbec4bee@kernel.org>
Date: Fri, 28 Mar 2025 15:09:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
To: Kamaljit Singh <kamaljit.singh1@wdc.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, "axboe@kernel.dk"
 <axboe@kernel.dk>, hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
 <20250328213640.798910-2-kamaljit.singh1@wdc.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250328213640.798910-2-kamaljit.singh1@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/03/28 14:36, Kamaljit Singh wrote:
> Added capability to connect to an administrative controller by

s/Added/Add

> preventing ioq creation for admin-controllers. Also prevent ioq creation
> for discovery-controllers as the spec prohibits them.

This second part should be a different (preparatory) patch.

> 
> * Added nvme_admin_ctrl() to check for an administrative controller

s/Added/Add
And this should be a different preparatory patch.

> 
> * Renamed nvme_discovery_ctrl() to nvmf_discovery_ctrl() as discovery is
>   more relevant to fabrics

I do not think that is necessary since this is testing the controller type,
which may be limited to fabrics or not.

> * Similar to a discovery ctrl, prevent an admin-ctrl from getting a
>   smart log (LID=2). LID 2 is optional for admin controllers but in the
>   future when we add support for the newly added LID=0 (supported log
>   pages), we can make GLP accesses smarter by basing such calls on
>   response from LID=0 reads.
> 
> Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>

[...]

> @@ -2863,13 +2858,19 @@ static int nvme_init_subsystem(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
>  	else
>  		subsys->subtype = NVME_NQN_NVME;
>  
> -	if (nvme_discovery_ctrl(ctrl) && subsys->subtype != NVME_NQN_DISC) {
> +	if (nvmf_discovery_ctrl(ctrl) && subsys->subtype != NVME_NQN_DISC) {
>  		dev_err(ctrl->device,
>  			"Subsystem %s is not a discovery controller",
>  			subsys->subnqn);
>  		kfree(subsys);
>  		return -EINVAL;
>  	}
> +	if (nvme_admin_ctrl(ctrl)) {
> +		dev_info(ctrl->device,
> +			"Subsystem %s is an administrative controller",
> +			subsys->subnqn);
> +	}

Is this really necessary ? In any case, please remove the curly brackets.

[...]

> diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
> index 299e3c19df9d..0f3150411bd5 100644
> --- a/drivers/nvme/host/rdma.c
> +++ b/drivers/nvme/host/rdma.c
> @@ -1030,6 +1030,17 @@ static int nvme_rdma_setup_ctrl(struct nvme_rdma_ctrl *ctrl, bool new)
>  		goto destroy_admin;
>  	}
>  
> +	/* An admin or discovery controller has one admin queue, but no I/O queues */
> +	if (nvme_admin_ctrl(&ctrl->ctrl) || nvmf_discovery_ctrl(&ctrl->ctrl)) {
> +		ctrl->ctrl.queue_count = 1;
> +	} else if (ctrl->ctrl.queue_count < 2) {
> +		/* I/O controller with no I/O queues is not allowed */
> +		ret = -EOPNOTSUPP;
> +		dev_err(ctrl->ctrl.device,
> +			"I/O controller doesn't allow zero I/O queues!\n");
> +		goto destroy_admin;
> +	}

This is identical to the change for tcp, so maybe make this a helper function ?

> +
>  	if (ctrl->ctrl.opts->queue_size > ctrl->ctrl.sqsize + 1) {
>  		dev_warn(ctrl->ctrl.device,
>  			"queue_size %zu > ctrl sqsize %u, clamping down\n",
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 644f84284b6f..3fe2f617bfd5 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -2199,6 +2199,17 @@ static int nvme_tcp_setup_ctrl(struct nvme_ctrl *ctrl, bool new)
>  		goto destroy_admin;
>  	}
>  
> +	/* An admin or discovery controller has one admin queue, but no I/O queues */
> +	if (nvme_admin_ctrl(ctrl) || nvmf_discovery_ctrl(ctrl)) {
> +		ctrl->queue_count = 1;
> +	} else if (ctrl->queue_count < 2) {
> +		/* I/O controller with no I/O queues is not allowed */
> +		ret = -EOPNOTSUPP;
> +		dev_err(ctrl->device,
> +			"I/O controller doesn't allow zero I/O queues!\n");
> +		goto destroy_admin;
> +	}
> +
>  	if (opts->queue_size > ctrl->sqsize + 1)
>  		dev_warn(ctrl->device,
>  			"queue_size %zu > ctrl sqsize %u, clamping down\n",

-- 
Damien Le Moal
Western Digital Research

