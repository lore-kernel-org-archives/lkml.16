Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292271DE4DC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867700; cv=none; b=txKuisNwaHtHHcoxpzX6rxz1DH+0dk3yjeYbb0ZabyLNSzmHCzZbcPDFIh1Fk6ONWKz0BRHTgqEhezlZjRXwfpCNgKqm84y9DE7WH8ohQMOQUgNZAqlfCtDGaHBcb0q3ZhMZf3yisNCOPWURHVxnuHQ+2ufqnVAbMiq3jfV1dR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867700; c=relaxed/simple;
	bh=5nulTxMnIYIk2hOq1j9PcbmTHrZ2rCRpv8a7ug/XG1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnx/gQj0tAdmztgzMSRX60MWQR6RIX3g6F8wAkI97Q1OP+GY/m40cNPy0fCwM4R73sBuQ4NCQQS9hb+3muxTMr0sbylCnzjrAAeSONoHZdSzpE/3jDIa4tMd57PB9ZhE8J+ieUiORRgAHNX0Ugt8O73VCnvGqKYPNMxVD3Nhi+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6BY8kl1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6BY8kl1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4898C4CEEF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744867699;
	bh=5nulTxMnIYIk2hOq1j9PcbmTHrZ2rCRpv8a7ug/XG1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u6BY8kl1e5RiUzj6KkiXzVQYJpW+LTkKkTwzh+gjlRw30uoPjHK6IwcO270ACiauZ
	 YqgTXDrJGFrNflAhf4Yrkh70UTdTDn+J07Uu5abmoJTU+WOyLkLQ+zJDR+BrzFFPy0
	 e8gX77TUf0NqFSKi6SdVuZmqEGSsqslXkdhJAO4b6nxZK9dI1DJjPpQYisBW67DR2z
	 Ej4JlIuxCh5+7VaEE3bHDgOOaJWGjnHqEJHX7WRTDKRU2nXL/sz91W1JRx3eNJjPH+
	 ZAh754u9xtGABFFiGAyhx0WdUgLP5f4M2bykWiPyH/zdzLyv3LUPFvWsWqmaezOD80
	 6/0V+REAstRcQ==
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476ae781d21so3904381cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:28:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzh+mwWId6mtHEKyl9dXGSotD3m9uNDplSADiLrm4xKgC4tdizI
	80VY+pYhc1vWKWBzuLx7NnU4qHRi3BZRVZLlFKwiTN97yuaPRTA7Rz8LnslM/IjYiPPaCqaV18h
	QRBMelwJXdIK7SHBRLdbdJhr5HY0=
X-Google-Smtp-Source: AGHT+IHfj1ZW6/f0Qbs3G+6VwYnqPt5fWy6B+JR8gDtIXleiML091O70SkU8AQXdIYiui6SSAujoaGuVRQNK+y2QMhE=
X-Received: by 2002:ac8:578a:0:b0:476:8288:9563 with SMTP id
 d75a77b69052e-47ad80973a9mr54281061cf.10.1744867698822; Wed, 16 Apr 2025
 22:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
In-Reply-To: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
From: Song Liu <song@kernel.org>
Date: Wed, 16 Apr 2025 22:28:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>
X-Gm-Features: ATxdqUGu0s_Wo3j7qUbZSWmwU_ALvQ7OyebLFavS-tdfwMv1lJEa2d7htYHVD04
Message-ID: <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>
Subject: Re: The future of kernel-patches-daemon - folding under LF?
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kdevops@lists.linux.dev, 
	Jim Zemlin <jzemlin@linux-foundation.org>, Konstantin Ryabitsev <mricon@kernel.org>, 
	=?UTF-8?Q?Javier_Gonz=C3=A1lez?= <javier.gonz@samsung.com>, 
	Greg Marsden <greg.marsden@oracle.com>, Tso Ted <tytso@mit.edu>, 
	Gustavo Padovan <gus@collabora.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luis,

How about we discuss different options over a video conference?
We have a BPF office hour scheduled every Thursday at 9am PST.
Would this time work for folks?

Thanks,
Song


On Tue, Apr 15, 2025 at 10:47=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> Song,
>
> We're starting to rely on kernel-patches-deamon (kpd in short) [0] for qu=
ite a
> bit of  linux-kernel subsystems and have integrated it on kdevops for the=
m [1]
> [2]. We already use it for the modules subsystem but even then that runs =
into
> hiccups every now and then and we just have to restart it. For smaller
> subsystems we've started to experiment with lei based patchwork solutions=
, we
> started with the firmware loader, and the hope was that if that works we =
could
> move on to memory management to leverage the automation of tests we have =
for
> xarray, maple tree, and vmas. The lei patchwork instance which kernel.org=
 admins
> have helped us with works well, however kpd doesn't yet work with it [3],=
 so we
> can't even get that off the ground yet. In the meantime, we've been inste=
ad
> relying on linux-next tags to test other subsystems like memory managemen=
t so we
> avoid regressions that way, instead of testing patches while on the maili=
ng
> list. But we do want to get to the point we can test things proactively f=
or
> different subsystems.
>
> While we could look for alternatives I think we need to face the fact tha=
t we
> need more kpd love. I'm convinced that the only way to scale Linux kernel=
-ci
> work is by dividing and conquering and those can contribute to different
> components do so, and kpd fits well right in, but I think we need to star=
t
> thinking about scaling it beyond just Meta. While we could just try to
> contribute to it to fix lingering bugs I've noted my first issue with it,
> requring CLA [4], and I don't think it makes sense to fork it from Meta. =
kpd the
> sort of specialized daemon that also can take time to learn and believe a=
t this
> point it might make sense if kpd can be part of the LF covered toolbox we=
 can
> get support for. Ie, make it an LF project and see if we can get more hel=
p with
> the sort of pipelines that fit both Meta and the kernel community.
>
> Let me know your thoughts.
>
> [0] https://github.com/facebookincubator/kernel-patches-daemon
> [1] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/REA=
DME.md
> [2] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/ker=
nel-ci-kpd.md
> [3] https://lkml.kernel.org/r/CAB=3DNE6X5mJJmcXjEkHyE=3D2f1CCA5fDDEjMFH_a=
MArrhom2qO8Q@mail.gmail.com
> [4] https://github.com/facebookincubator/kernel-patches-daemon/issues/62
>
>   Luis
