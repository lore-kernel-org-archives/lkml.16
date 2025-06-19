Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D28207A27;
	Thu, 19 Jun 2025 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305667; cv=none; b=dnDfU2Ja9atPn/Skx7T9vP1mBEc7zR0OYU0f2cEw7stobA9x4sWucKWOsCwRu7VbWPBEt3izTPiXgZxGiu+0fnw4AiP9Waceqp6nAgR14fKCDQZQG9LYeJQNNT+G39YWrk3iegn1/DBnB9iHy9txSm85EAGtrMcV1C2595eFK14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305667; c=relaxed/simple;
	bh=uzfB+BZlFnvaD08LGcyN98GOijg8o/DIDcLcrxwZEog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI/oqusZ6yJNKgELGLYWNhw+ETdCDJ8AmIDOcsVYf8jl4DkN8aDCWmUo4Sa6aALiveMK4639ZXIaqai+nSmGSqbPXTImdU64WUFCb+tPmB7GuQ7Sj3mzqa6XE5xNmCUoRw8N6gpT9/ZDqpC15pyutTM24TDU27qUa/Klhz2Rq9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dL5pI0S1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dL5pI0S1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F3EC4CEEA;
	Thu, 19 Jun 2025 04:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750305666;
	bh=uzfB+BZlFnvaD08LGcyN98GOijg8o/DIDcLcrxwZEog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dL5pI0S1hAuBwv9hHH7stkQ2KhBOeyWRS+A3iGg7A0hVNlQTRmHKYyWBWobk3hZAc
	 WG5wxRDchXmvSRdf+dAC08yEu8D8AaBNF0lzbyzuAfkh/FqOnHyaUDgxI2BXdQ+y2X
	 qltLHtdTbVtXoSQMN7y9tyXZW9HZ9TDzO3gM1//s=
Date: Thu, 19 Jun 2025 06:01:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-plat: fix incorrect type for of_match
 variable in xhci_plat_probe()
Message-ID: <2025061950-frown-cesarean-a1e3@gregkh>
References: <2025061804-existing-taking-1f9c@gregkh>
 <20250618192713.20668-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618192713.20668-2-eeodqql09@gmail.com>

On Wed, Jun 18, 2025 at 03:27:14PM -0400, Seungjin Bae wrote:
> From: pip-izony <eeodqql09@gmail.com>

This line doesn't match up with:

> 
> The variable `of_match` was incorrectly declared as a `bool`.
> It is assigned the return value of of_match_device(), which is a pointer of
> type `const struct of_device_id *`.
> 
> Fixes: 16b7e0cccb243 ("USB: xhci-plat: fix legacy PHY double init")
> 
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>

That line :(

Also, no need for a blank line after Fixes:

Also:

> ---
>  drivers/usb/host/xhci-plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 6dab142e7278..49eb874b1d81 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -152,7 +152,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  	int			ret;
>  	int			irq;
>  	struct xhci_plat_priv	*priv = NULL;
> -	bool			of_match;
> +	const struct of_device_id *of_match;
>  
>  	if (usb_disabled())
>  		return -ENODEV;
> -- 
> 2.43.0
> 
> Hello Greg,
> 
> Thank you for your review and the helpful feedback.
> 
> I've corrected Signed-off-by line to use my real name.
> I also updated Fixes tag in the commit.
> 
> Regarding the original issue:
> I'm not exactly sure why the compiler didn't catch this,
> but I assume implicit casting from pointer to bool is allowed in this context.

That info should go below the --- line, and this is a version 2 of this
change, right?  Take a look at the kernel documentation for how to
number your patch revisions.

thanks,

greg k-h
