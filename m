Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD541B4257
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905673; cv=none; b=R1eBq+oY0sBa+buRrMXb1lsu4f0Dd/yg7+NGmOXKEAcs+MLRpnm+nlKm99QOxfILAKNdCHEFkA0oxmUptpyxev3AnPGEv6Ai8fFlR/7k1wZYWZcmYopsIWFF1NmsqE0zfM9U32RcllAJV7WcI4K6wRDLsiwrHV14xA4tX+smhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905673; c=relaxed/simple;
	bh=RXvqmdkxDwobcsY3vlLExzQPXBm/4w62Fdyp5UZdEWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0aj9J6Al6+tjxNL1EVfiOY932p8IuagWAKMvStOkheahoT6HLn0TYNTjgUT/yq04GDrV0Pkkb6E2bsN+3+vA3U98CVCOFLNwhgMMeNOAlawTfsIwOF9Ym2dGif4nu9QQ+0hckoHOK3iM3QpNFXdSoSyYOA/sMCHsFT3zw/e8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwBVrxhY; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwBVrxhY"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769e30af66so391761cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744905671; x=1745510471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXvqmdkxDwobcsY3vlLExzQPXBm/4w62Fdyp5UZdEWg=;
        b=nwBVrxhYdgiHKKh1qJxOIXFOUL5wZXWe3nl52v0pFEq19XHIYImH5YsEQcx//CMf4o
         K+e6lWsCOZCWC7qyeV5gw+1lOJevg2MTvsk3EEtdHcA5PLUrrSIE+dyjeIjER7CCGBgL
         4L2SCn+lT8DL4IHkrcCzGcD7AKM1mncuuDPy7bAj3JHG59W9gfI1xE2l1AewkcDwAYpg
         B4MnVuwwR7ufqWfxR7gMGyjSGrt6Se9TjzhHsL7aCaJISXT6NKrHOwb8YyE/DsM/K3eh
         6FkQbVcu4YRQyOPsXMiJqiPirnp/Q5ZVjqCO0naA2TuzoAMbFr9WDCyD7GXWmchmcLla
         /KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744905671; x=1745510471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXvqmdkxDwobcsY3vlLExzQPXBm/4w62Fdyp5UZdEWg=;
        b=Y9zpO1TDhSvBmiP1CXw6o3uMkBQh8A0qPju7YS6ZAm7KUgNsXZVj+ixiaOSFo1r+vW
         OuChQ/iGbKL+CdY0c744pgskc9ysqQfo/tZPQx6BoFpuagUKnpsh21bqreSSQrH3l7QS
         xX0pA80KwYc26PIx7STNvtyU/GkVRUJ2LpY6tsf/LK6A7duqaolJs2JWjerzFDPRAyjX
         e+4jeGz7kOXz2b4mcTJZSRI3S7+mSO0h2LXDPBASZR0LGOYXz8ZFcH9q+YvGI8NPb8ql
         niV8cMqjhFZZh7K/+A4sDF6fbYCFzPWPzTTVV6pch2KCnXGNZUdQkv14Lqc06bSz3/Tz
         1HNA==
X-Forwarded-Encrypted: i=1; AJvYcCXSp5R4d3hAs1BOz4t2icSBa7w0UvIa8YKYxLhcP8Wiu3KuSq/SR/FrB7J4ipy855Vs0ktAHQD4RHLddmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysoerpkXK3f0LmKAMa6m+4Ol4gQ6vjQ3eQKVp0LvR/iMLRsAUF
	MYKt4c9NofG6NhFakkUgUf5R1bcAIueEl3ojAf8v36GSzTZncnwGYmAjwA814JQDbsSosa8NhUa
	6ydtohhJNYJqdoZWF8tsgkZ3Ob+szbgaxnBiF
X-Gm-Gg: ASbGncsj1SB0gtS/j1ESGBOSc5K/ozlPSFF1tVC5j/HVnYdBhxXIVt6C+dzIBx0GMx1
	+dHHdn0c6Jy/OiIM6bnbkjw5q3zHDwN7WzOUkCP27KlwAC2zZH/d6FfinU5Y1R5S9WQ4j3tKHU5
	U1yAU6MAFjDgYS8p4mogOh1B+YLcnLvqAinwwTMKpL9LEHDVd6R1wQ
X-Google-Smtp-Source: AGHT+IElVrWiz+z6aR7JhOdXzIoqqu2MsQ71ji5T7pH6bgq7qi5lY94wzW3l+XdMMuRQ1ZiujS3QZITYZkuudyFzqyk=
X-Received: by 2002:a05:622a:1449:b0:477:7644:b738 with SMTP id
 d75a77b69052e-47adfca3569mr3481591cf.17.1744905670196; Thu, 17 Apr 2025
 09:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
 <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
 <CAJuCfpHcUfXb8RaGCExLc5U2HK3xcA0CjY1diM=S6DDqNFFykg@mail.gmail.com> <ogiahgnqihzg6nfew6oifgzjvetiwo25utp6jwskrhw4axdevp@rwqbgeraivym>
In-Reply-To: <ogiahgnqihzg6nfew6oifgzjvetiwo25utp6jwskrhw4axdevp@rwqbgeraivym>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 17 Apr 2025 09:00:59 -0700
X-Gm-Features: ATxdqUGoXYeBBRka0OEQp7wUI-t8t96QTHYYbOOhQhBMvYDpg8pP_c2LgExMKM8
Message-ID: <CAJuCfpE3JgJVB3+-ZZPU3kFDjPSJyo4WFtwmtMUnXJ6q0E09dA@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:47=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Wed, Apr 16, 2025 at 05:11:11PM -0700, Suren Baghdasaryan wrote:
> > On Wed, Apr 16, 2025 at 2:41=E2=80=AFPM Shakeel Butt <shakeel.butt@linu=
x.dev> wrote:
> > >
> > > On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
> > > > On Wed, Apr 16, 2025 at 11:06=E2=80=AFAM Usama Arif <usamaarif642@g=
mail.com> wrote:
> > > > >
> > > > > With this Kconfig option enabled, the kernel stores allocation ta=
g references
> > > > > in the page flags by default.
> > > > >
> > > > > There are 2 reasons to introduce this:
> > > > > - As mentioned in [1], compressed tags dont have system memory ov=
erhead
> > > > > and much lower performance overhead. It would be preferrable to h=
ave this as
> > > > > the default option, and to be able to switch it at compile time. =
Another
> > > > > option is to just declare the static key as true by default?
> > > > > - As compressed option is the best one, it doesn't make sense to =
have to
> > > > > change both defconfig and command line options to enable memory
> > > > > allocation profiling. Changing commandline across a large number =
of services
> > > > > can result in signifcant work, which shouldn't be needed if the k=
ernel
> > > > > defconfig needs to be changed anyways.
> > > >
> > > > The reason tag compression is not the default option is because it
> > > > works only if there are enough free bits in the page flags to store=
 a
> > > > tag index. If you configure it to use page flags and your build doe=
s
> > > > not have enough free bits, the profiling will be disabled (see
> > > > alloc_tag_sec_init()).
> > >
> > > Is it possible to fail the build in that case i.e. check the page fla=
gs
> > > availability at build time?
> >
> > The difficulty is finding out the number of allocation tags in the
> > kernel before it gets built. Maybe there is a way to add an additional
> > post-build stage to run that check.
>
> Yeah that would be good to have.
>
> > But even then making this option
> > default and causing build failures does not seem like a good idea to
> > me but maybe I'm being too cautious?
>
> Oh my question was orthogonal to the patch. Basically some users may
> want build time guarantee for this and they can enable such
> build-failing opt-in config/check.

Yes, that would require the post-build step to check the number of
tags vs the number of available page flag bits. I'll add it to my TODO
list but it won't be at the top, sorry :) Volunteers to help with that
would be highly appreciated.
