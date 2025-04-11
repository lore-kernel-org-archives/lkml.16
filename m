Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E51F3B89;
	Fri, 11 Apr 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379843; cv=none; b=ZZr0ZrtAUjlOkHi/6Y1lBLBFPMSuxhYH0UbZd19QeLGG4ONxxSN/zF89fISVsSLG9cfM8ToVeEpZO7qGTdarZhxJ/YNySgtXqEwdD6vB1YThGS0k4O2CD29nw3lwNEmne7N/+o2ypJC79rgEnv/CPDsecpwYLNw8tmP3/YZWy7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379843; c=relaxed/simple;
	bh=qKM86nHSsdV+O0qGr33nuoJcLArnt2t2yHur6JnRC5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdbJDS4zlNOq4peBXWqKt0DCmpkqOhdsX3t8x3kDfMnLOhdMiH9ikBfvMiSfjufM8EHLe2mI3OT/4Yne1QJ5jmcUUezGgY/MkTfbX9Mcw2ryXO70WjGY3CYNAGob/TijjJD8UnV5QYc82W/Sp1arJOt7Hv3Ego154JiiR3uOy3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XrCatCov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XrCatCov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029D9C4CEE7;
	Fri, 11 Apr 2025 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744379842;
	bh=qKM86nHSsdV+O0qGr33nuoJcLArnt2t2yHur6JnRC5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrCatCovTvxZdMoG/QMZeli3flXHRA/5zIqVIf8nzEVPAPp2VuigF+znX/J02B1ua
	 TpQsDPU8lQQxB4f3WL+KtohICnlRh8Bfkpp5tb2Q1tHGiRD2zWmh82x5dKCb9GKfpf
	 YOQr+EcBpZTgZdOnpvg++nWW5DLcAtEDPRokb678=
Date: Fri, 11 Apr 2025 15:57:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <2025041110-starch-abroad-5311@gregkh>
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325134000.575794-1-ptesarik@suse.com>

On Tue, Mar 25, 2025 at 02:40:00PM +0100, Petr Tesarik wrote:
> Remove a misleading comment and issue a warning if a zone modifier is
> specified when allocating a hcd buffer.
> 
> There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> - PIO mode can use any kernel-addressable memory
> - dma_alloc_coherent() ignores memory zone bits
> 
> This function is called by usb_alloc_coherent() and indirectly by
> usb_submit_urb(). Despite the comment, no in-tree users currently pass
> GFP_DMA.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  drivers/usb/core/buffer.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> index 87230869e1fa..10844cd42e66 100644
> --- a/drivers/usb/core/buffer.c
> +++ b/drivers/usb/core/buffer.c
> @@ -108,10 +108,6 @@ void hcd_buffer_destroy(struct usb_hcd *hcd)
>  }
>  
>  
> -/* sometimes alloc/free could use kmalloc with GFP_DMA, for
> - * better sharing and to leverage mm/slab.c intelligence.
> - */
> -
>  void *hcd_buffer_alloc(
>  	struct usb_bus		*bus,
>  	size_t			size,
> @@ -128,6 +124,12 @@ void *hcd_buffer_alloc(
>  	if (hcd->localmem_pool)
>  		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
>  
> +	/*
> +	 * Zone modifiers are ignored by DMA API, and PIO should always use
> +	 * GFP_KERNEL.
> +	 */
> +	WARN_ON_ONCE(mem_flags & GFP_ZONEMASK);

You just rebooted the box if this happens, do you REALLY want to do
that?  People generally do not like their data lost :(

Why not just fix the callers, OR if this really isn't going to be
allowed, return an error and just fail the whole submission?  And stick
around to fix up all of the drivers that end up triggering this...

thanks,

greg k-h
