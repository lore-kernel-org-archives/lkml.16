Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1B1B0411
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745470440; cv=none; b=iZ0Hh9tqftONb48wCZMZVM8PgHVn4K3n4rpzkMfiTduNmIIiSYS4sBnH1wPWj3RyR2BoCA0kQLjkXbkbhu9cfVwz85Y3/l5jgqoOjgpfYmPrhzxuNt1nbnBf/2m384YVLfxCLpzvKasER7EAL+EkcF/4YIg68SfqUXiAwhiOZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745470440; c=relaxed/simple;
	bh=aqL8oy1dZO1p2ooSSvW4m9NRoCmjZRfqHI2gMzOSpsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NREkt3EM0ycDL20qKoUAsyaFAa7K9dEnE4PKTmTIp2meHbm/+5hz7H+ycvtSHZStxvbMPxiPMmKU+GcnAB3bbyGLCwp+HHx7YFYAKegr7JVQ+b8A2Ml1JH23kSQpC1Dl22uxdI/FtFBzhDotuWk5v0f1SJOfv4+7PaX6l7FT1jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bq10276q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq10276q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3D8C4CEEA;
	Thu, 24 Apr 2025 04:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745470440;
	bh=aqL8oy1dZO1p2ooSSvW4m9NRoCmjZRfqHI2gMzOSpsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bq10276q4yPHQIoSOJQQDhQEr7eNBwLoxTdnakse68Gu4FIanx5kXy+N0s+ohkLTJ
	 3U4dgEzGiUXERrk9XBIFAmQGfkq8NoC7X9CLYYQkAW+9StT6L/thAZMUko8X5aNeUc
	 G8/AH47xxspTDKSjOQxWZO8dVCHJ+YLhzO9ZildTncoHlNH92Q9cX4ax/HGWdYDAt1
	 nyne5VTVpkoeNV7r8VoWwW2B4+eHwd5km8tyZpsL4ivN9kFkNhwiS0Dk6ckBJOQ7jN
	 34xpAtzrHk827v0MtU/+bQhlEWtn0i8LslwDDd/k3rVJWXFbh22iFQYpg/AuRflDGs
	 z8eaPQ6sbjobg==
Date: Thu, 24 Apr 2025 10:23:55 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: optee: smc: remove unnecessary NULL check before
 release_firmware()
Message-ID: <aAnD4_WXl8gE2bGv@sumit-X1>
References: <20250410075635.3558712-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410075635.3558712-1-nichen@iscas.ac.cn>

On Thu, Apr 10, 2025 at 03:56:35PM +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/tee/optee/smc_abi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..26f8f7bbbe56 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1551,8 +1551,7 @@ static int optee_load_fw(struct platform_device *pdev,
>  		  data_pa_high, data_pa_low, 0, 0, 0, &res);
>  	if (!rc)
>  		rc = res.a0;
> -	if (fw)
> -		release_firmware(fw);
> +	release_firmware(fw);
>  	kfree(data_buf);
>  
>  	if (!rc) {
> -- 
> 2.25.1
> 
