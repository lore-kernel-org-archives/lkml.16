Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4522A1CA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744839; cv=none; b=afTWFfaktcKr9kOevldeNZqolaTIM0hjd5ISf1oh+fhQo1N3aycof/JwTpSCzWMeCU2LY/fiHLJih8bYxB4XFkNsn+Ovhjz5Lm4VkpQ2ZnIymyOT9QRuNaTUREwz6wf/Bhz6aUG9YGAyIjCACp4oJtcujUPES3dth0hOqV5Pk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744839; c=relaxed/simple;
	bh=nc9vtekczR3AzqE+YNS3FhR33YVnADkRT4pnQITnIO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2sF9B2Id+iPcrueQEaFff64PNr8vzY9Q5kuo3fBJUOQVVj9DJ6/64WvEOmicMD47dmZfjM7FJgMrEBWPwDB7bEgICNfO89YvQ1qbTZqNkE0JohefRn5ulm0OzaD8LbaQaoQK2w2hT8f73BEy1N0eNniZcX+PeyyVxUbK3JVniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2/GIsUA; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2/GIsUA"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71e157a79c8so1759542a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738744836; x=1739349636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHvpzKGRstKu7+Rdf4MnzMEr2y24O/yubCCOtQf+0ro=;
        b=H2/GIsUAkikzJ8hJcem3jsv/2QmsfZBSwjKpwHp5N/iajjFddAKgJwlU9iox6l943S
         XJPeTCh4F20+thhHWXu6JwzargczBv4mQW/1Fi3JO4tjmKBfSrq4qLihatkni1Y1C5W0
         W4WkaRGB5KZkk2lHrYRkYlsImEhHV9bU4ltE0Ai0yHDzfpG/xw0BRv5rpTOtI50SbMMo
         6l69fwT0u4VC5FL31C7BACjc0A5ih+KFPXmq1bEpq4qydOj8j09yG907F/Y+S79LAQOf
         wEc9nXZEtZBqV9mz1pA0S8s+JhMx415PIFLWvFqtJezIX1DpQh+fzrBI8mGkj8z57Np/
         RzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744836; x=1739349636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHvpzKGRstKu7+Rdf4MnzMEr2y24O/yubCCOtQf+0ro=;
        b=v3Wd7rGZo5O5yBHVI87Q+TjCB85YGiwgXAOV87rVA6ECorXYfjas7oi6MbhB3VCipP
         k91q4rwLFS3cKXR6TtHETRdf9XFVLtWN0EGAtLU1LUi11oVyJMyycRh8LzoSDDYOlatH
         BZzxOKyRhU5fOuy2z3bsRtqp87HrypxjoUepHXW+J/QFAr0nSgyvAICdm+6Sq6S++0Z0
         BESc/qNiUV9Lkyy2qQBkEcu1MpoIIauaN3m/vO5yPhEbeJnedjCGOrg1NuAQHH6e/DQJ
         wVrLVsH2KqjEjhDS3OfTnNZ+mO/XBdH+YvtGNK78S1nNqveeG6WWS1S6hDyqbc1QakZS
         KMAw==
X-Forwarded-Encrypted: i=1; AJvYcCX1VZEhVj2t0ycLFrgfVLPFloWuHd+2s2wxeF3rOueXW7YAaW+YQCb/MIILv8BbXolyQ8ZxmwE0r2wnydU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7nIDVp6MXnfkF+qzj9uQTKtMEEp4AMgdTAH0a4aNEYvMga07
	yfM4KvGCltU/7hrf22VEKRqElvyNNPbugoZBVsEUt0OqsM2KVF/xQTeDDO3VwDpPj0rOFhXGVAh
	v6nUcrfDsPW3HvZ5DiT6l/t4EkuI2DdeJNxVu
X-Gm-Gg: ASbGncvA7jt0LqbDlJV317Y6B+EK0b8VoN+GNgj8coGiAhlIg7EQ7hXgEb+pqcaM48y
	vVaQmPv96YawPJF9dPEf8Wn4M1A4Ue/jcsWgTZYAggnj5fSzg8H+yNwxEuHQ3EaQkqeoOcEoFr5
	/m0SF40CPC1k9LU4WiqUnpiUFZZzk0
X-Google-Smtp-Source: AGHT+IGHMEE4ziJA3O5Dv0ZwsMrxWkRsD8+UATY8NrtcImvYml3tNs2ZcrcpS1j3JPSXB8nR9Ja83CWGnhZ3uVusCVQ=
X-Received: by 2002:a05:6830:3698:b0:703:7827:6a68 with SMTP id
 46e09a7af769-726a414a4dcmr1477342a34.6.1738744835695; Wed, 05 Feb 2025
 00:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202035100.31235-1-badhri@google.com> <20250202035100.31235-2-badhri@google.com>
 <20250204004638.cacmapvsp5vlewir@synopsys.com>
In-Reply-To: <20250204004638.cacmapvsp5vlewir@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 5 Feb 2025 00:39:59 -0800
X-Gm-Features: AWEUYZnhrHhXAL0UCg7Qlui2rzLw0o6ZthpFr2dzKgv9dQAZnbdyhhEQ_fdnjvc
Message-ID: <CAPTae5JJ11DFA=HT0xaxQXzNjO_ne0U6T43EowTRRToCKc7GxA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: core: Obtain imod_interval from device tree
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	John Youn <John.Youn@synopsys.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:46=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Sun, Feb 02, 2025, Badhri Jagan Sridharan wrote:
> > Although commit cf40b86b6ef6 ("usb: dwc3: Implement interrupt
> > moderation") adds support for interrupt moderation in device
> > mode, it does not add an option to enable interrupt moderation
> > unless the version of the controller is 3.00a where the
> > interrupt moderation is automatically enabled. This patch
> > reads the interrupt moderation interval counter value from
> > device tree so that the interrupt moderation can be enabled
> > through the device tree.
> >
> > The explicit initialization to 0 can be avoided as the dwc3
> > struct is kzalloc'ed.
> >
> > Cc: stable@kernel.org
> > Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/dwc3/core.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index dfa1b5fe48dc..be0d302bbab7 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1818,6 +1818,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >       dwc->dis_split_quirk =3D device_property_read_bool(dev,
> >                               "snps,dis-split-quirk");
> >
> > +     device_property_read_u16(dev, "snps,device-mode-intrpt-mod-interv=
al",
> > +                              &dwc->imod_interval);
> > +
>
> This value will get overwritten in dwc3_check_params() for DWC_usb3
> v3.00a.
>
> >       dwc->lpm_nyet_threshold =3D lpm_nyet_threshold;
> >       dwc->tx_de_emphasis =3D tx_de_emphasis;
> >
> > @@ -1835,8 +1838,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >       dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
> >       dwc->tx_max_burst_prd =3D tx_max_burst_prd;
> >
> > -     dwc->imod_interval =3D 0;
> > -
> >       dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
> >  }
> >
> > --
> > 2.48.1.362.g079036d154-goog
> >
>
> Do you need a property to adjust the IMOD interval? If not, just enable
> it for all capable devices (dwc3_has_imod) with IMODI of 1 for now. It
> should be good to have it enabled for all capable devices by default.
>

Yes, IMHO it would make sense to have a property to adjust IMOD
interval for two reasons:
1. This would be then identical to the "imod-interval-ns" property
that's used for XHCI based host mode controllers.
2. Also, potentially allowing the controller to interrupt once every
250ns might not be desirable for all platforms and should be left as
platform tunable to fully realize the capability of interrupt
moderation which the controller offers again similar to
"imod-interval-ns" property in host mode.

Along with this I will also set the default value to 1 in my v2 which
I will send out shortly.

Thanks,
Badhri

> BR,
> Thinh
