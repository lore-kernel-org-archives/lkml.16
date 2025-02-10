Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469EB264619
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220395; cv=none; b=ERh9SN0XKl0FaczIbiK1qsXnK1GiIonEyA0GvTv8WBHDhl/DHoqdbi5cuElPX1FgvS320qdq5SEaSjTK3TBzNQchvbABtH48YIF5BC+OHV4KU0X1tEIkM84fnuhJ9+LN/qsciYFdnlhq74f2BojOR0VcrmRH1s7l+kSrsU8eeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220395; c=relaxed/simple;
	bh=YjMg18iPraSfB7gYeljXFaWdZCQpj6L90GR9hnqeZJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFejKEaT0LF8Yq/Y7Xt+13YGtTerMILk5LktlXVaJxwio6cAFTXb7ES5dXMtCl1eQY4rlUQau9oylH5txZGkCsJ8IurYqQCbm+/4eooLRrk7U3j6AqRRBoHWeig86JA6PCenpzk1Zcf8n2opSIesvF/Zbn5cLyzoCRxy7h8Zaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1xYLKgY; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1xYLKgY"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1276125b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739220391; x=1739825191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTz2G+osBZOI2qrcEz2DubZi9LC3H8MM7P5FUg9ZQ6c=;
        b=a1xYLKgY1kV88uhKncxZY/JQyOcqPFGVLXf38RMeie+PkxzOiMm0YI9R1tnVBy/yg4
         SUMP+mXf/dVYfBfAhhoyd2r58idWsJQnY516CD7c8w77BAQ2LnafvD2FmZvihQ7+JiaZ
         lqV4aug/9JsDjJQ/op1ePwNS1Ty3uXFEUmg4oZ2wmybc7sslf+nC1Y1cXZoYjyR49qJh
         pkm7M6ym9E8S386S8npcTI4gb4liI6ic4Q1ISyTBjmJUNf0LA+eoLB7yrVReVcjCcKme
         hpX3JcUz7oFsoO3VZoL6yjEJm5E3AWbC6SuiHOBQ5ocJ+iwofGXmz+ER8zNQy0xIdz09
         qQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220391; x=1739825191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTz2G+osBZOI2qrcEz2DubZi9LC3H8MM7P5FUg9ZQ6c=;
        b=vHiSSM6wx83e51b5UrgWMZsEBqvUBE+U85Q7T1JVI8ubSTREL9KlQfPHuRNTC7/F9u
         rA2rfb5mEcDS7dBfFaunBufXMaoNcT7pKmqC9TvCwSb1Emsc5MWbJBuV08LW9Vo7w+Zz
         URm58rqgEH/Kf61uqhKQs88Ur6zT2IgvsjqsxXnWIpZoFBEM6hUSp1S33ok0QRIhdNXA
         v3hS1pN0C2mfyZIge44X8e8L5aUKIPdzXS78b5MA6oQJkJ9m2K6nyjVS2U87B2mz1/gU
         jI5nCL3VrdIfl855wf/VJ5dNQhB10leb3MLC7NepPPMqHt7VRWZA4IY5PUrIv1asVVXb
         Z2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWg07F2O3/NCGztxg++CIsNs6y7/vNUE2Pk9T1j6c/oI7B+IS6CUy+vU+Kt/MYUMIIkWlRUqEYPXLqBYLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5Dw2vyf/y4xf82uPbAPJBKcMI/F1qhMrO7IpedG/L5iMfT1g
	TxXFSq9/B80FInFYT9zUdkV+QzINxFh7HEz86tBH16dsfhb6wOP1ZAbX/22p+VCLlEH+3Lprqko
	31W40LBRlPKKwan5ExmfAGF8V8D8r00M0P+mAdGQZQ9ShJMhQxxSh
X-Gm-Gg: ASbGncuAQlMWJD8Sjzeh3ste1CoOEiQ12FXYPUQ7hlJuY8leoXejYi84B/fEavs/T9J
	2buyaaMrjvaxOiR6MOhuF7eKpG5YJn4dhwMgB5xlu5WXgGNZ2WKz3djPvhbN/NDvKskGjehNpK9
	PB9d9NMoCFAIlmKq3ncH3mozzsgQMPyQ==
X-Google-Smtp-Source: AGHT+IHnT0DCAZ4e+uDewxZGJfHSuvhUI0Jc5UKJf6W79fEDyu/BxP83uIqsn10mC/yrh6HlNKtJBTb1KQuEj4MV5pE=
X-Received: by 2002:a05:6808:1701:b0:3ea:aa8a:c121 with SMTP id
 5614622812f47-3f39233f5c5mr11834469b6e.22.1739220391142; Mon, 10 Feb 2025
 12:46:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124075911.811594-1-badhri@google.com> <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
 <20250130014159.bv7gvtskyg73lxmc@synopsys.com> <CAPTae5JYuogc-mHUi-VdfLAJ4E1z6myGofCvqVCfYxt--VetKA@mail.gmail.com>
 <20250201000926.veukjr6wmhrgl6me@synopsys.com> <CAPTae5Lw8pB=SuGgkfTyk5BNPWwgCVvYssdLwT7vFKgMepsZig@mail.gmail.com>
 <20250204002238.prkgpq3w6c6ck6a4@synopsys.com> <CAPTae5K7fdUPsDp-S8uOfrOrN5Pqfd91bw+UN=h65sjrTvFdzg@mail.gmail.com>
In-Reply-To: <CAPTae5K7fdUPsDp-S8uOfrOrN5Pqfd91bw+UN=h65sjrTvFdzg@mail.gmail.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 10 Feb 2025 12:45:54 -0800
X-Gm-Features: AWEUYZlVgT5TYpYhjZtOHYaZTLE5nZMU_q1hFqZgo0RnoF5jnN2p5SEB47gEj50
Message-ID: <CAPTae5KAwCuE7EREa=k3Sj_xK8fKBbY8tw2Q7b3Yer03E8QQ-w@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 12:32=E2=80=AFAM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> On Mon, Feb 3, 2025 at 4:22=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsy=
s.com> wrote:
> >
> > On Sat, Feb 01, 2025, Badhri Jagan Sridharan wrote:
> > > On Fri, Jan 31, 2025 at 4:09=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@sy=
nopsys.com> wrote:
> > > >
> > > > Hmm... Can you try this instead:
> > >
> > > Thanks, this seems to be working !
> > > I also sent out the following as there isn't a way to enable interrup=
t
> > > moderation through the device tree node:
> > > https://urldefense.com/v3/__https://lore.kernel.org/all/2025020203510=
0.31235-1-badhri@google.com/__;!!A4F2R9G_pg!e6BA5h7M1-HZjrH2-bLVF0YbmzStu9A=
Sv1lkZudrnyX2RFDlDUnrlFCgMdbwXcbTrMsVUQvgnpRmYxmcV-w$
> > > https://urldefense.com/v3/__https://lore.kernel.org/all/2025020203510=
0.31235-2-badhri@google.com/__;!!A4F2R9G_pg!e6BA5h7M1-HZjrH2-bLVF0YbmzStu9A=
Sv1lkZudrnyX2RFDlDUnrlFCgMdbwXcbTrMsVUQvgnpRm9hdUtjE$
> > >
> > > >
> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > > index 0fe92c0fb520..c1b5a3742ab4 100644
> > > > --- a/drivers/usb/dwc3/gadget.c
> > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > @@ -5737,14 +5737,20 @@ static irqreturn_t dwc3_process_event_buf(s=
truct dwc3_event_buffer *evt)
> > > >         dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
> > > >                     DWC3_GEVNTSIZ_SIZE(evt->length));
> > > >
> > > > +       /*
> > > > +        * Keep the clearing of DWC3_EVENT_PENDING after the interr=
upt unmask
> > > > +        * but before the clearing of DWC3_GEVNTCOUNT_EHB.
> > > > +        */
> > > > +       evt->flags &=3D ~DWC3_EVENT_PENDING;
> > > > +
> > > > +       /* Ensure the flag is updated before clearing DWC3_GEVNTCOU=
NT_EHB */
> > > > +       wmb();
> > >
> > > I still have one more question though :)
> > > Wondering why not move this code about the DWC3_GEVNTSIZ write where
> > > the interrupt is actually unmasked that way this would also work for
> > > systems which dont have interrupt moderation enabled right ?
> > >
> >
> > It's mainly for PCI devices. PCI devices sends assert/de-assert message=
s
> > to represent the level interrupt for PCI legacy interrupt. The de-asser=
t
> > interrupt message may not be received right after masking the interrupt=
,
> > such as due to system latency. This may trigger a scheduling of the
> > TH again. If there's new event received during the TH, this will cause =
a
> > race and dwc3 driver may overwrite the cached events (a window between
> > clearing the flag and unmasking of interrupt).
> >
> > We may have a potential issue for platform with devices with shared
> > interrupt too (though I haven't seen report of this issue before).
>
> Thanks for the detailed explanation Thinh ! Appreciate that !
> I am running more tests before sending out the V2 version of the patch.
> Should be done in another day or two.


Hi Thinh,

I have sent out the V2 version of this patch in
https://lore.kernel.org/all/20250208033129.3524423-1-badhri@google.com/
and have incorporated all the feedback. When you get a chance, let me
know if it looks good.

Thanks,
Badhri

>
>
> Thanks,
> Badhri
>
> >s
> > BR,
> > Thinh
