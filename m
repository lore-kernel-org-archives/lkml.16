Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB02262171
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294506; cv=none; b=I2Zwcdh9XKv9JCrOtNfANR89dMm4AN2EkjRAIPQMTZEyXOgAXma6nlKHkdxecV5JQYKwF0g/7oJ482mzMtjThW0QDUGLLb33f2Kr2cxjlLLyTPPw8SYVhhwFLAvEjQ3SCgaJiRIM+9OM/U3bw7Qo/adtHdm7i6zh9K1VseOJTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294506; c=relaxed/simple;
	bh=33aNdAWPleqZPWLjPNi4tNlbUJD+PrwWrkwh59O2C6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuOlP/isnK9OhlSuVyu4Ju5Lhto8kuUDU6f7PPT1iYzZvdNvMURhsSekYUIl/BdCAuDW0hHyDub1NYVXbv77W/U8FKD92JwygvluEUIDlsIhutlwNHYGNlqIqhIXWgX2cUl/Nnr4V2tpOS3Da7QViw9M0/jGUxEj2NzdefSL1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HY+4aWh9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HY+4aWh9"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4718aea0718so418391cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739294504; x=1739899304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQU4kCb3JDQS3HCzC0AuWPhi/mIN8ce8zfOQVORZJ8s=;
        b=HY+4aWh99z8/UHxn20i5I56CSkhOHgleC7PmsRaiUBADvpHNhynGO23gd3jYNR9czd
         h5WfznooPc18HbgkxcZdAIC5Fv3Xdj1pM04JQTTgj7nlmiFrUpV/PPOMHPMjGP1+jm1g
         fwsWE38ufAkvVlBmxxQVSuaX6OZno54klkZioudnNKsfHPOJ7cycj//TQ5oAzWltvZ3h
         KZZ8XMf8bToZ+0y8obN6GATRLOx4YSPUENzoouJVCUNw7OYg6elQ2tHqXmg1oYyBse5w
         pT9qSzF/ISvi7G3n+YutBv64+8HKXxYWbW7LmxjbzdOPB0WS5UZZjGWKl/fkEvsEyWFH
         LKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294504; x=1739899304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQU4kCb3JDQS3HCzC0AuWPhi/mIN8ce8zfOQVORZJ8s=;
        b=YKi7I/TmPflWS+gJszUOemNA6AEgBldZQ0B/L3CnfkkVWwVPeBHUQpBqzvMcMJraDh
         +RzsRJycYIQpy0cw2VWxXHCgzN1tz6Ygr4/EKz402ELTuqDKY6W0KUe36xJ+qPoJ5Uvw
         h4z0+BGmqkfpQ4jDzDLIK6HyAGsf8rxYYLnBI/V4DyOo3TjsjM+xIERVXUUm00OQIWnQ
         pzTzsAqnhUs1vwMd60yuUJp7JDHDoqwWJiFuJFhB7PyM6iqaWDsiNU4bMV1OIbiRvlAm
         +KCVxdlmR4mHnVIfMN8zTSULQhvR+99FjFMg81jlp0cb6gcy143pd5qC1CbWANhZtHy/
         rSLA==
X-Forwarded-Encrypted: i=1; AJvYcCWpkOMtAqxM4LZ80hjKne6bCViWklSCMFHL6Z3ekf+LfAQPzvXw+4lHJO+qp7Z53QwqIDICKuuAXV5Xy8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YweaItbfMJneu5zm8pDIhYk8AdtOlnuNAaQ13DV/5Ux7Ao6VCPu
	cXo5F9bEDYfxVDJ5DzYMN+sEjHfeX07UYqzWB3xEk0WDphDUiW7nTPwKmDXvfvxSRK7xDvAd/4r
	HI9OofBxMYvaV10Lp87bICerK4IVsHYjUcYjn
X-Gm-Gg: ASbGncu7rYA8mnsJUPs9giZSUKielbqnN4P3vRodmtgZLrtCklhylMGb6Sjc6qmIZZ5
	elrd+8Ystm4wiW7o+h4CH75TqFCt97+p4SNXMMckzkob5PsXTqRMIXvSWwTVdM87g62vNjQ==
X-Google-Smtp-Source: AGHT+IGOEFH7664K9RlNpVES6sDxn8gX1Ls9BZ79xJQxYziPDxioUbrCegncHzSc4ClUTc63c5nWi+UY2RfjDX6kyag=
X-Received: by 2002:ac8:5dcb:0:b0:471:a0ae:7e3d with SMTP id
 d75a77b69052e-471a2611629mr3841661cf.20.1739294503928; Tue, 11 Feb 2025
 09:21:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com> <Z6pH_9X-kFhwPz2-@localhost.localdomain>
 <CAPTztWYD09A5rJBPNtjDa07uMswxFHutYGwBR54ByfMchd6YKA@mail.gmail.com> <20250210152858.58e6ac26b9cd6e2a36aaac8f@linux-foundation.org>
In-Reply-To: <20250210152858.58e6ac26b9cd6e2a36aaac8f@linux-foundation.org>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 11 Feb 2025 09:21:32 -0800
X-Gm-Features: AWEUYZk3xVLMBtUXNyUTcyykqkTjpJHTLzYu4NG1RcZKt9p7J4QDT-B2dpP9DTo
Message-ID: <CAPTztWZs44-drRC_+9A3+BnhrFVTS-MA7TziYhiX4wjRFyuamA@mail.gmail.com>
Subject: Re: [PATCH v3 00/28] hugetlb/CMA improvements for large systems
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:29=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 10 Feb 2025 10:56:50 -0800 Frank van der Linden <fvdl@google.com>=
 wrote:
>
> > > Hi Frank,
> > >
> > > While I plan to keep reviewing the series, I think it would make sens=
e
> > > to split this patchset into two smaller ones.
> > > The way I see it, we are trying to deal with two different problems a=
nd their
> > > solutions.
> > >
> > > 1) pre-hvo at boot time
> > > 2) multi-range support of CMA (only used for hugetlb)
> > >
> > > I did not go through the entire patchset yet, so I ignore whether the
> > > respective patches to tackle these two problems are really dependent =
on
> > > each other, but I think that would be very interesting to consider a
> > > patchset per solution if that is not the case.
> > >
> > > IMHO, it would ease review quite a lot.
> >
> > Hi Oskar,
> >
> > Thanks a lot for reviewing this series.
> >
> > I certainly could split it up, but here are the dependencies (it's
> > actually 3 parts):
> >
> > 1. Multi-range CMA (used by hugetlb) (patches 1-4)
> > 2. Pre-HVO for hugetlb bootmem pages (patches 5-22)
> > 3. Enable hugepages=3D (and pre-HVO) for CMA (patches 23-28)
> >
> > 1 and 2 are independent. 3 depends on 1 and 2.
> >
> > So, I could post 1) and 2) simultaneously, and 3) would have to wait
> > until 1) and 2) are resolved.
> >
> > Andrew, do you have any thoughts on splitting it up?
>
> I don't see much trouble with the above dependencies - we can consider
> the three series to be an all-or-nothing thing.
>
> Such a splitup would be the same patches, packaged slightly
> differently.  The main difference would be the presence of two more
> [0/n] cover letters, presumably also repackaging existing material.  I
> don't see a lot of benefit personally.
>

Thanks Andrew. Here's what I can do: keep the series as a whole, but
note at the top of the cover letter that parts can be reviewed /
applied independently. I hope that works out for everyone.

- Frank
