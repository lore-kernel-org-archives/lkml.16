Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781415D1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627498; cv=none; b=RvS21RUFXKffthYqvc918Gclg8vCVRbzIDQIGz7wluGc5ffqjvanL4AOOxCJe6KtC/QuUq7+46HLfGSpTtxBmvgYNU1BIbvvl1ca/Ug39iL/kl4PxnhTUqwl/8m6+JJm+SejmelrWNTGFICHrY/lVi89NmWG8Y1XXxqPCJaDfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627498; c=relaxed/simple;
	bh=z/AkE5OtlG5VKaps7hsui4hy5C+xiiW1gvnj/DSmXAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pw5S/oh8/R5JqsRnhkwvVkbOmXGC4oKV9xySfgvyboPdwB44oUoqiOSMx1qAluyXZmyBYCKj3Lt1UawF5DhgdbG6Ui52KCuvEY9sqcahUmexgKIizG8hAVGlbimkvIjcsXlwt23XSW1TB37A4ny9+kywF6B9O1OyF0KYAFl0zTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wyDl4wkL; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wyDl4wkL"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso69686676d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738627495; x=1739232295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V503CGB4G24QXJlj1eoG6Q8Ui1RZ3tMq+XHz9JhS07M=;
        b=wyDl4wkL/DD+IfO7kqEFr44e71IClns+bVHlgX6Gv4zfC+0uqs7+5lO0scVJ6lGTW6
         FRL19DItS4boaH6DjimHDHObFoVkfFMEmohW38thToQ4MzCjDMoLPTecT3/15fzhYkb+
         Vx6aHYvCrARCG8QVINI/luq6NUdzj54mRAXFLwWk3i1yJXKnXoOo/1N3n/fpK7MdiAEr
         oDhLfS1Wfb2jGg/fZlVJtYESRLfL2XZrstA+fAdnL+XYFY60OoDJh+2jnmEadPUX0WUA
         Jg30i85bFO3al9SVzHQOkngy1P9im/dBA3Bf9ivkrOgkdihAyq3V9QlCWa0n5tWS8lms
         6N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738627495; x=1739232295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V503CGB4G24QXJlj1eoG6Q8Ui1RZ3tMq+XHz9JhS07M=;
        b=dj1qbS47aMF2hUVsSRMovJEYHKzONfgicb7JxPb0glmMvVPXPZgTkemEG0OrLFZ2jx
         D4iB89HlUPEhbVgY3UtBydfIyv2Kv8nJpHgwsTeqcBwEwDI724jJWNarR7l4hSF4fCTE
         E4PR/o7Xp3KHbkmAR1EbFu4LOvtpnPdyIOyEcAlnUOM/eEZvFKFc0M9k22fbRDBSOAyy
         UJWHaZVZQpQQWHySHR1BaQns3o8kgRRa5Lq9cmwPK5NCptmvTQS8IqwK951vgWvq9LJg
         1HTXj3n5EyFJDLFQOWe2I0H2ZOGsrY2RlAYWcMfrhLpPrWLyGGEUOPpKnUqoo3U6wUeW
         IEIg==
X-Forwarded-Encrypted: i=1; AJvYcCXt7nodKJbA7L7wN5a2qqocLZex7XowBINQvFUhDFd7KJ+iMOXDU4U19zid1b7KTIh/9tCAUvf85C8LWOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrhAQYMd202icpGmRNpunkVob3ulJqullBK8soK41dWNZEUlqr
	ZzXUwjD+eF7tJHy6SPyvBkB8wNouFwCWWCLNZj02Fcy3foY+VOg6ZuK8rStTiDnggyMOmLFVPmR
	mJaQy9MBw9IJgKsNNWP4xFylm4rI+VfwjYU3e
X-Gm-Gg: ASbGncssBYiQ6g7BH/hQ83g1gNkQOexdSjqOZ39eUC+rXPaabatXbsCHmF50NTUi+vN
	1Qp59HSrRsJPPPdVRQobZWaAwlx9DoZIXLeWDAjokhOVadpbsgtg0tICxXNFK5w1Ldf0lWmF/zM
	ilwLUjFqY68O8O6hkyNDexrNDahw5p1Hg=
X-Google-Smtp-Source: AGHT+IFVlZs6Mpv2+fjTlh8bdBFBUssI0vxpB8GKft1EHXE6M1u9F7Oltlen7bAvf8lsXTwaQHr4qPrCje3ZhigawQ0=
X-Received: by 2002:a05:6214:598c:b0:6d8:821d:736e with SMTP id
 6a1803df08f44-6e243c674ccmr399961206d6.36.1738627495145; Mon, 03 Feb 2025
 16:04:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122024452.50289-1-royluo@google.com> <20250128014400.7jx4segwn53vjnb5@synopsys.com>
 <CA+zupgwLfzDvVF+5psdbuUgZb_mCNqXtxS5=b1RtTAjQKq6AuA@mail.gmail.com>
 <20250131234407.fyv4iu5yadp5xeg2@synopsys.com> <db8819b7-05d5-468d-8974-3dfae25bbb2b@rowland.harvard.edu>
 <20250203235416.nkhxutxywzu646kg@synopsys.com>
In-Reply-To: <20250203235416.nkhxutxywzu646kg@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Mon, 3 Feb 2025 16:04:19 -0800
X-Gm-Features: AWEUYZkApqtKGZHkcx2izTgQVgNosyAIzfkyNtxx49oWQQcmxhx3Zbq5m1y5NGU
Message-ID: <CA+zupgy3VZzDcz93WxGNMvjOKA8UufQPZRy9boP5w1thM_2ngg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 3:54=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Sat, Feb 01, 2025, Alan Stern wrote:
> > On Fri, Jan 31, 2025 at 11:44:17PM +0000, Thinh Nguyen wrote:
> > > Cc Alan
> > >
> > > On Fri, Jan 31, 2025, Roy Luo wrote:
> > > > On Mon, Jan 27, 2025 at 5:44=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > > > >
> > > > > On Wed, Jan 22, 2025, Roy Luo wrote:
> > > > > > `dwc3_gadget_soft_disconnect` function, called as part of
> > > > >
> > > > > The dwc3_gadget_soft_disconnect() isn't directly part of
> > > > > device_del(&gadget->dev). It should be part of disconnect.
> > > > >
> > > > > Can you provide the full sequence of events so I can have more co=
ntext?
> > > > > The handling of the flushing of gadget->work should not be part o=
f the
> > > > > dwc3.
> > > >
> > > >
> > > > Yes, it's a part of disconnect, and disconnect is a part of gadget =
unbind.
> > > > Let me try my best to explain. Here's the call stack for usb_del_ga=
dget:
> > > > -> usb_del_gadget
> > > >     -> flush_work(&gadget->work)
> > > >     -> device_del
> > > >         -> bus_remove_device
> > > >         -> device_release_driver
> > > >         -> gadget_unbind_driver
> > > >         -> usb_gadget_disconnect_locked
> > > >         -> dwc3_gadget_pullup
> > > >         -> dwc3_gadget_soft_disconnect
> > > >         -> usb_gadget_set_state
> > > >         -> schedule_work(&gadget->work)
> > > >
> > > > Then when usb_put_gadget is called, gadget could be freed before
> > > > gadget->work is executed.
> > > > -> usb_put_gadget
> > > > -> put_device
> > > > -> kobject_put
> > > > -> device_release
> > > > -> dwc_gadget_release
> > > > -> kfree(gadget)
> > > >
> > >
> > > Thanks for the details!
> > >
> > > The UDC core is initiating and handling the gadget->work, so the
> > > flushing of the gadget->work should also be handled there.
> > >
> > > Since the usb_gadget_disconnect_locked() may trigger a state change w=
ork
> > > on unbind, the flushing of the gadget->work should to be moved to
> > > gadget_unbind_driver() instead:
> > >
> > > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/c=
ore.c
> > > index f8c1ef465e45..9e4abd6e40f8 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -1568,7 +1568,6 @@ void usb_del_gadget(struct usb_gadget *gadget)
> > >
> > >         kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
> > >         sysfs_remove_link(&udc->dev.kobj, "gadget");
> > > -       flush_work(&gadget->work);
> > >         device_del(&gadget->dev);
> > >         ida_free(&gadget_id_numbers, gadget->id_number);
> > >         cancel_work_sync(&udc->vbus_work);
> > > @@ -1694,6 +1693,8 @@ static void gadget_unbind_driver(struct device =
*dev)
> > >                 synchronize_irq(gadget->irq);
> > >         mutex_unlock(&udc->connect_lock);
> > >
> > > +       flush_work(&gadget->work);
> > > +
> > >         udc->driver->unbind(gadget);
> > >
> > >         mutex_lock(&udc->connect_lock);
> >
> > What about instead moving the flush_work() call down just one line,
> > after the device_del(&gadget->dev) call rather than before it?
> >
> > The work queue doesn't need to be flushed every time a driver unbinds
> > from the gadget, only when the gadget is about to be deallocated.
> >
>
> That sounds good to me.
>
> Thanks,
> Thinh

Thank both of you for the review!
I've sent out https://lore.kernel.org/linux-usb/20250204000102.3989779-1-ro=
yluo@google.com
per Alan's suggestion.

Regards,
Roy
