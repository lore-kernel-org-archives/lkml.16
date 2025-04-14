Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3C1BC3C;
	Mon, 14 Apr 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614838; cv=none; b=D9XldGF0M8c90rA4IfLaCYQ7CaHFzD8hsdwno2fRHSUbMDFCnkjtUEw7ikthWFPYS37dEtmqogt9SPPKXbICZDm6RWSIP/hdy3Ju9aHRiLpCZKtrhPR+Wcum2VjjH/vSQLedVuSJmoxI9xEyiWUrv8MkcryLH1goB5Ky88kaCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614838; c=relaxed/simple;
	bh=yZYekePMIMVeeQwBv1Vp94M5jdHE5/SnXXfse5nxBIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j51jTmp+/rZhcq+PdgJjOT4/uum9iNqdhjdxxzmMQZsTwZwyikPTXC9bj8R2FETC53XXisix5dMWLsEIYVBPL00H877nf5SRh5pL0wi0GnZIzY25xVj2PJKEUuJqaXbKr01aUGGPalqelKS3aUeR5aj5sRcuFbkBhh4FH4kv0OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZEeF3+U+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZEeF3+U+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614F8C4CEEA;
	Mon, 14 Apr 2025 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744614838;
	bh=yZYekePMIMVeeQwBv1Vp94M5jdHE5/SnXXfse5nxBIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEeF3+U+BOvzTUfZUagamiBQlpAAB/LEUHdMGjTDzc03frkm6KTOChDhCJc1USqol
	 WHQTultBo980BXvVQZZM0D6DIIG73cUWnWUNcWUOIy9OAz+DirbW6Id3oh+QevBybS
	 UHedwrVgLrjZz4s41uKl9Butask3PebeZklc1p9U=
Date: Mon, 14 Apr 2025 09:12:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <2025041424-delay-distill-50b8@gregkh>
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <2025041110-starch-abroad-5311@gregkh>
 <20250414090216.596ebd11@mordecai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414090216.596ebd11@mordecai>

On Mon, Apr 14, 2025 at 09:02:16AM +0200, Petr Tesarik wrote:
> On Fri, 11 Apr 2025 15:57:19 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Mar 25, 2025 at 02:40:00PM +0100, Petr Tesarik wrote:
> > > Remove a misleading comment and issue a warning if a zone modifier is
> > > specified when allocating a hcd buffer.
> > > 
> > > There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
> > > - PIO mode can use any kernel-addressable memory
> > > - dma_alloc_coherent() ignores memory zone bits
> > > 
> > > This function is called by usb_alloc_coherent() and indirectly by
> > > usb_submit_urb(). Despite the comment, no in-tree users currently pass
> > > GFP_DMA.
> > > 
> > > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > > ---
> > >  drivers/usb/core/buffer.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
> > > index 87230869e1fa..10844cd42e66 100644
> > > --- a/drivers/usb/core/buffer.c
> > > +++ b/drivers/usb/core/buffer.c
> > > @@ -108,10 +108,6 @@ void hcd_buffer_destroy(struct usb_hcd *hcd)
> > >  }
> > >  
> > >  
> > > -/* sometimes alloc/free could use kmalloc with GFP_DMA, for
> > > - * better sharing and to leverage mm/slab.c intelligence.
> > > - */
> > > -
> > >  void *hcd_buffer_alloc(
> > >  	struct usb_bus		*bus,
> > >  	size_t			size,
> > > @@ -128,6 +124,12 @@ void *hcd_buffer_alloc(
> > >  	if (hcd->localmem_pool)
> > >  		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
> > >  
> > > +	/*
> > > +	 * Zone modifiers are ignored by DMA API, and PIO should always use
> > > +	 * GFP_KERNEL.
> > > +	 */
> > > +	WARN_ON_ONCE(mem_flags & GFP_ZONEMASK);  
> > 
> > You just rebooted the box if this happens, do you REALLY want to do
> > that?  People generally do not like their data lost :(
> 
> FWIW my box does not reboot on a warning. But I admit there are people
> who want to run their systems with panic_on_warn (although I suspect
> they already experience some sudden reboots, so they had better be
> prepared).

There are billions of Linux systems out there with panic-on-warn enabled :(

> > Why not just fix the callers, OR if this really isn't going to be
> > allowed, return an error and just fail the whole submission?  And stick
> > around to fix up all of the drivers that end up triggering this...
> 
> That's the point. AFAICS there are _no_ in-tree callers that would pass
> GFP_DMA or GFP_DMA32 to hcd_buffer_alloc(), directly or indirectly. But
> nobody should be tempted to add the flag, because I cannot imagine how
> that would ever be the right thing to do.
> 
> I can change it back to mem_flags &= ~GFP_ZONEMASK to fix it silently;
> I simply thought that driver authors may appreciate a warning that
> they're trying to do something silly.

A warning is fine, but don't reboot a box please.  dev_warn() with a
ratelimit and then return an error perhaps?

> Whatever works for you, but please keep in mind that there seems to be
> agreement among mm people that DMA and DMA32 zones should be removed
> from the kernel eventually.

I agree, they should be removed as they don't do what people think they
do.  So why not just remove them entirely, otherwise are you going to go
and add this type of checking to all bus subsystems?

thanks,

greg k-h
