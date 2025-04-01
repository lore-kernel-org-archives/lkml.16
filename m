Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758E1EA7C1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508239; cv=none; b=N6sQ+7mkNdL257eTmdmMS+evJht5ahh1nxJsha7wrbYXo7xngLU/HV74mJfa53ufM93m7nQR8ITNi0LXo3BYNKCR2m/EDOngRZj5ZvCDUhtLcgYP/PGZ1Np7MvNbfDLUEr5zef5omAhkJMphtAegwtKM39CPbVILLL79qCAdHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508239; c=relaxed/simple;
	bh=Qxf7pul0wUbk0fSwy6plIWVWNrFDzhqa5xEHRCSsU98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=cZytWMb7RGa3ZJFJApgWM2j7oj3rjP3lAbqeVp4hQkN11JALRhhPsg2iUey+/rXnFvk7pFmjns+p9JfeeNwt2l+RoT+WREL5MBuTZ7gSuKfGGh0bBRKUTwoQdFgYM5mZAIwg5KbTBL/OgMKfh+QJsGPufdAmudmvCU5Kskqcrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fUDXbtE3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fUDXbtE3"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7023843e467so41287167b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743508237; x=1744113037; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOgeifCPueURI4iZ+PSvJq0F/yvoGRM/ptjc8joEL44=;
        b=fUDXbtE3ZewZhxxomie3dorFzWVM/B/P5sTzgNGamUmpEozl6KGQYVha1BEIBKTckI
         5b+FTTQUuBFgqbaNjLaeXRzkkSvSzK0j0aCzSR6nvrBtrt/YAAS+gXBon4CE4YLV8fA6
         k4QbaaxoIRyHaVmD+F2XXQnFAncH5vGao67t1Qy6vPJTZux8RiqnKPMNwwjXrn/aZmP+
         6mJetVf4ngHTQaCwOmsnbnMO+knQ3/N4SGvkzS1sIkIdjOlBeQPcUU8oBjZjrZuJMDv2
         BBBDsTyNflgudGgvjOgwneKMyxg1GyB1Di+v8AR5R79vVOLMbf62nbkrtQRPOgdV/Vd2
         BnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508237; x=1744113037;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOgeifCPueURI4iZ+PSvJq0F/yvoGRM/ptjc8joEL44=;
        b=ab4msJ0r3AC8EBPY23BMB9Wyo6KZwoEEcxHBu4ejK+t1gvfiJNEX1ZcLf4jLWGy25m
         QlieLNjVDi2tD8VHSqjMUHas+kJ9z0zwmtoCIr0XJjRX6Bxt1fsXVv8BSUNS4JGQcy7a
         gdWje8ytJEncpemWqtkJ5vy7/A0YvjDkClPSa0lBXdncVQeGvhGfpGcZREVjhPMV+Jz0
         2m+oNlfjeN6Ho5W/Lg8MCm1W0xrmMc4HixjX+o3f2oyFNGes3sP43maDb7xtLiI+JWA0
         EP55xAtrmv6i3UzSLlCDen3EdCe153HaN1qgZuEITUmb/pHz7RhOV0aY7BYPQsokHuxQ
         Ip/A==
X-Forwarded-Encrypted: i=1; AJvYcCXufSXguTZdw7j62LFBCX/L5sp00jCmK/+vHIa39GmK0rPAAAnylvpNTerG41yVmP9pTZRIR9mltGlwGEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNl9vISCmzkqY6aNfQEakbjj5oscprQQpQWqRWiR0oupqHCNX
	/5b5dNVzhtrslp8G9mr2yVuZ1jNBAj+VcS4EM/iamlIgeBP29jT+OU9mtpWVLFhe+UKhGrUsTKE
	iyUibqK5CSVLUN+wpoQKJaBJNJTbGfqzTMnzEJA==
X-Gm-Gg: ASbGncuTsZnevz6TyawD5eLp/aljvmcjLivUfazTAQU5x9q9HHYFVdXRcf65q1FgoD6
	pj7xDhYPkl8Dz/0PXDQXYWSbGBA5IlSyYRcINYyD7VcxA74OHI4r8RHucK/p8ODYq5DTiKgABeX
	14h6bx0u8MgT0FhxpYpPHH12PTjXzErwrKRMw93g==
X-Google-Smtp-Source: AGHT+IEccr3CCj7xmEQlHsDfauhpuJ3bZ5uaub8hZq7c6Tbl/9LjElpjGlbWImSrgrcDwT40VZjgNc2LpyX75ImC3eM=
X-Received: by 2002:a05:690c:6f85:b0:702:4eb0:6af with SMTP id
 00721157ae682-7025734bd0emr179109817b3.31.1743508237063; Tue, 01 Apr 2025
 04:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org> <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
 <Z-pQj6ynnfMa77fM@shikoro> <CAPDyKFr0MvQDxsi-Qd0F=1KuR4Gy6s5bhVdOXRt9K14Z9sO2Kw@mail.gmail.com>
 <Z-pyfv_7gJ72YWhz@shikoro> <CAPDyKFqW92wJ9P5cyO0vcV14dU5Q-JRGR=oKOS362crFy6y2Pw@mail.gmail.com>
 <Z-uM3aRHJ_8bwu0W@shikoro>
In-Reply-To: <Z-uM3aRHJ_8bwu0W@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 1 Apr 2025 13:50:01 +0200
X-Gm-Features: AQ5f1Jo07Glme3B0Z5ezvlFDATG1bBux2mgX6GZTlztytvrlGC2oFJ5S_fWro3Q
Message-ID: <CAPDyKFqf3K3-gv2+7yORw3nqxJ5bnFbCH2yB+E8=XOGuYuVsyA@mail.gmail.com>
Subject: Re: [PATCH 2/5] mmc: core: Further avoid re-storing power to the eMMC
 before a shutdown
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Avri Altman <Avri.Altman@sandisk.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 08:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> > mmc_card_can_poweroff_notify() would not be consistent with all the
> > other mmc_can_* helpers, so I rather stay with
> > mmc_can_poweroff_notify(), for now. If you think a rename makes sense,
> > I suggest we do that as a follow up and rename all the helpers.
>
> I vageuly recall that the commit I mentioned below (renaming hw_reset to
> card_hw_reset) should have been a start to do exactly this, renaming
> more of the helpers. I drifted away. Yet, I still think this would make
> MMC core code a lot easier to understand. I'll work on it today, timing
> seems good with rc1 on the horizon...

Alright!

>
> > mmc_host_can_poweroff_notify() seems fine to me!
>
> Great!
>
> > > I do understand that. I don't see why this needs a change in the
> > > existing logic as Alan pointed out above.
> >
> > Aha. I get your point now. As stated in the commit message:
> >
> > Due to an earlier suspend request the eMMC may already have been properly
> > powered-off, hence we are sometimes leaving the eMMC in its current state.
> > However, in one case when the host has MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
> > set we may unnecessarily restore the power to the eMMC, let's avoid this.
>
> Oookay, now I see what you are aiming at. It seems I got the PWR_CYCLE
> flags wrong? I thought MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND is only a
> subset of MMC_CAP2_FULL_PWR_CYCLE. The former can do the power cycles
> only in suspend, while the latter can do them in suspend and shutdown.

Not exactly. In shutdown we don't need specific caps. The card will be
fully powered off no matter what. In other words, it's always better
to do poweroff-notification if the card supports it.

> So, in my thinking, full power cycle might also have the eMMC
> powered-off during shutdown. This is wrong?

See above.

>
> > Let me try to clarify the commit message a bit with this information.
>
> Whatever is the final outcome, it needs a comment in the code, I am
> quite sure.

I will add it!

>
> Happy hacking,
>
>    Wolfram
>

Kind regards
Uffe
