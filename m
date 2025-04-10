Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCCC2673BE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279149; cv=none; b=crcrZxrrXf7U+/9OjDoDUk81tLUPYEjA76xEPMtDDBvKg0kJE+g1fnxAljKbYK9JNxymxu3ZraIDeP3G6lApy/a2bYkTl94agFVfpDUMbj1ph/g/ABDSRWz2ftEiCzvkraDURVlgQhYCxokLZOkBPinBpb9xcZQ2vNe0r6fhpRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279149; c=relaxed/simple;
	bh=to6vm0rC1fbCpBMfSCTmB7z9mZRggxqxOXHu7KnOZC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvJkYeB4N++VSjKsJbHzzXOyECpQ1rue6LMYaanS853KXe2VAIMn2jtBt6s+ZXNOSppbMT2/Nxdxhagn1XSCpVpIcxgotzH23jvm9l/BqbpO55/Iuub44hOvlRREIPO1ORqaQuanPTD5RCndcmrawd3+UUNzaX0aUezyIET7s1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cFMo5xIY; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cFMo5xIY"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaecf50578eso109121266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744279146; x=1744883946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL0HpDhrZM9n98xZWp9B/ltCY9esMwVPBh6P4iWMURc=;
        b=cFMo5xIYrAr2c5HeWlSfp7z8gUDjwxqpsIX34Is9Ta5jN7oHCCJktI7g9Xo+x1MQQW
         t+nE/7CavbhFwJVgPYWy9p4J8a7ht4TbwYDYt3ELDMBzqjJL8/0hU8iARetGs3IFyR8s
         eUseRaHA9kuDetXm0s0QbFPLLufjm+UHzKOaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279146; x=1744883946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SL0HpDhrZM9n98xZWp9B/ltCY9esMwVPBh6P4iWMURc=;
        b=W13NgaLKFQMPiuQ/A8dbHagdb29TS2Ndvf3+vWNPlgS1U8TYapOyLzEwlLiW9X8H9l
         do5yt35KexA0ezbMa93q9NjKUA5VvPI4KZTgl58IBnzvIpU22pK0INwbHK40lvzBhOnQ
         DCsdJTJfRCthkVw9ihZnIOWqIYeC6vhe+QlWelWDLGHDcpJGQk5CcQVrDIvpxfWgNwvq
         xZFZ/j4CmmNDohdCuGsoVvLpKlj7qr57CbszPOinXKO+2NzJ1fsEGphU07FHoa1224Jg
         jINpcOwDLMTWq93DwXWU/9nei3I18bkFONB/Cs6f9Xz1rs3kdnPh8qKplpOjS0nchuhV
         47EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOMa0lQRZ0SedxGsi3SWeHMT6kRqwlwBCIdDy5Qzt0bPAhVkg0fwnxoNyaDLsAHTH2JMrjbwNdXK8LfJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNY5U/ZvZpEYAC2oe8LccLIZg1IbK0CeBUDXJN1Up3TxPJYc1W
	qeWIQ6wH9+Nx3ziF9H/498OPr2ri5/tg+xfYmFwY+n+itM5bbLoKrNlsV4QtJeAGoo/cGnlxlhY
	=
X-Gm-Gg: ASbGncuikBCgM2B1vPr9VkMzxKmoRoOK+K9Ir1yUzw5xXTTQtl8qa+QLq/u6XLnnUIj
	XfyHvR6piuhi6NB4JuxspJQJe39/OnRmAdq4E5wr5dQVGekJXKq+5YP+ml70iuzUWzsAVF7nDJF
	sZgS/wDatNyVaHSD9sPqCJeyMIkz91YJIpCgbJAVvzyabARupbCDdC6trDhiaHqRIQKLsUJaidP
	i7dH1Nj2i9XuOS8du1neg/jf9dxWLY71e6G44kU+LTYxZLZDML5lhgHJkvE+x3klLwfFaWKn+o0
	PBMLIFUGkTsaGdwWKZIR41RuZsf1oCTtJ4JSAB787s0Exn5yNZ2yjWIhX2mCE4VIhtSZAWVgwQe
	PplIw4DI=
X-Google-Smtp-Source: AGHT+IGgZncBDIjDJNpX+2cIMkO2hSD4ene9Jyn8fEUe9kJd4mMPEYm0NG0otBR7PuQT2VZ/T5QqLw==
X-Received: by 2002:a17:907:3c85:b0:aca:a67d:c0b9 with SMTP id a640c23a62f3a-acabd1c526dmr227523166b.24.1744279145907;
        Thu, 10 Apr 2025 02:59:05 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce70c1sm243761666b.175.2025.04.10.02.59.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:59:05 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e789411187so6467a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+8ma8oXADrAln0Mk3fArvilAGyFmo5usdr7WMaTa+LiF3GHF05zBiaysAf8WwBwHh0IFGn8eBHQEL3Qw=@vger.kernel.org
X-Received: by 2002:a50:955a:0:b0:5de:bcd9:4aa with SMTP id
 4fb4d7f45d1cf-5f32be7ca56mr44710a12.3.1744279144410; Thu, 10 Apr 2025
 02:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-temp-v1-1-9a391d8c60fd@chromium.org> <CAJZ5v0ixiiSiGvc_8D8YxK22yKOAzkdrNaMNjydOHD7gQVc9tQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0ixiiSiGvc_8D8YxK22yKOAzkdrNaMNjydOHD7gQVc9tQ@mail.gmail.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 10 Apr 2025 17:58:27 +0800
X-Gmail-Original-Message-ID: <CAHc4DNJs-tq+KbukyovABkp8-GEbia3KfgEURcNqqRiJ2vvwyA@mail.gmail.com>
X-Gm-Features: ATxdqUH6chIPMhKRb7zUFrIDu_id5vmjZQ0E6lQUwzdQ0QTxOC9fNvtyIJfZVTE
Message-ID: <CAHc4DNJs-tq+KbukyovABkp8-GEbia3KfgEURcNqqRiJ2vvwyA@mail.gmail.com>
Subject: Re: [PATCH] thermal: sysfs: Return ENODATA instead of EAGAIN for reads
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 1:31=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Wed, Apr 9, 2025 at 11:13=E2=80=AFAM Hsin-Te Yuan <yuanhsinte@chromium=
.org> wrote:
> >
> > When userspace nonblocking reads temperature via sysfs, EAGAIN error
> > returned by thermal driver will confuse user from the usual meaning of
> > EAGAIN, the read would block.
>
> Why would it block?

I mean EAGAIN returned by nonblocking read implies the read would
block (source: manpage of read)
>
> > Change to throw ENODATA instead of EAGAIN to userspace.
>
> Casting error codes tends to be confusing.
>
> > Also, ENODATA more accurately reflects that data is not currently avail=
able.
>
> It means something else, "try again" vs "no data available (possibly at a=
ll)".
>
> The error code comes from the thermal driver and if it wants to say
> "try again" then this is what it wants to say.

Yes, but EAGAIN has special meaning when returned by nonblocking read.
Hence, we need to avoid returning EAGAIN to userspace and ENODATA is
the most suitable alternative in my opinion.

>
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> >  drivers/thermal/thermal_sysfs.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_=
sysfs.c
> > index 24b9055a0b6c515b865e0d7e2db1d0de176ff767..3d1713e053dfb867933d951=
31f1f2491d2ecd07e 100644
> > --- a/drivers/thermal/thermal_sysfs.c
> > +++ b/drivers/thermal/thermal_sysfs.c
> > @@ -40,8 +40,11 @@ temp_show(struct device *dev, struct device_attribut=
e *attr, char *buf)
> >
> >         ret =3D thermal_zone_get_temp(tz, &temperature);
> >
> > -       if (ret)
> > +       if (ret) {
> > +               if (ret =3D=3D -EAGAIN)
> > +                       return -ENODATA;
> >                 return ret;
> > +       }
> >
> >         return sprintf(buf, "%d\n", temperature);
> >  }
> >
> > ---
> > base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> > change-id: 20250409-temp-6ebd13ad0dbd
> >
> > Best regards,
> > --
> > Hsin-Te Yuan <yuanhsinte@chromium.org>
> >
> >
