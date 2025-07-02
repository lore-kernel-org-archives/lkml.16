Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878917A316
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422723; cv=none; b=EAb/63PWPnqLKky86mQ0zxFmeuNxVGKgjvyG2qNMZuvwI5sa4H+BD2pGDHEbXcwrnQlJZLJWl3t6NTVGZfGDwO65agsKtPecn7RNvB9n9yLL03T2/QPTQfhOeLOWUgeiCcFKHLi/hvehAzlUEh8kCcWJORMmXVJaKrEbnF5BkAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422723; c=relaxed/simple;
	bh=yDb7K2gWpOa8KbXyqMKhSrGKILO4NsmhbZBvRWQl2fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jujg4f8iELOTWU8Af7cYJU3RX/ZVTso5Sgmo2DWLSer7qcZ3KFFDGhTl/Zs7sr7x8kwBYAI8Sn7fVh49t4reLEXB/EViZZqCVlGijnhG6kUsaoQOTZMLrzOkezj3cJp/q2fkLWQaNTrGwZGBHiGw8oORp9AsCCoQT2LqhPEoof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUbUMpBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUbUMpBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0664EC4CEEB;
	Wed,  2 Jul 2025 02:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751422723;
	bh=yDb7K2gWpOa8KbXyqMKhSrGKILO4NsmhbZBvRWQl2fU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uUbUMpBi8YExPPZvUnhUsHAq1g5uNn1AN3ccgX58eLft8DPH7zNDv4qdSZkJycdtj
	 Wnev/En6RxkwfYNK6Y5Pj+/9eGDsAXyHoruKm1NP1V09p2SsST4rFZEJQkZ7ExaQdt
	 7GXpOBw853+tuQXbcmjEjWuKlCzuYVh8qX6vy/oo2/BgHgraoSnBvVGCLS8//Wo/IX
	 LFypRahZjb48qVPp3eILrEbsbrQidqoQ35c5nqQqQ0qvbFE0whO6Hygfjc/HT44wXE
	 VSz5tHgBJUDhCRZe/Obws/aLx+qzpyZFi5m7COV/JARftg6oZ+pGJfn4fL4P1xb2kn
	 5h9ORtj5oMoEg==
Message-ID: <c168acff-66ff-4692-b21e-093c0aa592a1@kernel.org>
Date: Wed, 2 Jul 2025 11:18:40 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nvme: prevent ioq creation for discovery
 controllers
To: Kamaljit Singh <kamaljit.singh1@wdc.com>, kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: cassel@kernel.org
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-4-kamaljit.singh1@wdc.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250702005830.889217-4-kamaljit.singh1@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 09:58, Kamaljit Singh wrote:
> Prevent ioq creation for discovery-controllers as the spec prohibits
> them, similarly to the administrative controllers.
> 
> Reference: NVMe Base rev 2.2, sec 3.1.3.4, fig 28.
> 
> Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
> ---
>  drivers/nvme/host/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index c310634e75f3..3ad3b1da8b34 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -3155,12 +3155,12 @@ static inline bool nvme_admin_ctrl(struct nvme_ctrl *ctrl)
>  }
>  
>  /*
> - * An admin controller has one admin queue, but no I/O queues.
> + * An admin or discovery controller has one admin queue, but no I/O queues.
>   * Override queue_count so it only creates an admin queue.
>   */
>  void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl)
>  {
> -	if (nvme_admin_ctrl(ctrl))
> +	if (nvme_admin_ctrl(ctrl) || nvme_discovery_ctrl(ctrl))
>  		ctrl->queue_count = 1;
>  }
>  EXPORT_SYMBOL_GPL(nvme_override_prohibited_io_queues);

Repeating comment on patch 1. Can't we do this in nvme_init_subsystem() or may
be better, in nvme_set_queue_count() or nvme_init_ctrl_finish() ?


-- 
Damien Le Moal
Western Digital Research
