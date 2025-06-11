Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E525BEEF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644507; cv=none; b=fskcIFunVIyAGAjGnknHPxcOUhZ5lsb71U18cUOYTJeB+AgRErZ6oclTLwEEdKP19/wTAH7yIf6RQz0H+UxQWVTwOLaxxVEDVAA84syWjIwyY7NGM+Tk5BOj7ckqOy2yN1ArSVdTn6vzOjZl4JfY9jp1sjXj6ITO6e5tTJfdFiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644507; c=relaxed/simple;
	bh=N6AwoaQ8JOMbGY9qqlJYeVZCOwSny51eFYcWlv/tM1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZY+qe5dnamB9Az9p/WYTlSC52NqHHqJ37rilCz79pxwQMoW4BE0YaymMtfV5MskfBdqa2v50GWHb/u4eCOYZpy7XFgij7NQtLxp+C7JCMGdfHTqMDadmfRwreGn1YnkA8I9uaH13HekWCcRf8GdHJMtihB550OogNxX4l2+xreU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=e9A3VMnS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="e9A3VMnS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235ea292956so62446195ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1749644505; x=1750249305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6AwoaQ8JOMbGY9qqlJYeVZCOwSny51eFYcWlv/tM1g=;
        b=e9A3VMnSDd5UrGFqeXgxbxe7IOdcbtKMnU1L7ws5O8bU0Ezk6FjUnUxlb586pvW0/f
         WdDk5nG7RBWj8VRQT/jRynyPXkVMtTuGXz1RiqA0FRQuKps5YJLusjhFxL76LT6i8erM
         PLCCgjkTba5ftWiJwTnZdlU6SV++s3YhI1IlA4aTiYpIz3KD8IiB+lIlOCMWIx5Ou6VA
         gfF/3aWj8JnF9TeYDs6xoDrZSOUVTA4IvBHl5siUTRwXnwGbIIELdrs1uegcYV6buGZ2
         3GapD7bWKu9QYcgIwfNOwqbteivvC6CMzYNIUjj5F4ZIkSOfBgcfekUfZGmSJJT/AG8G
         YX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644505; x=1750249305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6AwoaQ8JOMbGY9qqlJYeVZCOwSny51eFYcWlv/tM1g=;
        b=iAqAwqG8RNqDrXSdIHwmKEWz9vZyQ643zHdshN1y6tRjz+VLl78l5yBrzKgVDHLAJF
         g03ML2b8EDZ+FC5aW1S0ng7mFGdhMziL1Zd8XgiTICvcX43YV+r08mvjMAyfITQo+p+Y
         xLE+BtK135RJWsYWNc7KtRIqNRf5bs+sdlunhQUBOpnG6ogvyh+2rMs7hfbIXYAD2XIJ
         Kr9mI6ItxFHn0v721M1MpzPfnv+6bOhE3Im/YWkEUYO7+i2rH4QCSkxLJVNv+YOP3+Ho
         mQKmZ/u3aXkbBWtNQfyKxN4rAoC9twPppYvlK3gj19l/CVVMaYazZvSU2OT45CsunsBh
         jxJw==
X-Forwarded-Encrypted: i=1; AJvYcCXGqikO9gZRIKDRoX8EJ9TV1FHv7FipIDYa6Uadc3LRWSkacvv6FCmCxpm9WKeypmvvzahvVAaviyp+0K4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzw7fO2PZajK5apgmYpp8VKNjhZ+o6rA6TzJGtRo4loozy/GI
	hzcTjr3+nQvHWShkyT9N+KoJO6hYvcl+SGPgbFktkCzDS5q2msJiTb/1BqHZ5fMAjVlXX+AXc9u
	pmsVBFoN3q04rgdu05YEztE9FwERjGOvhBIKaHfJtqQ==
X-Gm-Gg: ASbGnctrI/4Da55dqFIRWL/tnE8UWW4A6Ynwp2wiCsctcQJ+ZynHJ1WoBqqx16zQO4R
	1zoYNsXaU/Uw4mdOw+2sSeP7QSwDyQKKVu43BxK1PFdvTtOG957CbwiICrEBfnt+jmONL62xowU
	eyYvQXJ2hrkhlx0uSx6C2P2+S2as/QvpO6Gg/d1ZW833smYCc+0p3KUJ7FV/ak+RV4GK3S6A==
X-Google-Smtp-Source: AGHT+IHnwLBGFspJ8nKuqDkcPB8jk6LlTb220Au/O2D82q9VjxSFycPW/vtBu5VJsLHKYngkw7uiilRnXE6iAcFWw0Y=
X-Received: by 2002:a17:903:2286:b0:234:909b:3dba with SMTP id
 d9443c01a7336-23641a9a2c1mr43760005ad.20.1749644504683; Wed, 11 Jun 2025
 05:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610111559.1667156-1-matt@readmodwrite.com> <CA+fCnZdR3qC-mDKSb9wWnA3-2qQxMvgArCPd3Cd_h=psjBx+vA@mail.gmail.com>
In-Reply-To: <CA+fCnZdR3qC-mDKSb9wWnA3-2qQxMvgArCPd3Cd_h=psjBx+vA@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Wed, 11 Jun 2025 13:21:33 +0100
X-Gm-Features: AX0GCFu_jTEwCdkZcGm6D1sHsPXpx-UHj01v6sz-NQh-d7BUknsZ_royBNUTmzE
Message-ID: <CAENh_SQXoMDmHw2K3p4VLC4iG_-Lx=CK-dVrqRm2m5Yv2anTbw@mail.gmail.com>
Subject: Re: [PATCH] stackdepot: Make max number of pools build-time configurable
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:09=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Jun 10, 2025 at 1:16=E2=80=AFPM Matt Fleming <matt@readmodwrite.c=
om> wrote:
> >
> > From: Matt Fleming <mfleming@cloudflare.com>
> >
> > We're hitting the WARN in depot_init_pool() about reaching the stack
> > depot limit. My assumption is because we have long stacks that don't
> > dedup very well.
>
> Note that this might happen if filter_irq_stacks() somehow fails in your =
setup.
>
> See e.g. this:
>
> https://lore.kernel.org/all/CA+fCnZdWgAD1pu4yyjON0ph9ae1B6iaWas0CbET+MXLN=
NXt5Hg@mail.gmail.com/
> https://lore.kernel.org/all/44140c34-e2bd-4f6e-892c-51469edc8dfb@redhat.c=
om/

Thanks for the tip. I'll double-check if we're hitting a similar issue
before sending a v2.
