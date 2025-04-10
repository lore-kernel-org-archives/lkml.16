Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1A28153C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744283123; cv=none; b=qFTAEdnWzPU90ETQhANo79/RFGB5LxOn8eYzqpMntrpUFOhPD03NhiU8Fmw0nAFgHTOhCHYfOMb4lL1NQnvO2ALqTi+/nvffC/1khkDNH3Fkm4WmKf4+dfFLnJRHcKXK6Op9HDZE4Y/RiNSA+SmGGWUjYZgEq4f2ATVNOqJY1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744283123; c=relaxed/simple;
	bh=wg7FUQheY1V6LHVrnBH6vF7AmRgRoD+z9k4SJ/+hrhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxgOK04UgE7KEvGLaKVejquItR0el4/yNOemuUxU4LUq0lX1Wji8rRcrsJP9UyHW7pk44l9mglEDaWh/ICJTGhTqt8XKT/rL+2kmc+LgHudsxGxMARFCnQCIeleZCzw0RWNyonv7AI7bU5AZ0JiKQPBPe/R5KBNgT3nrn5aRa3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bTUb6zJw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bTUb6zJw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac41514a734so123297466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744283120; x=1744887920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2bSpGtjwX4CGykGdpyzxbN5QEjzPWX6x76bISxkkL4=;
        b=bTUb6zJwB6rH0bgq/R6AG5AY0GAPvDlY4t7o/k94BwEi+Jsfbu5jCkrNAZPu2dFabz
         Q9Nu5bQm4kcU5xu9FF4+1BoGMaNh3CSkPe+re63d2xiTsRV/bKsEIrdftvyoa+qMSqII
         U3B9TIi1NiXT99okqcCDkJajiwEtdzftbJDq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744283120; x=1744887920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2bSpGtjwX4CGykGdpyzxbN5QEjzPWX6x76bISxkkL4=;
        b=WTT+osFtw8eqqqzLIWus5HUJ1AbGYRAQpOgXmU7kgJGmduIKTiYpgCTo5LgmkytoO5
         FsHEKhvpYY1aBSkcyxs8/iFSazS7NFM7ArYKFRkhyOqzZSkos+wTQryHydYnwN3tFoN7
         jpsQSu3reIQvb+1x5nD1cgnGjRkhp1qtQiXOABeqSDL9F+wEMYQr+9iENomaUYKqdclB
         DfWlFURHXwx1pKpXylkJYH6uMtYmQY4KzDU0MNAQwRlgiDQOOxp1u0NOxfo0KXxvvWGT
         cQokjDSfC9RoAs2o7n/8/CWS28DDaef0+8o2B+f+kZSbkL1AxHbsAljWpnhWaS/sps0K
         tQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcF1J4V5zaUqT7luDNc/ZMdPZS0n4LdaUfZd4+ck+HAkRFZY8g/lqmjM/xK/4Ahrf76n/9kO4LCykEvKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgs+UEPUjk8s7LSeIw62/lxkY5bwlXlLmep3JTTRXOA1aYeWV
	1s7JIKIrg6nOkuHLd8k/nQgvAcrYFJ81R+cdTddfO4cztkdQDUPAS3jfPPA9FEc5uGP3pKPEE7o
	=
X-Gm-Gg: ASbGncsOi5RlBtljguqZtLGXW1gxUzEtT3IA0FKkohbFIfkpjAL0+LoVdUuwt/1fQMO
	85GupyZbzxfkb5M6Ryg9ZSeAQ50AzmdsC7sHTxSltN0xe3QPvgLE5kbrg0R0xLk87d4NmE6TzfT
	bjzClk+pgFxb2/Aop38FAU8yO17+kNFduM0A5IwloQLD9AC4dCPqu41rtE9h6/waPCiiH+VoWT9
	HKmg+hlMyRw/8jqIgww1x4l7GdGANNPsvOaG9/W5icDeeER+zfoVmLdUGMZIR1Y4mfmzBt4racB
	4QqqMD6dUjuQMcjewEPdsxARcSeGaEO+pLGh8xRaikBglQPQdqHAiWPdQJcxE+bSTRa1z779AVw
	7BVo1HUL81KhhA/xExw==
X-Google-Smtp-Source: AGHT+IFhip+unAjC2+15DoBmQfxkxSW7F2WL64dXQ2cjSnM8sTZxF0pdf3IuvDZz8g2UTOzcUJzUjg==
X-Received: by 2002:a17:907:724b:b0:ac7:3918:752d with SMTP id a640c23a62f3a-acabd51b1f7mr179858066b.58.1744283119995;
        Thu, 10 Apr 2025 04:05:19 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3553sm256208766b.29.2025.04.10.04.05.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 04:05:19 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e789411187so7107a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:05:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyQX3wb8XNAbETyco4+/gwskAluGYCEqqmPOa/rWYi21f+oFN3LI4gYdiAJBx06enobowY4OKlIkAqiu4=@vger.kernel.org
X-Received: by 2002:a50:bb42:0:b0:5de:c832:89ad with SMTP id
 4fb4d7f45d1cf-5f32901142amr72339a12.6.1744283118895; Thu, 10 Apr 2025
 04:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-temp-v1-1-9a391d8c60fd@chromium.org> <CAJZ5v0ixiiSiGvc_8D8YxK22yKOAzkdrNaMNjydOHD7gQVc9tQ@mail.gmail.com>
 <CAHc4DNJs-tq+KbukyovABkp8-GEbia3KfgEURcNqqRiJ2vvwyA@mail.gmail.com> <CAJZ5v0j9TAcr0=vpjTqBSFtpTKAttoOnaDOncL6y=VUgyiJHkA@mail.gmail.com>
In-Reply-To: <CAJZ5v0j9TAcr0=vpjTqBSFtpTKAttoOnaDOncL6y=VUgyiJHkA@mail.gmail.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 10 Apr 2025 19:04:42 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKhwC5d_49Wjt=-iH+bckWDC_Hxww-1iq0rKYfvgkr16g@mail.gmail.com>
X-Gm-Features: ATxdqUFDTzwSBvEKCyT_QhLT0rMjj_eIRZS5XWEaYX9nmTvFGLJUNR-6Nxbcuwg
Message-ID: <CAHc4DNKhwC5d_49Wjt=-iH+bckWDC_Hxww-1iq0rKYfvgkr16g@mail.gmail.com>
Subject: Re: [PATCH] thermal: sysfs: Return ENODATA instead of EAGAIN for reads
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 6:10=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 11:59=E2=80=AFAM Hsin-Te Yuan <yuanhsinte@chromiu=
m.org> wrote:
> >
> > On Thu, Apr 10, 2025 at 1:31=E2=80=AFAM Rafael J. Wysocki <rafael@kerne=
l.org> wrote:
> > >
> > > On Wed, Apr 9, 2025 at 11:13=E2=80=AFAM Hsin-Te Yuan <yuanhsinte@chro=
mium.org> wrote:
> > > >
> > > > When userspace nonblocking reads temperature via sysfs, EAGAIN erro=
r
> > > > returned by thermal driver will confuse user from the usual meaning=
 of
> > > > EAGAIN, the read would block.
> > >
> > > Why would it block?
> >
> > I mean EAGAIN returned by nonblocking read implies the read would
> > block (source: manpage of read)
> > >
> > > > Change to throw ENODATA instead of EAGAIN to userspace.
> > >
> > > Casting error codes tends to be confusing.
> > >
> > > > Also, ENODATA more accurately reflects that data is not currently a=
vailable.
> > >
> > > It means something else, "try again" vs "no data available (possibly =
at all)".
> > >
> > > The error code comes from the thermal driver and if it wants to say
> > > "try again" then this is what it wants to say.
> >
> > Yes, but EAGAIN has special meaning when returned by nonblocking read.
> > Hence, we need to avoid returning EAGAIN to userspace and ENODATA is
> > the most suitable alternative in my opinion.
>
> So any sysfs interface returning an error code would be affected by
> this, wouldn't it?
>
> Why do you want to change this particular one?

The background is that the implementation of read in golang tries to
nonblocking read a file and poll it when that read returns EAGAIN.
That implementation is following POSIX spec. However, the sysfs node
of the thermal zone can't be polled since the thermal sensor doesn't
inform kernel when data is ready.
Hence, the poll in golang implementation never returns and makes read
never return when the thermal driver returns EAGAIN.

I'm not sure whether other sysfs interfaces have this issue or not.
Simultaneously satisfying both returning EAGAIN when reading and not
supporting being polled might not be that common.

>
> > >
> > > > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > > > ---
> > > >  drivers/thermal/thermal_sysfs.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/ther=
mal_sysfs.c
> > > > index 24b9055a0b6c515b865e0d7e2db1d0de176ff767..3d1713e053dfb867933=
d95131f1f2491d2ecd07e 100644
> > > > --- a/drivers/thermal/thermal_sysfs.c
> > > > +++ b/drivers/thermal/thermal_sysfs.c
> > > > @@ -40,8 +40,11 @@ temp_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
> > > >
> > > >         ret =3D thermal_zone_get_temp(tz, &temperature);
> > > >
> > > > -       if (ret)
> > > > +       if (ret) {
> > > > +               if (ret =3D=3D -EAGAIN)
> > > > +                       return -ENODATA;
> > > >                 return ret;
> > > > +       }
> > > >
> > > >         return sprintf(buf, "%d\n", temperature);
> > > >  }
> > > >
> > > > ---
> > > > base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> > > > change-id: 20250409-temp-6ebd13ad0dbd
> > > >
> > > > Best regards,
> > > > --
> > > > Hsin-Te Yuan <yuanhsinte@chromium.org>
> > > >
> > > >
