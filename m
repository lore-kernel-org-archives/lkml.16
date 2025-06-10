Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F820E711
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530142; cv=none; b=OqvaEXiv8LjBzZ1p3QG+uikUyl53yRRExjCV/IjUk4gqjj+vNHAec95bbKfohxGwirikNyx2CM8Iski+9lWn0UZ2ojCE83EqirS/geyEqkMXZDkJKQFdYdZ3b2lv+8cUlkaVQI0zp0ZT6mQ5Nvl/gC5QT0G4ZUBKkU7sb5O1cXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530142; c=relaxed/simple;
	bh=+vjfbM7qqAK0wXxezlHayMmhbq1IaZ9tTIr+C3ezwK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQ+leus2KfPuSjeIE0Q/qzIP+8iaVbfcWSsctVp4MxgJDOlgyaL/1hPNCuOUVBAojIyL6rWHST512yeE+Gps7y1oPlU0lFT3hvehMJfEJwZXFGIb+yox2oqnTbWZ2B/e6jYpDMnj+Bm5uCkt7gbps81Fq7rJjH5sMCJzGVCy8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Vbe6L+zs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Vbe6L+zs"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-552206ac67aso6055309e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 21:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749530139; x=1750134939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed8RxUAjYyp2LZZaxVzqOY+SgZzJQWB9mmLBoWY3jwg=;
        b=Vbe6L+zs/5pWBRPba5ctupjKictxAHVF2LHzhFto7ztoPt8fOo0qOKIZQ2yh/2YNJ+
         QvaVC5rN5HlOU3RyFHLOGZgVMc/SAjxddb1VIQjtAUxDFBDa8dajgAXcgLAGxTF0uId7
         2XLKmfafjYxerKNemsh6XXc80jHFTXXLZWUNvNfQrpdxCtY7iuQi9fSnhLEnLVgm/xVk
         GnI2z1XO2A/DkZZbx2ZUHA99SyU3SVz43JvuHpbPPHtTgyR+AO6cf8Ar1zXmahdyP6Tt
         OpVvUUa1UD1Do7SLBUGAH2wf0J3Aek4QwRcbrK8u8upD22Kw6B9XTcNhFlpzrbi+NCRq
         YukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530139; x=1750134939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed8RxUAjYyp2LZZaxVzqOY+SgZzJQWB9mmLBoWY3jwg=;
        b=U2Qn/mCc8W63Bb+36d1Nx7RIGrk4x5/EpRxzBDDTPFtgQVKeX4O5LKnsIiptXBh+N/
         zmgpjWMM8i/3Ee7KRpdEHwBV35t0alGIS1OYdh+Q/uBWiAwT485VzRoCqaAvichTDlsL
         mo7HoMAzimAsMGRtJfPGlezay64lCmPWW5eFB6TkypQurWVwHZaVr3VHAAA8vo3NfWwg
         aTgA1YmsaCtYcqQJUGxhTDLkFjUYMec2vAyCXyRLs3cxixhxtqKp/P2YSh7Lzj7Y9yYW
         JB99hiyBAAzmCEsiI5UlSnw5kOsx5jVyXf7w9eup+/dXlg6n9NG/7SE+CIWpPKJ5v7ri
         YLjA==
X-Forwarded-Encrypted: i=1; AJvYcCVYEAf6m3nWc9opQfcR53OMdlGnDjMRCfUxFF0h+qWaM7XSGu5jnkDn5P2jYkjv86R3ixfiIiLl5HqPRIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIlW3Jk9Z3hH5N74jrIibg9Uw9HSlmKKzHM78knRUHDqWV8y6
	vferjpowkt0EaVRWOvi2nRQ4iJunr5OzaXaD7p2r2kLswJzZiKLefyZUcLwA1x05NZAbev0NXZr
	rO+/8m3wjymRID5UMQeOEjt3LLoorXRo34eRfmuaHCQ==
X-Gm-Gg: ASbGnctxMGOvPV1/sS2wsuih6LWEKJKcLk8V5Lb+xI/LINXGAYFPOHBvShiRVHrHE6Y
	O1gU/udl9mDPv9w0fZnIzBxKXNNQbIav57l+eHiUGj1FYcWyp+slnw0ONtCRswyubu49V6xLE7Y
	g7YzzfirbIfZAykoXrlBSsWsu+rKduzoOEFFsaiACTLXy/
X-Google-Smtp-Source: AGHT+IFxFmkHQ3fGwNL4owR0g3OIQgJ/V8z3FZMMkX4FuLFUg5JQYB9HKU+r2AMKe1MFWDs5KmtPabb7AI8QwZPozUs=
X-Received: by 2002:ac2:4c4d:0:b0:553:3a0a:1892 with SMTP id
 2adb3069b0e04-55366bee654mr3830038e87.15.1749530139008; Mon, 09 Jun 2025
 21:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com> <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
 <CAK9=C2XJwgsC5AK-eVOHQqN1tPxtrsTjVoKdHgALbREv=sb8zQ@mail.gmail.com> <aEc-SHvL187xdj-m@smile.fi.intel.com>
In-Reply-To: <aEc-SHvL187xdj-m@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 10:05:27 +0530
X-Gm-Features: AX0GCFs_6x-PmQkIdN0TNx_kOYhGk1jP9YjELf3l8YvJWCRscxqU6ceG469MS-c
Message-ID: <CAK9=C2VjOZ22smYdxDg1bjnx-+wwjngEN3c-iOpdtaADFcQ0+w@mail.gmail.com>
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jun 09, 2025 at 05:59:40PM +0530, Anup Patel wrote:
> > On Wed, May 28, 2025 at 4:23=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:
>
> ...
>
> > > > +#include <asm/sbi.h>
> > >
> > > asm/* usually goes after generic linux/* ones. Why here?
> >
> > I am not aware of any such convention but I will update anyway.
>
> It's just a common sense. We include most generic first and most custom a=
t
> last.
>
> ...
>
> > > > +static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 a=
ttr_count,
> > > > +                         u32 *attrs_buf)
> > > > +{
> > > > +     struct mpxy_local *mpxy =3D this_cpu_ptr(&mpxy_local);
> > > > +     struct sbiret sret;
> > > > +     u32 i;
> > > > +
> > > > +     if (!mpxy->shmem_active)
> > > > +             return -ENODEV;
> > > > +     if (!attr_count || !attrs_buf)
> > > > +             return -EINVAL;
> > > > +
> > > > +     get_cpu();
> > > > +
> > > > +     for (i =3D 0; i < attr_count; i++)
> > > > +             ((__le32 *)mpxy->shmem)[i] =3D cpu_to_le32(attrs_buf[=
i]);
> > >
> > > Don't we have helpers for this? They are suffixed with _array.
> > > https://elixir.bootlin.com/linux/v6.15-rc6/source/include/linux/byteo=
rder/generic.h#L168
> > > Don't forget to have asm/byteorder.h being included.
> > >
> > > Ditto for the similar case(s).
> >
> > The cpu_to_le32_array() and le32_to_cpu_array() helpers update data
> > in-place but over here we have separate source and destination.
>
> Fair enough. Perhaps add something like memcpy_to_le32() / memcpy_from_le=
32()
> or alike for your case?

Okay, I will add memcpy_to_le32() / memcpy_from_le32()
in include/linux/byteorder/generic.h and use it over here.

>
> > > > +     sret =3D sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
> > > > +                      channel_id, base_attrid, attr_count, 0, 0, 0=
);
> > > > +
> > > > +     put_cpu();
> > > > +     return sbi_err_map_linux_errno(sret.error);
> > > > +}
>
> ...
>
> > > > +                            sizeof(mchan->rpmi_attrs) / sizeof(u32=
),
> > > > +                            (u32 *)&mchan->rpmi_attrs);
> > >
> > > Why casting? What about alignment?
> >
> > The RPMI attributes (aka struct sbi_mpxy_rpmi_channel_attrs) are
> > a collection of u32 attributes hence we can also treat rpmi_attrs
> > as a u32 array. Further, the rpmi_attrs is XLEN aligned within the
> > struct mpxy_mbox_channel so no alignment issue with the casting
> > on both RV32 and RV64.
> >
> > If we want to avoid the casting then we will have to use a temporary
> > u32 array plus additional memcpy().
>
> OK.
>
> ...
>
> > > > +     if (mbox->msi_count)
> > >
> > > Is this check really needed?
> >
> > MSIs are optional for the SBI MPXY mailbox so we should only use
> > platform_device_msi_xyz() APIs only when MSIs are available.
>
> > > > +             platform_device_msi_free_irqs_all(mbox->dev);
>
> Hmm... I am not sure why. Do you have any Oops or warnings if the check
> is not there and no MSI provided?

We don't see any oops or warnings. This check is to avoid unnecessary
work (such as acquiring lock, checking default domain, etc) in the
msi_domain_free_irqs_all() called by platform_device_msi_free_irqs_all().

I don't mind dropping the check so I will update in the next revision.

Regards,
Anup
