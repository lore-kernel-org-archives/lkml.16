Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ADC1F92A;
	Sun, 29 Jun 2025 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187990; cv=none; b=t16UUEqns4fMCiQi+DtFIVSVt3/EIgDttL+PbqXWyxTuPOMPq5ZMeZWk3fLkh9WbbXsdaPWl5PFsYhK8uc7MBQureIng0WJinnQlihzf2gzDCuDg1uCKLUNy39EZbJUo+Q6K8L2r25TVOIAQLmwq7MYOozvD9lrRB0242FhMaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187990; c=relaxed/simple;
	bh=lnka/eXLTDEG4SqUaPbOnCW7lS33jxlI3sBID2bvuFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEHNKacz+Iid9ZqRlwgeYOk76tmM0Gp+XeLb/0My3So7CzJXSqDM+CW6vtiDLrOxLgOKvlsWPf2BR4zriN9R7P3lPUBaQYxKRd/y2h2rcyUx0W5XypGHkNWwyDJgrmBDrtDN8eJ9TSbZlu7R2S5VvfFnl9soHeMyAcFHu1BihKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ElY8OPti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ElY8OPti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2AAC4CEEB;
	Sun, 29 Jun 2025 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751187989;
	bh=lnka/eXLTDEG4SqUaPbOnCW7lS33jxlI3sBID2bvuFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ElY8OPtitxm3taEQ9Tj4he47WqgCjToNtLRHLQqlaJRTnKvihAC/1Coo2+RGBRLbd
	 g6JYe8WyTpDGgbYXkbFV5bnqIHtRCLQjJ64C75GKkh5HR3Mdmxy1a/JGtTSU+9Heo8
	 I+/xK2A14O75Vf8z98m0o5sOxNeox8h9qEN0GH6w=
Date: Sun, 29 Jun 2025 11:06:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Message-ID: <2025062945-expose-veteran-3c35@gregkh>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
 <20250623224340.oszkgwnhcjhnibaz@synopsys.com>
 <AM8PR06MB752168CCAF31023017025DD5BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
 <2025062825-equipment-barista-dabc@gregkh>
 <AM8PR06MB7521915A5FB0DDD1DA38BA3ABC47A@AM8PR06MB7521.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM8PR06MB7521915A5FB0DDD1DA38BA3ABC47A@AM8PR06MB7521.eurprd06.prod.outlook.com>

On Sun, Jun 29, 2025 at 08:45:45AM +0000, SCHNEIDER Johannes wrote:
> Hoi Greg,
> 
> 
> > > Now that the TRB reclaim logic always inspects the TRB's CHN (Chain) bit
> > > directly to determine whether a TRB is part of a chain, the explicit
> > > 'chain' parameter passed into dwc3_gadget_ep_reclaim_completed_trb()
> > > is no longer necessary.
> > >
> > > This cleanup simplifies the reclaim code by avoiding duplication of
> > > chain state tracking, and makes the reclaim logic rely entirely on the
> > > hardware descriptor flags — which are already present and accurate at
> > > this stage.
> > >
> > > No functional changes intended.
> > >
> > > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> > > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > > ---
> > > v3: no changes, re-submission as single patch
> > > v2: no changes to the patch, "faulty" re-submission
> > > v1: initial submission as part of a series
> > > Link:
> > >
> > >  drivers/usb/dwc3/gadget.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > index 99fbd29d8f46..a4a2bf273f94 100644
> > > --- a/drivers/usb/dwc3/gadget.c
> > > +++ b/drivers/usb/dwc3/gadget.c
> > > @@ -3497,7 +3497,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
> > >
> > >  static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
> > >               struct dwc3_request *req, struct dwc3_trb *trb,
> > > -             const struct dwc3_event_depevt *event, int status, int chain)
> > > +             const struct dwc3_event_depevt *event, int status)
> > >  {
> > >       unsigned int            count;
> > >
> > > @@ -3549,7 +3549,8 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
> > >       if ((trb->ctrl & DWC3_TRB_CTRL_HWO) && status != -ESHUTDOWN)
> > >               return 1;
> > >
> > > -     if (event->status & DEPEVT_STATUS_SHORT && !chain)
> > > +     if (event->status & DEPEVT_STATUS_SHORT &&
> > > +         !(trb->ctrl & DWC3_TRB_CTRL_CHN))
> > >               return 1;
> > >
> > >       if ((trb->ctrl & DWC3_TRB_CTRL_ISP_IMI) &&
> > > @@ -3576,8 +3577,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
> > >               trb = &dep->trb_pool[dep->trb_dequeue];
> > >
> > >               ret = dwc3_gadget_ep_reclaim_completed_trb(dep, req,
> > > -                             trb, event, status,
> > > -                             !!(trb->ctrl & DWC3_TRB_CTRL_CHN));
> > > +                             trb, event, status);
> > >               if (ret)
> > >                       break;
> > >       }
> > > --
> > > 2.43.0
> > >
> > 
> > Applying just this patch I get:
> > 
> >   CC [M]  drivers/usb/dwc3/gadget.o
> > drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_ep_reclaim_completed_trb’:
> > drivers/usb/dwc3/gadget.c:3517:13: error: ‘chain’ undeclared (first use in this function)
> >  3517 |         if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))
> >       |             ^~~~~
> > drivers/usb/dwc3/gadget.c:3517:13: note: each undeclared identifier is reported only once for each function it appears in
> > 
> > So that's not going to work :(
> > 
> 
> Oh - sorry! i shouldn't have pulled the initial series apart :-(
> 
> I'll re-submit both patches together as v4 (this time both with cc-stable)
> ... without b4 to have a new mail tread

The first patch is already in my tree, I can't drop that, sorry.  Just
resend this one on it's own please.

thanks,

greg k-h
