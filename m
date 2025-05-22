Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE858221DB4;
	Thu, 22 May 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902764; cv=none; b=oGC2IoxMVBJRJ2yg228mYD/z4Qikj9m+EGX9yPfOJ/Z5JeSues/xNzqJ22WTMBd26lMpKJ7qPYQ/ZnnH5mRu46PFd6IFyhBAslYq4+Ft0XK0syQnK4xFBrxzlwC9EzPQB+mKw8Zv6yJ5e8HXugxf1qiNidgLYhAWUeJOexEV42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902764; c=relaxed/simple;
	bh=qzece0dG6CvJSlZWCPI6r8FLhfVkXatcWlynd1wqVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM2Xr0ubJB+TT9EAHwar5nwF752LFah2Bqt4pOAuJcWxryeGUZSr0XA9RHVeX5f6ZR4UOjUk+Qk2PNyu4ZDOIQt50Bu18yWjio40ICxk1IaeOAanjStDrDWPGNQ97+CA0gjx7BUdT8TMJ6e1SullJmOjROxRyZGWwyKuXiI8fvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pKUCoG91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pKUCoG91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97438C4CEE4;
	Thu, 22 May 2025 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747902764;
	bh=qzece0dG6CvJSlZWCPI6r8FLhfVkXatcWlynd1wqVIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKUCoG914/X+xlvH/BOpuEKwVoVSXwwkoo0maruRQOUIpAJ6ZGTzsz+UWf0xEORJ2
	 Yoqg9xvwSmiIbg6OmNbtuTx695hOf+bJNtSuVlTLukRSuAzj0aiPVR0QGZlcpaND0W
	 rnbmqcXSjNaDik4Qjix97orsR3I50tR8gRKpRgYc=
Date: Thu, 22 May 2025 10:32:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, oneukum@suse.com, stern@rowland.harvard.edu,
	hminas@synopsys.com, rui.silva@linaro.org, jgross@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] USB: xhci: use urb hcpriv mempool for private data
Message-ID: <2025052211-oxidizing-tannery-de3f@gregkh>
References: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
 <5f14d11e4c651f9e856d760bc8b45ea7ac863b2f.1747897366.git.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f14d11e4c651f9e856d760bc8b45ea7ac863b2f.1747897366.git.00107082@163.com>

On Thu, May 22, 2025 at 03:10:10PM +0800, David Wang wrote:
> xhci keeps alloc/free private data for each enqueue/dequeue cycles,
> when using a USB webcam, allocation rate is ~250/s;
> when using a USB mic, allocation rate reaches ~1k/s;
> The more usb device in use, the higher allocation rate.
> 
> URB objects have longer lifespan than private data, hand over ownership
> of private data to urb can save lots of memory allocations over time.
> With this change, no extra memory allocation is needed during usages of
> USB webcam/mic.
> 
> Signed-off-by: David Wang <00107082@163.com>
> ---
>  drivers/usb/host/xhci-mem.c  | 1 +
>  drivers/usb/host/xhci-ring.c | 3 +--
>  drivers/usb/host/xhci.c      | 8 +++-----
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index d698095fc88d..b19e41cf1c4c 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1745,6 +1745,7 @@ struct xhci_command *xhci_alloc_command_with_ctx(struct xhci_hcd *xhci,
>  
>  void xhci_urb_free_priv(struct urb_priv *urb_priv)
>  {
> +	WARN_ONCE(1, "xhci private data should be managed by urb");

You just crashed the kernel if this ever gets hit.  As you are saying
this should never be called, why is this function even present anymore?

This makes no sense :(

Again, NEVER add a WARN*() call to the kernel for something that it
should be handling properly on its own.  Otherwise you just lost all the
user's data when the box got rebooted (and if userspace can trigger
this, you just created a new CVE...)

thanks,

greg k-h
