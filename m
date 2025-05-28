Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982227584C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426268; cv=none; b=XogrTufIGijcXlWZe8NLQgVmRH68aMQ0f0Qk6p/qwEmfsQepX228FhXUCjzceHlM0YOFXIQPkr+ccEB4qvOkHoBlo6plzlPgApgEGdLhm8RTJpcanBXFz+TOrDCAaDDVJH+5Pv7+BmVo24Fjy0hbJKRxZiCS1laoUWTyeLJUinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426268; c=relaxed/simple;
	bh=NY4ppF8WDLnUEHIz0ojqjJm6a5YSQxyU166J9C6MAD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AB6x68rhAVWuUsnHCTAKl4YvKZCIstMav0C0q04tq4FcakvJIRFremN3WV6v1haXmBaeBLVKfVB377bgoLznt17kILSdfvu+rUeDISrcMWLjTusKqE2TgNrAqO9PNq/KOAzZE/N8ltW8YcjATYAPECHzzUfaDypTlAEzxwpJPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pjZnWZtC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pjZnWZtC"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so5096413a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748426264; x=1749031064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks3rhmD/IHlVoyz8JuxtGnWPe59bWGftTPLGTy/S1P8=;
        b=pjZnWZtC2h3kOjEe9LEGzuZHtEOwTYCuV6JqcoGywkjnl2A9RQ7ANO3XQmyThu10io
         U+FOKZKzkLRZYpBgjGiSI0QCBu0lAXRY3dBVERiK/4Kw+WyHaye37A4RnGd0fLPKCgUX
         IYMjz17DW+mx/JycEAW83UGudA9ayJe8f1Jtk67NjEgN7HS1S88olgpsKT7uA6IRdCyG
         79K7ZSXQK1ACe7yMiIeT9Bmcd0E4GI/SpGMnoHayK3P05NC06Z9Ged1l2RcHbJ/5NQUL
         esEB+IvPl/CauWKZX7yyWHg53uFvgEP2rmvix4vTvBQlGx4DzOEuS+OrG+XSF5CP/jv1
         dUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748426264; x=1749031064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ks3rhmD/IHlVoyz8JuxtGnWPe59bWGftTPLGTy/S1P8=;
        b=V6DTZvZ81CG9FtrEymaycaLNI9UchrdYEUY8tnnBzUK9YhGyrm9SYD0tOMBqsoATpb
         YUOGwjwTsAxj9fJ2fbhdprEt466Joa6Mt5oCmOsCqcz/W+jog4FvcABb+MEUevIH0vZx
         GRrHjr8cJl3cXCU1fkGbM5zI3IFSD6i+LYIjcDGu12I1T1JlAe3S8PFlwxDnm6JoR+5A
         WytXu9DWBkfFhXz3DAFfs3YZc/TH9Dtq8kPUl6r+8MP1x1PDrhOXsm/LxPiOipaIhppz
         mZe/GSKQl1F+gH2r7KgR7Jsyyf7vxlh6F0scvo+8lgsqnVRqgFUNa8J89ycEYPOCN8P6
         lzow==
X-Forwarded-Encrypted: i=1; AJvYcCV6S3XH7uXRvtOwaRoWHjARwRn8fo+8sURPktUXRWNCJr0f0HVCv8u8x16BaNWdhf87d8W0aI+24w4zthM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/Y2PHmgEzLWXc4b1+2f972lLRkpa1Xa/w8/XoA7GBj4OiIxP
	sAAisMBZMX2xraoVVelgr2ZpHY2NSi2hCozygLKSt+uwM9m2DHcq0E9zSKVGLc6YwTz9PBv9UTw
	nup8jlCeETYUAU/ENfwDexBvjEdrsnXUvn4/c7ISX
X-Gm-Gg: ASbGncuXxVQnWggBZBroI6Y/8PyhwaItaXK2IlxwxQpWabwCA/2xRjxIHg+tTwXP4Dl
	f0WFv1dnXQ0PuYtuwCxMwL0ftYbzWKlAin0+3FV9Qes92weO3ngMXF85uU1YQbfZIlFCfwCIymQ
	nVdYfN8uB0hx1REOV5ToymS2nLKK5jaOTT9XVndAc5i139d+zMyBVoDpgKe9ZMAGiObVGkqQ==
X-Google-Smtp-Source: AGHT+IFFD/y5HtmSNrKzHhwfxF7XDgkk5kJYkfCwOSf/luOnKSQmxuN22Xn2tS6vv4V5KENmsK82jP6Xvsq5rx1uJ+c=
X-Received: by 2002:a05:6402:5112:b0:604:e74d:3615 with SMTP id
 4fb4d7f45d1cf-604e74d367bmr6357406a12.26.1748426264183; Wed, 28 May 2025
 02:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527121807.3597061-1-korneld@google.com> <oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5hsil@vhh22j6b5cvq>
In-Reply-To: <oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5hsil@vhh22j6b5cvq>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Wed, 28 May 2025 11:57:32 +0200
X-Gm-Features: AX0GCFvK9nh_ZQOQ8q-wzxVPyhyMhhVBescCioACvy1eSbZRd2cZXohjA9FPaQ4
Message-ID: <CACF_fqksF+whYbGEdSvJ=87FQH03EzO+hSSf8eRc8MitR2hzxA@mail.gmail.com>
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report battery capacity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 9:34=E2=80=AFPM 'Dmitry Baryshkov' via
chromeos-krk-upstreaming <chromeos-krk-upstreaming@google.com> wrote:
>
> On Tue, May 27, 2025 at 12:18:07PM +0000, Kornel Dul=C4=99ba wrote:
> > Battery charge can be reported in several different ways. One of them i=
s
> > is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
> > power supply API. Currently the driver reports the capacity in this way
> > on SM8350, but not on the newer variants referred to as SC8280XP in the
> > driver. Although this is not a bug in itself, not reporting the
> > percentage can confuse some userspace consumers.
> > Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
> > calculate the percentage capacity by dividing the current charge value
> > by the full charge. Both values are expressed in either uWh, or
> > in uAh.
> >
> > Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> > ---
> >  drivers/power/supply/qcom_battmgr.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply=
/qcom_battmgr.c
> > index fe27676fbc7c..5ed5452ab51c 100644
> > --- a/drivers/power/supply/qcom_battmgr.c
> > +++ b/drivers/power/supply/qcom_battmgr.c
> > @@ -577,6 +577,8 @@ static int qcom_battmgr_bat_get_property(struct pow=
er_supply *psy,
> >               val->intval =3D battmgr->status.capacity;
> >               break;
> >       case POWER_SUPPLY_PROP_CAPACITY:
> > +             if (battmgr->status.percent =3D=3D (unsigned int)-1)
> > +                     return -ENODATA;
> >               val->intval =3D battmgr->status.percent;
> >               break;
> >       case POWER_SUPPLY_PROP_TEMP:
> > @@ -617,6 +619,7 @@ static const enum power_supply_property sc8280xp_ba=
t_props[] =3D {
> >       POWER_SUPPLY_PROP_STATUS,
> >       POWER_SUPPLY_PROP_PRESENT,
> >       POWER_SUPPLY_PROP_TECHNOLOGY,
> > +     POWER_SUPPLY_PROP_CAPACITY,
> >       POWER_SUPPLY_PROP_CYCLE_COUNT,
> >       POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
> >       POWER_SUPPLY_PROP_VOLTAGE_NOW,
> > @@ -1063,6 +1066,21 @@ static void qcom_battmgr_sc8280xp_callback(struc=
t qcom_battmgr *battmgr,
> >               battmgr->ac.online =3D source =3D=3D BATTMGR_CHARGING_SOU=
RCE_AC;
> >               battmgr->usb.online =3D source =3D=3D BATTMGR_CHARGING_SO=
URCE_USB;
> >               battmgr->wireless.online =3D source =3D=3D BATTMGR_CHARGI=
NG_SOURCE_WIRELESS;
> > +             if (battmgr->info.last_full_capacity !=3D 0) {
> > +                     /*
> > +                      * 100 * battmgr->status.capacity can overflow a =
32bit
> > +                      * unsigned integer. Do a temporary cast to avoid=
 that.
> > +                      */
> > +                     battmgr->status.percent =3D
> > +                             (uint64_t)100 * battmgr->status.capacity =
/
> > +                             battmgr->info.last_full_capacity;
>
> Can you use mult_frac(), preventing the overflow?

Good idea, but I don't think mult_frac() helps in cases where the
dividend is smaller than the divider. Let's look at the sources:
#define mult_frac(x, n, d)      \
(...)
        typeof(x_) q =3D x_ / d_; \
        typeof(x_) r =3D x_ % d_; \
        q * n_ + r * n_ / d_;   \

Since in our case x_ < d_, q =3D 0 and r =3D x_ then r * n_ will still
result in an overflow.

Unfortunately, the cast-and-divide approach won't work either. I
received an email from a kernel test robot saying that this patch
breaks a 32-bit only build. (">> ERROR: modpost: "__udivdi3"
[drivers/power/supply/qcom_battmgr.ko] undefined!") See
https://lore.kernel.org/oe-kbuild-all/202505280344.GjzOItSS-lkp@intel.com/
for details.

I suppose I could just use a do_div with a temporary variable to work
around that. I noticed that all data read from FW is multiplied by
1000, so I leveraged that instead:
battmgr->status.percent =3D
    (100 * le32_to_cpu(resp->status.capacity)) /
      (battmgr->info.last_full_capacity / 1000);

Any thoughts?

>
> > +             } else {
> > +                     /*
> > +                      * Let the sysfs handler know no data is availabl=
e at
> > +                      * this time.
> > +                      */
> > +                     battmgr->status.percent =3D (unsigned int)-1;
> > +             }
> >               break;
> >       case BATTMGR_BAT_DISCHARGE_TIME:
> >               battmgr->status.discharge_time =3D le32_to_cpu(resp->time=
);
> > --
> > 2.49.0.1151.ga128411c76-goog
> >
>
> --
> With best wishes
> Dmitry
>
> --
> You received this message because you are subscribed to the Google Groups=
 "chromeos-krk-upstreaming" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to chromeos-krk-upstreaming+unsubscribe@google.com.
> To view this discussion visit https://groups.google.com/a/google.com/d/ms=
gid/chromeos-krk-upstreaming/oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5=
hsil%40vhh22j6b5cvq.
> For more options, visit https://groups.google.com/a/google.com/d/optout.
