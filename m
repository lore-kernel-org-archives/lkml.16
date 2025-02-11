Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BC26BDA1;
	Tue, 11 Feb 2025 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283915; cv=none; b=TZkNElZWxTb8t0tyGVSbmrzvV/fHVOXmOZAMonbegNRqS7DD8VUtBdh6ywBJkmnN+UrsTcLlG0GTktO3efu8q2Fjqawl5e1GUcrYdVw0JCGWCVz9lVjtNYUFZPjKuw4KIOuKwaeGVheuSNYP77nddtVWUJ1VoigW4HgltVAv7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283915; c=relaxed/simple;
	bh=joOhHQs7N3k2V7iD1a05eNhSfWZS61s1us9jgWnob3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4u62T7i/cj79/CGJ2xJP6uSX/xQQENy5Z5Q/DU3pm4owHuY1Ial1VB+/0SJSAVFKd5X1QFRkYcaCQQNuEee5Nd0Uicrn/aIWlwkBgnNYD7gfuvH0rHILw2fIA2DOBlqeKW6Ju5LBbMOymEpcksLMJZgW4ulElq/B1PNbhbRpIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHvKgC8z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHvKgC8z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AACC4CEDD;
	Tue, 11 Feb 2025 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739283914;
	bh=joOhHQs7N3k2V7iD1a05eNhSfWZS61s1us9jgWnob3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHvKgC8zXDfnrIHYpY+hs/TYfaMJjXhE8bkB05fftOoZd3yejl8he4KQUF46vcT7r
	 OgOEWngZnmpAwoGodY5uAEPp0OJ69OZ2m0AAbNR6u40Pjqmak4OxVBQzfzYMWXryVy
	 so9a2XOQz4+FLF7l1x3uXiMTdJ9KTLOnpLlGOjqSjjCLmYU2U4y3yYoSls36xt29Ow
	 33vhuH0F4ncPiJlRgYEsGiWi1UoYDCmswgahcb7e+WWzbgrBdmGWzpIwjQe6cNkA4S
	 aiPFF0QVA/ojWQlm6vfNQQNcBLT/LFINDAIq0l1T2ajIfNarRO7y4dH8UYuEWQ/7y2
	 c6qHtt8tl29mA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thrCT-000000008OV-3Fjr;
	Tue, 11 Feb 2025 15:25:22 +0100
Date: Tue, 11 Feb 2025 15:25:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Ulv Michel <ulv@on2.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: AW: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW
 support
Message-ID: <Z6td0Tqp4RTZebe3@hovoldconsulting.com>
References: <20250125094005.1132785-1-ulv@on2.de>
 <2025020308-anemic-sasquatch-efbe@gregkh>
 <AS2PR10MB75024C662CA4E5EE7DBF06A689F52@AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS2PR10MB75024C662CA4E5EE7DBF06A689F52@AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM>

On Mon, Feb 03, 2025 at 03:51:52PM +0000, Ulv Michel wrote:
> Hello Greg,
> 
> > We need a full name, sorry.
> the full name is Ulv Michel.
> 
> > And where is patch 1/2 of this series?

> Part 1 is this: https://lore.kernel.org/linux-usb/2025012501-pediatric-abide-b802@gregkh/T/#t

Looks like something went wrong with the threading when you submitted
this series.

You can resend the patches individually if you prefer since they go
through different trees anyway, but you should get your mail setup fixed
for future contributions anyway.

Try sending it to yourself first.

> > >  	  .driver_info = RSVD(1) | RSVD(4) },
> > > +	{ USB_DEVICE_AND_INTERFACE_INFO(0x1435, 0x3185, 0xff, 0x00, 0x00) },   /* Wistron Neweb M18QW */
> 
> > You forgot a tab before the comment :(

> :( I removed the tab because the checkpatch.pl complained the length of the line being more than 100 columns...
> What would be you suggestion? Resubmit? Or keep it?

It's ok with lines longer than 100 columns here in these tables.

Please submit a v2 with your full name in From and in the SoB tags as
well.

One more comment below.

> -----Ursprüngliche Nachricht-----
> Von: Greg Kroah-Hartman <gregkh@linuxfoundation.org> 
> Gesendet: Montag, 3. Februar 2025 16:17
> An: Ulv Michel <ulv@on2.de>
> Cc: Johan Hovold <johan@kernel.org>; linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org
> Betreff: Re: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW support
> 
> On Sat, Jan 25, 2025 at 10:40:05AM +0100, U Michel wrote:
> > From: U M <ulv@on2.de>
> 
> We need a full name, sorry.
> 
> And where is patch 1/2 of this series?

> > Signed-off-by: U M <ulv@on2.de>
> > ---
> >  drivers/usb/serial/option.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c 
> > index 1e2ae0c6c41c..b166f1607b0e 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -2285,6 +2285,7 @@ static const struct usb_device_id option_ids[] = {
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1435, 0xd191, 0xff),			/* Wistron Neweb D19Q1 */
> >  	  .driver_info = RSVD(1) | RSVD(4) },
> > +	{ USB_DEVICE_AND_INTERFACE_INFO(0x1435, 0x3185, 0xff, 0x00, 0x00) },   /* Wistron Neweb M18QW */

And try to keep the entries sorted by VID/PID when possible (e.g. within
this Wistron subsection).

> You forgot a tab before the comment :(

Johan
