Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC98F13CA97
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412472; cv=none; b=qrW7L+tk3xSLlbqmPeE4Oqici2zW06PJPL6Q5/MsDgRdSmjdtbeVzOvHqtLWaKRK52YqAb+SIqdCqJEANWm23eVQgvAtuyokpmJInUacC9BCrskECYP3vb4gQ+knWCzzUbQ3Fz15MwgR6oZg7NNATD8/AK4ySZvoIIywXePVLxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412472; c=relaxed/simple;
	bh=fKCmciuVrejgNfucjb/y/00oSEiIqotqVhoUG09i+hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mLMEpUDYdhI5bahOQwzss+hz7znfkJio+a9EAL4lgYv+Yr5+WEF3Dz/1C7ipFKQEZWoQ18ZTKSAA5QNtJiIHMo1muEu1cCCawLup058NcB56UOWcB5FcGGPqAtI4vbju0mwWIpY8d+1GugkZZy6MyVTqkfuJudXGoYIGufXPczM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfpYhVVQ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfpYhVVQ"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e637edaa652so3041444276.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743412469; x=1744017269; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efmCxG+jaNBJ2pGe9YTJUnaGnslDF0WWbVSPJUczx00=;
        b=EfpYhVVQrhKV//BvHy0025zthJOr6afBX+9aZvawBccsfbpEEr29JTjm81sO+KAGT/
         PnS3L0GU3FOfoDI6kJL/+esh8aLc12dEZPBNxaURErwA5vhFx6UaIXngZjB5jXwf74N5
         CMumoMOgwHuLdnia9oEpPDypC0CD3144/ZOkpryNW1p/OLi5bcLocgHgTyGp0fAxW3f7
         dYEiqE7OV9+4c70s5gyjql0TuxYxnVKqShgN14Y5rGZiiO5raXl8Lmv1GgwPGYyD20pj
         ZmGHBSEZ2LVtgYEuGb6qNbO6FMZxxaJHV3YGdVdPzCFh+sR62yoTQzRaIulcPjcBOctD
         QAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743412469; x=1744017269;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efmCxG+jaNBJ2pGe9YTJUnaGnslDF0WWbVSPJUczx00=;
        b=bNmZrCbHZ2/A5HSUS1dXhTNuPYNSNarY4Glbs3CbU4b5CFXHLCFCVn1ImNHids2T2K
         wzOmO9NjS6cBsvEKpyKHmKd8VV0zLtTEcpAKQoqxAmvVj/KqcECYQdZPRjcLHwvcuFyY
         i0G92dkrjuXzwz4Too22Xh1eJA7IQ9N4Lxqjt5PM31QAm7R8BZI61RFe0dYeavCFfrUj
         Z5ScqlDzdORhwX8jpoQ15oUP2rjJjVkZXKzzrE5BjFJ0yybW1O2Ushmn1oFDVNGn7zxl
         ST03FXIN4AILIGmvMG5jCFYOG/YCfRSXX05zEdIcUEIr/mjzsp+eLkdNmYJydLNPEFD8
         bewA==
X-Forwarded-Encrypted: i=1; AJvYcCWZRGcXlNAJPtDGlOrct32eZE0k8T5oKQ+nC4mooHecP90AEL9Eq5XlRB96jb1f9V2wNx6U1KXAcImOBM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh66iurFGsvN3E0yAManeIpIqIf8tbjlO2dI0i+zEN1FrveNXf
	cIOTaSnMe4cjW3YRAD6rgfFYgqU28DsGAl1TiVnu+oLYFTHrYfCMQFeWc/k9B3QIN7+YTQ18kEQ
	A0kzqkeIljR38EyHnuwFlPWL+iw7QP4N+OyM5Rw==
X-Gm-Gg: ASbGncvdmUi2ocKWGIQwBN70BkjE3vZ/nU1G39ohNKBL0wszkszEB3EnUUyzhCVHdPc
	WdH7opIycbyaXlnUOdG1ZN9wowPaTFJndTqPGUqC3ffZUJjxzIdVAdHHxs2VLAzYZFLnGZMbK3G
	a5ybp05q7kmDfWgotpnTOJUcHsAxI=
X-Google-Smtp-Source: AGHT+IHh9xktT34GqhiGsVujUnGGm0FQurTIYLhUauWx5xwssos0oEUywTUlZ+xscELY+5XdU4/SW3GH2916Y6r1a10=
X-Received: by 2002:a05:690c:6887:b0:6ff:1fac:c4fc with SMTP id
 00721157ae682-702573684e1mr117766837b3.37.1743412469616; Mon, 31 Mar 2025
 02:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org> <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
 <Z-pQj6ynnfMa77fM@shikoro>
In-Reply-To: <Z-pQj6ynnfMa77fM@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 31 Mar 2025 11:13:53 +0200
X-Gm-Features: AQ5f1Jr7WV6ibZ9pOu7C8LaYmbAKrf81E1XaVWgZJi_Ofi4gKPgGIRE2NlhigSs
Message-ID: <CAPDyKFr0MvQDxsi-Qd0F=1KuR4Gy6s5bhVdOXRt9K14Z9sO2Kw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mmc: core: Further avoid re-storing power to the eMMC
 before a shutdown
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Avri Altman <Avri.Altman@sandisk.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 10:21, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > +static bool mmc_may_poweroff_notify(const struct mmc_host *host,
> > > +                               bool is_suspend)
>
> Maybe add some comments about the difference between
> mmc_can_poweroff_notify() and mmc_may_poweroff_notify()? Like make it
> super-obvious, so I will easily remember next year again :)

mmc_can_* functions are mostly about checking what the card is capable
of. So mmc_can_poweroff_notify() should be consistent with the other
similar functions.

For eMMC power-off notifications in particular, it has become more
complicated as we need to check the power-off scenario along with the
host's capabilities, to understand what we should do.

I am certainly open to another name than mmc_may_power_off_notify(),
if that is what you are suggesting. Do you have a proposal? :-)

>
> > >     if (mmc_can_poweroff_notify(host->card) &&
> > > -           !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> > > +       !mmc_may_poweroff_notify(host, true))
> > I guess this deserve some extra documentation because:
> > If MMC_CAP2_FULL_PWR_CYCLE is not set but MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND is set,
> > !mmc_may_poweroff_notify(host, true) will evaluate to false while !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) will evaluate to true.

Right. See more below.

>
> I agree, I neither get this. Another way to express my confusion is: Why
> do we set the 'is_suspend' flag to true in the shutdown function?
>

I understand your concern and I agree that this is rather messy.
Anyway, for shutdown, we set the is_suspend flag to false. The
reasoning behind this is that during shutdown we know that the card
will be fully powered-down (both vcc and vccq will be cut).

In suspend/runtime_suspend, we don't really know as it depends on what
the platform/host is capable of. If we can't do a full power-off
(maybe just vcc can be cut), then we prefer the sleep command instead.

I was hoping that patch3 should make this more clear (using an enum
type), but I can try to add some comment(s) in the code to further
clarify the policy.

Thanks for reviewing and testing!

Kind regards
Uffe
