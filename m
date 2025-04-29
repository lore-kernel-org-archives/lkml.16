Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160131EB5CE;
	Tue, 29 Apr 2025 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935921; cv=none; b=OT5D+d/Kz1O1N6ukrQbO99/kBv3AHjmcat7FWrHfQFUkaRvtsgOC7YfwTBqQb/1xxvJbwGNW0CEg2YwrZIZzN/YJDUmj5kBTnz1cOzj6yrhhCeGYcVEmNAumIEb7EctbdbAfaKgijDgUgxdnPrXElGKbHAHWOQS7BLgTRZDPSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935921; c=relaxed/simple;
	bh=0V9jMahAxYW8zbxd2kGc9AaAI9Gd2wiuBQJ9XabL0Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vi+Y8phtzKo5ahB0jQ4WU//PRIn0opBYkn5lDWRGYV5mUNvTCn2UCgx5soI4k2G6l9CO/ZT/Trr7SygNR6k8XMdMuA8zmqXdwInu4AvUlPSvVHUy6u0MvwF+v7pPPyAVqGskllyz2L1VZApcoT0+0XQEM2n3OPMzpquEgLZh0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj/Y042B; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj/Y042B"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30549dacd53so4857674a91.1;
        Tue, 29 Apr 2025 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745935919; x=1746540719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghLO85v0/fKsf8d4D5aFV15vBDjmZGdRu4B7/a9HdgA=;
        b=Uj/Y042B5zObpZ5beVEXHGQcGoqVDvn62MX3F4YIuIFYNyRHFlQuTkv+rQVrN8Chge
         YdEz2qgvat0HJg9Wg2eTU7V0GoZJaTaF4NXzFxtpmubEuc/xXZbypMAp7XmMMdd68wB3
         hcdGHnnpsvh+20y1lwuENU2rPWwjpeBMdF8Bj+lsKUQzSVO/XgnnqG03ZTK2MyeepJ1i
         5G+mGfxSG+luQV7oRYxrkee1KMWwvTDyjrW5xSMTQt1a/hKgjWPN+m++lARstr3LJwl5
         v+1JBHsy9guBoY44OkRRP1vsUfPb/OnHPN/5Sdsf6mRin9ctQRh7k895Atq9sSPwoGQu
         kLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935919; x=1746540719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghLO85v0/fKsf8d4D5aFV15vBDjmZGdRu4B7/a9HdgA=;
        b=qqNY6ZOkNvVP5OqBVtcM5zFhmlQhugxpmRI2f0hmtk0H4IOlNL64n61cXYKbuBwgcG
         BirPg+v4h18AlLSVUSPYp+uMtBNkbX82sY2ckQGL6/8WPsKpELrk6zjvmxuwVd1Qbm/4
         W6J4U/9LTA9UW7lXMx+jbxlM+LOIpxVkS8rxWBd1oqw1av4a/tAWx6jfEUQSnh5itGZw
         5BiJ9IpGdRrYv2Hn5zbjJm1tXWD2Lm/9CFRDtCpaU3F6asbx+r4awHkS/4KfeDz12l0Z
         /ca/6T6XZ69iyNgWdqcNvX87BTXD8rClGIinYne0zsywu14WB3x5NHJoSReJX+LZhW6y
         HG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEFXW8R1Hv9lwMfk5ijMQBuYo/HfZmKUToR/4EDUgT6HuhgqVkmVmCcqj6W/fG55a+bGKdwaAaukQB@vger.kernel.org, AJvYcCWVuGPPZnd1BQ6X2+U+IpvhtVA/DNxFAczVVGsXO3Yh7GB7rv2p0Z4GTqTS+KrjOZ2/36viHzIdsHSsYNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bqgVzkK56QzoL95EV1bwtXQ7VIeONxRxfi66X6Ay2/Lr9DcI
	/8vfn4b8Y5cVVVjZWmW2L7cW+po+E7hn+RD2fQUy60KwY2XB9MjkD1lB0XXWms9r2Dit8+vaWfP
	QdgPXqGtaqAhswRiaJVTDBqxoUMr06rzcGFEgDg==
X-Gm-Gg: ASbGncvRNXoVNj9dnwrf9mDcDsQ1nCdBqjmLDYFZY5WR685mpx+qmmsAbjJBO/tcheM
	lul4eukdzkAmoBCpd6sdw15gIljFlVABvVKG1ucQgh9vGeu2MYMhTHU1xd3Gs6/D3l7lHhX+vMy
	vKbpJlxFKJF+3Yv6G7LHreDmS1uOG0t+I=
X-Google-Smtp-Source: AGHT+IFGIJaXnUPI2CD5vwEPgXqAmwhf+WOG/jajlE048Ga1kc+i4yz/jRP2kw+bf/cOEgkA8sSkOIjBG6LR4KK8qMM=
X-Received: by 2002:a17:90a:dfcc:b0:30a:1ebb:8dfb with SMTP id
 98e67ed59e1d1-30a22456bccmr4003881a91.5.1745935919183; Tue, 29 Apr 2025
 07:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429133310.353977-1-hoff.benjamin.k@gmail.com> <af771944-8236-462f-9097-2bf2336b361c@oss.qualcomm.com>
In-Reply-To: <af771944-8236-462f-9097-2bf2336b361c@oss.qualcomm.com>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Tue, 29 Apr 2025 10:11:48 -0400
X-Gm-Features: ATxdqUF7Aep6o1Op5JSRl8mp6bspZ5TAYbHexXD2Kq22HAs9nao-eQuJ7awo2Hs
Message-ID: <CAMSzxxRfKA0CTi0x_FAohvf8buTJ+eaB-q2+qrnfTd7E6eTwrQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: hid: allow dynamic interval configuration
 via configfs
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Krishna,

Thanks for the feedback!

You're right =E2=80=94 I should not have changed the default bInterval from=
 4
to 10 for all endpoints.
To preserve the original behavior, I'll resend a v2 patch that:

- Sets the global default bInterval to 4 frames, matching the existing
implementation.
- Leaves the High-Speed interrupt-out endpoints
(hidg_hs_descriptors_intout) at their historic 10-frame default unless
explicitly overridden through configfs.

Thanks again for reviewing this =E2=80=94 I'll send an updated patch shortl=
y.


Ben

On Tue, Apr 29, 2025 at 9:50=E2=80=AFAM Krishna Kurapati
<krishna.kurapati@oss.qualcomm.com> wrote:
>
>
>
> On 4/29/2025 7:03 PM, hoff.benjamin.k@gmail.com wrote:
> > From: Ben Hoff <hoff.benjamin.k@gmail.com>
> >
> > This patch adds support for dynamically configuring the polling interva=
l
> > (bInterval) for HID function drivers using configfs. This enables
> > custom HID gadgets with user-specified poll rates without recompilation=
.
> >
> > Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> > ---
> >   drivers/usb/gadget/function/f_hid.c | 54 ++++++++++++++--------------=
-
> >   drivers/usb/gadget/function/u_hid.h |  1 +
> >   2 files changed, 27 insertions(+), 28 deletions(-)
> >
>
> [...]
>
> > @@ -1468,6 +1462,9 @@ static struct usb_function_instance *hidg_alloc_i=
nst(void)
> >       if (!opts)
> >               return ERR_PTR(-ENOMEM);
> >       mutex_init(&opts->lock);
> > +
> > +     opts->interval =3D 10;
> > +
>
> The default value was 10 only for hidg_hs_descriptors_intout.
> Aren't we now making it 10 for all other ep descriptors as well ?
>
> Regards,
> Krishna,
>
> >       opts->func_inst.free_func_inst =3D hidg_free_inst;
> >       ret =3D &opts->func_inst;
> >
> > @@ -1546,6 +1543,7 @@ static struct usb_function *hidg_alloc(struct usb=
_function_instance *fi)
> >       hidg->bInterfaceProtocol =3D opts->protocol;
> >       hidg->report_length =3D opts->report_length;
> >       hidg->report_desc_length =3D opts->report_desc_length;
> > +     hidg->interval =3D opts->interval;
> >       if (opts->report_desc) {
> >               hidg->report_desc =3D kmemdup(opts->report_desc,
> >                                           opts->report_desc_length,
> > diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/f=
unction/u_hid.h
> > index 84bb70292855..a29dcb14f738 100644
> > --- a/drivers/usb/gadget/function/u_hid.h
> > +++ b/drivers/usb/gadget/function/u_hid.h
> > @@ -25,6 +25,7 @@ struct f_hid_opts {
> >       unsigned short                  report_desc_length;
> >       unsigned char                   *report_desc;
> >       bool                            report_desc_alloc;
> > +     unsigned char                   interval;
> >
> >       /*
> >        * Protect the data form concurrent access by read/write
