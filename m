Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D521DE4D8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415590; cv=none; b=iuMwjpr58qW5O1nJf1RlFiJUPTenmdLu9D/+SYto/jjwainJxJDvTAKcfXfECn5cY2IQls/P50DBGEBpn6U/+gFAA8sQXOimHhacGb2sRp69HCgmM3QnA2nodgFWkhVpvezf05l0HQCUupjiPL8oFn9Fd2CvjCGh+Lep5nnIn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415590; c=relaxed/simple;
	bh=j3gsOeQ0J9+h4s5tv+MEM7+H2Ks6tViGWPgQEYxS5yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFKbEhU2H1PO/rUA//7redBmP3J+tMXk82EGULqlMOVw37OXRzEvJs10d0zH9qNb4sax27OA2KUI6OsQdiC+WkipdTtCSO+HeUEPXDij5mV8S7UiH8xqxUkEg9v0LZD439hX6MPfPaMetmqsZIvcRm+DR9EKSgZ/7DiXzH/B7wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VHn7t6T+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VHn7t6T+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso674772266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743415587; x=1744020387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrMN6LZWukOmN0j90Re+qVcywcRqKb8H+Y3qDOVIMVY=;
        b=VHn7t6T+nmF/wANvZ2lSQBW04ipnnR8CtYUH4V5tY9zBvWTOXHzC1BrW2YdECd/OLs
         1efTKIUKvWAap9hWhrD+Q5HcNH9s5JrwW3vT9WzcwEZ81oXCnKxcKre0L5FXRPT4YwgT
         4C12ddLK/LnfO0dyx9EnK46w6jLyTq0Ry5411dVqn57ZxCw3+dZ8+pHBJ+4jGaLwNWm4
         lTc2bVMWzu2qM1OnPZUyG5HZdTblI4jnqWYMXrOS3ZeE3kUAGh3Dc9TP1GgX5D7n8+m5
         C0xP2ixduom22pMsyVDpJu7VNd6nCM48zV9os9lGe4cwmVvyN2OWYC3ttxAK0qo+kypT
         qgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415587; x=1744020387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrMN6LZWukOmN0j90Re+qVcywcRqKb8H+Y3qDOVIMVY=;
        b=RzLrFbU3sF8Vn2fSTbAuW0/9ztBWx/VvzbLNmOmrn7WSeTUc9XzIg2llcGMcLM94aB
         r6hRbeNJjXG0X5h6EO/hX7BBMcAYyl71Kmd6Y91u+Qu7uEY446tGt3X9/rbOlS27fZE7
         3kAYJv0iocr57fZ0pCzz21XX1q+vMmPouqW4u1mleKa6gXhjgKvvakpXRc0YKsxxd3ym
         AeKeQt6BXolhbBhjAQzBRQIyZ0IuzyEJz6Q5GZ9rvlTJxx4ChNJWZx3QIi4PlFqDUnyY
         K73bkIsXylyf66qPk48wMCkAVyuAT2mW7MnnauUMpxLxkx9HO+kR9l70nWp3BmIKlk1o
         g+XA==
X-Forwarded-Encrypted: i=1; AJvYcCWuwD44k3xOChn45ozxiDpo7Rb9TyR4gehdGgr6/FeSbyhwZvfSKAxQ1sBEUuQaAye8OnK5lDPMzFp6l80=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOeDczkYFnDxmbS4teP7d5C2G8dCr4K7e6geuvmLOWz4Bj63Ol
	s7ock3CURHJ461EW7UG+jvOG3MCsfHEKdg/0tDiKf2pPN00LpFTey3BeT4dQR4QfavVpE6gDzKr
	bIMRwVKoYR2expsIo5nDSFKMveiwRoma+szHsaw==
X-Gm-Gg: ASbGncv7VlWFfCcEsdpSlgvOWtntG7WHwTuGpheCHgsrbEs5EAfGwDOzraz3zz01X92
	+o/EODAnH/gkmtucPs6sk5Q1f+rWCxsRF9e9qbvE4fb/HDwGUbF8NJNS/Bpi8v9hZ4gCNEf0L6I
	pwT+386JJWuET5kl/WlzcxfCy9
X-Google-Smtp-Source: AGHT+IFjoxRROSQJ2QQqf9HRlr+wmpb/KClLSvPvp1nnV8qvUH1qPNSLpAY2JcZAclvPhNIvsCQu1LAjYR7TxgXQO58=
X-Received: by 2002:a17:906:4a94:b0:ac7:a2:b6d6 with SMTP id
 a640c23a62f3a-ac738bae0eemr656150266b.57.1743415586921; Mon, 31 Mar 2025
 03:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331082347.1407151-1-neelx@suse.com> <2a759601-aebf-4d28-8649-ca4b1b3e755c@suse.com>
In-Reply-To: <2a759601-aebf-4d28-8649-ca4b1b3e755c@suse.com>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 31 Mar 2025 12:06:15 +0200
X-Gm-Features: AQ5f1JqutY5B58lKkBXLsgmMnOxey8gmhV-G874E52O3tluKYg9BOIh6iYZZcLU
Message-ID: <CAPjX3Fdru3v6vezwzgSgkBcQ28uYvjsEquWHBHPFGNFOE8arjQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: zstd: add `zstd-fast` alias mount option for fast modes
To: Qu Wenruo <wqu@suse.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Nick Terrell <terrelln@fb.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Mar 2025 at 10:49, Qu Wenruo <wqu@suse.com> wrote:
> =E5=9C=A8 2025/3/31 18:53, Daniel Vacek =E5=86=99=E9=81=93:
> > Now that zstd fast compression levels are allowed with `compress=3Dzstd=
:-N`
> > mount option, allow also specifying the same using the `compress=3Dzstd=
-fast:N`
> > alias.
> >
> > Upstream zstd deprecated the negative levels in favor of the `zstd-fast=
`
> > label anyways so this is actually the preferred way now. And indeed it =
also
> > looks more human friendly.
> >
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > ---
> >   fs/btrfs/super.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
> > index 40709e2a44fce..c1bc8d4db440a 100644
> > --- a/fs/btrfs/super.c
> > +++ b/fs/btrfs/super.c
> > @@ -368,6 +368,16 @@ static int btrfs_parse_param(struct fs_context *fc=
, struct fs_parameter *param)
> >                       btrfs_set_opt(ctx->mount_opt, COMPRESS);
> >                       btrfs_clear_opt(ctx->mount_opt, NODATACOW);
> >                       btrfs_clear_opt(ctx->mount_opt, NODATASUM);
> > +             } else if (strncmp(param->string, "zstd-fast", 9) =3D=3D =
0) {
> > +                     ctx->compress_type =3D BTRFS_COMPRESS_ZSTD;
> > +                     ctx->compress_level =3D
> > +                             -btrfs_compress_str2level(BTRFS_COMPRESS_=
ZSTD,
> > +                                                       param->string +=
 9
>
> Can we just use some temporary variable to save the return value of
> btrfs_compress_str2level()?

I don't see any added value. Isn't `ctx->compress_level` temporary
enough at this point? Note that the FS is not mounted yet so there's
no other consumer of `ctx`.

Or did you mean just for readability?

> );
> > +                     if (ctx->compress_level > 0)
> > +                             ctx->compress_level =3D -ctx->compress_le=
vel;
>
> This also means, if we pass something like "compress=3Dzstd-fast:-9", it
> will still set the level to the correct -9.
>
> Not some weird double negative, which is good.
>
> But I'm also wondering, should we even allow minus value for "zstd-fast".

It was meant as a safety in a sense that `s/zstd:-/zstd-fast:-/` still
works the same. Hence it defines that "fast level -3 <=3D=3D=3D> fast level
3" (which is still level -3 in internal zstd representation).
So if you mounted `compress=3Dzstd-fast:-9` it's understood you actually
meant `compress=3Dzstd-fast:9` in the same way as if you did
`compress=3Dzstd:-9`.

I thought this was solid. Or would you rather bail out with -EINVAL?

> > +                     btrfs_set_opt(ctx->mount_opt, COMPRESS);
> > +                     btrfs_clear_opt(ctx->mount_opt, NODATACOW);
> > +                     btrfs_clear_opt(ctx->mount_opt, NODATASUM);
> >               } else if (strncmp(param->string, "zstd", 4) =3D=3D 0) {
> >                       ctx->compress_type =3D BTRFS_COMPRESS_ZSTD;
> >                       ctx->compress_level =3D
>
> Another thing is, if we want to prefer using zstd-fast:9 other than
> zstd:-9, should we also change our compress handling in
> btrfs_show_options() to show zstd-fast:9 instead?

At this point it's not about preference but about compatibility. I
actually tested changing this but as a side-effect it also had an
influence on `btrfs.compression` xattr (our `compression` property)
which is rather an incompatible on-disk format change. Hence I falled
back keeping it simple. Showing `zstd:-9` is still a valid output.

--nX

> Thanks,
> Qu
