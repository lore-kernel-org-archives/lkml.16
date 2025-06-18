Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9802AD14;
	Wed, 18 Jun 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226621; cv=none; b=Oh2r3l/bKtqt7zsHcCNF79enCwpGK56yolcPBuAziJe0ZSrm2xngRimG0OTAj9M1k5KtNyBPngJwndYkWtSVITFfF7ZMPbjhueTlEkQYviVcpdwlxsdJ7PE48nRy6RCZ4ZCHLB0ZLSsl1rkJCiK3up98O3ogu931pJRIPRU0DaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226621; c=relaxed/simple;
	bh=zuQZiKFuyyXt3bpw0yVnvQKbv44dNqauZ4Ch6XAGsFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9N9W/+10QgQ5VZOnkBVFts71s5jl4YE59TR0ULP4oNG7bOuTfZtKmgNeGvzOUBnmsOrBKiet7fIrLnFaz3VAc6f74IVq3xoZZJHxHz46XVDeGXng2qFTwTGdunVcd+eWR+Bum0/Scs/nc9De5ZfACUtrpD8KGwp9//1pvSsrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ETCXhviy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ETCXhviy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96D0C4CEE7;
	Wed, 18 Jun 2025 06:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750226621;
	bh=zuQZiKFuyyXt3bpw0yVnvQKbv44dNqauZ4Ch6XAGsFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETCXhviyMzp7TFMyLGp99Zl1zW0ubsrRJX2+vv4QBzN5kxzdVOKRu90/4tZM91a7u
	 GuGk83kwUgxksW3rW0mEjxDLBFZyahLf5l6XcaHpRNz420wPawKq2rImawOTsGIyk+
	 gF0bDOZN9NoMIz3rjlI34oN+O5WGYR8yWwIygpXY=
Date: Wed, 18 Jun 2025 08:03:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xiehongyu1@kylinos.cn
Cc: mathias.nyman@intel.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] xhci: Disable stream for xHC controller with
 XHCI_BROKEN_STREAMS
Message-ID: <2025061801-gosling-urchin-c2cb@gregkh>
References: <20250618055133.62638-1-xiehongyu1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618055133.62638-1-xiehongyu1@kylinos.cn>

On Wed, Jun 18, 2025 at 01:51:33PM +0800, xiehongyu1@kylinos.cn wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>
> 
> Disable stream for platform xHC controller with broken stream.
> 
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
> ---
>  drivers/usb/host/xhci-plat.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 6dab142e72789..c79d5ed48a08b 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -328,7 +328,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  	}
>  
>  	usb3_hcd = xhci_get_usb3_hcd(xhci);
> -	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
> +	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
> +	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
>  		usb3_hcd->can_do_streams = 1;
>  
>  	if (xhci->shared_hcd) {
> -- 
> 2.25.1
> 
> 

Should this be backported to stable kernels?  if so, how far back?

What commit id does this fix?  Or what hardware does this fix?

thanks,

greg k-h
