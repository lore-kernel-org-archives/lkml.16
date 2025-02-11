Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD981F03C8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234499; cv=none; b=CHkjvpr4HDly8D/WzQS9ktd1ULR6ZNolpSumdgOYbFVX6l/IBWeZnwitW2en9GFKlZtoy31omI9rDOj1/uNFqLYO6Mtf7QFzfuL/OctBwobiYHdKaN92MmVvERI8xaiVsVz/wvaXWhsRxLV+tBbwBrhyIeUbTcMyyU15s/ediKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234499; c=relaxed/simple;
	bh=EIFh1VS+tmyV8MWJnttmdKzNbkF0v1mKqFsWzLP6HZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFDDhEzmDW5CQAaids8A6dlIZGUyJTig3Or3mTxwiUgvmn97lTD2RuKuHnW8lT1T/Ov/yZ5gLFuBN/oI0amCJivw++WnqhzNTOqpBTFlBGucFe0IELEQBbMhTWsGrMg8dRZwFTPcUiPicCn+gx9qepuZWDuwqCIjp564FTciJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cD2/nV1r; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cD2/nV1r"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3a6ee569cso508672b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739234493; x=1739839293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTYdSbxG8yUDg+dbsh8BpVlCJuplQ2b0sQujpaxyPas=;
        b=cD2/nV1rRJLhr8veJBR/13ah0l5HgCaA1sLX8e4RgmgXBNStxW4y0HUKTpqrsSPSpI
         8qSohd6U0o4qiMqDDT9tgkYlFAqPwUfFLqdpdmKgLR6l35crUq/4dnTupeIYLROblyOP
         U24r9wqvlv5b5/2vFUYVXOgqZVodTHkyRU1o+eo+e8UfUbZqh81l620cVIcAHbuLNh2m
         czNirfYgwVJzdAMkmlDfd1G3OZFRZIWyarTm7hnlzn75rcl0OGSPfPxZq5ygbrN+h4ai
         NjJpwsvRi0MiabAOe74pc0RDeFwxMfcTzBMPfvIXIbZv1HDDH1AiW+OEs+BXqOLVVkb0
         MIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234493; x=1739839293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTYdSbxG8yUDg+dbsh8BpVlCJuplQ2b0sQujpaxyPas=;
        b=e7kNioMRtn8dBGsSFan5TydcTj6NSG2EZarpjBbNnytqqerv2hoQ94L0fsKTF3KIpd
         jPgKMHVs04GvjUt2B4ri8WXwDTx2luVwZjZmiSKoaZ8rpevOw+vyPjiM4Zx2KMoZ+XmX
         vY72LuIQT9XMjIYetMC5iCVsgrIU/DkmYZ22GzEo6M3dXjDdbM2dYP54hsWDAsUmAFSZ
         Al3fO+T+0y0uBesySwDHA3C8rhWGoWbl/3tsksSmSpirjBtBVygIythPkiubG2fgNA+q
         3e7jXzmoHSbaTW/lWDldRfZh22EhlgwET2n57ibmPNFxiiNOES77FSXou/KvNf6in7CA
         IvVw==
X-Forwarded-Encrypted: i=1; AJvYcCU5mfoE+wM3EZXJHHBMcCXHvU9uimTLSTyFgI0E0cwPtirKASphyvGgI6qqH8Z6gGRv9fh6uGD5LFRHOgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0ZR3GIVWrNB6qb9pTKj5iaZ3sPtrlAj42X04/SU9sTBFpWYe
	qzQKQ+QtsEkL1Ssf675h92tLIA2lGm6Ja4TRI8tZZ6wMJEJUsOl+ad4tc0rXVOXTea5rwg6Xidi
	tYffO4MfmKIT/KZDnB87itqwxzuIGqWSMKc+S
X-Gm-Gg: ASbGncvNMJ/WPzdX2LcQDZI6a6uvwNB8WPxjzEw3+wYGXGRjzqnJNvQ+SLJGDZFCkbP
	9O57ubIKTQrJsmDZ50Jm7BEG+bznhux/K68Ep56tHRd46Yuis7QSCAm+YGkV8vxE8Yil08WHN9G
	+lpjy+ie8IOkWSPuZWLc5eX+kkBIMdDw==
X-Google-Smtp-Source: AGHT+IHKpDcNbK8l8Cif7Teq0zW4ncPo2hFh+SJRVAe4zwcaAY56zpp5E+WA4yh8LAB2rBdI4b+XQdbiNWT4LJZtsSQ=
X-Received: by 2002:a05:6808:1701:b0:3ea:aa8a:c121 with SMTP id
 5614622812f47-3f39233f5c5mr12325831b6e.22.1739234493210; Mon, 10 Feb 2025
 16:41:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208033129.3524423-1-badhri@google.com> <20250211002155.62lyfqjlygod7cdp@synopsys.com>
In-Reply-To: <20250211002155.62lyfqjlygod7cdp@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 10 Feb 2025 16:40:54 -0800
X-Gm-Features: AWEUYZlBGWpL05YGugXdws7E7XtDkVKCf7mI5RDSxg5eqkUq0ieRg_9FmSAS7CU
Message-ID: <CAPTae5LisYMjx63Jz_xmZ9zA5PtaxRA49gh2FA-fONsJ12sXeg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

.

On Mon, Feb 10, 2025 at 4:22=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Sat, Feb 08, 2025, Badhri Jagan Sridharan wrote:
> > While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in
> > event cache") makes sure that top half(TH) does not end up overwriting =
the
> > cached events before processing them when the TH gets invoked more than=
 one
> > time, returning IRQ_HANDLED results in occasional irq storm where the T=
H
> > hogs the CPU. The irq storm can be prevented by clearing the flag befor=
e
> > event handler busy is cleared. Default enable interrupt moderation in a=
ll
> > versions which support them.
> >
> > ftrace event stub during dwc3 irq storm:
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handler_exit: =
irq=3D14 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handler_entry:=
 irq=3D504 name=3Ddwc3
> >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handler_exit: =
irq=3D504 ret=3Dhandled
> >     ....
> >
> > Cc: stable@kernel.org
> > Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in event=
 cache")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/dwc3/core.c   |  2 +-
> >  drivers/usb/dwc3/gadget.c | 10 +++++++---
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index dfa1b5fe48dc..6df971ef7285 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1835,7 +1835,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >       dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
> >       dwc->tx_max_burst_prd =3D tx_max_burst_prd;
> >
> > -     dwc->imod_interval =3D 0;
> > +     dwc->imod_interval =3D 1;
>
> Use dwc3_has_imod() to determine whether to set this. Otherwise we get
> a warning on setups that don't support imod.

Hi Thinh,

dwc3_check_params() which gets invoked after dwc3_get_properties() at
https://elixir.bootlin.com/linux/v6.14-rc1/source/drivers/usb/dwc3/core.c#L=
1851
seems to already call dwc3_has_imod(). Do you prefer me to add an
explicit check here as well ?

Thanks,
Badhri

>
> >
> >       dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
> >  }
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index d27af65eb08a..fad115113d28 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -4467,14 +4467,18 @@ static irqreturn_t dwc3_process_event_buf(struc=
t dwc3_event_buffer *evt)
> >       dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
> >                   DWC3_GEVNTSIZ_SIZE(evt->length));
> >
> > +     evt->flags &=3D ~DWC3_EVENT_PENDING;
> > +     /*
> > +      * Add an explicit write memory barrier to make sure that the upd=
ate of
> > +      * clearing DWC3_EVENT_PENDING is observed in dwc3_check_event_bu=
f()
> > +      */
> > +     wmb();
> > +
> >       if (dwc->imod_interval) {
> >               dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), DWC3_GEVNTCOUN=
T_EHB);
> >               dwc3_writel(dwc->regs, DWC3_DEV_IMOD(0), dwc->imod_interv=
al);
> >       }
> >
> > -     /* Keep the clearing of DWC3_EVENT_PENDING at the end */
> > -     evt->flags &=3D ~DWC3_EVENT_PENDING;
> > -
> >       return ret;
> >  }
> >
> >
> > base-commit: 9682c35ff6ecd76d9462d4749b8b413d3e8e605e
> > --
> > 2.48.1.502.g6dc24dfdaf-goog
> >
>
> The rest looks fine.
>
> Thanks,
> Thinh
