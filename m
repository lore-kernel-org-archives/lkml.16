Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186B20459F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514879; cv=none; b=tTzEo+W/x1vOTUT3lm6DdTf3ewAuGmICSr1ul2w+kSMxrKUMo/FqLew/oIL0jZEO+yk8++W1Ga9+hargWHd8htlpuRyydYI/rylq5CvQlC4pSthMr3cR/pMXmoqfY9mGG84VKkua8Gw+WABeVuPpCMh3rryey8iW4Bicpg/w4HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514879; c=relaxed/simple;
	bh=NO4QxF/AUCFksC/Ltmd/C3Hxbp63nGqmFcsOSIHzH8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbSwzWwY+UdA2qgirP58FmbsDKgfN03cnHjIFmGuv6lMpxb9FrCDQjiGurPH6ALWYVUkPKQwy+CfAkuOsQN9lk1ygAJkypc9EROGRCMiml4azfLl225AZgzOX210UHvxMY49tj1WcPzcW5Rez1GqgRD4MqC2FeIld6MeVIoJw8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OgJGxYG7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OgJGxYG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F32C4CEE5;
	Tue,  1 Apr 2025 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743514879;
	bh=NO4QxF/AUCFksC/Ltmd/C3Hxbp63nGqmFcsOSIHzH8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgJGxYG7hLtvEHHkq9XbnWzAY3TCVfJXMTwT59k4k/z2I+7/9ntsp30QDC9yZu7OP
	 Df8jBRok7LpdFrieO4yQ3bEKjrNSEbwiA0FwfPik1Eevg0/dm/nTyMRoHK7QeELjEB
	 UJcX2FVb2onoMq2BdcgP6NlI+G1tMXt0EOzX5boM=
Date: Tue, 1 Apr 2025 14:39:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] misc: tps6594-pfsm: Add NULL check in
 tps6594_pfsm_probe()
Message-ID: <2025040135-vanilla-acquire-4298@gregkh>
References: <20250401133404.27793-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401133404.27793-1-bsdhenrymartin@gmail.com>

On Tue, Apr 01, 2025 at 09:34:04PM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> tps6594_pfsm_probe() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/misc/tps6594-pfsm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
> index 0a24ce44cc37..0d9dad20b6ae 100644
> --- a/drivers/misc/tps6594-pfsm.c
> +++ b/drivers/misc/tps6594-pfsm.c
> @@ -281,6 +281,8 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
>  	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
>  	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
>  					    tps->chip_id, tps->reg);
> +	if (!pfsm->miscdev.name)
> +		return -ENOMEM;
>  	pfsm->miscdev.fops = &tps6594_pfsm_fops;
>  	pfsm->miscdev.parent = dev->parent;
>  	pfsm->chip_id = tps->chip_id;
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
