Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197AB13B590
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422433; cv=none; b=h5QztY78OxKm/5/nScOgCQuOZLjVVXChvBW+nUN+qYSGNuLJ3DSO2e+58BUmyGDISP6BBtoV/3F0oMqW/ANEIqmjWvC/HeRF7OO5UEhPiVaaxbwNSXeJmWLGiTvJ75f3YRyAGetSQD+i2xUav6wxlEBJUA48tvK3TmMVt343g7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422433; c=relaxed/simple;
	bh=rqDOKEqDtU4wDif/XftU7uJJKvo8fG5j53uQf5R1kHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HsCwvRempkonOw2kPhWqqYSeU2zlF7lPMGPfQrEtui6GvmgJlhSQ7LCPMrTs9ufxSZ9o/RceDUV5hLg+e2kInjd0fomJFxOY2y9swOTkUxU6t/hpPTSWcBHvrXXW6knZeAhii1LjLd+HlVzQV4i3t388/wftOSXuZK6H/UH7ZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXtjtqAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXtjtqAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2550AC4CEEB;
	Wed,  2 Jul 2025 02:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751422432;
	bh=rqDOKEqDtU4wDif/XftU7uJJKvo8fG5j53uQf5R1kHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZXtjtqAe3PGWiGweYVTnUrfSvcEurYq8KKFdpjR8uJGJmaul4cRJPmL770ouAytJE
	 BEnWSg/2xFDJc3rvVfcQg9DuI9qWDloVPZx7fzUC2APkz6/kr3gPWT73O0YrUxu8MX
	 HER4JvjnMtfawHYtk8VxbPwWy9CP+5phHhowNI8auabBs68usJ5RrZ3eU1R1bcK9lO
	 MwUR1N1yJ2yPUxGP/NpXiz2DwqvF4Ua0wG4eLHdM1bjSA1x3ZOgHj2I2SqfA1+/n6l
	 yCzaYry5ebIRbnWR8SjNsYx/tOwLs+DCFZM0xSdq3LJjQfv+0Hmvmd528ras8JGjOG
	 kSO8/Gbk+WFJA==
Message-ID: <36499d5b-4203-432a-a822-95b6d20d458f@kernel.org>
Date: Wed, 2 Jul 2025 11:13:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nvme: prevent admin controller from smart log
 fetch (LID 2)
To: Kamaljit Singh <kamaljit.singh1@wdc.com>, kbusch@kernel.org,
 axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: cassel@kernel.org
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-3-kamaljit.singh1@wdc.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250702005830.889217-3-kamaljit.singh1@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 09:58, Kamaljit Singh wrote:
> Similar to a discovery ctrl, prevent an admin-ctrl from getting a smart
> log. LID 2 is optional for admin controllers to support.

If it is optional, when the admin controller support it, why prevent it ?
This is what your code does... Or is it that at this stage of the
initialization, you do not know yet if the admin controller supports LTD 2 ?

> 
> In the future when support for the newly added LID=0 (supported log
> pages) is added, GLP accesses can be made smarter by basing such calls
> on response from LID=0 reads.
> 
> Reference: NVMe Base rev 2.2, sec 3.1.3.5, fig 31.
> 
> Signed-off-by: Kamaljit Singh <kamaljit.singh1@wdc.com>
> ---
>  drivers/nvme/host/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index a1155fb8d5be..c310634e75f3 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -3705,7 +3705,7 @@ int nvme_init_ctrl_finish(struct nvme_ctrl *ctrl, bool was_suspended)
>  
>  	nvme_configure_opal(ctrl, was_suspended);
>  
> -	if (!ctrl->identified && !nvme_discovery_ctrl(ctrl)) {
> +	if (!ctrl->identified && !nvme_discovery_ctrl(ctrl) && !nvme_admin_ctrl(ctrl)) {
>  		/*
>  		 * Do not return errors unless we are in a controller reset,
>  		 * the controller works perfectly fine without hwmon.


-- 
Damien Le Moal
Western Digital Research
