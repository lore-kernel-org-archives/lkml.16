Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF5250C09
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695780; cv=none; b=eEENzQJ/DbonPA4UPskK8LQ+JQ/HkzRCfAkalFxSpoS32Y9ssuS+NyOdOSta4gAdr+DHN8ju4l2ApN8SZki6jLX8gzHSTXLuXgzuWIlXkzGa7ftKXC1cXtUkKk/7Hj02jLOyVJfqQqpOxujSAi/ovThmChODu7ybbgZbr4IbLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695780; c=relaxed/simple;
	bh=KCKOvMLcQl20SFn4Y6202YMYWvD8kd3yt+S0nsoRWDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCJZQFFD1ADKyXanfjk4sQ9+/P0uvabwiye11vIpiFntXhxfep/sc/KRoKaRGTa2Fi1Pj02sjVeWisV2OIqSkYRpFWjp8WmFf6Tx2hNw27lRufcgLrP1YN6Tr0qfuzl+NMTWSOZYOImpR2rRquMqworuvF0kcmpoz2aMwVwqkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kBNL0Dhb; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kBNL0Dhb"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6feab7c5f96so10712547b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743695777; x=1744300577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HXCFU9YonjJhyDLHpnnxPkRURBU3+SLjAkNFJPgsSI=;
        b=kBNL0DhbNR8Dj5SOwUVGMD2gKvrb30mqHgk+5cAUNsbbqGyCwSesGAlpmHskKo36sM
         ckeVPa5VFvtaNk6zYOYWpCHvdHQd73YqG5flbRsFdEuPUPBUEgDpweMWlEsPbgtxfDyb
         rSNuOmfl6v9cO1z9I4bcu5KY7pLWevWsuMpWPueKw1/sBVPNMYStlMecH2GJhWj2S0B6
         yJL0CVpHP9brQaeAl7swovyY0VQiS9c/4oRo+wXqUxoTxzPFbW7Z1rllkp6K7O3RoIHp
         r8tpU9D5ePGS2wzz1aqpGwDhX1SRkuCnyDTanqVUbwxiboVS2tHBIEbtpZn13KfF68lH
         t7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695777; x=1744300577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HXCFU9YonjJhyDLHpnnxPkRURBU3+SLjAkNFJPgsSI=;
        b=FXjjky3GbdqoTHwIW87zL0DRS3HkmGGNE1Gw8rWfxGrNaj7WTnTt3yPiA0O8GMCHaW
         egNV5Z7T3PqM7bGAk0v15Ih0yBEfWdhQ440ElZndOyVeCrqjfgfsQlGPAWn/PrYwvCB8
         vVhJWf+5qLsKoUsZ+DFNCQIlsfvgshFxKm/MjfoN7frakw9Js0L3t8TESssycz7jFVaF
         /m2dtsn66B/t6OXQHbPQLhUWE4zCcJ2zUfeFxDpSsDBhrojDXxJIHhmTo92C7B9OrWwF
         wn5Jw+XSiPHr/P+hAWF3vrMguK/EEO+Zrt/bFxv7PulCgKBaWssJUnI5GML2TckGBJj2
         LzOw==
X-Forwarded-Encrypted: i=1; AJvYcCXanWesGGneeSXIBT/HSkgNGBLREmOpfFat6aqN58wpJan0uFaroSTbFDpR7KB/tqaqa1yWBpowU2GD1H8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtb+wvw7lX4QUby3gieSFUrpzujfr82OR+23Wo0nuB9h0yCQ5z
	XBFm6lz0gm4mECrmYevo/TBwwAsnwLxRQ6+xPGayUkC4VTBoreLLBcsukKqvHVOK4lxJtwABxPP
	pBb0/tnKxFdQhNCUkDIPZTIYurZsOFpLLE9voxA==
X-Gm-Gg: ASbGncsoJ3/xwwVzACgz1eh7GlhT7n3caynvzdjfRIHe5pxsZU2YFWcZekhmRODD2a/
	XQMJIF3lD84bqYMZJqh7++kY37edj4FpgiRfp1aR21ZOd3Md66SgLDkKIBQ2mr9Oeq9XRoSkhIb
	amLycKC7vCAHi81RLfHc2hSae+hGMGDyjEMerr2Q==
X-Google-Smtp-Source: AGHT+IFtup6lzCCDcgglb/vouYIF02tq5aB9fUksxAEAz4mtg2896UBjPrAGsh8END8a/G1BpCJH1h+ZLmjMPi7nqts=
X-Received: by 2002:a05:690c:4807:b0:6fd:41e1:83d8 with SMTP id
 00721157ae682-703d0790885mr56680357b3.6.1743695777536; Thu, 03 Apr 2025
 08:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402120613.1116711-1-ulf.hansson@linaro.org> <20250403080815.jsdoydcczkeuvmy6@lcpd911>
In-Reply-To: <20250403080815.jsdoydcczkeuvmy6@lcpd911>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Apr 2025 17:55:41 +0200
X-Gm-Features: ATxdqUE_uiMj0ReQyXslvnN9euZTVAjRRAl_6-w9vMIxjplB4kuU0aE6cNyzWdE
Message-ID: <CAPDyKFrgYVMvaBf13ksdJ6Zr6bvLo1Jmz8yLiyg_43hs65STVQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Reset genpd->states to avoid freeing
 invalid data
To: Dhruva Gole <d-gole@ti.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Apr 2025 at 10:08, Dhruva Gole <d-gole@ti.com> wrote:
>
> On Apr 02, 2025 at 14:06:13 +0200, Ulf Hansson wrote:
> > If genpd_alloc_data() allocates data for the default power-states for t=
he
> > genpd, let's make sure to also reset the pointer in the error path. Thi=
s
> > makes sure a genpd provider driver doesn't end up trying to free the da=
ta
> > again, but using an invalid pointer.
>
> I maybe missing something but if kfree works similar to [1]GNU free() won=
't
> it make the genpd->states NULL anyway? Have you actually seen scenarios
> where the genpd->states is remaining non-NULL even after kfree?

Yes. kfree() doesn't reset the pointer to the data.

>
> [1]
> https://www.gnu.org/software/libc/manual/html_node/Freeing-after-Malloc.h=
tml#:~:text=3DThe%20free%20function%20deallocates%20the%20block%20of%20memo=
ry%20pointed%20at%20by%20ptr%20.&text=3DOccasionally%2C%20free%20can%20actu=
ally%20return,malloc%20to%20reuse%20the%20space.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 9b2f28b34bb5..c179464047fe 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2229,8 +2229,10 @@ static int genpd_alloc_data(struct generic_pm_do=
main *genpd)
> >       return 0;
> >  put:
> >       put_device(&genpd->dev);
> > -     if (genpd->free_states =3D=3D genpd_free_default_power_state)
> > +     if (genpd->free_states =3D=3D genpd_free_default_power_state) {
> >               kfree(genpd->states);
> > +             genpd->states =3D NULL;
>
> Also the coding convention for kfree in other places in pmdomains
> doesn't seem to follow this practise either...

Right. I am not suggesting changing them all. Only this one, as it's a
special case and an error path.

genpd->states may be allocated by both the genpd provider driver and
internally by genpd via pm_genpd_init(), hence we need to be a bit
more careful.

>
> $> rg -A1 kfree drivers/pmdomain
>
> Is this something we're planning to start following in pmdomains from
> now on?

As I said, this is a special case.

>
> > +     }
> >  free:
> >       if (genpd_is_cpu_domain(genpd))
> >               free_cpumask_var(genpd->cpus);
> > --
> > 2.43.0
> >
> >

Kind regards
Uffe
