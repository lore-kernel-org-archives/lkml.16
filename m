Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE5E274B42
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458384; cv=none; b=rkKtkpDQ8OugOGb5PWPkAe8ya2AF3icFC21I9BGOv4OPS8W2AnY1INropzWb1p3QAO7DHxeVazBBSUoHQBYwgRiJyjdUN9xHddSwb0pbR4OpIRoQqFdAk+FcE839TVJAnx85S6bYuYi2tcJFGwV6AEUlQyW/v6ZERwNs2TXKlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458384; c=relaxed/simple;
	bh=oClDJcT0mTELwPMf1uIqlxpRObpfhkuJDcTpu4d7ylI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOHqSv2WH4R1dzrnR/Ldwq2dfGc0gwEM6Xcz9binm3qL+cbfHcvKerYp1PbZUfeyejz4UGWCB4QYbWD+ACa8GxCE/BJZ+cDaZ1PCC2UU8lLfqZf6yGl0Tf4NOP+f8+XRaiQLZtaDa4qxfxLu59ONMSfOR+3p2dUvVHzuyDNA480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ad6CQ57t; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ad6CQ57t"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8187601f85so5975978276.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751458382; x=1752063182; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gk4s+SONPpEB34QsQQb13XEXrE5uFgXKOQWW3pBsTo=;
        b=ad6CQ57twtnzZ2FeSCplJsw4oZ8pQTTWrc86OBlc4QMTXiJQVwJcykh4II/LSoYIaC
         CbJCZPpOY6x8dlBHn/LUJ+k09mDahR1jIfxEtwCwbi30YMYKa5JztVF/L3Siek+Lhnhs
         zj99UMvx3/hm/m621hfQ0omx59BIWxhKVraQLnbPMYSfoi2Gj+Cukn4wzNuqMnX6ykHJ
         NCTF988haTQggTaNupeC4+5gbq0mZteU/qIHDU5GJ5rNW5PmbpSaGODzA+ObMRPKDpJD
         FRFVOQhQuy2/qj4TvHJiOY3IJPVxWdAd0/Hn1sNpWgBewMxyqVArS3IDT8RoOlO69DKZ
         32xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458382; x=1752063182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gk4s+SONPpEB34QsQQb13XEXrE5uFgXKOQWW3pBsTo=;
        b=Z+QeNaGPotr0VvAN+L8V9VmN8ZDF9D5U7u59ZX2yPKYtCTjU4EfygKqHC4RtqRIUuU
         16HxXMhJXjZ2pEE/PzVxTXrMDrs2o4mSlZVku5Tspiet33ZPtkVhI5pP8R52mwK2278W
         IpgkNsyygdC1SzHFYtwcNmaKj/Uwbg8N7kB6YIB+GEtvGEyt1HnRpUD/EalLkbbUXtlx
         KS0fn3/Pf9IUTFa0Qh6Vbbg/6hpeGPV7BKvtDSqAxd9ZKmghyVHrr3piDOlTqkN0LYgn
         RkagksPkzBVOiOAtxXuprDHBn2UD64s7jmwUc08HREnJgbUNkmxHMpilOJoqd2A3Pvj3
         DFbw==
X-Forwarded-Encrypted: i=1; AJvYcCWuFD1jvs98zOMRkN3cdFlzZPRvzRzKYAD290rrAAZbNCFHkRbgHXSfcDJzL1CtSFoRe7dYUDIFZuXlfMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAlae8wWb9SL0y7NFxKOZOUpe+LCNL64PUxZPdobVS+MjQKjp
	x7z7bh+2C8va4+unvip3o6OlTOh7opBvVXsJOAFjYkORq84dwfcEUj6hzIe+D+2OKdwS6PveBwj
	/ZrgbwZJUTcyflcEiCAQsxyGI0gk6pIR2m/KdqpiTow==
X-Gm-Gg: ASbGncsS4EcwfqVzBV2uNSfsDBH3u0mRd2XuuG6lt02ahqB2af3/0hGzLGuHbrfWeMr
	fMh/GVzAedTNPr9ulkBEPjYZDEhzmFPoq90tBfhodztSaIfJVI1SRJoABXQrOro9lKOnmJI4pEw
	RGHreZXAec2K2rJ+6C0jf1mtV1sBvdFgzQ4n+U+lHFM/nYkNK8VTaZv2Q=
X-Google-Smtp-Source: AGHT+IG3NWai+ZP/un1xZG3CzZCkLzSMLJaFL3JR+EQ/9jK23FydSpvbz+8ZOtgLz/en/MyFioW+0zHkRi1p3FqLmno=
X-Received: by 2002:a05:690c:4a0b:b0:6fb:a696:b23b with SMTP id
 00721157ae682-7164d571f91mr35480447b3.33.1751458376965; Wed, 02 Jul 2025
 05:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
 <7hsejzp4xg.fsf@baylibre.com> <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
 <7hcyb1os9y.fsf@baylibre.com> <CAPDyKFpTgAmLBq2ZExPoxWM0wL756zH96vW7M6wHSA1MTTG1wA@mail.gmail.com>
 <7hjz4tnlg6.fsf@baylibre.com>
In-Reply-To: <7hjz4tnlg6.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Jul 2025 14:12:20 +0200
X-Gm-Features: Ac12FXx099YexnSX3D-jd8HuUZnwt5D-jZ9PNizBBy6pBlCC473WjWV1dygsTok
Message-ID: <CAPDyKFrY2kNaP=Hk-81B4WEGxyKUTYqBWJHQKtHnyTPWTFUOEQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 20:17, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > [...]
> >
> >> I've done an implementation with struct device_node *.  This works
> >> better (IMO) than struct of_phandle_args * because the caller (in my
> >> case scmi_pm_domain.c) already has device nodes, but not phandle args.
> >>
> >> The result will be that the pmdomain helper will call
> >> pm_genpd_add_subdomain() instead of of_genpd_add_subdomain().
> >>
> >> Below[1] is the current working version, which includes adding the
> >> helper to the PM domain core and showing the usage by the SCMI provider.
> >>
> >> How does this look?
> >
> > It's a lot better in my opinion. Although, I have a few comments below.
> >
> >>
> >> Note that doing this at provider creation time instead of
> >> <genpd>->attach_dev() time will require some changes to
> >> of_parse_phandle_with_args_map() because that function expects to be
> >> called for a device that has a `power-domains = <provider>` property,
> >> not for the provider itself.  But I have it working with some local
> >> changes to make that helper work if called for the provider directly.
> >> If you're OK with the PM domains approach, I'll post another rev of this
> >> series which includes the OF changes for review by DT maintainers.
> >>
> >> Kevin
> >>
> >> [1]
> >> ---
> >>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 ++++++++--
> >>  drivers/pmdomain/core.c               | 34 +++++++++++++++++++++++++++
> >>  include/linux/pm_domain.h             | 11 ++++++++-
> >>  3 files changed, 54 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> >> index a7784a8bb5db..8197447e9d17 100644
> >> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> >> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> >> @@ -54,7 +54,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
> >>
> >>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
> >>  {
> >> -       int num_domains, i;
> >> +       int num_domains, i, ret;
> >>         struct device *dev = &sdev->dev;
> >>         struct device_node *np = dev->of_node;
> >>         struct scmi_pm_domain *scmi_pd;
> >> @@ -115,7 +115,15 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
> >>
> >>         dev_set_drvdata(dev, scmi_pd_data);
> >>
> >> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
> >> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       /* check for (optional) subdomain mapping with power-domain-map */
> >> +       for (i = 0; i < num_domains; i++, scmi_pd++)
> >> +               of_genpd_add_subdomain_map(np, domains[i], i);
> >> +
> >> +       return ret;
> >>  }
> >>
> >>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
> >> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >> index 88819659df83..3ede4baa4bee 100644
> >> --- a/drivers/pmdomain/core.c
> >> +++ b/drivers/pmdomain/core.c
> >> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
> >>  }
> >>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
> >>
> >> +int of_genpd_add_subdomain_map(struct device_node *np,
> >> +                              struct generic_pm_domain *domain,
> >> +                              int index)
> >
> > Providing the struct generic_pm_domain *domain as an in-parameter for
> > the child-domain seems unnecessary and limiting to me.
> >
> > Instead I think we should parse the power-domain-map DT property at
> > 'index', to find the corresponding child-domain's specifier/index and
> > its corresponding parent-domain.
> >
> > In other words, we don't need the struct generic_pm_domain *domain as
> > an in-parameter, right?
>
> I'm not sure I follow.  The `struct generic pm_domain *domain` is the
> SCMI child domain.  From the map, we use the index to find the parent
> domain.  And then we add the child as a subdomain of the parent.
>
> Are you suggesting that I (re)parse the DT for to find the child domain
> also?

Correct!

The DT property ("power-domains-map") that you added in patch1/2,
contains all the information so let's just parse it and assign
child/parent domains based on it.

Kind regards
Uffe
