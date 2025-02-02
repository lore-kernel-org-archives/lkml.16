Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC12BD11
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738524995; cv=none; b=uiddMx7qcdcg3WNVLrdM/lpkW00hjVbKjdx29mrymOywc4dE/72lBjqJV4KmSNXX1Ena/DwV6W5+CbjiWh/lWpC/3TY7HaUT6r48wQj/We6WbIdD5v2GhhtRhIZEQKelq5QwQJ3MZxESocNPgbOFRoVBipiku5VnOZkiTmJ/r3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738524995; c=relaxed/simple;
	bh=vpOsiCRX7bgZiiNhyXbFnqDnnV+YSjKZ3cL/A3byv/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhIKhfYDJyS/CUbCi2tmHxAGVgkh1Eisr2fqBDUlD88o0B6a67FLq9SPmvN59ZVpRVj9PHZDAMYPPiU83udkvBUhDO/cIaK8Q2pNGFYTSFD+m2/nZiggd9u22iLLYIJ5kzix3nd1pal9gLLv5E3ndJyUNbztxyu3vVP0lvnC7gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kJyi3L+D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kJyi3L+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFD6C4CED1;
	Sun,  2 Feb 2025 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738524995;
	bh=vpOsiCRX7bgZiiNhyXbFnqDnnV+YSjKZ3cL/A3byv/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJyi3L+DCs+UKz9aLZeJjhFJQvfjtZKBXEBPWC9Djn5VuE+u2U9QLURmFeuuY2gMW
	 x7U349S7EcBeu2f8WbVjHquWzO9upvSK3STHxFNaisOBm3aeccb6ZZakxpncjsOC4O
	 6dvdVCrQdfdDtlQsyuEJyagOrTTHMNnqe7BYVOWg=
Date: Sun, 2 Feb 2025 20:35:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: broonie@kernel.org, rafael@kernel.org, dakr@kernel.org,
	mazziesaccount@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regmap-irq: Add missing kfree()
Message-ID: <2025020222-immodest-charcoal-f490@gregkh>
References: <20250202181812.48594-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202181812.48594-1-jiashengjiangcool@gmail.com>

On Sun, Feb 02, 2025 at 06:18:12PM +0000, Jiasheng Jiang wrote:
> Add kfree() for "d->main_status_buf" in the error-handling path to prevent
> a memory leak.
> 
> Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/base/regmap/regmap-irq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
> index 0bcd81389a29..b73ab3cda781 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -906,6 +906,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
>  	kfree(d->wake_buf);
>  	kfree(d->mask_buf_def);
>  	kfree(d->mask_buf);
> +	kfree(d->main_status_buf);
>  	kfree(d->status_buf);
>  	kfree(d->status_reg_buf);
>  	if (d->config_buf) {
> -- 
> 2.25.1
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
