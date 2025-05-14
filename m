Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72B0221572
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210510; cv=none; b=cg9rn7AAKNRavuKjXuqLcZ5XVNjoLUqr4wGKvpOmE6rd3aBAvU4LzELG6ww77BkiyqMLtpVnt6CwFhrS4B8jS1qsJ+GnM+nYljkSqiW6UvcgQbRufpRAlS2Bodd+3AHGjZCgrNR743nJhYbwWHZBOb5MEwGu1giCPgavaD+z8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210510; c=relaxed/simple;
	bh=9VCZ2nTIs3bCUWVuAYQgmVxueOMul5I+8ga024o2NB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/OpQUm7mjTFygLCh5fsU2dU+yoq4gjImycdJ4E3ovgWRM8CmP0P1C3HbeZ9RfrMfehY/W7IF3TuGZAf3JP2kF7C1gf11wyoK+xyoBdIDGBwgoDvyvxvwFfdHTZfNxdP5yviGjYfycewg/hCG0mMhLi0ToOnOMEcNblUncp+RMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dw6eMP3U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dw6eMP3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24731C4CEEB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210510;
	bh=9VCZ2nTIs3bCUWVuAYQgmVxueOMul5I+8ga024o2NB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dw6eMP3UhWFPvTXkkokCdhU/Xl72PEoTwImjTjs4vhzAOg0L2CBgUZC8NBqVxuawZ
	 I3ihPluFcZhHI81AjUqUd1ORvcF/9adntjAMULNKXN43nX1lyu13NIus8nxpcS1kx3
	 qhlOHRjj+Mcpeb9cn+3qkR/xihlYxL3OCNkKJPMfpi/pGGYr0uvIgtQJK3ozXXAET3
	 asXnvgPoVBKqeTatgE4QbldNqvB2SJ+tutH48MRMvEYIWUXXV/FQq9j1fMQLNkph8F
	 Vxu41kM41EaDKHljQiC3qmwy33xenKrLUNVI56Ss+fLpo2v9rQvBfrg7Ek32MHEje7
	 ceki9nr049n9Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7930575e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:15:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/Ir/RDSSzS66fHyI6qKGi9EvZ6yoxTiTga69SY7QQNZgtN3KSlM34mKZkj246rslRxfGGn48shngpmqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gp715PTqxKfFh06gRC9rhKCX7IgkS0lJmeZxselIUKMzS+HV
	GIX/jSXdMN1J1cwWMsdNiM+LPeocWxsZGclokqbD59UP92XVi9dgs0GV0RpEkxoBCAJwfm0vOsC
	ZpHW2QFznziuxuRzqQvWwId9X8Ec=
X-Google-Smtp-Source: AGHT+IGUWeYGV7srKLxri40hS627pla6oAdPrNn/iGJSiTLZpJPZeHPZFQEgTAits1U4kYbamCgJdgB/UEyvWT3cdIM=
X-Received: by 2002:a05:6512:2588:b0:549:8f15:db18 with SMTP id
 2adb3069b0e04-550d5fafe54mr918617e87.28.1747210508516; Wed, 14 May 2025
 01:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-10-ardb+git@google.com>
 <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh> <aCROdV_fIygO8OoM@gmail.com>
In-Reply-To: <aCROdV_fIygO8OoM@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 14 May 2025 09:14:56 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGChWHhbfjUgTQ37+epLjivrKhV8unwyZCHvNTJL2f57w@mail.gmail.com>
X-Gm-Features: AX0GCFulJvnHexLoDyvpHu0YI-wl8atKuHlQpPRLY0e2_i3HQ4O3x1qtuq1KPmc
Message-ID: <CAMj1kXGChWHhbfjUgTQ37+epLjivrKhV8unwyZCHvNTJL2f57w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level paging
To: Ingo Molnar <mingo@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 09:04, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> > On Tue, May 13, 2025 at 01:12:00PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Currently, the LA57 CPU feature flag is taken to mean two different
> > > things at once:
> > > - whether the CPU implements the LA57 extension, and is therefore
> > >   capable of supporting 5 level paging;
> > > - whether 5 level paging is currently in use.
> > >
> > > This means the LA57 capability of the hardware is hidden when a LA57
> > > capable CPU is forced to run with 4 levels of paging. It also means the
> > > the ordinary CPU capability detection code will happily set the LA57
> > > capability and it needs to be cleared explicitly afterwards to avoid
> > > inconsistencies.
> > >
> > > Separate the two so that the CPU hardware capability can be identified
> > > unambigously in all cases.
> >
> > Unfortunately, there's already userspace that use la57 flag in
> > /proc/cpuinfo as indication that 5-level paging is active. :/
> >
> > See va_high_addr_switch.sh in kernel selftests for instance.
>
> Kernel selftests do not really count if that's the only userspace that
> does this - but they indeed increase the likelihood that some external
> userspace uses /proc/cpuinfo in that fashion. Does such external
> user-space code exist?
>

Bah, that seems likely if this is the only way user space is able to
infer that the kernel is using 5-level paging.
