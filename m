Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F3526BDAB;
	Tue, 11 Feb 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291302; cv=none; b=DmFYG+R2osgwh5UlHbCYQFTZ2pIRw2qMlm90RizTMJ0TpW1hta2kRGPyUczeaeCFV3yjYSNqIdMrUcFJFIghoyn3Mt+tYUhq6RaKUl6lwKJmhF969OZj+ecMjyRKLCTmN79xVFWLdaWTT5FaH0EHfpnX40GIK64y9ayaDus8Htw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291302; c=relaxed/simple;
	bh=oItqTVZbp0ANDC8mJoF9eaiOIBmVbYMHhUv1BxWeCBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB13HzQ1UOg/YPrxZzct/6WEUDtYDy6Tzto642ocgmdNA5JMXQkd32E83VM5aISOE/nwiNAMB+a52PkXPUbAVWhBxfID4n8wahXVG7mDMeAmxho5OOOcaza+Iz7s5+H1Ohwkdj9GrFfRYdkiXq7x4ywi1kXbnow3uLxAh/4Ov4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4ba00b6821aso1614109137.2;
        Tue, 11 Feb 2025 08:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291298; x=1739896098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgA8gFOXpsj/QSSXszXpeKHHr8T/tFfcyy9+Om8hw6I=;
        b=AqAVcparC6iGd3P0MhSjAG/ZyWi8502HBqntkVCNYOQOm/JQmYqUz5aRLYbxBuLNPN
         Q8IaXBUjt7Deps2lLYobE1SdrjcnOKd4U3VHlkoSUxW1vUVefsShCWz3qzbIS52zlNtF
         Uj0bDt1R1eG0JQ3sUlJgMiKaO5Zm7fF680+VazoYvZNrmvPRvDJ5cluW4kkgROw0nMik
         CCDxXULDRlotJFXu6JF7pS+53cnPriLb8krsNtsJHY4P8Nl0EMRoqIslDdexShX2JtqZ
         rT0ZjPtv09fCtry43ZZwsInzJlCa2B0JIfbp/igvUQkP6vybmXP4qoz7FAfMHBHFYvP0
         afsA==
X-Forwarded-Encrypted: i=1; AJvYcCUTySIxvLvDK0kjoHqjrnQaR5bheWVxMz+ZUlm+1xM93MqZRGyRzZ30nqUOJQs34wASVobyh0mmGQm9@vger.kernel.org, AJvYcCWtOYJtfNVInz2R/WZQqGzr9tyVgnWIX/Dp+eLNw4gumggIXtLQEj3VNat1XRZSlwVkISSTpYSPer7RdKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmM6fvPVuKJV+Ve3LrWxlPfPQnQ9JNjiOY4VenQTtxDVLe4Ln9
	fGoRH/9H3b/D2yW4qfNGr9b6o/4E3QItjBrBKq05hnBYh2g1qXtJ+roOGfFOlVU=
X-Gm-Gg: ASbGnctaHxLYadEM9l+ZXuHtN+PQlH3eJ79WFHBrHsLjD6eNb1BpluOzKDvtCvmb/UZ
	b4QiauiO0HFtE/Ahl4Bhrq8IqpFEn466J+tMrBXg4bmka9Hjj76C+W7RQ/jM9ayFrQFXrDST7kc
	pQc6te3fk9nZy6G+3unbmgj1XsMMQf2d/DqW3qYGe8lp6yC1FMfP0Nr2WftMwg1m46DTnbPjgJy
	8IIHFJB8q1S7RwXjOzjh7l/IzrQXDZyku0KGS4wegy+Zmez2NvOWpZ6Vu8R7j57lpI0LljKJMwd
	G1fsFoL7s7lrloI92qzPmil/Pc76wvMLwy7x6LuX/OLIbBRkkUgqAg==
X-Google-Smtp-Source: AGHT+IGpv+XuWmsIFduK0V/wxQ3PEU53WHLRXWi1hfLsQygZ0zCpd2u68j6e/qMOF5VYaNsX2T2VsA==
X-Received: by 2002:a05:6102:3f41:b0:4bb:e5bf:9c7d with SMTP id ada2fe7eead31-4bbf22ded5fmr221769137.17.1739291298427;
        Tue, 11 Feb 2025 08:28:18 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f965ee7bsm2112489241.8.2025.02.11.08.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:28:18 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbd554fe87so631898137.0;
        Tue, 11 Feb 2025 08:28:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfNovEii4hEqpcBPUCK9Iav304sx/0PUG3pZ6DzsfZiLbtG8qyvX4X8B/3VxaElrl8+AvEU1OSOWfV@vger.kernel.org, AJvYcCXDnWCJMLILiFxhvTd0fotLboW+GeRk/LuiTAQRydBtCY/PS6T3RZwxUPxsmxjOsnHi4lla7/S4xFKmAKo=@vger.kernel.org
X-Received: by 2002:a05:6102:32c6:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4bbf2312e79mr203543137.21.1739291297935; Tue, 11 Feb 2025
 08:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
 <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz> <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
 <68bb307a-26ad-46ac-a9de-bec9b808506a@suse.cz>
In-Reply-To: <68bb307a-26ad-46ac-a9de-bec9b808506a@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 17:28:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNNSCrad=wZW_q7OX_-4D8gSbj4Qv-S6Y5Ro+qqRYkRA@mail.gmail.com>
X-Gm-Features: AWEUYZlgtGLaioPAuMDynZKouzsATihTrlXxV6Qg2aUP7AeD66fgnTsBa_nAJZU
Message-ID: <CAMuHMdXNNSCrad=wZW_q7OX_-4D8gSbj4Qv-S6Y5Ro+qqRYkRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
To: Vlastimil Babka <vbabka@suse.cz>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Vlastimil,

On Tue, 11 Feb 2025 at 17:09, Vlastimil Babka <vbabka@suse.cz> wrote:
> On 2/11/25 16:19, Geert Uytterhoeven wrote:
> > On Tue, 11 Feb 2025 at 15:58, Vlastimil Babka <vbabka@suse.cz> wrote:
> >> On 2/11/25 11:48, Geert Uytterhoeven wrote:
> >> I've tried to do that in v1 in the form of reporting e.g. as
> >> John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])
> >>
> >> But it seemed noisy to repeat that on every line involving the subsystem.
> >
> > Yeah, it could be considered noisy... (more below)
> >
> >> When you say comment, what kind of separation for the comment would work
> >> regardless of what's used for postprocessing?
> >
> > I don't mind much. Perhaps just a comma?
>
> Hm comma where exactly? Sorry I might not get it, could you provide a full
> example? Thanks.

I was thinking something like:

    John Doe <jd@example.com> (maintainer:SUBSYSTEM, supported)

But I guess your example above

    John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])

would be fine, too.

> >> > Now, as both Uwe and I edit our generated scripts before running them,
> >> > we can delete the unwanted lines, but it's more work...
> >> > Thanks!
> >>
> >> I guess technically your scripts could detect first if --no-substatus is
> >> supported by grepping --help or testing if passing the option results in an
> >> error? But yeah it's not ideal, looks like I've hit the limits of automagic
> >> heuristics here.
> >> Or we make it fully opt-in but then most non-scripting users will not learn
> >> the status at all because it won't occur to them to enable it...
> >
> > I still seem to miss the real story behind this patch (so perhaps
> > that's why I would consider all of it noisy ;-). When I create a patch,
>
> The cover letter tells the story. It comes back to the way the script
> reports maintainers as "supporter"s (or other roles according to the status,
> however some status means there is most likely no maintainer). Joe objected
> to that status reporting would be simply removed in [1]. I also think it's
> useful information for the submitters, so I try to provide it differently.
>
> > what am I gonna do with this extra information?
> > E.g. decide not to send the patch, because the driver is orphaned?
>
> Well for example you can know that you might not get a timely reply, or
> might need to step up as a maintainer. Or you're trying to add a feature and
> the driver is "odd fixes". I think we do document the status in MAINTAINERS
> for a reason, and one could expect the tool to provide it and not require
> you to go look into MAINTAINERS yourself.

As the "S" field is separate from the (possibly multiple) "M" and "R"
fields, it still doesn't tell you e.g. who of them "is actually paid
to look after this" and who "actually looks after it"...

To me it looks overly complex. I send patches, and resend them, and
invoke e.g. akpm if all else fails...

> [1]
> https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
