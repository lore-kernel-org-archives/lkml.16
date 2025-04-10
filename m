Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D21F0E39
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285911; cv=none; b=TWwG0dk6NdVHNGPbyBWFM5ycsZ2VBjVQKzHxjIYv0oknUiEXVXal7AL0jNIxNwbkKaNzjaJ0fRYgc+cee/rzvmcB6vSi8D/khvNqzbZ/BSU4+lUff+ONVAC2qvBlqV2hpCoval8iZxtflO6bZYFpD/thxcRvVXcoKxmGH0QiGa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285911; c=relaxed/simple;
	bh=9fnYVyJmiHU1RU3MCP32Uuu1TPM9x54U015iQwykPqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuKs9rpmUqC5o2CUKTJgD9xkC9J+88QRrskmU9gPxZ+4zhK0UjLzsF9ciHChRNsH5+gSFcBInQSUcn9HGdmxj4pSZ0VEKy1unt/WUnbnwVjqD+une6mz23D/1wFncDX3P9BUkrPr4e/Z0pJPyRapR/Gjku9jlkj4Y6N3H1ooAUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ks+oHZOQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ks+oHZOQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A52C4CEDD;
	Thu, 10 Apr 2025 11:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744285910;
	bh=9fnYVyJmiHU1RU3MCP32Uuu1TPM9x54U015iQwykPqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ks+oHZOQVvgOzCyFX9aETvfopadMGvxAZ5BWwxEB5+qa0IVkakDfdBn6XbGpv2GNL
	 IiOBAvOy/u0Wifx/mNaDZhxEXwEf5BILnyz/2FnQweJAMO5IDytIctTugnXIQGuhBz
	 SOB4PdeVuc4kUon80Lxfyjo/3ADuw1donjhjV8JY=
Date: Thu, 10 Apr 2025 13:50:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Han <hanchunchao@inspur.com>
Cc: arnd@arndb.de, jpanis@baylibre.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: tps6594-pfsm: Add NULL check in tps6594_pfsm_probe
Message-ID: <2025041008-frying-widely-d542@gregkh>
References: <20250410105256.70310-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410105256.70310-1-hanchunchao@inspur.com>

On Thu, Apr 10, 2025 at 06:52:53PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in tps6594_pfsm_probe() is not checked.
> Add NULL check in tps6594_pfsm_probe(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/misc/tps6594-pfsm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
> index 0a24ce44cc37..05c4e081a8d2 100644
> --- a/drivers/misc/tps6594-pfsm.c
> +++ b/drivers/misc/tps6594-pfsm.c
> @@ -281,6 +281,11 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
>  	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
>  	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
>  					    tps->chip_id, tps->reg);
> +	if (!pfsm->miscdev.name) {
> +		devm_kfree(dev, pfsm);
> +		return -ENOMEM;
> +	}
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
