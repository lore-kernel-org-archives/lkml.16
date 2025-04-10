Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6A281358
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285978; cv=none; b=VuprxLCaenSYx0pvAbsZFt4fEfWfAu3RxZ/YlQTQifCfcxS891wcTDE4pEFGGkdxMPZBUU3QJiUw+9T6XtsAlgEqqTjgLM0oq+3R0Pqs9lIBm+ioDA2bpV6Y0/MjMLWMPMag8pKe9fHXcwtMaNwWTFfsbdfecrE1lnhFIgDl/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285978; c=relaxed/simple;
	bh=s3csa4H8M9KRAkSXicPip+/546cC5E+ESes5kJTkiJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmn6R4dEIuBOZEwQk4hQxKiTvh5hprcFL1pV6rVJhbjS6RrjUEfQ4R236Hv62MRTGy4jjfNS4jf5mAP25hJhLNRJZqS1QPOLGwXQvjkF3Ee8EmcsCMxXo3bE64TYPOLkhqJI+rFocBOOBOvDLOzOvbrIQ44LYnrUp+u1tyCpHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=So0nvDf7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="So0nvDf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC51DC4CEDD;
	Thu, 10 Apr 2025 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744285978;
	bh=s3csa4H8M9KRAkSXicPip+/546cC5E+ESes5kJTkiJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=So0nvDf7aJT4pu4A7zUuKBfymJRpNxyJ6S+kxrpHAaNVISyW/zbLr+EK1n777xJUH
	 S+B4Y2hKIP3Uli6M66JIGAONusDGUQRyUf7ePuAdmEzT39Ll7Dj0ww1xYXKqy0i7ii
	 YYq3DRwNguS6wMFcNfHNHiVWLRTxT1l1cDUz4J7E=
Date: Thu, 10 Apr 2025 13:51:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: arnd@arndb.de, jpanis@baylibre.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] misc: tps6594-pfsm: Add NULL check in
 tps6594_pfsm_probe
Message-ID: <2025041010-bundle-thrive-c32f@gregkh>
References: <20250410113911.80495-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410113911.80495-1-hanchunchao@inspur.com>

On Thu, Apr 10, 2025 at 07:39:11PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in tps6594_pfsm_probe() is not checked.
> Add NULL check in tps6594_pfsm_probe(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/misc/tps6594-pfsm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
> index 0a24ce44cc37..6db1c9d48f8f 100644
> --- a/drivers/misc/tps6594-pfsm.c
> +++ b/drivers/misc/tps6594-pfsm.c
> @@ -281,6 +281,9 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
>  	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
>  	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
>  					    tps->chip_id, tps->reg);
> +	if (!pfsm->miscdev.name)
> +		return -ENOMEM;
> +
>  	pfsm->miscdev.fops = &tps6594_pfsm_fops;
>  	pfsm->miscdev.parent = dev->parent;
>  	pfsm->chip_id = tps->chip_id;
> -- 
> 2.43.0
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

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
