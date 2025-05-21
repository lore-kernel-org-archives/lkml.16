Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D690C25A326;
	Wed, 21 May 2025 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823533; cv=none; b=o0V3TZtlkgUnOmBzgBJ/hmFbPsXXZN4yFSL4H6JNbgMKLolUB79E1jrvCWpHhKQBSgH4GXEJgHy+AmxOQW3i9cTdCnl349XjhAZEyQcmoTbRTkGhsyIHqexjFzJ82SttXOkSbksuE1b3p1PkzkEn6rT4CiMYP93lAuOK/DFJonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823533; c=relaxed/simple;
	bh=7L99yt1gugpvwhYiMmt3ZZK42PIRijia6HyKCSi3NPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7eBoa/lDqFJB+beNwaoIDm3knZe1BxvfwSp3T48SgTrgq1M+jQl2sSlT3HfQ+Ko+5LUaPh9CZGavM3aJ9S245tZp2DnppzkpifnBj4d+Yug/fa2ZvRmqox7qpGsLh5h6n1VsJjpue005ZoHXz0rf+yYpsxzfbTtaAuCuockWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BWOBJMM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BWOBJMM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BC1C4CEE4;
	Wed, 21 May 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747823533;
	bh=7L99yt1gugpvwhYiMmt3ZZK42PIRijia6HyKCSi3NPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWOBJMM+K/22XkIz9N2UbKVsPoZTUgPx8F2u1XQKpFAICfX4ue5F9qjXKysDFnnXf
	 gZ4eg51ESTpVNnFDKfgDIK+KDH4+lnpYVfh40IabD/D1asArF1HOLEG+1YfHW0mZdu
	 Aqy0+VdOJAmQJk9YoatjpvhBr+F2tMXqMnib9UVA=
Date: Wed, 21 May 2025 12:32:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, oneukum@suse.com, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
Message-ID: <2025052148-cannot-football-74e1@gregkh>
References: <20250517083819.6127-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517083819.6127-1-00107082@163.com>

On Sat, May 17, 2025 at 04:38:19PM +0800, David Wang wrote:
> ---
> Changes since v2:
> 1. activat the pool only when the urb object is created via
> usb_alloc_urb()
> Thanks to Oliver Neukum <oneukum@suse.com>'s review.

Changes go below the bottom --- line, not at the top.  Please read the
documentation for how to do this.

Also, these are not "threaded" together, making them hard to pick out.
Please when you resend, make them be together using git send-email or
some such tool.

> ---
> URB objects have long lifecycle, an urb can be reused between
> submit loops; The private data needed by some host controller
> has very short lifecycle, the memory is alloced when enqueue, and
> released when dequeue. For example, on a system with xhci, in
> xhci_urb_enqueue:
> Using a USB webcam would have ~250/s memory allocation;
> Using a USB mic would have ~1K/s memory allocation;
> 
> High frequent allocations for host-controller private data can be
> avoided if urb take over the ownership of memory, the memory then shares
> the longer lifecycle with urb objects.
> 
> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> of memory and grows when larger size is requested.
> 
> The mempool is activated only when the URB object is created via
> usb_alloc_urb() in case some drivers create a URB object by other
> means and manage it lifecycle without corresponding usb_free_urb.
> 
> The performance difference with this change is insignificant when
> system is under no memory pressure or under heavy memory pressure.
> There could be a point inbetween where extra 1k/s memory alloction
> would dominate the preformance, but very hard to pinpoint it.
> 
> Signed-off-by: David Wang <00107082@163.com>
> ---
>  drivers/usb/core/urb.c | 45 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |  5 +++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 5e52a35486af..53117743150f 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -23,6 +23,8 @@ static void urb_destroy(struct kref *kref)
>  
>  	if (urb->transfer_flags & URB_FREE_BUFFER)
>  		kfree(urb->transfer_buffer);
> +	if (urb->hcpriv_mempool_activated)
> +		kfree(urb->hcpriv_mempool);
>  
>  	kfree(urb);
>  }
> @@ -77,6 +79,8 @@ struct urb *usb_alloc_urb(int iso_packets, gfp_t mem_flags)
>  	if (!urb)
>  		return NULL;
>  	usb_init_urb(urb);
> +	/* activate hcpriv mempool when urb is created via usb_alloc_urb */
> +	urb->hcpriv_mempool_activated = true;
>  	return urb;
>  }
>  EXPORT_SYMBOL_GPL(usb_alloc_urb);
> @@ -1037,3 +1041,44 @@ int usb_anchor_empty(struct usb_anchor *anchor)
>  
>  EXPORT_SYMBOL_GPL(usb_anchor_empty);
>  
> +/**
> + * urb_hcpriv_mempool_zalloc - alloc memory from mempool for hcpriv
> + * @urb: pointer to URB being used
> + * @size: memory size requested by current host controller
> + * @mem_flags: the type of memory to allocate
> + *
> + * Return: NULL if out of memory, otherwise memory are zeroed
> + */
> +void *urb_hcpriv_mempool_zalloc(struct urb *urb, size_t size, gfp_t mem_flags)
> +{
> +	if (!urb->hcpriv_mempool_activated)
> +		return kzalloc(size, mem_flags);
> +
> +	if (urb->hcpriv_mempool_size < size) {
> +		kfree(urb->hcpriv_mempool);
> +		urb->hcpriv_mempool_size = size;
> +		urb->hcpriv_mempool = kmalloc(size, mem_flags);
> +	}
> +	if (urb->hcpriv_mempool)
> +		memset(urb->hcpriv_mempool, 0, size);
> +	else
> +		urb->hcpriv_mempool_size = 0;
> +	return urb->hcpriv_mempool;
> +}
> +EXPORT_SYMBOL_GPL(urb_hcpriv_mempool_zalloc);
> +
> +/**
> + * urb_free_hcpriv - free hcpriv data if necessary
> + * @urb: pointer to URB being used
> + *
> + * If mempool is activated, private data's lifecycle
> + * is managed by urb object.
> + */
> +void urb_free_hcpriv(struct urb *urb)
> +{
> +	if (!urb->hcpriv_mempool_activated) {
> +		kfree(urb->hcpriv);
> +		urb->hcpriv = NULL;

You seem to set this to NULL for no reason, AND check for
hcpriv_mempool_activated.  Only one is going to be needed, you don't
need to have both, right?  Why not just rely on hcdpriv being set?

And are you sure that the hcd can actually use a kmalloced "mempool"?  I
don't understand why xhci can't just do this in its driver instead of
this being required in the usb core and adding extra logic and size to
every urb in the system.

thanks,

greg k-h
