Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8120F09A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955447; cv=none; b=FKLKLiCCV8Y2rV+DaCaI2mMzftnB0tq6wml3kTR/UAmRw/qP8RYxvcxdHf8GtZfXsO8mZmA1myRCmclIDDh4cxIWH2ifl2Fl7ocV9498UO3Scg9+RSCL08zQaMDQKVyTDRD7GjNIN+aIhUroLVj1sos/tYGlzN7hy55z8Vuzegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955447; c=relaxed/simple;
	bh=VxniKKxdj8VO60D+f8aO8Zk5R4w5C4igetSRbzU2mqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpQEsqxBcs17XpDcYoj4cdcsAEFZY+SeEzLLBDMLshGa7JC2HM7oTrZM7rZOAzjXECeZE4jSMN3B6g9VgHtSomd76MjSl7yPykAdNliETkPzDy9vAYfhQTUkJYEW+ZYLrjQoIkEDY5tbiOPied7BoMYl1DknNiYU/Z9bPUDEea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qVFEVI3B; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qVFEVI3B"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-237f270513bso179785ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750955445; x=1751560245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxniKKxdj8VO60D+f8aO8Zk5R4w5C4igetSRbzU2mqw=;
        b=qVFEVI3BnK/A8w48E+me7Yu/T4PEBwoQV8siY2cs2fdMtMl/1UGcWjZogr52vUUf2w
         SrmmY+sxVCS66PFYNxgie6YlTIgbQlE+zDkmbgbxIJ1gkTg+/7pV/imtZqaVP4QHMmPi
         5llOuln+TKIcY6g3m6eOC7IHEWYBcnSnOR+BxgJYM2z6DMXoSdq87FOcnm1X3SXNqqqs
         z//VwFTAnrwEvPDull3wnQdo2VTlUYcQY4wHOnKP84G/Rl35+tuw1fvmLFLZJv8U2cRz
         E4lQZXc6OVVzfmxiiIvlfAkmQzcXH3DaDAqxyyMLb4xorfS968EyJUMceaCFfJnRPKg0
         yJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955445; x=1751560245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxniKKxdj8VO60D+f8aO8Zk5R4w5C4igetSRbzU2mqw=;
        b=RjWYTkSnGjEubyytT/hyVDxSsAS2ohg9bl9OhGE7gWPEebmGsyKmBYycU9AFj9vS/j
         pok/rIH5A6Bkq4MkD9rI5wJSoAdbYaq9XyZpoFtb49B2UYPaHH/bArK7ET9flY9JCpUX
         YlDEwgCvvC6x7qrspdOG/GG061X6+eTKW4T2ltELndWhgQ73eM6EHh9M/csid3S6VNFf
         BLEFZvKyI6njcPV+U7ScFQXCn7lRHp/yoYumpodSCsAID3wzvangHqPlxHz0LrYV6VYS
         t2zvPcs33AfO812/MpFKs35afAGkgzQ5d6/5M830LnIpp3YwM5ZildL6yi24prWPJ0JK
         k5ww==
X-Forwarded-Encrypted: i=1; AJvYcCWxu5DePsrn4zbExst5q3lIyFbKkYRU1JM/Uzy2XPthjKuixZ+MqpzPlpJOiCgXbmmVrEQDO06Xb8fJJZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvIIzLV+EK/sPv9jHNISMaZiVYNYc2b5IWeI5Y4G+6Fh09PeOZ
	p6LmoJT21gSIdujU0jrvH8u6ovcIXf7Wy/X+aoxVSiij6/9O1P+mPsfJkegXBGkrggpE4Zct5wR
	FeOSVP0iQUiAgpeLEFMSiQlMLz26vt/Qq9KzZcIqWS7T9YUFtpyODDmpH
X-Gm-Gg: ASbGncsj69u3Gm0PHkJX+5qgxkl0mXA1uDICQng7KUs/Byzfni69KYSmcjMJVLdcpra
	FLSxObn8/0QHR5v/wq2Hzsdjdx3SrM4o+hs1BSIhmpf4onyrY3Sf00apDSZnDWbwamBwhtlkfRo
	Cde8JSZo973BsNG0JB0QIdncKcUFaGoJ/jsT/nkLY3IqJrn0odVsDesh4CXzhd4zjWvl+bAhSq7
	w==
X-Google-Smtp-Source: AGHT+IHnkI1JTKMufhBHrZlGk3kcyVjXOAIfbl75+k0vyNtVnCOnm8BKwUiXRKwCOmCAmjKm1fvC9OsZdFGZsBrVeGo=
X-Received: by 2002:a17:902:f64a:b0:236:9402:a610 with SMTP id
 d9443c01a7336-23ac169a103mr188905ad.22.1750955444986; Thu, 26 Jun 2025
 09:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619181519.3102426-1-almasrymina@google.com>
 <175072801301.3355543.12713890018845780288.git-patchwork-notify@kernel.org>
 <CAHS8izMPWjmxLWJr+BSqd5jamsFHDOm71NkG7fmm-78SkLxQTg@mail.gmail.com>
 <20250625170305.40d8c27a@kernel.org> <CAHS8izO9=Q3W9zvq4Qtoi_NGTo6QShV7=rGOjxz3HiAB+6rZyw@mail.gmail.com>
 <20250626082327.59888c1f@kernel.org>
In-Reply-To: <20250626082327.59888c1f@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 26 Jun 2025 09:30:32 -0700
X-Gm-Features: Ac12FXyeQlG6eMLJvH4wzEsZH3DMG00Fymfw_gdDT1maO_1-nKM7RvUbzGWO3f0
Message-ID: <CAHS8izPCjjfgfUWVuANcCLs6DLCefAyQL4OKT9g0YQTt2jraKA@mail.gmail.com>
Subject: Re: [PATCH net-next v5] page_pool: import Jesper's page_pool benchmark
To: Jakub Kicinski <kuba@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	hawk@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, toke@toke.dk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:23=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 25 Jun 2025 17:22:56 -0700 Mina Almasry wrote:
> > What I'm hoping to do is:
> >
> > 1. Have nipa run the benchmark always (or at least on patches that
> > touch pp code, if that's possible), and always succeed.
> > 2. The pp reviewers can always check the contest results to manually
> > see if there is a regression. That's still great because it saves us
> > the time of cherry-pick series and running the tests ourselves (or
> > asking submitters to do that).
> > 3. If we notice that the results between runs are stable, then we can
> > change the test to actually fail/warn if it detects a regression (if
> > fast path is > # of instructions, fail).
>
> That's fine. I don't think putting the data on a graphs would be much
> work, and clicking old results out of old runs will be a PITA. Just a
> little parsing in the runner to propagate it into JSON. And a fairly
> trivial bit of charts.js to fetch the runs and render UI.
>
> > 4. If we notice that the results have too much noise, then we can
> > improve the now merged benchmark to somehow make it more consistent.
> >
> > FWIW, when I run the benchmark, I get very repeatable results across
> > runs, especially when measuring the fast path, but nipa's mileage may
> > vary.
>
> 100% on board. But someone with Meta credentials needs to add a runner
> and babysit it, I have enough CI wrangling as is.
>

Of course! If someone with the credentials volunteers that would be
great, if not, no big deal really. We can always get the runs manually
in the meantime. The volume of pp patches isn't that much anyway.

> Or we wait a couple of months until we migrate to a more public setup.

Yes, I'll take a look when/if that happens (I'll watch out for an announcem=
ent).

Thanks!

--=20
Thanks,
Mina
