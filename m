Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46E820E004
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744405; cv=none; b=tULPWnjR28ER120gDHkjgVbEZ7sbMo/zTuWjKLlZ5C7KqvUy4BAwq3qmvA4Ofx5pdyH8P3i5dn+H+18teEG4lVDsE4tM1zC+McjupLaJ3yqOiGYvbRTY0ayCjFjQ3Tv+CREvDQTsmWUqnJgxjZTnCfwb49zmQgkJyf7SASQdivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744405; c=relaxed/simple;
	bh=LlEdYd4ygz+o1YGRiZov8vFIz6Np5NaBUJAwadGda5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEzqjfd9SqqSwYSzajVTiWRZ4PpRqfpC2+fzmkt05vbgxBHijtEnHo6KsF/ISwURSTvErxtgRVBOfGL7PvhLVpfQybf/1zBtHkCbf3PT0XA5SLSfnMk4Ed1ysi45puJirzTNBrkWyA90JxIdtlnvlp5ssP7NZvn0vHtcqpj/+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TIYjm6Rf; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TIYjm6Rf"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3eba5848ee4so1652484b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738744403; x=1739349203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMUc5Ufll9rw5kictwJr8ttvujGSAgAYNkyTuGO2LIM=;
        b=TIYjm6Rfs+9fgIwfVNl10YMO3VmKUQu7sIT+WL5X9yQTwlYW9dss5fP40KhAx1DTd8
         mLYxwu2vJkmwp98dixEU/sSe7S81Kdf1rCEjJTSI7RLyRJiyBLiKpNI+kERmHTEmXvY/
         X/kATWqmpNJDyGt4+rC1T4BjIGVE8kvMqyxMgpQUMqw6RVNfIYRloI4oNVCYiB0lIgCl
         UXhgDdt+f+oqh+X9VUgooXmDvuJNk3DLZ5fJMZC+1bS4ruQASUGM4YNiNywKdrwEKuNL
         Cfj6OPB2MRgF/UDSAAiJzQpzug5hxFr6HveOZobFnNzJEeOkTMCkjkTqcpkYgo/Ur2Vm
         zpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744403; x=1739349203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMUc5Ufll9rw5kictwJr8ttvujGSAgAYNkyTuGO2LIM=;
        b=T9DUoaASsV5d2qjU5VHtg/Brw4/QHmUB/qnhmSrUYwGC19fGLRG5MVkYFrDRRySVDb
         HmD4q7BVcgcjrHz88f79NS9ncuZsOJsCMsCyr/o+0rAA7DYK38ri1LaHDecG0jYdpPff
         teS0mJhcNRNlWjrl1CYAem5BABiUv7FK9dQXBUAKPL+c6XDR2dduUa3jgfLjF+4QUgZm
         BJvF8840Qs4AkVA5Qj3ON5U3FUeJX0F0CXLwCHrFkq2rXbMIBRy2ldq3zpwnFA3FAUEB
         RmOAS88rkJ1pOxzBh62ap9dXzHx9VyDW40KRDWvxbIS1etCDqx4DJQ5fpI8iRB5H/Gg/
         3emQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz70DBrCzkvQPfMlMPNv3Chf7Vu8dG2QKpr9Sw6M1M9XtQm/mhVbnWwQ9LSe2JTNtSqAzRVOl1YBK7QKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+djyZih9e4zhYdW9dcNSRO3xfAfL08yD7iiXHe3UK39hniXfW
	zYb1mOFtulTR6oGdYR7qCyK/mHHKEWEi9oieHw5ybfjavYay3/gLex3wNMXs0PYkWmhdKniqCma
	99GAlk86FuqDrrlT5Empa6QzVME1KSQtPletg
X-Gm-Gg: ASbGnctgM3ASWrx+5NC3vMxCyVE+pZNk4pkk0zqcfBxEGTueaMQkIbK3dr1OqrSoIgM
	p/CVzJz4bmOfvBs7+NAD6+SgQTPp3brbVxpSaScCbfqJQubB6N4Txo9VR8FFMA1Y6gna9cESPf9
	QDtK4H2C1PsjThgo66VkY8zgmdYTKw
X-Google-Smtp-Source: AGHT+IELC4iozk9QaY+1rPmAg6VS84pTGLrGWhVSZ/ro3zhARta87PJtalC3nI/hHS4F/ZxKJJdz5xjm67CdlTYi7RU=
X-Received: by 2002:a05:6808:2128:b0:3ea:57cf:7c26 with SMTP id
 5614622812f47-3f37c13d292mr1074613b6e.19.1738744402656; Wed, 05 Feb 2025
 00:33:22 -0800 (PST)
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
 <20250204002238.prkgpq3w6c6ck6a4@synopsys.com>
In-Reply-To: <20250204002238.prkgpq3w6c6ck6a4@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 5 Feb 2025 00:32:46 -0800
X-Gm-Features: AWEUYZkE6v9btx87bIyhQmtlcXO2kIetuDDZLswFcgNL4vVoOfASAL6Cx6Ube0g
Message-ID: <CAPTae5K7fdUPsDp-S8uOfrOrN5Pqfd91bw+UN=h65sjrTvFdzg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:22=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Sat, Feb 01, 2025, Badhri Jagan Sridharan wrote:
> > On Fri, Jan 31, 2025 at 4:09=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > Hmm... Can you try this instead:
> >
> > Thanks, this seems to be working !
> > I also sent out the following as there isn't a way to enable interrupt
> > moderation through the device tree node:
> > https://urldefense.com/v3/__https://lore.kernel.org/all/20250202035100.=
31235-1-badhri@google.com/__;!!A4F2R9G_pg!e6BA5h7M1-HZjrH2-bLVF0YbmzStu9ASv=
1lkZudrnyX2RFDlDUnrlFCgMdbwXcbTrMsVUQvgnpRmYxmcV-w$
> > https://urldefense.com/v3/__https://lore.kernel.org/all/20250202035100.=
31235-2-badhri@google.com/__;!!A4F2R9G_pg!e6BA5h7M1-HZjrH2-bLVF0YbmzStu9ASv=
1lkZudrnyX2RFDlDUnrlFCgMdbwXcbTrMsVUQvgnpRm9hdUtjE$
> >
> > >
> > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > index 0fe92c0fb520..c1b5a3742ab4 100644
> > > --- a/drivers/usb/dwc3/gadget.c
> > > +++ b/drivers/usb/dwc3/gadget.c
> > > @@ -5737,14 +5737,20 @@ static irqreturn_t dwc3_process_event_buf(str=
uct dwc3_event_buffer *evt)
> > >         dwc3_writel(dwc->regs, DWC3_GEVNTSIZ(0),
> > >                     DWC3_GEVNTSIZ_SIZE(evt->length));
> > >
> > > +       /*
> > > +        * Keep the clearing of DWC3_EVENT_PENDING after the interrup=
t unmask
> > > +        * but before the clearing of DWC3_GEVNTCOUNT_EHB.
> > > +        */
> > > +       evt->flags &=3D ~DWC3_EVENT_PENDING;
> > > +
> > > +       /* Ensure the flag is updated before clearing DWC3_GEVNTCOUNT=
_EHB */
> > > +       wmb();
> >
> > I still have one more question though :)
> > Wondering why not move this code about the DWC3_GEVNTSIZ write where
> > the interrupt is actually unmasked that way this would also work for
> > systems which dont have interrupt moderation enabled right ?
> >
>
> It's mainly for PCI devices. PCI devices sends assert/de-assert messages
> to represent the level interrupt for PCI legacy interrupt. The de-assert
> interrupt message may not be received right after masking the interrupt,
> such as due to system latency. This may trigger a scheduling of the
> TH again. If there's new event received during the TH, this will cause a
> race and dwc3 driver may overwrite the cached events (a window between
> clearing the flag and unmasking of interrupt).
>
> We may have a potential issue for platform with devices with shared
> interrupt too (though I haven't seen report of this issue before).

Thanks for the detailed explanation Thinh ! Appreciate that !
I am running more tests before sending out the V2 version of the patch.
Should be done in another day or two.

Thanks,
Badhri

>s
> BR,
> Thinh
