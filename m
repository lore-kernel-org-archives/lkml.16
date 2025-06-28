Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332F21E0DCB;
	Sat, 28 Jun 2025 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124225; cv=none; b=QyADfio4p1zMlSZr3P+VMWk9TXWCxNsL7RGiPAFYVdMDkOuubXT0GcLcWls8K+2Pvn1vcqC/yVdLO6DMcU9Wy+J5FgjQKpdSa4EDukABNoLgtD1tsHa63Dy7hRj/I9E9fVNkvZLoAz65GEe7TZcg1+ZKhejysM+8EwcIrqqVdmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124225; c=relaxed/simple;
	bh=B9DbxsAd1qr7E4UnYaoJhFDAqOMpmYJ3s6bZID7MUAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reicuJpsxJZRh6S9vm5aSLcOi2XmioKBkFg08hNLrBYrc7nV/pyeAqxgmIKSFbBLz+CmsgiQker7MH0j+4zAXdcqZjNC7akg7HwGnI3xTF+1unzAK9/Zl3IAj8PKRekdxB69ioI9/90jg2gJAngiYqqNFmeORyOUUeVEGew0XC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O2ns4kyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O2ns4kyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FB6C4CEEA;
	Sat, 28 Jun 2025 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751124221;
	bh=B9DbxsAd1qr7E4UnYaoJhFDAqOMpmYJ3s6bZID7MUAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2ns4kyqf6rV38yebG5IPLRVK2/8oSDSd/dQ1nS+X7+swqybaLJstl2JdSxPyF+ti
	 ClydrYNRCcJjuUBVemwQKtihiIFyjEVZecXc3nEGaC6Gx2JLYJW5VPXwCb0pzlEcjL
	 KZGp+iB2JrglvkvhxorpjlfHuqZHl5lO9YOySUbA=
Date: Sat, 28 Jun 2025 17:23:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Message-ID: <2025062825-equipment-barista-dabc@gregkh>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
 <20250623224340.oszkgwnhcjhnibaz@synopsys.com>
 <AM8PR06MB752168CCAF31023017025DD5BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM8PR06MB752168CCAF31023017025DD5BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>

On Wed, Jun 25, 2025 at 07:53:17AM +0000, SCHNEIDER Johannes wrote:
> Now that the TRB reclaim logic always inspects the TRB's CHN (Chain) bit
> directly to determine whether a TRB is part of a chain, the explicit
> 'chain' parameter passed into dwc3_gadget_ep_reclaim_completed_trb()
> is no longer necessary.
> 
> This cleanup simplifies the reclaim code by avoiding duplication of
> chain state tracking, and makes the reclaim logic rely entirely on the
> hardware descriptor flags — which are already present and accurate at
> this stage.
> 
> No functional changes intended.
> 
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> v3: no changes, re-submission as single patch
> v2: no changes to the patch, "faulty" re-submission
> v1: initial submission as part of a series
> Link: https://lore.kernel.org/lkml/AM8PR06MB7521CFF1CD8A93622A537EEDBC78A@AM8PR06MB7521.eurprd06.prod.outlook.com/
> 
>  drivers/usb/dwc3/gadget.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 99fbd29d8f46..a4a2bf273f94 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3497,7 +3497,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
>  
>  static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
>  		struct dwc3_request *req, struct dwc3_trb *trb,
> -		const struct dwc3_event_depevt *event, int status, int chain)
> +		const struct dwc3_event_depevt *event, int status)
>  {
>  	unsigned int		count;
>  
> @@ -3549,7 +3549,8 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
>  	if ((trb->ctrl & DWC3_TRB_CTRL_HWO) && status != -ESHUTDOWN)
>  		return 1;
>  
> -	if (event->status & DEPEVT_STATUS_SHORT && !chain)
> +	if (event->status & DEPEVT_STATUS_SHORT &&
> +	    !(trb->ctrl & DWC3_TRB_CTRL_CHN))
>  		return 1;
>  
>  	if ((trb->ctrl & DWC3_TRB_CTRL_ISP_IMI) &&
> @@ -3576,8 +3577,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
>  		trb = &dep->trb_pool[dep->trb_dequeue];
>  
>  		ret = dwc3_gadget_ep_reclaim_completed_trb(dep, req,
> -				trb, event, status,
> -				!!(trb->ctrl & DWC3_TRB_CTRL_CHN));
> +				trb, event, status);
>  		if (ret)
>  			break;
>  	}
> -- 
> 2.43.0
> 

Applying just this patch I get:

  CC [M]  drivers/usb/dwc3/gadget.o
drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_ep_reclaim_completed_trb’:
drivers/usb/dwc3/gadget.c:3517:13: error: ‘chain’ undeclared (first use in this function)
 3517 |         if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
      |             ^~~~~
drivers/usb/dwc3/gadget.c:3517:13: note: each undeclared identifier is reported only once for each function it appears in

So that's not going to work :(

