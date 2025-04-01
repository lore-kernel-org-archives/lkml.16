Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50001581E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501934; cv=none; b=cnuIvVVzdRd6zuH0/5ruxiBE1arJFodcpptU+ShueMRFOHGIkIBoVpHID9Vm58F9WrMBtvNs9Z4iIBWIuwpv+qpSLdDKAnFNvqwVArfOuXenSdAK6XIjoktJhbDcvV+ee8r9wGNI4en9KYZcjrWxCa6bGEaZNIsYlAY3Tilhi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501934; c=relaxed/simple;
	bh=Ynlsx9uhf/hXaTXpPnrpiwevwNagDU+SDiU16bAop3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4psdn2EQyfzWr+tfTZyr/ZD2T/C62nHjzk6MWIxHl0XxUxUNrMw7H+FQE0rDxTG9tRMVXNIyQ2zvCem6qBcCfsOgTPqBJdE01is64zM7TDFo3MAx5qeiPBckr3+ZfDpfLmZWw4CHt67hLqquseCr5pWfAMcpFsX5xmVYd3EAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K/WfFVZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K/WfFVZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08429C4CEE4;
	Tue,  1 Apr 2025 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743501933;
	bh=Ynlsx9uhf/hXaTXpPnrpiwevwNagDU+SDiU16bAop3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/WfFVZFCBsAGe0FcaT048mnzkKJulCigUDKPztsDlXEewvATa4aPAitr/abBEDKn
	 lODjzU9kiI0pEcuEpOiiyxACdjF34AetaNyZPKIVlhmCjaXCHbgPFfnlQCyZ5zmVp6
	 gsGmE47AZWr3VhOY1CdMpNw846CrkCwBmizbF4Mg=
Date: Tue, 1 Apr 2025 11:04:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: krzk@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uio: uio_fsl_elbc_gpcm: Add NULL check in the
 uio_fsl_elbc_gpcm_probe()
Message-ID: <2025040156-preoccupy-eardrum-b7d1@gregkh>
References: <0b99b7e5-a035-4a15-8389-dcb3ca81f96d@kernel.org>
 <20250401100240.24439-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401100240.24439-1-bsdhenrymartin@gmail.com>

On Tue, Apr 01, 2025 at 06:02:40PM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> uio_fsl_elbc_gpcm_probe() does not check for this case, which results in
> a NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue and ensuring
> no resources are left allocated.
> 
> Fixes: d57801c45f53 ("uio: uio_fsl_elbc_gpcm: use device-managed allocators")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Remove printk after memory failure and add proper resource
> cleanup.
> 
>  drivers/uio/uio_fsl_elbc_gpcm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
> index 81454c3e2484..26be556d956c 100644
> --- a/drivers/uio/uio_fsl_elbc_gpcm.c
> +++ b/drivers/uio/uio_fsl_elbc_gpcm.c
> @@ -384,6 +384,10 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
>  
>  	/* set all UIO data */
>  	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
> +	if (!info->mem[0].name) {
> +		ret = -ENOMEM;
> +		goto out_err3;
> +	}
>  	info->mem[0].addr = res.start;
>  	info->mem[0].size = resource_size(&res);
>  	info->mem[0].memtype = UIO_MEM_PHYS;
> @@ -423,6 +427,7 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
>  out_err2:
>  	if (priv->shutdown)
>  		priv->shutdown(info, true);
> +out_err3:
>  	iounmap(info->mem[0].internal_addr);
>  	return ret;
>  }
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
