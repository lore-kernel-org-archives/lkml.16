Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DE26A0EB;
	Tue,  1 Jul 2025 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359434; cv=none; b=fZk32UnaXtddZAL6T6hQDCDogbWisuP1nDmptRRQSZD+3eMJwU0YBIt+LGCydIupMM8FGfCBkLbj/RY3z6WqhKPcYrROBQuZjhCC28qNUJqHUq8t1Qi3vMJvPiNS8Ei0HmtYFtrt0sMSZNb1POiPqqaSI1CM7qJ5LBbdRAUkEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359434; c=relaxed/simple;
	bh=zEtteRShEKxsilU1Hd798Yj8bqUgtyrPa4gMPVvltBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZk2H6Xe0Ya0GegRpVF5vyidsHXWj4t+P2s5ReJkKiF2wz75VFANJota42Bt2Aq/uadyJYdLlxDTsMbuguKsgcKRwsWVWefcWLgQKh8fFEO9nKMA9jr7CDi/OaBiX9iNXN/gfC3PB6MSD2VwaFyEbtDP4jeV9UiDclxP0ezAQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QTca0xQ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QTca0xQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D8BC4CEEB;
	Tue,  1 Jul 2025 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751359433;
	bh=zEtteRShEKxsilU1Hd798Yj8bqUgtyrPa4gMPVvltBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTca0xQ6usblgn0H54MJyFZyL9ZmPDGrAlA4LGrzuO1VJiUauh+qK/CUxeFlTL5dX
	 UscJa3DxZM42Q76n7oBLLmiGaoU8ZWPIWQkqVSMNFj/3q4V7QQORhbz8GV+WrOHzEw
	 O9n/nG5o4+q+Tzl7xOo2l0wRcFsSY/lY8U0UJTlw=
Date: Tue, 1 Jul 2025 10:43:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?P=E9rez?= <sperezglz@gmail.com>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] usb: gadget: udc-xilinx: validate ep number before
 indexing rambase[]
Message-ID: <2025070120-outhouse-lubricant-ff47@gregkh>
References: <20250627060125.176663-1-sperezglz@gmail.com>
 <2025062834-botanist-crop-4aec@gregkh>
 <CAMCbnubpfO0y9oMnJnYHQ3ALTPmF1W80sPhbNPzaR59hy+cDQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCbnubpfO0y9oMnJnYHQ3ALTPmF1W80sPhbNPzaR59hy+cDQQ@mail.gmail.com>

On Mon, Jun 30, 2025 at 02:20:35PM -0600, Sergio Pérez wrote:
> > On Fri, Jun 27, 2025 at 12:01:22AM -0600, Sergio Perez Gonzalez wrote:
> > > Issue flagged by coverity. The size of the rambase array is 8,
> > > usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.
> >
> > But how can that happen with this hardware?  As the array states, this
> > hardware only has that many endpoints availble to it, so how can it ever
> > be larger?
> >
> 
> Hardware will likely behave and not report more endpoints than it
> supports, but I thought that there is still a possibility that this
> can be exploited, taking into account this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7f14c7227f342d9932f9b918893c8814f86d2a0d

That patch is probably not needed, for this same reason.

> and this CVE:
> https://www.cvedetails.com/cve/CVE-2022-27223/

Odds are we should reject that CVE, want me to go do that?

> However, looking more closely the above patch, the endpoint number is
> extracted from a struct different than the "usb_endpoint_descriptor":
> "epnum = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;"
> in contrast with the code that I'm touching. The CVE does not add more
> details to understand if the part of the code that I'm changing is not
> subject to the vulnerability.

Please dig deeper to determine this :)

> > > ---
> > >  drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> > > index 8d803a612bb1..0c3714de2e3b 100644
> > > --- a/drivers/usb/gadget/udc/udc-xilinx.c
> > > +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> > > @@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
> > >       ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
> > >       /* Bit 3...0:endpoint number */
> > >       ep->epnumber = usb_endpoint_num(desc);
> > > +     if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
> > > +             dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
> > > +                             ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
> > > +             return -EINVAL;
> >
> > Any hints as to how this was tested?
> 
> I don't have access to such xilinx hardware, given that it was marked
> as a high severity defect in coverity and it is basically extending a
> validation that was already added in other parts of the code, I
> decided to propose the patch without runtime testing.

Never trust static analysis tools blindly.  The number of
false-positives stuff like coverity creates because it can not determine
where data actually comes from is way too high.

thanks,

greg k-h
