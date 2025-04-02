Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCA2D7BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604278; cv=none; b=oD40gogB0pdnl+jvpy5EfKB7tJh4prkcNFMxj3iSMN1/QLiJbAsqmezAgalRYDjLtzM7aGnekpI5Y7uKLvHJB16O1tugYNVPXxjQk5tYRueGmgb04d5grNoQDXYEW86NFzlNyFoF4Ol9SWDRYxdq4q6oPv+FqsG/LD9g7DI0hZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604278; c=relaxed/simple;
	bh=YpYJRk1fqwew8uO6OLpw+y5a+3bMGS6IUxUD4ARDgMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZomTPtGx/phWxJ3BXzoV82Afz9GXCJ6ScPwWhihPK2OiMcTuSS2w244mJH9cj1OqHMVqa242ZATLBxXTEjqdbf5osK6tRgTidCmN7N+441txhORiy6cnsIrjsKexh45eZE22QNMP1xU6jSn7XPBxH+c8bGHPAW1l5l9RuPkW8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L+P3yVcU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L+P3yVcU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so9283489a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743604273; x=1744209073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZXeR3AOyrqMIL/S02Uc1Qq3QuVgipSFuMWKMSod7OE=;
        b=L+P3yVcU7dyeLJdXcooeAPTlPK0X0AWQ1AJ73KzbMP42iOPIer/LR3J/vo8TCFvJxK
         QGHZ1bhXTkHXAPgcsSJHUMxJ75HG7aDkRT4UjkIIZ8B9MnEr/aad/P58dx9eqSeP0FgK
         5bpTvYnkGuNhsFkghBZGWIOWqnk1QvRMEyq3lWrFHTF/jY5AVUjNaII2IFJJNX6Oltyu
         bV7B/+vLQQtQA0nDRh1XsqNTBr4ZhgIRpiNNxt9pzTMY6Y4E8da6i7O7+gq5UhO1vOaW
         APtJ2mwty7Lvm7Z8D5JzbnVWxCE/q03AegjtmB70s3dGf9o6arnbm2zJyA3mWmEW3aLT
         kvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604273; x=1744209073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZXeR3AOyrqMIL/S02Uc1Qq3QuVgipSFuMWKMSod7OE=;
        b=cqyeOTBjA82Du+kJ/pHFzyzo3pxClG3HUJcb2jwROjSJaH2hNVgbAztvqUrPzf/GfN
         O1cBtXTV/pl5SZSbDsAOOM0oAhSDjRiKwByj0DgEH9kawbA3ZAXZMhplgeWpFvp/nHLv
         bf9924fqHnBwstEYbe+z7hSvtcKlEgAAO6MMa0BJpoDE1GGNkCCQ+epOoEOX7jefpXId
         NZGox/YCMHtuu0HNJXfDQyqw2Geh7uEh3WgQe3FHJUboUhgUI1m42lxXexmzN+RQwKSE
         kudnjrUccWwvjg0or7xlY2QNbUzasYi4UAhkPrxDhr+ooCzckYEGz2Ncfbs1Y0m9dsBZ
         eRVA==
X-Forwarded-Encrypted: i=1; AJvYcCVIgpOoxDyzBXIuqbYJBnaufmU/ri36GuIVmVED6APAnD/PDeqFuapsXzwNICWtkfuAysTQ6t7SHkwoPjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YznTtUX1ya6NsstsOkyXF2wRGXeuW+u/rVs0fOlDvB2SbVvZq++
	0ScF7D9ket6igqqsXGh6QIWHyS8aZbyBhl9YjGWxhz8rOTAEOK9fEwhY+vCwazoXZtv83Rht1n7
	aoDQeC4zVY2NjIT8u/Ai0bPT1ba4IS+Hbl+3mTg==
X-Gm-Gg: ASbGncuE4F0NMypc0yALgmIh9avpKLlXUYC0erDlJZfHm021tOik+YLadjoO4oRNKVX
	CfexaB7W8OdCLjQtPD1h5FTyyObrOPlNcnH0QIsB9uJqcrwG9wVjti8qKDVORNPYBKIyIVyQVm3
	+MxlJEEND0Hk0QLPtrsiKG+TVco2ElHD9NZ+A=
X-Google-Smtp-Source: AGHT+IGQQr6tSI/y6KGq/mkyeb3dIgsskInkIrWoOxeRv/LNuwn85mZmYAfm1T0V3zZqekUev9RiElshHrZ88+BpJ8w=
X-Received: by 2002:a17:907:9625:b0:ac2:a5c7:7fc9 with SMTP id
 a640c23a62f3a-ac738c13711mr1500877066b.51.1743604272919; Wed, 02 Apr 2025
 07:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331082347.1407151-1-neelx@suse.com> <2a759601-aebf-4d28-8649-ca4b1b3e755c@suse.com>
 <CAPjX3Fdru3v6vezwzgSgkBcQ28uYvjsEquWHBHPFGNFOE8arjQ@mail.gmail.com>
 <b1437d32-8c85-4e5d-9c68-76938dcf6573@gmx.com> <20250331225705.GN32661@twin.jikos.cz>
In-Reply-To: <20250331225705.GN32661@twin.jikos.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 2 Apr 2025 16:31:01 +0200
X-Gm-Features: AQ5f1JreI7_MwIaFFCGj7DmjbzaZf2psYvmmr8gsj6fcp71_gIbVniN6_ARIJgs
Message-ID: <CAPjX3FfVgmmqbT2O0mg9YyMnNf3z7mN5ShnXiN1cL9P=4iUrTg@mail.gmail.com>
Subject: Re: [PATCH] btrfs: zstd: add `zstd-fast` alias mount option for fast modes
To: dsterba@suse.cz
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>, Qu Wenruo <wqu@suse.com>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Nick Terrell <terrelln@fb.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Apr 2025 at 00:57, David Sterba <dsterba@suse.cz> wrote:
>
> On Tue, Apr 01, 2025 at 07:44:01AM +1030, Qu Wenruo wrote:
> >
> >
> > =E5=9C=A8 2025/3/31 20:36, Daniel Vacek =E5=86=99=E9=81=93:
> > [...]
> > >>>                        btrfs_set_opt(ctx->mount_opt, COMPRESS);
> > >>>                        btrfs_clear_opt(ctx->mount_opt, NODATACOW);
> > >>>                        btrfs_clear_opt(ctx->mount_opt, NODATASUM);
> > >>> +             } else if (strncmp(param->string, "zstd-fast", 9) =3D=
=3D 0) {
> > >>> +                     ctx->compress_type =3D BTRFS_COMPRESS_ZSTD;
> > >>> +                     ctx->compress_level =3D
> > >>> +                             -btrfs_compress_str2level(BTRFS_COMPR=
ESS_ZSTD,
> > >>> +                                                       param->stri=
ng + 9
> > >>
> > >> Can we just use some temporary variable to save the return value of
> > >> btrfs_compress_str2level()?
> > >
> > > I don't see any added value. Isn't `ctx->compress_level` temporary
> > > enough at this point? Note that the FS is not mounted yet so there's
> > > no other consumer of `ctx`.
> > >
> > > Or did you mean just for readability?
> >
> > Doing all the same checks and flipping the sign of ctx->compress_level
> > is already cursed to me.
> >
> > Isn't something like this easier to understand?
> >
> >       level =3D btrfs_compress_str2level();
> >       if (level > 0)
> >               ctx->compress_level =3D -level;
> >       else
> >               ctx->compress_level =3D level;
> >
> > >
> > >> );
> > >>> +                     if (ctx->compress_level > 0)
> > >>> +                             ctx->compress_level =3D -ctx->compres=
s_level;
> > >>
> > >> This also means, if we pass something like "compress=3Dzstd-fast:-9"=
, it
> > >> will still set the level to the correct -9.
> > >>
> > >> Not some weird double negative, which is good.
> > >>
> > >> But I'm also wondering, should we even allow minus value for "zstd-f=
ast".
> > >
> > > It was meant as a safety in a sense that `s/zstd:-/zstd-fast:-/` stil=
l
> > > works the same. Hence it defines that "fast level -3 <=3D=3D=3D> fast=
 level
> > > 3" (which is still level -3 in internal zstd representation).
> > > So if you mounted `compress=3Dzstd-fast:-9` it's understood you actua=
lly
> > > meant `compress=3Dzstd-fast:9` in the same way as if you did
> > > `compress=3Dzstd:-9`.
> > >
> > > I thought this was solid. Or would you rather bail out with -EINVAL?
> >
> > I prefer to bail out with -EINVAL, but it's only my personal choice.
>
> I tend to agree with you, the idea for the alias was based on feedback
> that upstream zstd calls the levels fast, not by the negative numbers.
> So I think we stick to the zstd: and zstd-fast: prefixes followed only
> by the positive numbers.

I'd still opt for keeping full range and functionality including
negative levels using the plain `zstd:N` option and having the other
just as an additional alias (for maybe being a bit nicer to some
humans, but not a big deal really and a matter of preference).
Checking the official documentation, it still mentions "negative
compression levels" being the fast option.

https://facebook.github.io/zstd/
https://facebook.github.io/zstd/zstd_manual.html

The deprecation part looks like just some gossip. It looks more about
the cli tool api and we are defining a kernel mount api - perfectly
unrelated.

> We can make this change before 6.15 final so it's not in any released
> kernel and we don't have to deal with compatibility.
