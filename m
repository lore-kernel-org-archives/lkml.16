Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416B221726
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004514; cv=none; b=LvGBySiZEDNMjjuabfUCkq0UvWXXzWdhOgUxDP3C0KG9zHukMUlW+g/1InTfRHwUPUeDUbcSi59vzYy8RlhPp004XwINPH9JzUfhIa2jVprLkoaIsCM28iR6ppI+aEqiOPTvH5oNTKEoS5IeZ1Ru5fEt4maFQZHf9OTP537iA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004514; c=relaxed/simple;
	bh=fIHnNSFJTdbi9iK1x/daqwAm+XfYvJeK//5NIoVEN3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZyrc+ln41Pn1fg7GovEWMnyhR+rR1VCxfZeVjq0SG4u8rhDIpla8BIMp/5jYW9rE0uU6vahUwI1u92d4aDof3/A7KzzMhmDqVHoo+zwq7Uh5OpR65fE9r76lKM3Li4gM1gmDGH5iu89i1x/VWY7WqSz6RUWyHOQw7vYJt7ZiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N61W9ia8; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N61W9ia8"
Date: Wed, 30 Apr 2025 11:15:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746004511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hl3rwiSgW5ZHuokF2/OswWCYniG/EBnE+RTr8A4w/KE=;
	b=N61W9ia87mKXUx37pCW2HfITVRF2NtRUvVUSeExOg5gmYMuNZoZUZYlwRGtSI0uPpoaX7h
	MjFwC1F27H6IAw0bnUr5i3LtAprpFpCDaEYER3bvblBJMFOhKXTA9a7A6AMCdDZNQykErF
	UwgnRB2F5glApiB70k3O0D5ILz4o1Jg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 9/9] media: i2c: ov9282: add strobe_source v4l2 control
Message-ID: <3pnxcrz3xzuonilqnkkxrdelwyuu2zr4dacr4snwq666guupty@z3txo76p35ur>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-9-2105ce179952@linux.dev>
 <aBHhz85RVEBrAu56@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHhz85RVEBrAu56@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks for your comment!

On Wed, Apr 30, 2025 at 08:39:43AM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Tue, Apr 29, 2025 at 02:59:14PM +0200, Richard Leitner wrote:
> > Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
> > to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
> > strobe based on its register settings.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 5ddbfc51586111fbd2e17b739fb3d28bfb0aee1e..34ea903a18dadeeebd497a4a8858abf12b598717 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1367,6 +1367,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
> >  	const struct ov9282_mode *mode = ov9282->cur_mode;
> >  	struct v4l2_fwnode_device_properties props;
> > +	struct v4l2_ctrl *ctrl;
> >  	u32 hblank_min;
> >  	u32 lpfr;
> >  	int ret;
> > @@ -1446,6 +1447,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> >  			  0, 13900, 1, 8);
> >  
> > +	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > +				      V4L2_CID_FLASH_STROBE_SOURCE,
> > +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
> > +				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
> > +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
> > +	ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> Note that v4l2_ctrl_new_std_menu() may return NULL.

Good catch. Thanks! Will add a check in v4.

> 
> > +
> >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >  	if (!ret) {
> >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > 
> 
> -- 
> Sakari Ailus

regards;rl
