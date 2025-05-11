Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029262BAF7;
	Sun, 11 May 2025 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746942734; cv=none; b=dhjYm3XQ54UTOR1CYW0Yk6oo8zFHdv0uIZMseWeF89R8DB30EW/O+KI8GMi95z12CHnkLvjU3xaYAPtSN+S+Ds4mYLgxh66G2zquBCcOR6cafdJGs+oQmLtulwCqiiwB83QT4DSA3Hlwwgy34dAgsUAtK7jDH2MoF/7vzvoQIUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746942734; c=relaxed/simple;
	bh=BJhqTKQgr3+wKZWPlHF1sd3gUx+qt91YFIZKWDy4Eec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmDCdE0lH5H27b6Bs+bMx2d3mbRFBcC80KVu549UIvKW7uIvx6qxh/3HlLNkXs8DzT8AgIhJUl2U7q2MJtdAImAaqzq33/+nRaOSU2XN5D8V5g4ZMmeDx9I5MhQhwdfPdtWrsxunjtnP418EMi9BRulLSoy6PI5TUgqlpeoFNYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aCYYyU/k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aCYYyU/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D44C4CEE4;
	Sun, 11 May 2025 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746942733;
	bh=BJhqTKQgr3+wKZWPlHF1sd3gUx+qt91YFIZKWDy4Eec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCYYyU/kmh+Gas/ZuaaouD23Tm2csIofdIySiIqTswGztm7bDKB6ovcGa5rAnj0hg
	 TjZk0bGlolCnzT1d/9kDAWF8Z0ffnYzRkoJa+jqIckqmmcllrJJk+OARMhKfS48MJX
	 LRu9UNVDW6BiNl/PE9geeme/H7uUNOGiEuIXVenc=
Date: Sun, 11 May 2025 07:52:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddarth Gundu <siddarthsgml@gmail.com>
Cc: b-liu@ti.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] usb: musb: Fix signed integer overflow
Message-ID: <2025051109-corner-womanless-e400@gregkh>
References: <20250510211217.122790-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510211217.122790-1-siddarthsgml@gmail.com>

On Sun, May 11, 2025 at 02:42:17AM +0530, Siddarth Gundu wrote:
> Shifting 1 << 31 on a 32-bit int causes signed integer overflow, which
> leads to undefined behavior.
> 
> Cast 1 to u32 before performing the shift, eliminating the
> undefined behavior.
> 
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
> ---
>  drivers/usb/musb/cppi_dma.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/cppi_dma.h b/drivers/usb/musb/cppi_dma.h
> index 3606be897cb2..33bf5f83f08d 100644
> --- a/drivers/usb/musb/cppi_dma.h
> +++ b/drivers/usb/musb/cppi_dma.h
> @@ -38,7 +38,7 @@ struct cppi_rx_stateram {
>  };
>  
>  /* hw_options bits in CPPI buffer descriptors */
> -#define CPPI_SOP_SET	((u32)(1 << 31))
> +#define CPPI_SOP_SET	((u32)1 << 31)

Why not just use the proper BIT() macro instead?

And does this actually overflow and cause problems?  What is the result
of the original code where it is an issue in the driver?  Have you
tested it?  Is the assembly output actually different?

thanks,

greg k-h
